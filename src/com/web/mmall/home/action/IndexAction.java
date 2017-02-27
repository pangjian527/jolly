package com.web.mmall.home.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import pub.dao.query.PageSettings;
import pub.dao.query.QueryResult;
import pub.types.Pair;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.entity.Factory;
import com.sys.entity.FactoryUser;
import com.sys.entity.Product;
import com.sys.entity.ProductItem;
import com.sys.entity.Score;
import com.sys.service.BookformService;
import com.sys.service.FactoryService;
import com.sys.service.ProductItemService;
import com.sys.service.ProductService;
import com.sys.service.ScoreService;
import com.sys.service.UsageRecordService;
import com.web.mmall.MMallActon;

@Controller
public class IndexAction  extends MMallActon{

	@RequestMapping
	public String execute(HttpServletRequest request,HttpServletResponse response){
		
		FactoryUser user = this.getUser();
		//1. 订单数量
		int countBookform = bookformService.countBookformByFactory(user.getFactoryId());
		//开店数量
		int countFactory = factoryService.countFactoryByRefereeId(user.getFactoryId());
		//总积分
		int totalScore = scoreService.getFactoryHistoryScore(user.getFactoryId());
		int useScore = scoreService.getFactoryConsumeScore(user.getFactoryId());
		
		request.setAttribute("countBookform", countBookform);
		request.setAttribute("countFactory", countFactory);
		request.setAttribute("score", totalScore - useScore );
		return "/mmall/home/index";
	}
	@RequestMapping
	public String security(){
		return "/mmall/home/security";
	}
	/* 防伪码详情 */
	@RequestMapping
	public String securityDetail(HttpServletRequest request,HttpServletResponse response,String securityCode){
		
		FactoryUser factoryUser = this.getUser();
		List<Pair<Long, String>> listResult = productItemService.getProeuctItemTimeLog(securityCode, factoryUser.getFactoryId());
		
		ProductItem productItem = productItemService.getBySecurityCode(securityCode);
		Product product = productService.get(productItem.getProductId());
		int countUsageQuery = usageRecordService.countUsageQuery(securityCode);
		
		request.setAttribute("listResult", listResult);
		request.setAttribute("product", product);
		request.setAttribute("countUsageQuery", countUsageQuery);
		return "/mmall/home/security_detail";
	}
	
	@RequestMapping
	public String scoreList(HttpServletRequest request,HttpServletResponse response){
		String pn =  request.getParameter("pn");
		int pageNo  = pn ==null ? 1:Integer.valueOf(pn); 
		FactoryUser user = this.getUser();
		if(user==null){
			return "redirect:/mmall/factoryuser/login.do";	
		}
		
		JSONObject condition=new JSONObject();
		condition.element("factoryId", user.getFactoryId());
		QueryResult queryResult = scoreService.query(condition.toString(), PageSettings.of(pageNo));
		Factory factory = factoryService.get(user.getFactoryId());
		request.setAttribute("queryResult", queryResult);
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
		
		String pn =  request.getParameter("pn");
		int pageNo  = pn ==null ? 1:Integer.valueOf(pn);
		JSONObject condition=new JSONObject();
		condition.element("refereeId", factory.getId());
		QueryResult queryResult =factoryService.query(condition.toString(), PageSettings.of(pageNo));
		
		List<Factory> factoryList = factoryService.getAllByRefereeId( factory.getId());
		
		request.setAttribute("factory", factory);
		request.setAttribute("queryResult", queryResult);
		request.setAttribute("factoryJsonArray", JSONArray.fromObject(factoryList));
		return "/mmall/home/recommend_list";
	}
	
	
	@Autowired
	private ScoreService scoreService;
	@Autowired
	private FactoryService factoryService;
	@Autowired
	private BookformService bookformService;
	@Autowired
	private ProductItemService productItemService;
	@Autowired
	private ProductService productService;
	@Autowired
	private UsageRecordService usageRecordService;
}
