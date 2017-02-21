package com.web.mmall.factoryuser.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pub.functions.StrFuncs;

import com.sys.entity.FactoryUser;
import com.sys.service.FactoryUserService;
import com.web.common.action.BaseAction;

@Controller 
public class LoginAction extends BaseAction{
	Logger logger = LoggerFactory.getLogger(LoginAction.class);
	@RequestMapping
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return "mmall/factoryuser/login";
	}
	
	@RequestMapping
	public String login(HttpServletRequest request,
			HttpServletResponse response, String account, String password) throws Exception {
		String errorMsg = null;
		try {
			if(StrFuncs.isEmpty(account) || StrFuncs.isEmpty(password)){
				throw new Exception("用户名或密码不能为空!");
			}
			logger.info("页面登录");
			factoryUserService.login(account.trim(), password.trim());
			logger.info("页面登录成功");
			
			/*String redirectUrl=this.getParam("redirectUrl");
			if(StrFuncs.notEmpty(redirectUrl)){
				return "redirect:"+redirectUrl;
			}*/
		} catch (Exception e) {
			e.printStackTrace();
			errorMsg = e.getMessage();
			request.setAttribute("errorMsg", errorMsg);
			return "mmall/factoryuser/login";
		}
		return "redirect:index.html";
	}
	
	@Autowired
	private FactoryUserService factoryUserService;
	
}
