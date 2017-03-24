package com.web.mmall.factory.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import pub.dao.query.PageSettings;
import pub.dao.query.QueryResult;
import pub.functions.StrFuncs;

import com.sys.entity.Factory;
import com.sys.entity.FactoryUser;
import com.sys.service.FactoryService;
import com.sys.service.ScoreService;
import com.web.mmall.MMallActon;
import com.wxpay.util.WXConfigUtil;

@Controller
public class FactoryAction extends MMallActon{
	@RequestMapping
	public String execute(HttpServletRequest request,HttpServletResponse response,String factoryId){
		
		FactoryUser user = this.getUser();
		if(user==null){
			return "redirect:/mmall/factoryuser/login.do";
		}
		Factory factory = factoryService.get(user.getFactoryId());
		request.setAttribute("factory", factory);
		request.setAttribute("factoryImgIds", this.SplitToList(factory.getPhotoIds()));
		request.setAttribute("licenseImgIds", this.SplitToList(factory.getLicenseFileIds()));
		return "mmall/factory/detail";
	}
	
	@RequestMapping
	public String saveDetailInfo(HttpServletRequest request,HttpServletResponse response){
		
		FactoryUser user = this.getUser();
		if(user==null){
			return "redirect:/mmall/factoryuser/login.do";
		}
		Factory factory = factoryService.get(user.getFactoryId());
		if(factory.STATUS_INVALID==factory.getStatus()
				||factory.STATUS_OUT_OF_STOCK==factory.getStatus()){
			//商家已被删除或下架，不能进行认证
			return "redirect:/mmall/factoryuser/login.do";
		}
		
		updateFactoryInfo(factory);
		
		factoryService.save(factory);
		
		return "redirect:/mmall/home/index.do";
	}

	private void updateFactoryInfo(Factory factory) {
		String name = this.getParam("name");
		String man = this.getParam("man");
		String mobile = this.getParam("mobile");
		String provinceId = this.getParam("provinceId");
		String cityId = this.getParam("cityId");
		String countyId = this.getParam("countyId");
		String addr = this.getParam("addr");
		Double gpsX = this.getDoubleParam("gpsX");
		Double gpsY = this.getDoubleParam("gpsY");
		String licenseName = this.getParam("licenseName");
		String licenseFileIds = this.getParam("licenseFileIds");
		String photoIds = this.getParam("photoIds");
		String moneyAccount = this.getParam("moneyAccount");
		
		factory.setName(name);
		factory.setMan(man);
		factory.setMobile(mobile);
		factory.setProvinceId(provinceId);
		factory.setCityId(cityId);
		factory.setCountyId(countyId);
		factory.setAddr(addr);
		factory.setGpsX(gpsX);
		factory.setGpsY(gpsY);
		factory.setLicenseName(licenseName);
		factory.setLicenseFileIds(licenseFileIds);
		factory.setPhotoIds(photoIds);
		factory.setAgreeProtocol(Factory.PROTOCOL_AGREE);
		factory.setStatus(Factory.STATUS_APPROVE);;
		factory.setMoneyAccount(moneyAccount);
	}
	
	public List<String> SplitToList(String imgIds){
		if(StrFuncs.notEmpty(imgIds)){
			return Arrays.asList(imgIds.split(","));
		}else{
			return new ArrayList<String>();
		}
	}
	
	@Autowired
	private FactoryService factoryService;
	@Autowired
	private ScoreService scoreService;
}
