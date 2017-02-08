package com.web.common.action;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import pub.dao.query.PageSettings;
import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;
import pub.functions.StrFuncs;
import pub.models.listview.ListViewModel;
import pub.spring.ActionResult;
import pub.types.Pair;
import pub.utils.ExportUtils;

import com.sys.service.BaseService;

public abstract class ManageAction<T> extends BaseAction{
	
	@RequestMapping
	public String query(HttpServletRequest request, ModelMap model) throws Exception{
		
		Pair<String, Integer> postConfig = this.getPostConfig(request, "query");
		String queryCondition = postConfig.first;
		int pageNo = postConfig.second;
		
		BaseService<T> serviceBean = this.getService();
		QueryResult result = serviceBean.query(queryCondition, PageSettings.of(pageNo));
		request.setAttribute("queryResult", result);
		
		//记录当前的查询条件
		this.setPostConfig(request, "query", postConfig);

		return getJspFolderPath() + "/query";
	}
	
	protected String query(HttpServletRequest request, ModelMap model, String queryMethod) throws Exception{
		Pair<String, Integer> postConfig = this.getPostConfig(request, queryMethod);
		String queryCondition = postConfig.first;
		int pageNo = postConfig.second;
		
		BaseService serviceBean  = this.getService();
		Method method = serviceBean.getClass().getMethod(queryMethod, String.class, QuerySettings.class);
		QueryResult result = (QueryResult)method.invoke(serviceBean, queryCondition, PageSettings.of(pageNo));
		request.setAttribute("queryResult", result);
		
		
		//记录当前的查询条件
		setPostConfig(request, queryMethod, postConfig);
		return getJspFolderPath() + "/query";
	}
	
	protected Pair<String, Integer> getPostConfig(HttpServletRequest request, String method){	
		if(StrFuncs.notEmpty(request.getParameter("loadcache"))){
			//String attributeName = this.getClass().getName() + "." + method + ".config";
			//return (Pair<String, Integer>)request.getSession().getAttribute(attributeName);
			String queryCondition = (String)request.getParameter("queryCondition");
			if(StrFuncs.isEmpty(queryCondition)){
				queryCondition = "{}";
			}
			Integer pn = this.getIntegerParam("pn", 1); 
			return new Pair<String, Integer>(queryCondition, pn);
		}
		else{
			String queryCondition = (String)request.getParameter("queryCondition");
			if(StrFuncs.isEmpty(queryCondition)){
				queryCondition = "{}";
			}
			Integer pn = this.getIntegerParam("pn", 1); 
			return new Pair<String, Integer>(queryCondition, pn);
		}
	}
	
	protected void setPostConfig(HttpServletRequest request, String method, Pair<String, Integer> postConfig){
		String attributeName = this.getClass().getName() + "." + method + ".config";
		request.getSession().setAttribute(attributeName, postConfig);
		request.setAttribute("queryCondition", postConfig.first);
	}

	@RequestMapping
	public String add(HttpServletRequest request, ModelMap model)throws Exception {
		model.put( "readonly", false);
		T bean = getService().create();
		model.put( "bean", bean);

		return getJspFolderPath() + "/show";

	}
	
	/**
	 * myq add 2015-5-13，根据当前类的路径，推算出当前action和对应的jsp所在目录的路径
	 * @return
	 */
	private String webPath = null;
	protected String getJspFolderPath(){
		if(webPath == null){
			synchronized(this){
				if(webPath == null){
					String className =  this.getClass().getName();
					int startIndex = 7;
					int endIndex = className.indexOf(".action.");
					webPath = className.substring(startIndex, endIndex).replaceAll("\\.", "/").toLowerCase();
				}
			}
		}
		return webPath;
	}
	
	@RequestMapping
	public String edit(HttpServletRequest request, ModelMap model, String id) throws Exception{
		model.put( "readonly", false);
		T bean = getService().get(id);
		//System.out.println("bean的值"+bean);
		model.put( "bean", bean);
		return getJspFolderPath() + "/show";
	}
	
	@RequestMapping
	public String show(HttpServletRequest request, ModelMap model, String id) throws Exception{
		String path = edit(request, model, id);
		model.put( "readonly", true);
		return path;
	}
	
