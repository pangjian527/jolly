package com.web.mmall.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.mmall.consts.Consts;

public class SecurityFilter implements Filter{

	public void init(FilterConfig filterConfig) throws ServletException {
		//do nothing
	}
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
						 FilterChain filterChain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) servletRequest;
		//操作结果，不过滤
		if( request.getRequestURI().indexOf("/common/action_result.html") !=-1){
			filterChain.doFilter(servletRequest, servletResponse);
			return;
		}
		
		//如果打开登陆或注册页面，不需要做什么处理
		List<String> filterUrlList = this.getfilterUrlList(request.getContextPath());
		if (filterUrlList.contains(request.getRequestURI())) {
			filterChain.doFilter(servletRequest, servletResponse);
			return;
		}
		//如果用户已经使用帐号+密码登陆了Icrm系统，可以正常访问对内的 *.jsp和*.do
		if (request.getSession().getAttribute(Consts.FACTORY_USER_SESSION_KEY) != null) {
			//在这里后续判断用户访问的url是否和其拥有的权限匹配，如果超出权限，则转入非法页面提示
			filterChain.doFilter(servletRequest, servletResponse);
			return;
		}
		
		String indexUrl = request.getContextPath() + "/mmall/product/product.do";
		String method = request.getParameter("op");
		if (request.getRequestURI().equals(indexUrl)&& method==null) {
			filterChain.doFilter(servletRequest, servletResponse);
			return;
		}
		
		//如果未登陆客户试图通过直接输url的方式来强制访问PIM非公开页面，拒绝并转入PIM登陆页面
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		String loginUrl = request.getContextPath() + "/mmall/factoryuser/login.do";
		response.sendRedirect(loginUrl);
	}

	private List<String> getfilterUrlList(String contextPath) {
		List<String> filterUrlList = new ArrayList<String>();
		filterUrlList.add(contextPath+"/mmall/factoryuser/login.do");
		filterUrlList.add(contextPath+"/mmall/factoryuser/register.do");
		filterUrlList.add(contextPath+ "/mmall/area/area.do");
		return filterUrlList;
	}
	public void destroy() {
		//do nothing
	}
}
