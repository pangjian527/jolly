package com.sys.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.GeneralDao;
import pub.functions.JsonFuncs;

import com.sys.dao.CartDao;
import com.sys.data.cart.CartData;
import com.sys.data.cart.CartItem;
import com.sys.entity.Cart;
import com.sys.entity.FactoryUser;
import com.sys.entity.Product;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
@Transactional(readOnly = true)
public class CartService {
	
	public Cart get(String userId, String productId){
		return cartDao.get(userId, productId);
	}
	

	@Transactional
	public void delete(FactoryUser user, String[] productIds){
		//Customer customer = SessionDataUtil.getCustomer();
		if(user != null){
			String customerId = user.getId();
			for (String productId : productIds) {
				Cart cart = cartDao.get(customerId, productId);
				if(cart!=null){
					cartDao.delete(cart);
				}
			}
		} 
	}
	
	/**
	 * myq add 2015-2-24 add，读取数据库中永久存储的购物车数据，并组装成 CartData
	 * 适用范围： 
	 * @return
	 */
	public CartData getData(String userId){
		CartData cartData = new CartData();
		
		//1.读取数据库中存储的购物车记录
		//String customerId = SessionDataUtil.getCustomerId();
		List<Cart> carts = cartDao.getAllByProperty("userId", userId);
		
		//2.创建基本的购物车对象
		for(Cart cart : carts){
			cartData.addItem(cart.getProductId(), cart.getCount());
		}
		
		return cartData;
	}
	
	/**
	 * myq add 2015-2-24 add，用于将Session中的购物车数据，写入数据库进行持久化
	 * 适用范围： 
	 * @return
	 */
	@Transactional
	public void saveData(String userId, CartData data){
		//1.遍历最新的cartData，与数据库中的数据进行对比，找出新增/修改过的购物车项目
		for(CartItem item : data.getItems()){
			Cart cart = get(userId, item.getProductId());
			if(cart == null){
				cart = new Cart();
				cart.setProductId(item.getProductId());
				cart.setCount(item.getCount());
				cart.setUserId(userId);
				cartDao.save(cart);
			}
			else if(cart.getCount() != item.getCount()){
				cart.setCount(item.getCount());
				cartDao.save(cart);
			}
		}
		
		List<Cart> carts = cartDao.getAllByProperty("userId", userId);
		//3.生成delete语句
		Set<String> newProductIds = data.extractProductIdSet();
		for(Cart cart : carts){
			if(!newProductIds.contains(cart.getProductId())){
				cartDao.delete(cart);
			}
		}
	}
	
	
	public void complete(CartData cartData){
		List<CartItem> items = cartData.getItems();
		for(int i = items.size() - 1; i >= 0; i--){
			CartItem item = items.get(i);
			//1.ignore invalid item
			Product product = productService.get(item.getProductId());
			if(product == null){
				items.remove(i);
				continue;
			}
			
			item.copyProperties(product);
			
		}
	}
	
	public CartData getCartData(String jsonArrData){
		
		JSONArray cartDatas = JsonFuncs.toJsonArray(jsonArrData);
		
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
		
		return cartData;
	}
	
	
	
	
	
	@Autowired
	private CartDao cartDao;
	@Autowired
	private ProductService productService;
	@Autowired
	private FactoryService factoryService;
	@Autowired
	private GeneralDao generalDao;
}
