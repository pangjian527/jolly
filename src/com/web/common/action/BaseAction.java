package com.web.common.action;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import pub.functions.BeanFuncs;
import pub.functions.ColFuncs;
import pub.functions.DateFuncs;
import pub.functions.JsonFuncs;
import pub.functions.StrFuncs;
import pub.web.ServletUtils;

/**
 * myq add 2015-8,所有action的基类，封装了对session,cookie,ip等与基础的功能
 * @author newbaby
 *
 * @param <T>
 */
public abstract class BaseAction {
	
	protected HttpServletRequest request(){
		return ServletUtils.getRequest();
	}
	
	protected HttpServletResponse response(){
		return ServletUtils.getResponse();
	}
	
	protected Object getSession(String key){
		return request().getSession().getAttribute(key);
	}
	
	protected Object getSession(String key, Object defaultValue){
		Object value = request().getSession().getAttribute(key);
		if(value != null){
			return value;
		}
		else{
			this.setSession(key, defaultValue);
			return defaultValue;
		}
	}
	
	protected void setSession(String key, Object value){
		request().getSession().setAttribute(key, value);
	}
	
	protected void removeSession(String key){
		request().getSession().removeAttribute(key);;
	}
	
	protected String getCookie(String key){
		try{
			Cookie[] cookies = request().getCookies(); 
			if(cookies != null){
				for(Cookie cookie : cookies){
					if(cookie.getName().equals(key)){
						return URLDecoder.decode(cookie.getValue(),"UTF-8");
					}
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return null;
	}
	
	//设置cookie
	protected void setCookie(String key, String value){
		try {
			Cookie cookie = new Cookie(key, URLEncoder.encode(value,"UTF-8")); 
			cookie.setPath("/");
			cookie.setMaxAge(60 * 60 * 24 * 365);
			response().addCookie(cookie);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void removeCookie(String key){
		Cookie cookie = new Cookie(key, null);
		cookie.setPath("/");
		cookie.setMaxAge(0);
		response().addCookie(cookie);
	}
	
	protected String getIp() { 
	    String ip = request().getHeader("x-forwarded-for"); 
	    if(StrFuncs.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) { 
	        ip = request().getHeader("Proxy-Client-IP"); 
	    } 
	    if(StrFuncs.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) { 
	        ip = request().getHeader("WL-Proxy-Client-IP"); 
	    } 
	    if(StrFuncs.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) { 
	        ip = request().getRemoteAddr(); 
	    } 
	    return ip; 
	}
	
	protected String getUrl(HttpServletRequest request){
		String url = "http://" + request().getServerName() //服务器地址  
			+ ":"   
			+ request().getServerPort()           //端口号  
			+ request().getContextPath()      //项目名称  
			+ request().getServletPath();      //请求页面或其他地址  
		
		String queryText = request().getQueryString();
		if(StrFuncs.notEmpty(queryText)){
			url += "?" + queryText;
		}
		
		return url;
	}
	
	protected void populate(Object bean){
		
		Map map = request().getParameterMap();
		if (map.size() == 0) {
			return;
		}
		//myq add 2013-11-8,解决 request中同一个表单name包含多个值时(多选框checkbox典型)，默认populat方法只保存数组中第一个值的bug
		Iterator iter = map.entrySet().iterator(); 
		while (iter.hasNext()) { 
		    Map.Entry entry = (Map.Entry) iter.next(); 
		    Object key = entry.getKey(); 
		    Object val = entry.getValue(); 
		    if(val instanceof String[]){
		    	entry.setValue(StrFuncs.join((String[])val, ","));
		    }
		} 

		try {
			BeanFuncs.populate(bean, map);	
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected Map<String, String> getParamData(){
		Map<String, String> result = new HashMap<String, String>();
		
		//myq add 2013-11-8,解决 request中同一个表单name包含多个值时(多选框checkbox典型)，默认populat方法只保存数组中第一个值的bug
		Iterator iter = request().getParameterMap().entrySet().iterator(); 
		while (iter.hasNext()) { 
		    Map.Entry entry = (Map.Entry) iter.next(); 
		    Object key = entry.getKey(); 
		    Object val = entry.getValue(); 
		    if(val instanceof String[]){
		    	result.put(key.toString(), StrFuncs.join((String[])val, ","));
		    }
		    else{
		    	result.put(key.toString(), val.toString());
		    }
		}
		return result;
	}
	
	protected String getParam(String paramName) {
		return getParam(paramName, null);
	}

	protected String[] getParams(String paramName) {
		String[] sValues = request().getParameterValues(paramName);

		return sValues;
	}

	protected String getParam(String paramName, String defaultValue) {
		String result = request().getParameter(paramName);
		return StrFuncs.isEmpty(result) ? defaultValue : result;
	}

	//
	protected Integer getIntegerParam(String paramName) {
		return getIntegerParam(paramName, null);
	}

	protected Integer getIntegerParam(String paramName, Integer defaultValue) {
		String result = request().getParameter(paramName);
		try {
			return Integer.parseInt(result);
		}
		catch (Exception e) { // null or bad format
			return defaultValue;
		}
	}

	protected Double getDoubleParam(String paramName) {
		return getDoubleParam(paramName, null);
	}
	protected Double getDoubleParam(String paramName, Double defaultValue) {
		String result = request().getParameter(paramName);
		try {
			return Double.parseDouble(result);
		}
		catch (Exception e) { // null or bad format
			return defaultValue;
		}
	}
	
	protected Date getDateParam(String paramName) {
		return getDateParam(paramName, null);
	}
	
	protected Date getDateParam(String paramName, Date defaultValue) {
		String result = request().getParameter(paramName);
		try {
			return DateFuncs.valueOf(result);
		}
		catch (Exception e) { // null or bad format
			return defaultValue;
		} 
	}

	protected Integer[] getIntegerParams(String paramName) {
		String[] sValues = request().getParameterValues(paramName);
		if (ColFuncs.isEmpty(sValues)){
			return new Integer[]{};
		}
		try{
			Integer[] values = new Integer[sValues.length];
			for (int n = 0; n < sValues.length; n++) {
				values[n] = Integer.parseInt(sValues[n]);
			}
			return values;
		}	
		catch(Exception e){
			return new Integer[]{};
		}
	}
	
/*	private static JsonConfig jsonConfig;
	static {
		jsonConfig = new JsonConfig();
		JsDateJsonBeanProcessor beanProcessor = new JsDateJsonBeanProcessor();
		jsonConfig.registerJsonBeanProcessor(java.util.Date.class, beanProcessor);
	}*/

	protected void writeJson(Object bean) {
		//String json = JSONSerializer.toJSON(obj, jsonConfig).toString();
		HttpServletResponse response = response();
		try {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			response.setContentType("application/json;charset=UTF-8");
			response.setHeader("Cache-Control", "no-store");
			response.getWriter().print(JsonFuncs.toJson(bean, true));
		}
		catch (IOException e) {
			throw new RuntimeException(e);
			
		}
	}
	protected void writeErrorJson(String text){
		JSONObject obj = new JSONObject();
		obj.element("error", text);
		this.writeJson(obj);
	}

}
