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
import com.sys.service.FactoryService;
import com.sys.service.ProductService;
import com.sys.service.ScoreService;
import com.web.mmall.consts.Consts;
import com.web.pmanager.PManagerAction;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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
		List<CartItem> itemList = new ArrayList<CartItem>();
		for(int i=0 ;i<cartDatas.size();i++){
			JSONObject jsonObject = cartDatas.getJSONObject(i);
			
			CartItem cartItem = new CartItem();
			String productId = jsonObject.getString("productId");
			int count = jsonObject.getInt("count");
			Product product = productService.get(productId);
			
			cartItem.copyProperties(product);;
			cartItem.setCount(count);
			itemList.add(cartItem);
		}
		
		CartData cartData = new CartData();
		cartData.setItems(itemList);
		
		//3.获取积分
		int totalScore = scoreService.getFactoryHistoryScore(factory.getId());
		int consumeScore = scoreService.getFactoryConsumeScore(factory.getId());
		
		//4. 省市区
		
		request.setAttribute("cartData", cartData);
		request.setAttribute("factory",factory);
		request.setAttribute("score", totalScore - consumeScore);
		return "/mmall/order/submit";
	}
	
	//订单提交
	@RequestMapping
	public void submit(HttpServletRequest request,HttpServletResponse response){
		
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
}
