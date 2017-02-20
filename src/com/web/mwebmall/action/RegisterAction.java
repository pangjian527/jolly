package com.web.mwebmall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pub.functions.StrFuncs;

import com.sys.entity.FactoryUser;
import com.sys.service.FactoryUserService;
import com.sys.service.SmsService;
import com.sys.service.TempVerifycodeService;
import com.web.common.action.BaseAction;

@Controller
public class RegisterAction extends BaseAction{
	@RequestMapping
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception { 
		return "wechat/register";
	}
	
	/*
	 * 	新用户注册时，根据用户输入的注册手机号，发送短信验证码
	 * */
	@RequestMapping
	public void sendRegistVerifycode(HttpServletRequest request, HttpServletResponse response,
			String cityId, String callbackMethod, String mobile,String imgcode) {
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
			if(factoryUser != null){
				
				throw new Exception("号码已经在本站注册，请直接登录");
			}

			
			//2.生成验证码和短信内容
			String code = tempVerifycodeService.createVerifycode(mobile);
			System.out.println("手机验证码：" + code);
			String content = "您的注册验证码为 " + code + "，请勿向他人透露";
			
			//3.发送短信
			String errorInfo = smsService.sendSms(mobile, content, this.getIp(), "Mobile Regist");
			if(errorInfo != null){
				throw new Exception(errorInfo);
			}
			this.writeErrorJson("");
		}
		catch (Exception e) {
			//4.处理短信
			e.printStackTrace();
			this.writeJson("{error:'"+e.getMessage()+"'}");
		}	
	}
	
	@Autowired
	private TempVerifycodeService tempVerifycodeService;
	@Autowired
	private SmsService smsService;
	@Autowired
	private FactoryUserService factoryUserService;
}
