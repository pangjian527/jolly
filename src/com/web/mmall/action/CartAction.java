package com.web.mmall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.data.cart.CartData;
import com.sys.data.cart.CartItem;
import com.sys.entity.FactoryUser;
import com.sys.entity.Product;
import com.sys.service.CartService;
import com.sys.service.FactoryService;
import com.sys.service.ProductService;
import com.web.mmall.MMallActon;

/*
 * @版本信息：2014-11-6
 * 
 * @功能说明：手机客户端加载手机action
 */
@Controller
public class CartAction  extends MMallActon {
	
	/*
	 * 
	 */
	@RequestMapping
	public String execute(HttpServletRequest request,HttpServletResponse response, 
			String cityId){
		FactoryUser user = this.getUser();
		if(user!=null){
			CartData cartData = cartService.getData(user.getId());
			//补充相关属性，并删除全部无效的数据
			cartService.complete(cartData);
			cartData.clearInvalidItems();
			request.setAttribute("cartData", cartData);
		}
		
		return "mmall/cart";
	}
	
	
	
	/**
	 * myq add 2015-3-15，增加or减少购物车内的项目
	 * @param productId
	 * @param count
	 * @param localCart
	 */
	@RequestMapping
	public void setItemCount(HttpServletRequest request,HttpServletResponse response, 
			String cityId, String productId, Integer count){
		FactoryUser user = this.getUser();
		if(user==null){
			this.writeJson("{error:\'请先登录\'}");
			return;
		}
		//1.检查
		CartData cartData = cartService.getData(user.getId());
		//3.新增项目
		CartItem targetItem = cartData.getItem(productId);
		if(targetItem == null){
			//3.1新增购物车数据
			String error = checkProduct(productId, count);
			if(error != null){
				this.writeJson("{error:\'"+error+"\'}");
				return;
			}
			cartData.addItem(productId, count);
		}
		else{
			//3.2修改购物车项目的数量
			String error = checkProduct(productId, count);
			if(error != null){
				this.writeJson("{error:\'"+error+"\'}");
				return;
			}
			targetItem.setCount(count);
		}

		cartService.saveData(user.getId(), cartData);
		//4.2已登录用户，清空客户端数据即可
		this.writeJson("[]");
	}
	
	/**
	 * myq add 2015-3-15，删除购物车内的项目
	 * @param productId
	 * @param count
	 * @param localCart
	 */
	@RequestMapping
	public void deleteItems(HttpServletRequest request,HttpServletResponse response, 
			String cityId, String callbackMethod, String[] productIds){
		FactoryUser user = this.getUser();
		if(user==null){
			this.writeJson("{error:\'请先登录\'}");
			return;
		}
		CartData cartData = cartService.getData(user.getId());
		
		//3.执行删除
		for(String productId : productIds){
			cartData.deleteItem(productId);
		}
		
		//3.3将购物车数据回写到DB
		cartService.saveData(user.getId(), cartData);
		this.writeJson("[]");
	}
	
	private String checkProduct(String productId, int count){
		Product product = productService.get(productId);
		if(product == null || product.getStatus() != 1){
			return "商品暂时无法购买，请选择其他同类商品";
		}
		if(count <= 0){
			return "商品至少要购买 1 份";
		}
		return null;
	}
	
	
	@Autowired
	ProductService productService;
	@Autowired
	private FactoryService factoryService;
	@Autowired
	private CartService cartService;
	
}
