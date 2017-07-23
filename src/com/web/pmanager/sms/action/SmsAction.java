package com.web.pmanager.sms.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import pub.functions.StrFuncs;


import com.sys.entity.SysRole;
import com.sys.service.SmsService;
import com.web.pmanager.PManagerAction;

@Controller
public class SmsAction extends PManagerAction<SysRole>{
	
	@RequestMapping
	public String execute(HttpServletRequest request, ModelMap model) throws Exception{
		System.out.println("---》");
		return "/pmanager/sms/smssend";
	}
	@RequestMapping
	public void sendSms(HttpServletRequest request, ModelMap model,HttpServletResponse response) throws Exception{
		
		String mobiles = request.getParameter("mobiles");
		String templateId = request.getParameter("templateId");
		try{
			
			if(StrFuncs.isEmpty(mobiles) || StrFuncs.isEmpty(templateId)){
				throw new Exception("号码和模板Id都不能为空");
			}
			
			String[] mobileArr = mobiles.split(",");
			
			JSONArray jsonArray = new JSONArray();
			for(String s : mobileArr){
				jsonArray.add(s);
			}
			
			//2.发送验证码
			smsService.sendTempMsg(templateId, jsonArray, jsonArray);
			//3.发送短信
			this.writeErrorJson("");
		}catch (Exception e) {
			//4.处理短信
			e.printStackTrace();
			this.writeJson("{error:'"+e.getMessage()+"'}");
		}
		
	}
	
	@Autowired
	private SmsService smsService;

}
