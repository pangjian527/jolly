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
	
	
/*	public BillData getData( String billId) throws Exception{
		BillData result = new BillData();
		result.setBill( this.get(billId));
		result.setBillDetails( billDetailService.getAllByBillId(billId));
		result.setBillDetailDatas(this.getBillDetailData(billId));
		return result;
	}*/
	/*private List<BillDetailData> getBillDetailData(String billId){
		List<BillDetailData> result = new ArrayList<BillDetailData>();
		
		Query query = new ListQuery(QueryResultType.MAP);
	    
	    StringBuilder select = new StringBuilder();
	    select.append( " b.price_pay as amount,b.book_id as bookId");
		select
				.append(" ,(select to_char(CREATE_TIME,'yyyy-MM-dd HH:mm') from t_bookform_detail "
						+ "where id = b.bookform_detail_id) as bookDate,d.product_name," +
								"(select user_bookid from t_bookform f where f.id=b.book_id) as user_bookId");
		select.append(" ,d.verification_Time ");

	    StringBuilder where = new StringBuilder();
	   
		query.select(select.toString()).from(" t_bill_detail b ,t_bookform_detail d").where( " b.bookform_detail_id=d.id and  b.bill_id =:billId");	
		query.put( "billId", billId);
		generalDao.execute(query);
		
		QueryResult _result = query.getResult();
		if(_result!=null){
			List _tmp = _result.getRows();
			for(Object object : _tmp){
				Map map = (Map) object;
				BillDetailData data = new BillDetailData();
				data.setAmount(map.get("AMOUNT").toString());
				data.setBookDate( (String)map.get("BOOKDATE"));
				data.setBookId(map.get("BOOKID").toString());
				data.setProductName(map.get("PRODUCT_NAME").toString());
				data.setUserBookId(map.get("USER_BOOKID").toString());
				data.setVerificationTime((Date)map.get("VERIFICATION_TIME"));
				result.add(data);
			}
		}
		
		return result;
	}*/
	
	/**
	 * 查询资金来往记录
	 * @param condition
	 * @param settings
	 * @return
	 * @throws Exception
	 *//*
	public QueryResult queryMoney(String condition,String factoryId,QuerySettings settings) throws Exception{
//	    Bill queryData = (Bill)BaseService.build(condition,new Bill());
	    Query query = null;
	    if(settings!=null){
	    	query =  new PagedQuery(settings);
	    }else{
	    	query = new ListQuery(QueryResultType.MAP);
	    }
	    
	    StringBuilder select = new StringBuilder();
	    select.append( " t.*");
	    select.append( " ,(select name from t_factory where id=t.factory_id) factoryname");
	    select.append( " ,(select status from t_factory where id=t.factory_id) factorystatus");
	    select.append( " ,(select account from t_factory_user where id=t.factory_user_id) factoryuser");
	    select.append( " ,(select name from sys_user where id=t.user_id) sysuser");
	    
	    StringBuilder where = new StringBuilder();
	    where.append(" 1=1 ");
	    where.append( " and t.PAYMENT_ID in(select id from LOG_PAYMENT where STATUS =:paySuccess)");
	    query.put( "paySuccess", LogPayment.statusPaySuccess);
//	    if(queryData!=null){
//	    	
//	    }
	    //商家取自己与总店的资金来往
	    if(StrFuncs.notEmpty(factoryId)){
	    	where.append( " and t.factory_id =:factoryId");
			query.put( "factoryId", factoryId);
	    }
		query.select(select.toString()).
				from(" t_bill t").
					where( where.toString()).
						orderBy(" t.create_time desc ");	
		generalDao.execute(query);
		return query.getResult();
	}
	
	
	
	
	 * @功能说明：商家发起付款流程
	 * 
	 * @版本信息：2014-11-14 pj add
	 
	@Transactional
	public void payMent(String factoryId,String factoryUserId) throws Exception{
		//商家发起付款流程，不需要总店审核，状态直接等待商家付款
		createBill(factoryId,factoryUserId,4);
	}
	
	private void createBill(String factoryId,String factoryUserId,int status){
		double balance=billDetailDao.countFactoryBalance(factoryId);
		Bill bill=new Bill();
		bill.setAmount(balance);
		bill.setFactoryId(factoryId);
		bill.setStatus(status);
		bill.setFactoryUserId(factoryUserId);
		//1. 保存申请接榫
		billDao.save(bill);
		//2. 绑定账单
		billDetailDao.bindBill(bill.getId(),factoryId);
	}
	
	
	 * @功能说明：获取商家未付款的申请
	 * 
	 * @版本信息：2014-11-14 myq add
	 
	public Bill getActiveBill(String factoryId) {
		return billDao.getActiveBill(factoryId);
	}
	
	
	 * @功能说明：获取商家未付款的申请
	 * 
	 * @版本信息：2014-11-14 pj add
	 
	@Transactional
	public void revocation(String billId) {
		Bill bill = billDao.get(billId);
		
		bill.setStatus(3);
		billDao.save(bill);
		
		//1.解除绑定
		billDetailDao.revocation(billId);
	}
	
	
	
	
	 * @功能说明：总店驳回申请
	 * 
	 * @版本信息：2014-11-14 pj add
	 
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
			+ "拒绝本次申请，原因为：" + reason;
		bill.setRemark(bill.getRemark() + "\n" + text);
		
		save(bill);
		//2.记日志
		draftService.saveLog(Bill.TABLE_NAME, id, user, "拒绝",
			"status", String.valueOf(oldStatus), "-1",
			"reason", reason, "");
		//3.
		return true;
	}
	
	*//**
	 * 请款异常
	 * @param id
	 * @param user
	 * @return
	 * @throws Exception
	 *//*
	@Transactional
	public boolean abnormalPaymentRequest(String id, SysUser user) throws Exception{
		//0.合法性
		Bill bill = billDao.get(id);
		int oldStatus = bill.getStatus();
		if(bill == null || user == null 
			|| (oldStatus != 0 && oldStatus != 1)){
			return false;
		}
		//1.变更数据状态
		bill.setStatus(Bill.STATUS_ABNORMAL_PAYMENT_REQUEST);
		String text = DateFuncs.toString(new Date()) + " " + user.getCode() + "请款异常";
		bill.setRemark(bill.getRemark() + "\n" + text);
		
		save(bill);
		//2.记日志
		draftService.saveLog(Bill.TABLE_NAME, id, user, "请款异常","status", String.valueOf(oldStatus), "6","reason", "", "");
		//3.
		return true;
	}
	
	
	
	
	*//**
	 * 商家在线支付成功后，系统自动回调该方法，将欠款Bill状态置为已完成，并记录logPaymentId
	 * @param id
	 * @param logId
	 *//*
	@Transactional
	public void finishPayment(String id, String logId){
		//0.有效性验证
		Bill bill = get(id);
		if(bill == null || bill.getStatus() != 4 || bill.getAmount() >= 0){
			return;
		}
		
		//1.更新bill数据，并记录logpayment id；
		bill.setPaymentId(logId);
		bill.setStatus(Bill.STATUS_AUDIT_SUCCESS);//付完钱就表示完成了
		String text = DateFuncs.toString(new Date()) + " 商家欠款在线支付成功，结算完成";
		bill.setRemark(bill.getRemark() + "\n" + text);
		save(bill);
		
		//2.更新bill detail，正式锁定
		List<BillDetail> billDetails = billDetailService.getAllByBillId(id);
		for(BillDetail billDetail : billDetails){
			billDetail.setStatus(1);
			billDetailService.save(billDetail);
		}
		
		//3.记录操作日志
		try{
			String action = "商家欠款在线支付成功，结算单自动转为已完成状态";
			draftService.saveLog(Bill.TABLE_NAME, id, SysUser.SYSTEM, action,
				"status", "0", "1");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		billDao.save(bill);
	}
	
	
	 * @功能说明：商家收回付款请求
	 * 
	 * @版本信息：2015-3-14 myq add
	 
	@Transactional
	public boolean withdraw(String id, String reason, FactoryUser user) throws Exception{
		//0.合法性
		Bill bill = billDao.get(id);
		int oldStatus = bill.getStatus();
		///boolean b = (oldStatus != Bill.STATUS_WAIT_FACTORY && oldStatus != Bill.STATUS_AUDIT_PENDING) ;
		if(bill == null || user == null 
				|| (oldStatus != Bill.STATUS_WAIT_FACTORY && oldStatus != Bill.STATUS_AUDIT_PENDING) 
				|| !bill.getFactoryId().equals(user.getFactoryId())){
			return false;
		}
		
		//1.变更数据状态
		bill.setStatus(Bill.STATUS_CANCEL);
		String text = DateFuncs.toString(new Date()) + " " + user.getAccount() + "撤回请求：" + reason;
		bill.setRemark(bill.getRemark() + "\n" + text);
		//bill.setRemark(user.getAccount() + "撤回请求：" + reason);
		
		//2.记日志
		draftService.saveLog(Bill.TABLE_NAME, id, user, "撤回",
			"status", String.valueOf(oldStatus), String.valueOf(bill.getStatus()));
		//3.
		return true;
	}
	
	*//**
	 * myq add 2015-3-11，根据计算单id，检验&生成商家欠款的相关信息 
	 * @param id
	 * @return
	 *//*
	public PayInfo getPayInfo(String id) throws Exception{
		//JSONObject result = new JSONObject();
		Bill bill = get(id);
		if(bill == null || bill.getStatus() != Bill.STATUS_WAIT_FACTORY || bill.getAmount() > 0){
			throw new Exception("该订单无法在线支付!");
		}
		
		return new PayInfo("商家支付欠款", - bill.getAmount(),
				BillPaymentCallbackUtils.class.getName(), id);
		//return result;
	}
	
	public Bill create(){
		return new Bill();
	}
	protected HibernateDao<Bill> getBaseDao(){
		return billDao;
	}
	
	
	public static void main(String[] args) throws IOException {
		Map<String, Object> signMap = new HashMap<String, Object>();
		signMap.put("mch_appid", WXPayConfig.PUBLIC_APP_ID);
		signMap.put("mchid", WXPayConfig.PUBLIC_MCH_ID);
		signMap.put("device_info", "WEB");
		signMap.put("nonce_str", Signature.getRandomStringByLength(32));
		signMap.put("partner_trade_no", "10000098201411111234567891");
		signMap.put("openid", "oFnLXt7haNdUR55t2CUnSNlmmIA0");
		signMap.put("check_name", "NO_CHECK");
		signMap.put("re_user_name", "伟少");
		signMap.put("amount", "100");
		signMap.put("desc", "测试test");
		signMap.put("spbill_create_ip", "183.48.14.169"); 
		String sign = Signature.getPublicSign(signMap);
		signMap.put("sign", sign);
		
		for (String key : signMap.keySet()) {
			System.out.println(key + "----" + signMap.get(key));
		}
		
		FileInputStream fileInputStream = null;
		try {
			KeyStore keyStore = KeyStore.getInstance("PKCS12");
			fileInputStream = new FileInputStream(new File("E:\\htw-file\\ca\\public-member\\apiclient_cert.p12"));
			keyStore.load(fileInputStream, "1238565702".toCharArray());
			
			@SuppressWarnings("deprecation")
			SSLContext sslContext = SSLContexts.custom().loadKeyMaterial(keyStore, "1238565702".toCharArray()).build();
			@SuppressWarnings("deprecation")
			SSLConnectionSocketFactory sslConnectionSocketFactory = new SSLConnectionSocketFactory(sslContext,new String[] { "TLSv1" },null,SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
			
			CloseableHttpClient httpClient = HttpClients.custom().setSSLSocketFactory(sslConnectionSocketFactory).build();
			HttpPost post = new HttpPost("https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers");
			post.setEntity(new StringEntity(Signature.mapToXML2(signMap), "utf-8"));
			CloseableHttpResponse httpResponse = httpClient.execute(post);
			HttpEntity httpEntity = httpResponse.getEntity();
			
			String result = EntityUtils.toString(httpEntity);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			fileInputStream.close();
		}
	}*/
	
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
