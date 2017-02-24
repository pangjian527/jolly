package com.web.mmall.order.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.data.cart.CartData;
import com.sys.data.cart.CartItem;
import com.sys.entity.Bookform;
import com.sys.entity.Factory;
import com.sys.entity.FactoryUser;
import com.sys.entity.Product;
import com.sys.service.AreaService;
import com.sys.service.BookformService;
import com.sys.service.CartService;
import com.sys.service.FactoryService;
import com.sys.service.ProductService;
import com.sys.service.ScoreService;
import com.web.mmall.consts.Consts;
import com.web.mmall.entity.OrderEntity;
import com.web.pmanager.PManagerAction;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import pub.functions.JsonFuncs;

@Controller
public class OrderAction extends PManagerAction<Bookform>{

	public static JSONArray cartDatas = null;
	static{
		JSONObject object = new JSONObject();
		object.element("productId", "ff8081815a45acd6015a45afc17e0001").element("count", 2);
		JSONObject object1= new JSONObject();
		object1.element("productId", "ff8081815a6911e6015a6969e0e30004").element("count", 2);
		cartDatas = new JSONArray();
		cartDatas.add(object);
		cartDatas.add(object1);
	}
	
	/*下单加载页面*/
	@RequestMapping
	public String execute(HttpServletRequest request,HttpServletResponse response){
		//1. 获取到商家
		FactoryUser factoryUser = (FactoryUser)request.getSession().getAttribute(Consts.FACTORY_USER_SESSION_KEY);
		Factory factory = factoryService.get(factoryUser.getFactoryId());
		
		//2. 获取到商品
		CartData cartData = cartService.getCartData(cartDatas.toString());
		
		//3.获取积分
		int totalScore = scoreService.getFactoryHistoryScore(factory.getId());
		int consumeScore = scoreService.getFactoryConsumeScore(factory.getId());
		
		//4. 省市区
		
		request.setAttribute("cartData", cartData);
		request.setAttribute("factory",factory);
		request.setAttribute("score", totalScore - consumeScore);
		System.out.println(cartDatas.toString());
		request.setAttribute("items", cartDatas.toString());
		return "/mmall/order/submit";
	}
	
	//订单提交
	@RequestMapping
	public void submit(HttpServletRequest request,HttpServletResponse response){
		
		Object object = request.getSession().getAttribute(Consts.FACTORY_USER_SESSION_KEY);
		String man = request.getParameter("man");
		String mobile = request.getParameter("mobile");
		String provinceId = request.getParameter("provinceId");
		String cityId = request.getParameter("cityId");
		String countyId = request.getParameter("countyId");
		String addr = request.getParameter("addr");
		int payType = Integer.valueOf(request.getParameter("payType"));
		String cartDatas = request.getParameter("cartDatas");
		
		JSONObject resultObj = new JSONObject();
		if(object == null){
			resultObj.element("code", "loginerr").element("content","未登录，请先登录");
			this.writeJson(resultObj);
			return ;
		}
		//2. 获取到商品
		CartData cartData = cartService.getCartData(cartDatas);
		
		FactoryUser factoryUser = (FactoryUser) object;
		OrderEntity entity = new OrderEntity(man,mobile,provinceId,cityId,countyId,payType,addr);
		//3. 提交订单
		try {
			bookformService.submitBookform(cartData, factoryUser, entity);
		} catch (Exception e) {
			resultObj.element("code", "dataerr").element("content",e.getMessage());
			this.writeJson(resultObj);
			return ;
		}
		
		resultObj.element("code", "success");
		this.writeJson(resultObj);
	}
	
	/*立即付款*/
	@RequestMapping
	public String pay(HttpServletRequest request,HttpServletResponse response){
		
		return "/mmall/order/pay";
	}
	
	/*订单列表*/
	@RequestMapping
	public String list(){
		return "/mmall/order/list";
	}
	/*订单详情*/
	@RequestMapping
	public String detail(){
		return "/mmall/order/detail";
	}
	
	@Autowired
	private FactoryService factoryService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ScoreService scoreService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private BookformService bookformService;
	@Autowired
	private CartService cartService;
}