	private String actionPath = null;
	protected String getActionPath(){
		//actionPath = null;
		if(actionPath == null){
			synchronized(this){
				if(actionPath == null){
					String className = this.getClass().getSimpleName();//获得形如 "BaseAction"的对象
					StringBuffer actionName = new StringBuffer(className.substring(0, 1));//去掉尾部的"Action"
					for(int i = 1; i < className.length() - 6; i++){
						char c = className.charAt(i);
						if(c >= 'A' && c <= 'Z'){
							actionName.append("_");
						}
						actionName.append(c);
					}
					actionPath = getJspFolderPath() + "/" + actionName.toString().toLowerCase() + ".do";
				}
			}
		}
		return actionPath;
	}
	
	@RequestMapping
	public View save(HttpServletRequest request, String id) throws Exception{	
		BaseService<T> baseService = getService();
		T bean = StrFuncs.isEmpty(id) ? baseService.create() : baseService.get(id);
		this.populate(bean);
		baseService.save(bean);
		Class clazz = this.getClass();
		
		return ActionResult.ok("保存成功", getActionPath() + "?op=query&loadcache=1");
	}
	
	@RequestMapping
	public View delete(HttpServletRequest request, String id) throws Exception{
		getService().delete(id);
		return ActionResult.ok("删除成功", getActionPath() + "?op=query&loadcache=1");
	}
	
	/*
	 * myq 2015-5-12 增加，直接从子类中找出对应的service对象
	 * 本方法使用了大量的java 反射高级语法，请开发人员有空认真学习
	 * 
	*/
	private BaseService<T> baseService = null;
	protected BaseService<T> getService(){
		//baseService = null;//for debug only
		if(baseService != null){
			return baseService;
		}
		
		synchronized(this){
			if(baseService == null){
				//a.获取泛型类T的class对象
				Class actionTClass = getActualTypeClass(this.getClass());
				
				//b.通过反射遍历子类的全部service对象，找出对应的service     //获取实体类的所有属性，返回Field数组  
	            for(Field field : this.getClass().getDeclaredFields()){     //遍历所有属性
	            	//b.1 判断字段名称是否为 "xxxService"格式
	            	if(!field.getName().endsWith("Service")){
	            		continue;
	            	}
	            	//b.2 判断属性是object类型
	            	Type type = field.getGenericType();
	            	if(!(type instanceof Class)){
	            		continue;
	            	}
	            	//b.3 判断属性是 BaseService的子类
	            	Class fieldClass = (Class)type;
	            	if(!com.sys.service.BaseService.class.isAssignableFrom(fieldClass)){
	            		continue;
	            	}
	            	//b.4 判断属性的泛型类=classT
	            	Class serviceTClass = getActualTypeClass(fieldClass);
	            	if(actionTClass.equals(serviceTClass)){
	            		try{
	            			//这一步最为关键，否则父类是没有权利获取子类的私有变量的
	            			//spring对私有变量的注入，也是用的相同方法
	            			field.setAccessible(true);
	            			baseService = (BaseService<T>)field.get(this);
	            		}
	            		catch(Exception e){
	            			e.printStackTrace();
	            		}
	            	}
	            }
			}
			return baseService;
		}
	}
	//myq add 2015-5-12，获取泛型类对应的第一个class,如
	private Class getActualTypeClass(Class clazz){
		ParameterizedType parameterizedType = (ParameterizedType)clazz.getGenericSuperclass(); 
		Type[] params = parameterizedType.getActualTypeArguments();  
		return (Class)params[0];
	}
	
	@RequestMapping
	public void export(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		
		Pair<String, Integer> postConfig = this.getPostConfig(request, "query");
		String queryCondition = postConfig.first;
		int pageNo = postConfig.second;
		
		BaseService<T> serviceBean = this.getService();
		//创建导出模板
		ListViewModel sampleListViewModel=serviceBean.getExportModel(queryCondition, PageSettings.of(pageNo));
		ExportUtils.exportToExcel(response, sampleListViewModel, getService().create().getClass().getSimpleName());
	}
}
