package com.web.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import pub.functions.StrFuncs;

import com.web.consts.SessionConsts;

/**
 * 后台管理过滤器
 * @author zhangz
 *
 */
public class ManagerSecurityFilter implements Filter{
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
	
	@Override
	public void doFilter(ServletRequest _request, ServletResponse _response,
			FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) _request;
		HttpServletResponse response = (HttpServletResponse) _response;
		response.addHeader("P3P: CP", "\"CAO PSA OUR\"");
		
		String home = request.getContextPath();
		String uri = request.getRequestURI();		//当前访问的地址
		
		if (request.getSession().getAttribute(SessionConsts.SESSION_DATA) != null) {
			filterChain.doFilter(_request, _response);
			return;
		}
		
		String loginUrl = home + "/manager/login.html";	
		String referer = StrFuncs.nvl(request.getHeader("referer"));
		
		if (uri.equals(loginUrl) ||
			referer.indexOf(loginUrl) > 0) {
			filterChain.doFilter(_request, _response);
			return;
		}		
		response.sendRedirect(loginUrl);
	}
	

	@Override
	public void destroy() {
		
	}
}
