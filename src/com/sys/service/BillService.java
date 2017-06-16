package com.sys.service;

import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.GeneralDao;
import pub.dao.hibernate.PagedQuery;
import pub.dao.query.Query;
import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;
import pub.functions.DateFuncs;
import pub.functions.StrFuncs;
import pub.spring.ActionResult;

import com.sys.dao.BillDao;
import com.sys.dao.BillDetailDao;
import com.sys.entity.Bill;
import com.sys.entity.BillDetail;
import com.sys.entity.Factory;
import com.sys.entity.FactoryUser;
import com.sys.entity.SysUser;
import com.web.utils.netease.Template;

@Service
@Transactional(readOnly = true)
public class BillService extends BaseService<Bill>{

	@SuppressWarnings("static-access")
	public QueryResult query(String condition, QuerySettings settings) {
		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
	    
	    Query query = new PagedQuery(settings);
	    
	    StringBuilder select = new StringBuilder();
	    select.append( " t.*, u.name sys_user_name, f.name as factory_name ");
	    
	    StringBuilder where = new StringBuilder(" 1=1 ");
	    
	    this.addQueryEqualFilter(queryJson, where, query, "factoryId", 
				" and t.factory_id = :factoryId");	
	    this.addQueryLikeFilter(queryJson, where, query, "factoryName", 
				" and f.name like :factoryName");	
		this.addQueryEqualFilter(queryJson, where, query, "status", 
				" and t.status = :status");
		this.addQueryEqualFilter(queryJson, where, query, "provinceId", 
				" and f.province_id = :provinceId");
		this.addQueryEqualFilter(queryJson, where, query, "cityId", 
				" and f.city_id = :cityId");
		
		query.select(select.toString())
			.from(" t_bill t left join sys_user u on t.sys_user_id=u.id left join t_factory f on f.id=t.factory_Id ")
			.where( where.toString()).orderBy(" t.create_time desc ");
		
		generalDao.execute(query);
		return query.getResult();
	}
	/**
	 * @功能说明：发起结算
	 * 
	 * @版本信息：2014-11-14 pj add
	 */
	@Transactional
	public Bill createAndSave(SysUser sysUser,String factoryId) throws Exception{
		//0.合法性验证，需要验证这个店是不是已经有未完成的单
		if(sysUser==null||getActiveBill(factoryId) != null){
			throw new Exception("有未完成的结算申请");
		}
		
		//1.汇总商家未结算的明细，生成结算清单
		double amount = 0;
		List<BillDetail> details = billDetailService.getAllByFactoryId(factoryId, 0);
		
		if(details.isEmpty()){
			throw new Exception("没有需要结算的账单");
		}
		for(BillDetail detail : details){
			amount += detail.getPricePay();
		}
		if(amount < 0 && amount > -500){//欠商家500内不结算
			throw new Exception("欠商家500元内不能发起结算");
		}
		
		Bill bill = new Bill();
		bill.setAmount(amount);
		bill.setFactoryId(factoryId);
		if(amount > 0.001){
			bill.setStatus(Bill.STATUS_FACTORY_PAY);//待商家付款
		}
		else{
			bill.setStatus(Bill.STATUS_MALL_PAY);//待商城付款
		}
		bill.setSysUserId(sysUser.getId());
		
		Date date = new Date();
		String text = DateFuncs.toString(date) + " " + sysUser.getName() 
			+ "申请结算" + bill.getAmount() + "元";
		bill.setRemark(text);
		bill.setUpdateTime(date);
		billDao.save(bill);

		String billId = bill.getId();
		for(BillDetail detail : details){
			detail.setBillId(billId);
			detail.setStatus(BillDetail.BILL_DETAIL_NOT_SETTLE);
			billDetailService.save(detail);
		}
		
		/*//2.记日志
		draftService.saveLog(Bill.TABLE_NAME, billId, user, "申请收款");*/
		
		//3.
		return bill;
	}
	
	/*
	 * @功能说明：获取商家未付款的申请
	 * 
	 * @版本信息：2014-11-14 myq add
	 */
	public Bill getActiveBill(String factoryId) {
		return billDao.getActiveBill(factoryId);
	}
	/*
	 * @功能说明：总店完成支付
	 * 
	 * @版本信息：2014-11-14 pj add
	 */
	@Transactional
	public boolean finish(String id, String detail, SysUser user) throws Exception{
		//0.合法性
		Bill bill = billDao.get(id);
		int oldStatus = bill.getStatus();
		if(bill == null || user == null || oldStatus != 0 || bill.getAmount() <= 0){
			return false;
		}
		//1.变更数据状态
		bill.setStatus(Bill.STATUS_FINISH);
		//bill.setRemark(user.getName() + "已向商家完成付款：" + detail);
		String text = DateFuncs.toString(new Date()) + " " + user.getCode() 
			+ "确认已付款，详情：" + detail;
		bill.setRemark(bill.getRemark() + "\n" + text);
	
		save(bill);
		List<BillDetail> billDetails = billDetailService.getAllByBillId(id);
		for(BillDetail billDetail : billDetails){
			billDetail.setStatus(BillDetail.BILL_DETAIL_YES_SETTLE);
			billDetailService.save(billDetail);
		}
		/*//2.记日志
		draftService.saveLog(Bill.TABLE_NAME, id, user, "商城完成付款",
			"status", "1", "2",
			"detail", detail, "");*/
		//3.
		return true;
	}
	
	/*
	 * @功能说明：总店驳回申请
	 * 
	 * @版本信息：2014-11-14 pj add
	 */
	@Transactional
	public boolean disable(String id, String reason, SysUser user) throws Exception{
		//0.合法性
		Bill bill = billDao.get(id);
		int oldStatus = bill.getStatus();
		if(bill == null || user == null 
			|| (oldStatus != 0 && oldStatus != 1)){
			return false;
		}
		//1.变更数据状态
		bill.setStatus(Bill.STATUS_CANCEL);
		String text = DateFuncs.toString(new Date()) + " " + user.getCode() 
			+ "撤销本次申请，原因为：" + reason;
		bill.setRemark(bill.getRemark() + "\n" + text);
		
		save(bill);
		/*//2.记日志
		draftService.saveLog(Bill.TABLE_NAME, id, user, "拒绝",
			"status", String.valueOf(oldStatus), "-1",
			"reason", reason, "");*/
		//3.
		return true;
	}
	
	
	public void notifyFactoryUserBillSubmited(final String factoryId,final double amount) {
		new Thread(){//异步通知
			public void run(){
				try {
					Factory factory = factoryService.get(factoryId);
					JSONArray mobileArr= new JSONArray();
					mobileArr.add(factory.getMobile());
					
					JSONArray tempParamArr= new JSONArray();
					tempParamArr.add(amount);//TODO
					smsService.sendTempMsg(Template.TEMPLATE_NOTIFY_SUBMIT_BILL_DETAIL, mobileArr, tempParamArr);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}.start();
		
	}
	
	@Autowired
	private GeneralDao generalDao;
	@Autowired
	private BillDao billDao;
	@Autowired
	private BillDetailService billDetailService;
	@Autowired
	private BillDetailDao billDetailDao;
	@Autowired
	private FactoryService factoryService;
	@Autowired
	private SmsService smsService;
	
}
