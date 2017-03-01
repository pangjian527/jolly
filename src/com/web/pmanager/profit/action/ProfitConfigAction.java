package com.web.pmanager.profit.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import com.sys.entity.Product;
import com.sys.entity.ProfitConfig;
import com.sys.service.ProfitConfigService;
import com.web.pmanager.PManagerAction;

import pub.dao.query.PageSettings;
import pub.dao.query.QueryResult;
import pub.spring.ActionResult;

@Controller
public class ProfitConfigAction extends PManagerAction<ProfitConfig>{

	@RequestMapping
	public String query(HttpServletRequest request,  ModelMap model)throws Exception{
		
		int pageNo=this.getIntegerParam("pn", 1);
		
		QueryResult queryResult = profitConfigService.query(null, PageSettings.of(pageNo));
		
		request.setAttribute("queryResult", queryResult);
		return "/pmanager/profit/query";
	}
	
	@RequestMapping
	public String add(HttpServletRequest request,  ModelMap model)throws Exception{
		return "/pmanager/profit/show";
	}
	
	@RequestMapping
	public View save(HttpServletRequest request,  String id)throws Exception{
		
		ProfitConfig profitConfig = new ProfitConfig();
		this.populate(profitConfig);
		profitConfig.setStatus(ProfitConfig.STATIC_INVALID);
		
		profitConfigService.save(profitConfig);;
		
		return ActionResult.ok("保存成功", getActionPath() + "?op=query");
	}
	
	@RequestMapping
	public void enable(HttpServletRequest request,  String id,HttpServletResponse response){
		String result = profitConfigService.enable(id);
		if(result == null){
			this.writeJson(true);
		}else{
			this.writeErrorJson(result);
		}
	}
	
	@RequestMapping
	public void disable(HttpServletRequest request,  String id,HttpServletResponse response){
		String result = profitConfigService.disable(id);
		if(result == null){
			this.writeJson(true);
		}else{
			this.writeErrorJson(result);
		}
	}
	
	
	@Autowired
	private ProfitConfigService profitConfigService;
}
