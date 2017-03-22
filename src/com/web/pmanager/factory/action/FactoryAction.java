package com.web.pmanager.factory.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import pub.dao.query.PageSettings;
import pub.dao.query.QueryResult;
import pub.functions.JsonFuncs;
import pub.functions.StrFuncs;
import pub.spring.ActionResult;
import pub.types.IdText;
import pub.types.Pair;

import com.sys.entity.Area;
import com.sys.entity.Factory;
import com.sys.entity.SysUser;
import com.sys.service.AreaService;
import com.sys.service.BaseService;
import com.sys.service.FactoryService;
import com.sys.service.FileService;
import com.sys.service.ScoreService;
import com.sys.service.SysUserService;
import com.web.pmanager.PManagerAction;
import com.web.pmanager.consts.Consts;

/**
 * 后台商家商户管理
 * @author zhangz
 */
@Controller
public class FactoryAction extends PManagerAction<Factory>{

	@RequestMapping
	public String query(HttpServletRequest request, ModelMap model) throws Exception{
			
		Pair<String, Integer> postConfig = this.getPostConfig(request, "query");
		String queryCondition = postConfig.first;
		int pageNo = postConfig.second;
		
		// 地推只能查看自己开发的门店
		SysUser sysUser = this.getUser(request);
		JSONObject jsonObject = JsonFuncs.toJsonObject(queryCondition);
		if(sysUser.getOrganizationId().equals("channel")){
			jsonObject.element("sysUserId", sysUser.getId());
		}
		
		QueryResult result = factoryService.query(jsonObject.toString(), PageSettings.of(pageNo));
		request.setAttribute("queryResult", result);
		
		//记录当前的查询条件
		this.setPostConfig(request, "query", postConfig);
		
		return getJspFolderPath() + "/query";
	}
	
	@RequestMapping
	public void queryForSelect(HttpServletRequest request, HttpServletResponse response)throws Exception{

		int pageNo=this.getIntegerParam("pn", 1);
		
		// @1：获取前端json查询条件,请求页数
		String queryCondition = request.getParameter("condition");
		QueryResult result = factoryService.query(queryCondition, PageSettings.of(pageNo));
		
		JSONObject object = new JSONObject();
		object.element("total", result.getRowCount());
		List rows = result.getRows();
		
		//map直接转json，报错
		JSONArray jsonArr = new JSONArray();
		for(Map row : (List<Map>)result.getRows()){
			JSONObject jsonObj = new JSONObject();
			jsonObj.element("id", row.get("id"));
			jsonObj.element("name", row.get("name"));
			jsonArr.add(jsonObj);
		}
		object.element("results", jsonArr);
		
		this.writeJson(object);
	}
	
	@RequestMapping
	public void get(HttpServletRequest request, HttpServletResponse response, String id)throws Exception{

		//@1：获取前端json查询条件,请求页数
		Factory factory = factoryService.get(id);
		this.writeJson(factory);
	}
	
	
	/**
	 * jmj 2015-05-20 
	 * 复制功能 :让用户更方便添加新的商家
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping
	public String clone(HttpServletRequest request, ModelMap model, String id) throws Exception{
		//1.调用修改函数 ,接收返回路径
		String path = edit(request, model, id);
		//2.更改 map从修改函数存储的数据 id 为null, 完成复制操作
		Factory factory = (Factory) model.get("bean");
		factory.setId(null);
		//3.返回展示页面
		return path;
	}
	
	@RequestMapping
	public String getAreas(HttpServletRequest request,HttpServletResponse response, String parentId) throws Exception{
		try {
			List<IdText> areas = areaService.queryByParentId(parentId);
			
			this.writeJson(areas);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping
	public String locateGps(HttpServletRequest request, ModelMap model, String id) throws Exception{
		Factory factory = factoryService.get(id);
		
		Area cityArea = areaService.get(factory.getCityId());
		Area area = areaService.get(factory.getCountyId());
		
		model.put("city", cityArea);
		model.put("bean", factory);
		if(area != null){
			model.put("fullAddress", area.getFullName() + factory.getAddr());
		}
		
		return this.getJspFolderPath() + "/locateGps";
	}
	
	@RequestMapping
	public View saveGps(HttpServletRequest request, String id, Double gpsX, Double gpsY) throws Exception{
		boolean success = factoryService.saveGps(id, gpsX, gpsY, this.getUser(request));
		if(success){
			return ActionResult.ok( "坐标信息保存成功", "/pmanager/factory/factory.do?op=query&loadCache=1");
		}
		else{
			return ActionResult.fail("非法数据操作", "/pmanager/factory/factory.do?op=query&loadCache=1");
		}
	}
	
	@RequestMapping
	public View delete(HttpServletRequest request, String id) throws Exception{
		boolean success = factoryService.delete(id, getUser(request));
		if(success){
			return ActionResult.ok( "商家已被删除，如需恢复请联系系统管理员", "/pmanager/factory/factory.do?op=query");
		}
		else{
			return ActionResult.error("非法操作");
		}
	}
	/*
	 * 保存
	 */
	@RequestMapping
	public View save(HttpServletRequest request, String id) throws Exception{
		if(StrFuncs.isEmpty(id)){
			Factory factory =  new Factory();
			this.populate(factory);
			factoryService.saveFactoryAndCreateFactoryUser(factory,"123456");
		}else{
			Factory factory = factoryService.get(id);
			this.populate(factory);
			factoryService.save(factory);
		}
		
		return ActionResult.ok("保存成功", "/pmanager/factory/factory.do?op=query&loadcache=1");
	}
	
