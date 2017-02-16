package com.web.pmanager.bill.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import pub.dao.query.PageSettings;
import pub.dao.query.QueryResult;
import pub.spring.ActionResult;

import com.sys.entity.Bill;
import com.sys.entity.BillDetail;
import com.sys.entity.Factory;
import com.sys.entity.FactoryUser;
import com.sys.entity.SysUser;
import com.sys.service.BaseService;
import com.sys.service.BillDetailService;
import com.sys.service.BillService;
import com.sys.service.FactoryService;
import com.sys.service.FactoryUserService;
import com.sys.service.SysUserService;
import com.web.common.action.ManageAction;
import com.web.pmanager.PManagerAction;
import com.web.pmanager.consts.Consts;

/**
 * 财务账单
 * 列表、详情、审核、付款
 * @author zhangz
 *
 */
@Controller
public class BillAction  extends PManagerAction<Bill>{

	/*
	 * @功能说明：查询账单详细信息
	 * 
	 * @版本信息：2014-11-20 pj add
	 */
	@RequestMapping
	public String show(HttpServletRequest request, ModelMap model, String id) throws Exception{
		
		//1. 查询到对应的账单
		Bill bean = billService.get(id);
		model.put("bean", bean);
		
		//2. 查询到对应的商家
		Factory factory = factoryService.get(bean.getFactoryId());
		model.put("factory", factory);
		
		//3. 查询到账单明细
		List<BillDetail> billDetails = billDetailService.getAllByBillId(id);
		model.put("details", billDetails);
		
		//4.json解析
		JSONArray configs = new JSONArray();
		for(BillDetail billDetail : billDetails){
			
			JSONObject detailJson = null;
			try{
				//detailJson = JSONObject.fromObject(billDetail.getDetail());
			}
			catch(Exception e){
				detailJson = new JSONObject();
			}
			configs.add(detailJson);
		}
		model.put("configs", configs);
		
		//4.申请人
		SysUser sysUser = sysUserService.get(bean.getSysUserId());
		model.put("sysUser", sysUser);
		
		
		return "/pmanager/bill/show";
	}
	
	/**
	 * 完成向商家付款
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping
	public View finish(HttpServletRequest request, String id, String detail) throws Exception{
		boolean success = billService.finish(id, detail, this.getUser(request));
		if(success){
			return ActionResult.ok("已完成支付", "/pmanager/bill/bill.do?op=query");
		}
		else{
			return ActionResult.error("非法数据操作");
		}
	}
	
	/*
	 * @功能说明：拒绝/取消付款申请
	 * 
	 * @版本信息：2014-11-20 pj add
	 */
	@RequestMapping
	public View disable(HttpServletRequest request, String id, String reason) throws Exception{
		boolean success = billService.disable(id, reason, this.getUser(request));
		if(success){
			return ActionResult.ok("已撤销商家欠款结算申请", "/pmanager/bill/bill.do?op=query");
		}
		else{
			return ActionResult.error("非法数据操作");
		}
	}
	/*
	 * @功能说明：查询账单详细信息
	 * 
	 * @版本信息：2014-11-20 pj add
	 
	@RequestMapping
	public String show(HttpServletRequest request, ModelMap model, String id) throws Exception{
		
		//1. 查询到对应的账单
		Bill bean = billService.get(id);
		model.put("bean", bean);
		
		//2. 查询到对应的商家
		Factory factory = factoryService.get(bean.getFactoryId());
		model.put("factory", factory);
		
		//3. 查询到账单明细
		List<BillDetail> billDetails = billDetailService.getAllByBillId(id);
		model.put("details", billDetails);
		
		//4.json解析
		JSONArray configs = new JSONArray();
		for(BillDetail billDetail : billDetails){
			
			JSONObject detailJson = null;
			try{
				detailJson = JSONObject.fromObject(billDetail.getDetail());
			}
			catch(Exception e){
				detailJson = new JSONObject();
			}
			configs.add(detailJson);
		}
		model.put("configs", configs);
		
		//4.申请人
		FactoryUser factoryUser = factoryUserService.get(bean.getFactoryUserId());
		model.put("factoryUser", factoryUser);
		
		
		return "/pmanager/bill/show";
	}
	
	
	
	
	
	*//**
	 * 请款异常
	 * @param request
	 * @param id
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping
	public View abnormalPaymentRequest(HttpServletRequest request, String id) throws Exception{
		boolean success = billService.abnormalPaymentRequest(id, this.getUser(request));
		if(success){
			return ActionResult.ok("已把次记录标识为异常", "/pmanager/bill/bill.do?op=query");
		}
		else{
			return ActionResult.error("非法数据操作");
		}
	}
	
	
	
/*	*//**
	 * 后端管理资金来往
	 * @param request
	 * @param billId
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping
	public String money(HttpServletRequest request,ModelMap model)throws Exception {
		
		String condition = request.getParameter( "formValues");
		
		int pageNo = this.getIntegerParam("pn", 1);
		
		QueryResult result = billService.queryMoney(condition, null, PageSettings.of(pageNo));
		
		model.put("queryResult", result);
		
		return "/pmanager/bill/payment";
	}
	*/
	
/*	protected String getJspFolderPath(){
		return "/pmanager/bill";
	};*/
	
/*	protected BaseService<Bill> getService(){
		return billService;
	}*/
	
	@Autowired
	private BillService billService;
	@Autowired
	private FactoryService factoryService;
	@Autowired
	private BillDetailService billDetailService;
	@Autowired
	private FactoryUserService factoryUserService;
	@Autowired
	private SysUserService sysUserService;
}
