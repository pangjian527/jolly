package com.web.mmall.home.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.entity.Factory;
import com.sys.entity.FactoryUser;
import com.sys.entity.Score;
import com.sys.service.FactoryService;
import com.sys.service.ScoreService;
import com.web.mmall.MMallActon;

@Controller
public class IndexAction  extends MMallActon{

	@RequestMapping
	public String execute(){
		return "/mmall/home/index";
	}
	@RequestMapping
	public String security(){
		return "/mmall/home/security";
	}
	@RequestMapping
	public String securityDetail(){
		return "/mmall/home/security_detail";
	}
	
	@RequestMapping
	public String scoreList(HttpServletRequest request,HttpServletResponse response){
		FactoryUser user = this.getUser();
		if(user==null){
			return "redirect:/mmall/factoryuser/login.do";	
		}
		List<Score> scoreList = scoreService.getAllByFactoryId(user.getFactoryId());
		Factory factory = factoryService.get(user.getFactoryId());
		request.setAttribute("scoreList", scoreList);
		request.setAttribute("factory", factory);
		return "/mmall/home/score_list";
	}
	
	@RequestMapping
	public String recommendList(HttpServletRequest request,HttpServletResponse response){
		FactoryUser user = this.getUser();
		if(user==null){
			return "redirect:/mmall/factoryuser/login.do";	
		}
		Factory factory = factoryService.get(user.getFactoryId());
		List<Factory> factoryList = factoryService.getAllByRefereeId(factory.getId());
		request.setAttribute("factory", factory);
		request.setAttribute("factoryList", factoryList);
		request.setAttribute("factoryJsonArray", JSONArray.fromObject(factoryList));
		return "/mmall/home/recommend_list";
	}
	
	
	@Autowired
	private ScoreService scoreService;
	@Autowired
	private FactoryService factoryService;
}
