package com.web.app.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.sys.consts.Consts;

/**
 * Created by IntelliJ IDEA.
 * User: dgs
 * Date: 2010-2-9
 * Time: 23:19:14
 */
public class PrepareGlobalDataListener implements ServletContextListener {

	public void contextInitialized(ServletContextEvent event) {
		ServletContext sc = event.getServletContext();
		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(sc);
		
		Consts.HOME = sc.getContextPath();

		sc.setAttribute("home", Consts.HOME);	
		Consts.REALPATH = sc.getRealPath("//");
		//sc.setAttribute("ak", JsonConfigUtils.getBaidu_ak());
		
		/*ConfigService configService = (ConfigService)wac.getBean("configService");
		
		Map<String,String> configs = configService.getByAll();
		Consts.configs = configs;
		sc.setAttribute("configs", configs);*/
	}

	public void contextDestroyed(ServletContextEvent event) {
	}
}
