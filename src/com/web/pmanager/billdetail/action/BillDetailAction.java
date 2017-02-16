package com.web.pmanager.billdetail.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import pub.dao.query.PageSettings;
import pub.dao.query.QueryResult;
import pub.functions.StrFuncs;
import pub.spring.ActionResult;
import pub.types.Pair;

import com.sys.entity.Bill;
import com.sys.entity.BillDetail;
import com.sys.entity.Bookform;
import com.sys.entity.FactoryUser;
import com.sys.entity.SysUser;
import com.sys.service.BaseService;
import com.sys.service.BillDetailService;
import com.sys.service.BillService;
import com.sys.service.BookformService;
import com.web.common.action.ManageAction;
import com.web.pmanager.PManagerAction;

/*
 * @功能说明：账单
 * 
 * @版本信息：2014-11-14 pj add
 */
@Controller
public class BillDetailAction extends PManagerAction<BillDetail>{
	
/*	protected String getJspFolderPath(){
		return "/pmanager/billdetail";
	};*/
	
/*	@RequestMapping
	public String query(HttpServletRequest request, ModelMap model) throws Exception{
		String path = super.query(request, model);
		QueryResult queryResult = (QueryResult)request.getAttribute("queryResult");
		for(Object row : queryResult.getRows()){
			Map map = (Map)row;
			String bookId = map.get("BOOK_ID").toString();
			if(StrFuncs.notEmpty(bookId)){
				Bookform bookform = bookformService.get(bookId);
				if(bookform != null){
					map.put("BOOKFORM_CODE", arg1)
				}
			}
			
		}
		return path;
	}*/
	
	@RequestMapping
	public String query(HttpServletRequest request, ModelMap model) throws Exception{
		String path = super.query(request, model);
		
		QueryResult result = (QueryResult)request.getAttribute("queryResult");
		for(Object row : result.getRows()){
			Map map = (Map)row;
			JSONObject detailJson = null;
			try{
				detailJson = JSONObject.fromObject(map.get("DETAIL"));
			}
			catch(Exception e){
				detailJson = new JSONObject();
			}
			map.put("detailJson", detailJson.toString());
		}
		
		return path;
	}
	
/*	protected BaseService<BillDetail> getService(){
		return billDetailService;
	}
	*/
	

	/**
	 * myq add@2015-3-5，申请结算
	 */
	@RequestMapping
	public View checkout(HttpServletRequest request, ModelMap model) throws Exception{
		SysUser user = this.getUser(request);
		
		//1.统计商家欠款
		Bill bill = billService.createAndSave(user,this.getParam("factoryId"));
		
		if(bill == null){
			//2.0 无效的申请
			//return "/pfactory/billdetail/bill_detail.do?op=\"query\"";
			return ActionResult.ok("无效的申请", null);
		}
		else{
			double amount = bill.getAmount();
			//2.1 商家在商城有余额，生成一条结算申请单(t_bill)，并切换回详情页面
			//return "/pfactory/billdetail/bill_detail.do?op=\"query\"";
			return ActionResult.ok("您已提交结算申请￥" + amount + "元)，请前往账单管理菜单查看", null);
		}
	}
	
	
	
	@Autowired
	private BillDetailService billDetailService;
	@Autowired
	private BookformService bookformService;
	@Autowired
	private BillService billService;
}
