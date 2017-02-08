package com.web.utils;

import javax.servlet.ServletContext;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import pub.web.ServletUtils;

/**
 * @author dgs Date: 2008-9-4 Time: 23:54:40
 */
public class ServiceUtils {

	private static Object getBean(String beanName) {
		ServletContext sc = ServletUtils.getSession().getServletContext();
		WebApplicationContext wac = WebApplicationContextUtils
				.getWebApplicationContext(sc);
		return wac.getBean(beanName);
	}

	public static Object getService(String serviceName) {
		return getBean(serviceName);
	}
}
