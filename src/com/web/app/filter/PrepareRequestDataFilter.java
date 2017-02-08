package com.web.app.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pub.spring.RequestScopeMessageSource;
import pub.web.ServletUtils;

/**
 * Created by IntelliJ IDEA.
 * User: dgs
 * Date: 2010-2-12
 * Time: 1:56:57
 * 为每个request设值:ServletUtils
 */
public class PrepareRequestDataFilter implements Filter {

	public void init(FilterConfig config) throws ServletException {
		// do nothing
	}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
						 FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) servletRequest;
		ServletUtils.setRequest(request);
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		ServletUtils.setResponse(response);		
		try {
			chain.doFilter(servletRequest, servletResponse);
		}
		finally {
			ServletUtils.setRequest(null);
			RequestScopeMessageSource.clear();
		}
	}

	public void destroy() {
		// do nothing
	}
}
