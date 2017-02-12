package com.web.pmanager.order.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import pub.spring.ActionResult;

import com.sys.data.book.BookformData;
import com.sys.entity.Bookform;
import com.sys.service.AreaService;
import com.sys.service.BookformService;
import com.sys.service.FactoryService;
import com.sys.service.SysUserService;
import com.web.pmanager.PManagerAction;

/**
 * 订单数据
 * @author zhangz
 *
 */
@Controller
public class BookformAction extends PManagerAction<Bookform>{ 
	
	public View delete(HttpServletRequest request, String id) throws Exception{
		return ActionResult.error("非法数据操作", null);
	}
	
	/**
	 * 查看订单详情
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping
	public String view(HttpServletRequest request, ModelMap model, String id)throws Exception {
		
		BookformData bookformData = baseService.getData(id);
		
		model.put("data", bookformData);
		model.put("nowDate", new Date());
		return "/pmanager/order/view";
	}
	
	@RequestMapping
	public View disable(HttpServletRequest request, ModelMap model, String id)throws Exception {
		String reason = request.getParameter("reason");
		boolean success = baseService.disable(id, getUser(request), reason);
		if(success){
			return ActionResult.ok("订单已被取消！", null);
		}
		else{
			return ActionResult.error("无效操作", null);
		}
	}
	/*
	@RequestMapping
	public String printBookForm(HttpServletRequest request, ModelMap model, String id) throws Exception{
		
		BookformData bookformData = baseService.getData(id);
		model.put("bookformData", bookformData);
		model.put("randomCode", UUID.randomUUID().toString().replace("-", ""));
		return "/pmanager/order/print";
	}
	
	*//**
	 * 展示加急安装询问页面
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping
	public String showUrgentInstall(HttpServletRequest request,ModelMap model,String id)throws Exception {
		//1.获取订单、车主信息
		BookformData data = baseService.getData(id);
		model.put("data", data);
		Bookform bookform = data.getBookform();
		Area area = areaService.get(bookform.getContactCountyId());
		model.put("county", area);
		
		//3.获取已经发送的询问情况
		QueryResult result = baseService.queryUrgentInstallConsult("{bookId : \"" + id + "\"}");
		model.put("consults", result.getRows());
		return "/pmanager/order/showUrgentInstall";
	}
	
	@RequestMapping
	public void getCandidateFactorys(HttpServletRequest request, HttpServletResponse response, 
			String id, String cityId, String countyId, String address, String orderBy)throws Exception {
		QueryResult result = baseService.queryCandidateFactorys(id, cityId, countyId, address, orderBy);
		this.writeJson(result.getRows());
	}
	
	@RequestMapping
	public View enableUrgentInstallFactory(HttpServletRequest request, HttpServletResponse response, String consultId)throws Exception {
		//BookformData data = baseService.getBookformData(id);	
		Boolean success = baseService.enableUrgentInstallConsult(consultId, this.getUser(request));
		if(success){
			return ActionResult.ok("您已选择加急安装门店！", null);
		}
		else{
			return ActionResult.error("无效操作", null);
		}
	}
	
	@RequestMapping
	public void inviteUrgentInstallFactorys(HttpServletRequest request, HttpServletResponse response,
			String id, String[] factoryIds, String describe)throws Exception {
		String[] ids = request.getParameterValues("factoryIds");
		Boolean success = baseService.createUrgentInstallConsults(id, factoryIds, describe, this.getUser(request));
		
		if(success){
			this.writeJson(true);
		}
		else{
			this.writeErrorJson("非法数据操作");
		}
	}
	
	 2015-10-19 add  从列表移除门店 
	@RequestMapping
	public void rejectUrgentInstallConsult(HttpServletRequest request,
			HttpServletResponse response, String bookId, String factoryId)
			throws Exception {
		boolean success = baseService.rejectUrgentInstallConsult(bookId,
				factoryId, this.getUser(request));

		if (success) {
			this.writeJson(true);
		} else {
			this.writeErrorJson("非法数据操作");
		}
	}
	
	*//**
	 * 确认加急订单
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping
	public View confirm(HttpServletRequest request, ModelMap model, String id)throws Exception {
		boolean success = baseService.confirm(id, getUser(request));
		if(success){
			//1.通过短信向车主发送验证码
			//baseService.sendVerifyCodeToCustomer(id, getUser(request));
			//2.返回
			return ActionResult.ok("订单已确认生效！", null);
		}
		else{
			return ActionResult.error("无效操作", null);
		}
	}
	
	*//**
	 * 确认货源
	 * @param request
	 * @throws Exception
	 *//*
	@RequestMapping
	public View confirmTyreSupply(HttpServletRequest request, ModelMap model, String id, 
			boolean useFactoryTyre) throws Exception{
		boolean success = baseService.confirmTyreSupply(id, this.getUser(request), useFactoryTyre);
		if(success){
			String text = "您已选择" + 
				(useFactoryTyre ? "使用门店轮胎，好胎屋无需发货" : "使用好胎轮胎，请注意收货 ");
			return ActionResult.ok(text, null);
		}
		else{
			return ActionResult.error("非法操作", null);
		}
	}
	
	
	@RequestMapping
	public View saveConfirm(HttpServletRequest request,ModelMap model,
			String bookformId,String selectedFactory)throws Exception {
		System.out.println(bookformId+'\t'+ selectedFactory);
		//根据bookformId改同批次的T_BOOKFORM_STOCK_CONSULT.status=1
		bookformStockConsultService.updateByBookId(bookformId);
		
		//根据bookformId改T_BOOKFORM. STATUS改为“已确认”同时将selectedFactory填入T_BOOKFORM.service_factory_id
		Bookform bookform = baseService.get(bookformId);
		bookform.setStatus(Bookform.STATUS_CONFIRMED);
		bookform.setServiceFactoryId(selectedFactory);
		
		baseService.save(bookform);
		
		return ActionResult.ok("确认完成！", "/pmanager/order/bookform.do?op=query");
	}
	
	*//**
	 * 保存发货信息
	 * @param request
	 * @param model
	 * @param bookformId
	 * @param deliveryName
	 * @param deliveryNo
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping
	public void deliverTyre(HttpServletRequest request, HttpServletResponse response,
			String id, String deliveryFactory, String trackingNumber)throws Exception {
		
		boolean success = baseService.deliverTyre(id, deliveryFactory, trackingNumber, this.getUser(request));
		if(success){
			this.writeJson(true);
		}
		else{
			this.writeErrorJson("非法数据操作，请求被拒绝");
		}
		
	}
	
	*//**
	 * 确认轮胎到店操作
	 * @param request
	 * @param model
	 * @param bookformId
	 * @param deliveryName
	 * @param deliveryNo
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping
	public View receiveTyre(HttpServletRequest request, ModelMap model,
			String id)throws Exception {
		boolean success = baseService.receiveTyre(id, this.getUser(request));
		if(success){
			return ActionResult.ok("您已代替门店完成确认轮胎到店!", "/pmanager/order/bookform.do?op=query");
		}
		else{
			return ActionResult.error("非法数据操作");
		}
		
	}
	
	@RequestMapping
	public void sendSms(HttpServletRequest request,
			HttpServletResponse response, String id) {
		try {
			baseService.sendVerifyCodeToCustomer(id, getUser(request));
			this.writeJson(true);
		} 
		catch (Exception e) {
			e.printStackTrace();
			this.writeErrorJson(StrFuncs.valueOf(e));
		}
	}
	
	@RequestMapping
	public String query(HttpServletRequest request, ModelMap model) throws Exception{
		//1.加载默认的查询逻辑
		String path = super.query(request, model);
		
		//2.查询本页面特殊的服务类型选项
		ProductType proType = productTypeService.getByCode("tyre");
		request.setAttribute("tProductType", proType);
		proType = productTypeService.getByCode("maintenance");
		request.setAttribute("mProductTypes", productTypeService.getAllByParentId(proType.getId()));
		proType = productTypeService.getByCode("repair");
		request.setAttribute("rProductTypes", productTypeService.getAllByParentId(proType.getId()));
		
		model.put("sysUsers", JsonFuncs.toJson(sysUserService.getAll()));
		//3.跳转到jsp页面进行显示
		return path;
	}
	
	*//**
	 * 把状态修改为已回访
	 * @param request
	 * @param id
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping
	public View returnVisit(HttpServletRequest request, String id) throws Exception{
		try {
			baseService.returnVisit(id);
			return ActionResult.ok("回访成功", "/pmanager/order/bookform.do?op=query");
		} catch (Exception e) {
			return ActionResult.error("非法数据操作");
		}
	}
	
	*//**
	 * 指派客服
	 *//*
	@RequestMapping
	public String sendCustomerService(HttpServletRequest request, ModelMap model){
		String id = this.getParam("id");
		String code = this.getParam("code");
		baseService.sendCustomerService(id, code);
		return "redirect:/pmanager/order/bookform.do?op=query";
	}
	
	*//**
	 * myq add 2015-3-4，用于查询商城所有的消费券
	 *//*
	@RequestMapping
	public String queryDetail(HttpServletRequest request, ModelMap model) throws Exception{
		
		super.query(request, model, "queryDetail");
		
		ProductType proType = productTypeService.getByCode("tyre");
		request.setAttribute("tProductType", proType);
		proType = productTypeService.getByCode("maintenance");
		request.setAttribute("mProductTypes", productTypeService.getAllByParentId(proType.getId()));
		proType = productTypeService.getByCode("repair");
		request.setAttribute("rProductTypes", productTypeService.getAllByParentId(proType.getId()));
		return getJspFolderPath() + "/queryDetail";
	}
	
	*//**
	 * cjw add 2015-5-14 
	 * 用于每个商品(轮胎/服务)查看交易情况
	 *//*
	
	@RequestMapping
	public String queryByProduct(HttpServletRequest request, ModelMap model, String id)throws Exception{
		Pair<String, Integer> postConfig = this.getPostConfig(request, "query");
		
		String queryCondition=request.getParameter("queryCondition");
		//1.判断queryCondition是否为空
		JSONObject jsonObject=StrFuncs.isEmpty(queryCondition)?new JSONObject():JSONObject.fromObject(postConfig.first);
		//1.1为空的时候，自定义查询方法
		jsonObject.element("productId", id);
		String condition = jsonObject.toString();
		//1.2不为空，就使用postConfig.first里面的参数继续查询
		int pageNo = postConfig.second;
		QueryResult result = baseService.queryDetail(condition, PageSettings.of(pageNo));
		request.setAttribute("queryResult", result);
		//request.getParameterMap().put("queryCondition", "{productId:\"" + id + "\"}");
		super.query(request, model, "queryDetail");
		//2.把id放到model里面，在页面需要用到隐藏id
		model.put("id", id);
		return getJspFolderPath() + "/queryByProduct";
	}
	
	
	 查询商家 
	@RequestMapping
	public String queryFactory(HttpServletRequest request,HttpServletResponse response){
		
		int pageNo=this.getIntegerParam("pn", 1);
		
		// @1：获取前端json查询条件,请求页数
		String queryCondition = request.getParameter("queryCondition");
		
		QueryResult queryResult = factoryService.query(queryCondition,PageSettings.of(pageNo));
		
		request.setAttribute("queryResult", queryResult);
		request.setAttribute("queryCondition", queryCondition != null ?queryCondition : "{}");
		return getJspFolderPath() +"/queryFactory";
	}
	
	 
	 * 订单更换商家
	 
	@RequestMapping
	public void resetFactory(HttpServletRequest request,HttpServletResponse response,String bookformId,String factoryId){
		try {
			baseService.resetFactory(bookformId,factoryId);
			this.writeJson("{}");
		} catch (Exception e) {
			e.printStackTrace();
			this.writeErrorJson(e.getMessage());
		}
	}
	 
	 
	@RequestMapping
	public void resetSaleSource(HttpServletRequest request,HttpServletResponse response,String bookformId,String jsonObjects){
		
		try {
			//jsonObjects-->[{bookDetalId:1111,price:50},{bookDetalId:1111,price:50}];
			baseService.resetSaleSource(bookformId,jsonObjects);
			this.writeJson("{}");
		} catch (Exception e) {
			e.printStackTrace();
			this.writeErrorJson(e.getMessage());
		}
	}*/
	
	
	@Autowired
	public BookformService baseService;
	@Autowired
	public SysUserService sysUserService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private FactoryService factoryService;
	
}
