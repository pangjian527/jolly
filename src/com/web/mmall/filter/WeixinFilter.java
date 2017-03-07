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

import org.apache.commons.lang.StringUtils;

import pub.functions.StrFuncs;

import com.sys.entity.FactoryUser;
import com.web.mmall.consts.Consts;
import com.wxpay.util.WXConfigUtil;

public class WeixinFilter implements Filter{

	public void init(FilterConfig filterConfig) throws ServletException {
		//do nothing
	}
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
						 FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		String requestType = request.getHeader("X-Requested-With");
		if(StringUtils.isEmpty(requestType)){
			FactoryUser factoryUser = (FactoryUser)request.getSession().getAttribute(Consts.FACTORY_USER_SESSION_KEY);
			WXConfigUtil.createWXConfigParam(request);
			WXConfigUtil.createWXShareParam(request, factoryUser==null?"":factoryUser.getFactoryId());
		}
		filterChain.doFilter(servletRequest, servletResponse);
	}

	public void destroy() {
		//do nothing
	}
}
