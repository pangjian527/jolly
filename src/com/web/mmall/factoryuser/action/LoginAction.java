package com.web.mmall.factoryuser.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pub.functions.CryptFuncs;
import pub.functions.StrFuncs;

import com.sys.entity.FactoryUser;
import com.sys.service.FactoryUserService;
import com.sys.service.SmsService;
import com.sys.service.TempVerifycodeService;
import com.web.common.action.BaseAction;
import com.web.mmall.MMallActon;
import com.web.mmall.consts.Consts;

@Controller 
public class LoginAction extends MMallActon{
	Logger logger = LoggerFactory.getLogger(LoginAction.class);
	@RequestMapping
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return "mmall/factoryuser/login";
	}
	
	@RequestMapping
	public String toLoginSms(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return "mmall/factoryuser/login_sms";
	}
	
	@RequestMapping
	public void login(HttpServletRequest request,
			HttpServletResponse response, String account, String password) throws Exception {
		try {
			if(StrFuncs.isEmpty(account) || StrFuncs.isEmpty(password)){
				throw new Exception("用户名或密码不能为空!");
			}
			logger.info("页面登录");
			
			FactoryUser factoryUser = factoryUserService.login(account.trim(), password.trim());
			this.setUser(factoryUser);
			logger.info("页面登录成功");
			
			/*String redirectUrl=this.getParam("redirectUrl");
			if(StrFuncs.notEmpty(redirectUrl)){
				return "redirect:"+redirectUrl;
			}*/
			this.writeErrorJson("");
		} catch (Exception e) {
			e.printStackTrace();
			this.writeJson("{error:'"+e.getMessage()+"'}");
		}
	}
	
	@RequestMapping
	public void loginSms(HttpServletRequest request,
			HttpServletResponse response,String mobile, String verifycode) throws Exception {
		
		try {
			if(!smsService.validate(mobile, verifycode)){
				throw new Exception("请输入正确的验证码");
			}
			logger.info("页面登录");
			FactoryUser factoryUser = factoryUserService.getByMobile(mobile);
			this.setUser(factoryUser);	
			logger.info("页面登录成功");
			
			this.writeErrorJson("");
		} catch (Exception e) {
			e.printStackTrace();
			this.writeJson("{error:'"+e.getMessage()+"'}");
		}
	}
	
	
	
	@RequestMapping
	public void sendLoginVerifycode(HttpServletRequest request, HttpServletResponse response,
			 String mobile,String imgcode) {
		try{
			if(!tempVerifycodeService.verify(request.getSession().getId(), imgcode)){
				this.writeErrorJson("请输入正确的图形验证码");
				return;
			}
			//1.有效性验证
			if(!StrFuncs.IsMobile(mobile)){
				throw new Exception("请输入正确的手机号码");
			}
			FactoryUser factoryUser = factoryUserService.getByMobile(mobile);
			if(factoryUser == null){
				
				throw new Exception("用户不存在，请先进行注册");
			}

			
			//2.发送验证码
			String code = smsService.sendMsg(mobile);
			System.out.println("手机验证码：" + code);
			this.writeErrorJson("");
		}
		catch (Exception e) {
			//4.处理短信
			e.printStackTrace();
			this.writeJson("{error:'"+e.getMessage()+"'}");
		}	
	}
	
	@RequestMapping
	public String logout(HttpServletRequest request,HttpServletResponse response) {
		this.removeUser();
		return "redirect:/mmall/product/product.do";
	}
	@Autowired
	private FactoryUserService factoryUserService;
	@Autowired
	private TempVerifycodeService tempVerifycodeService;
	@Autowired
	private SmsService smsService;
}