	/**
	 * 申请上架功能
	 * @param request
	 * @param id
	 * @param auditCheck
	 * @return
	 * @throws Exception
	 */
	@RequestMapping
	public View submit(HttpServletRequest request,String id, String auditCheck) throws Exception{
		boolean success = factoryService.submit(id, getUser(request));
		if(success){
			return ActionResult.ok( "商家已上架，可在商城进货", "/pmanager/factory/factory.do?op=query");
		}
		else{
			return ActionResult.error("非法操作");
		}
	}
	
	
	/**
	 * jmj 2015-05-20
	 * 直接下架功能
	 * @param request
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping
	public View disable(HttpServletRequest request, String id) throws Exception{
		boolean success = factoryService.disable(id, getUser(request));
		if(success){
			return ActionResult.ok( "商家已下架，无法在商城进货", "/pmanager/factory/factory.do?op=query");
		}
		else{
			return ActionResult.error("非法操作");
		}
	}
	
	
	
	
//	@RequestMapping
//	public View uploadLocation() throws Exception{
//		
//		//上报所有商家的地理信息（）
//		factoryService.uploadLocation();
//		
//		return ActionResult.ok( "上报完成", "/pmanager/factory/factory.do?op=query");
//	}
	
/*	protected String getJspFolderPath(){
		return "/pmanager/factory";
	};*/
/*	protected BaseService<Factory> getService(){
		return factoryService;
	}*/
	
	@RequestMapping
	public String factoryScore(HttpServletRequest request,ModelMap model, String id){
		
		int pageNo=this.getIntegerParam("pn", 1);
		
		//获取商家积分列表
		JSONObject object = new JSONObject();
		object.element("factoryId", id);
		QueryResult queryResult = scoreService.query(object.toString(), PageSettings.of(pageNo));
		
		//历史总积分
		double historyScore = scoreService.getFactoryHistoryScore(id);
		//已消费积分
		double consumeScore = scoreService.getFactoryConsumeScore(id);
		
		model.put("queryResult", queryResult);
		model.put("historyScore", historyScore);
		model.put("consumeScore", consumeScore);
		model.put("leaveScore", historyScore + consumeScore);
		return "/pmanager/factory/score";
	}
	
	@RequestMapping
	public String edit(HttpServletRequest request, ModelMap model, String id) throws Exception{
		model.put( "readonly", false);
		Factory bean = getService().get(id);
		//System.out.println("bean的值"+bean);
		model.put( "bean", bean);
		
		Factory refereeFactory = factoryService.get(bean.getRefereeId());
		model.put("refereeFactoryName", refereeFactory==null?"":refereeFactory.getName());//推荐商家
		
		SysUser sysUser = sysUserService.get(bean.getSysUserId());
		model.put("sysUserName", sysUser == null?"":sysUser.getName());//推荐职员
		return getJspFolderPath() + "/show";
	}
	
	@Autowired
	private FactoryService factoryService;
	@Autowired
	private FileService fileService;
	@Autowired
	private AreaService areaService;
	
	@Autowired
	private ScoreService scoreService;
	
	@Autowired
	private SysUserService sysUserService;
}
