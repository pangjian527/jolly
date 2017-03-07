package com.web.mmall.home.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import pub.dao.query.PageSettings;
import pub.dao.query.QueryResult;
import pub.functions.JsonFuncs;
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
import com.wxpay.util.WXConfigUtil;

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
		double totalScore = scoreService.getFactoryHistoryScore(user.getFactoryId());
		double useScore = scoreService.getFactoryConsumeScore(user.getFactoryId());
		Factory factory = factoryService.get(user.getFactoryId());
		request.setAttribute("countBookform", countBookform);
		request.setAttribute("countFactory", countFactory);
		request.setAttribute("score", totalScore - useScore );
		request.setAttribute("factory", factory);
		return "/mmall/home/index";
	}
	@RequestMapping
	public String security(HttpServletRequest request,HttpServletResponse response){
		return "/mmall/home/security";
	}
	/* 防伪码详情 */
	@RequestMapping
	public String securityDetail(HttpServletRequest request,HttpServletResponse response,String securityCode){
		
		FactoryUser factoryUser = this.getUser();
		
		ProductItem productItem = productItemService.getBySecurityCode(securityCode);
		if(productItem==null || productItem.getStatus()  != ProductItem.STATUS_OUT_STOCK){
			return "/mmall/home/security_detail";
		}
		//记录
		List<Pair<Long, String>> listResult = productItemService.getProeuctItemTimeLog(securityCode, factoryUser.getFactoryId());
		
		Product product = productService.get(productItem.getProductId());
		int countUsageQuery = usageRecordService.countUsageQuery(securityCode);
		
		//添加查询记录
		usageRecordService.addUsage(securityCode, factoryUser.getFactoryId());
		
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
		PageSettings setting = PageSettings.of(pageNo);
		QueryResult queryResult = scoreService.query(condition.toString(), setting);
		Factory factory = factoryService.get(user.getFactoryId());
		int totalPage = queryResult.getRowCount()%setting.getPageSize()==0
				?queryResult.getRowCount()/setting.getPageSize():queryResult.getRowCount()/setting.getPageSize()+1;
		request.setAttribute("queryResult", queryResult);
		request.setAttribute("totalPage",totalPage );
		request.setAttribute("factory", factory);
		return "/mmall/home/score_list";
	}
	
	@RequestMapping
	public void listScoreAsync(HttpServletRequest request,HttpServletResponse response){
		JSONObject jsonObject = new JSONObject();
		String pn =  request.getParameter("pn");
		int pageNo  = pn ==null ? 1:Integer.valueOf(pn); 
		FactoryUser user = this.getUser();
		if(user==null){
			this.writeJson(jsonObject);
			return;	
		}
		
		JSONObject condition=new JSONObject();
		condition.element("factoryId", user.getFactoryId());
		PageSettings setting = PageSettings.of(pageNo);
		QueryResult queryResult = scoreService.query(condition.toString(), setting);
		Factory factory = factoryService.get(user.getFactoryId());
		
		jsonObject.element("scoreList", queryResult.getRows());
		jsonObject.element("factory", factory);
		this.writeJson(jsonObject);
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
		PageSettings setting = PageSettings.of(pageNo);
		QueryResult queryResult =factoryService.query(condition.toString(), setting);
		int totalPage = queryResult.getRowCount()%setting.getPageSize()==0
				?queryResult.getRowCount()/setting.getPageSize():queryResult.getRowCount()/setting.getPageSize()+1;
		List<Factory> factoryList = factoryService.getAllByRefereeId( factory.getId());
		
		request.setAttribute("factory", factory);
		request.setAttribute("queryResult", queryResult);
		request.setAttribute("totalPage",totalPage );
		request.setAttribute("factoryJsonArray", JSONArray.fromObject(factoryList));
		request.setAttribute("indexNum",request.getParameter("indexNum") );
		return "/mmall/home/recommend_list";
	}
	
	@RequestMapping
	public void listRecommendAsync(HttpServletRequest request,HttpServletResponse response){
		JSONObject jsonObject = new JSONObject();
		FactoryUser user = this.getUser();
		if(user==null){
			this.writeJson(jsonObject);
			return;	
		}
			
		Factory factory = factoryService.get(user.getFactoryId());
		
		String pn =  request.getParameter("pn");
		int pageNo  = pn ==null ? 1:Integer.valueOf(pn);
		JSONObject condition=new JSONObject();
		condition.element("refereeId", factory.getId());
		PageSettings setting = PageSettings.of(pageNo);
		QueryResult queryResult =factoryService.query(condition.toString(), setting);
		
		jsonObject.element("recommendList", queryResult.getRows());
		this.writeJson(jsonObject);
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
