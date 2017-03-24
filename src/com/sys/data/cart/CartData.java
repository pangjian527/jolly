package com.sys.data.cart;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import pub.utils.NumberUtil;


/**
 * Created by IntelliJ IDEA.
 * User: dgs
 * Date: 10-12-16
 */
public class CartData implements Serializable {
 
	private static final long serialVersionUID = 2485790010938002286L;
	
	private List<CartItem> items;
	//标识是否有无效商品
	//false: 没有  true:有
	//private boolean hasInvalid = false;
	
	//private Customer customer;
	
		
	public CartData() {
		items = new ArrayList<CartItem>();
	}
	

	public List<CartItem> getItems() {
		return items;
	}
	public void setItems(List<CartItem> items) {
		this.items = items;
	}
				
	public boolean isHasInvalid() {
		return this.containInvalidItem();
	}
	

	
	public Set<String> extractProductIdSet(){
		Set<String> result = new HashSet<String>();
		for (CartItem item : items){
			result.add(item.getProductId());
		}
		return result;
	}

	//计算所有有效商品个数
	public int getItemCount() {
		int count = 0;
		for (CartItem item : items) {
			count += item.getCount();
		}
		return count;
	}
	
	//计算订单总价
	public double getAllTotal() {
		double total = 0d;
		for (CartItem item : items) {
			if(item.getPrice()!=null){
				double priceAmount=NumberUtil.mul(item.getPrice(), item.getCount());
				total = NumberUtil.add(total, priceAmount);
			}
		}
		return total;
	}
	
	//计算订单总价
	public double getMartPriceTotal() {
		double total = 0d;
		for (CartItem item : items) {
			if(item.getPriceMart()!=null){
				double priceAmount=NumberUtil.mul(item.getPriceMart(), item.getCount());
				total = NumberUtil.add(total, priceAmount);
			}
		}
		return total;
	}
	
	
	//判断指定的productId是否已经在购物车中,已经存在:true  没有:false
	public boolean checkProductIdInCartData(String productId){
		boolean ishas = false;
		for(CartItem item : items){
			if(productId.equals(item.getProductId())){
				ishas = true;
				break;
			}
		}
		return ishas;
	}
	
	//无效商品排后
	//根据CartItem item.status 1:有效 0：无效排序
	public void Sorting(){
		
	}
	
	public CartItem getItem(String productId){
		for(CartItem item: items) {
			if(item.getProductId().equals(productId)){
				return item;
			}
		}
		return null;
	}
	public void deleteItem(String productId){
		for(int i = 0; i < items.size(); i++) {
			if(items.get(i).getProductId().equals(productId)){
				items.remove(i);
				return;
			}			
		}
	}
	
	public void deleteItem(String[] productIds){
		for(String productId  :productIds) {
			deleteItem(productId);			
		}
	}
	
	public void addItem(String productId, int count){
		
		CartItem item = this.getItem(productId);
		if(item == null){
			item = new CartItem();
		}
		item.setProductId(productId);
		item.setCount(count);
		this.items.add(item);
	}
	

	public void clearInvalidItems(){
		//2.从data中找出全部的无效数据
		for(int i = items.size() - 1; i >= 0; i--){
			CartItem item = items.get(i);
			if(item.getStatus() != 1) {
				//从 Session Data中删除
				items.remove(i);
			}
		}
	}
	
	public boolean containInvalidItem(){
		for(int i = items.size() - 1; i >= 0; i--){
			CartItem item = items.get(i);
			if(item.getStatus() != 1) {
				//从 Session Data中删除
				return true;
			}
		}
		return false;
	}
	//获取所有商品
	public String[] getAllProductIds() {
		String[] productIds=new String[items.size()];
		for (int i=0;i<items.size();i++) {
			productIds[i]=items.get(i).getProductId();
		}
		return productIds;
	}
	
}
