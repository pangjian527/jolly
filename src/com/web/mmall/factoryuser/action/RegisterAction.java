package com.web.mmall.factoryuser.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pub.functions.StrFuncs;

import com.sys.entity.Factory;
import com.sys.entity.FactoryUser;
import com.sys.service.FactoryService;
import com.sys.service.FactoryUserService;
import com.sys.service.SmsService;
import com.sys.service.TempVerifycodeService;
import com.web.common.action.BaseAction;

@Controller
public class RegisterAction extends BaseAction{
	@RequestMapping
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception { 
		return "mmall/factoryuser/register";
	}
	
	/*
	 * 	新用户注册时，根据用户输入的注册手机号，发送短信验证码
	 * */
	@RequestMapping
	public void sendRegistVerifycode(HttpServletRequest request, HttpServletResponse response, String mobile,String imgcode) {
		try{
			if(!tempVerifycodeService.verify(request.getSession().getId(), imgcode)){
				throw new Exception("请输入正确的图形验证码");
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
			/*String errorInfo = smsService.sendSms(mobile, content, this.getIp(), "Mobile Regist");
			if(errorInfo != null){
				throw new Exception(errorInfo);
			}*/
			this.writeErrorJson("");
		}
		catch (Exception e) {
			//4.处理短信
			e.printStackTrace();
			this.writeJson("{error:'"+e.getMessage()+"'}");
		}	
	}
	
	@RequestMapping
	public void register(HttpServletRequest request,HttpServletResponse response){
		try {
			//TODO 注册商家信息
			String mobile = this.getParam("mobile");
			String verifycode = this.getParam("verifycode");
			String password = this.getParam("password");
			String factoryName = this.getParam("factoryName");
			String provinceId = this.getParam("provinceId");
			String cityId = this.getParam("cityId");
			String countyId = this.getParam("countyId");
			String addr = this.getParam("addr");
			if(!tempVerifycodeService.verify(mobile, verifycode)){
				//throw new Exception("请输入正确的验证码");
			}
			
			Factory  factory = new Factory();
			factory.setMobile(mobile);
			factory.setName(factoryName);
			factory.setProvinceId(provinceId);
			factory.setCityId(cityId);
			factory.setCountyId(countyId);
			factory.setAddr(addr);
			factoryService.saveFactoryAndCreateFactoryUser(factory, password);
			this.writeErrorJson("");
		}
		catch (Exception e) {
			e.printStackTrace();
			this.writeJson("{error:'"+e.getMessage()+"'}");
		}
	}
	
	@Autowired
	private TempVerifycodeService tempVerifycodeService;
	@Autowired
	private SmsService smsService;
	@Autowired
	private FactoryService factoryService;
	@Autowired
	private FactoryUserService factoryUserService;
}
