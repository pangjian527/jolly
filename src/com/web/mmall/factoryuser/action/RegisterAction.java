package com.web.mmall.factoryuser.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

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
import com.web.mmall.MMallActon;
import com.web.utils.netease.Template;
import com.wxpay.config.WXPayConfig;
import com.wxpay.util.WXConfigUtil;

@Controller
public class RegisterAction extends MMallActon{
	@RequestMapping
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception { 
		
		String uid = this.getParam("uid")==null?"" :this.getParam("uid");
		String pid = this.getParam("pid")==null?"" :this.getParam("pid");
		
		String redirectUrl=request.getRequestURL()+"?op=toRegisterPage&uid="+uid+"&pid="+pid;
		String weiXinOauthurl=WXConfigUtil.getWxOauthUrl(redirectUrl);
		String ua = request.getHeader("user-agent").toLowerCase();
		if(ua.indexOf("micromessenger")>0){//微信端才需要获取openid
			response.sendRedirect(weiXinOauthurl);
		}else{
			response.sendRedirect(redirectUrl);
		}
	}
	
	@RequestMapping
	public String toRegisterPage(HttpServletRequest request, HttpServletResponse response) throws Exception { 
		
		String uid = this.getParam("uid");
		String pid = this.getParam("pid");
		
		request.setAttribute("uid", uid == null ?"": uid);
		request.setAttribute("pid", pid == null ? "" : pid);
		request.setAttribute("subscribe",0);
		if(StrFuncs.notEmpty(request.getParameter("code"))){
			try {
				Map<String, String> oauthResult = WXConfigUtil.getOauthResult(request.getParameter("code"));
				String openId = (String)oauthResult.get("openid");
				Map<String, String> baseInfo = WXConfigUtil.getBaseInfo(WXPayConfig.WX_TOKEN, openId);
				if(baseInfo!=null&&baseInfo.get("subscribe")!=null){
					request.setAttribute("subscribe", baseInfo.get("subscribe"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
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

			
			//2.发送验证码
			String code = smsService.sendMsg(mobile,Template.TEMPLATE_REGISTER_CODE);
			System.out.println("手机验证码：" + code);
			
			//3.发送短信
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
			String sysUserId = this.getParam("uid");
			String refereeId = this.getParam("pid");
			if(!smsService.validate(mobile, verifycode)){
				throw new Exception("请输入正确的验证码");
			}
			
			Factory  factory = new Factory();
			factory.setMobile(mobile);
			factory.setName(factoryName);
			factory.setProvinceId(provinceId);
			factory.setCityId(cityId);
			factory.setCountyId(countyId);
			factory.setAddr(addr);
			factory.setSysUserId(sysUserId);
			factory.setRefereeId(refereeId);
			factory.setStatus(Factory.STATUS_DRAFT);
			factoryService.saveFactoryAndCreateFactoryUser(factory, password);
			FactoryUser user = factoryUserService.getByMobile(mobile);//获取用户
			this.setUser(user);
			
			//发送注册后的信息
			sendRegisterMsg(factory);
			this.writeErrorJson("");
		}
		catch (Exception e) {
			e.printStackTrace();
			this.writeJson("{error:'"+e.getMessage()+"'}");
		}
	}
	
	
	private void sendRegisterMsg(Factory factory) throws Exception {
		JSONArray mobileArr= new JSONArray();
		mobileArr.add(factory.getMobile());
		JSONArray tempParamArr= new JSONArray();
		tempParamArr.add(factory.getMobile());
		if(StrFuncs.isEmpty(factory.getName())
				||StrFuncs.isEmpty(factory.getAddr())
				||StrFuncs.isEmpty(factory.getProvinceId())
				||StrFuncs.isEmpty(factory.getCityId())
				||StrFuncs.isEmpty(factory.getCountyId())){
			smsService.sendTempMsg(Template.TEMPLATE_LACK_INFO_CODE, mobileArr, tempParamArr);
		}else{
			smsService.sendTempMsg(Template.TEMPLATE_UNAUTH_CODE, mobileArr, tempParamArr);
		}
	}

	@RequestMapping
	public String followPage(HttpServletRequest request,HttpServletResponse response){
		return "mmall/factoryuser/result";
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
