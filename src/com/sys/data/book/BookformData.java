package com.sys.data.book;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.sys.entity.Bookform;
import com.sys.entity.Factory;
import com.sys.entity.LogPayment;

/*
 * 
 * @版本说明：2014-11-10 pj
 */
public class BookformData implements Serializable {
	

	private static final long serialVersionUID = 9157272054764564836L;
	
	private String contactAddr;
	private String factoryAddr;
	private Bookform bookform;
	
	private Factory factory;
	
	private List<BookformProductData> productDatas;
	
	//不为null而且.status=1已支付状态，就是已经支付
	//service层已经做了处理，只有支付成功，logPayment才不为空
	private LogPayment logPayment;
	
	private boolean isAllOutStock;//是否都已出库
	public BookformData(Bookform bookform){
		this.bookform = bookform;
		productDatas =new ArrayList<BookformProductData>();
	}
	//获取商品的总数量
	public int getItemCount(){
		int count=0;
		for (BookformProductData item : productDatas) {
			count += item.getCount();
		}
		return count;
	}
	//获取商品的数量
	public int getProductCount(){
		return productDatas.size();
	}
	
	public String getContactAddr() {
		return contactAddr;
	}
	public void setContactAddr(String contactAddr) {
		this.contactAddr = contactAddr;
	}
	public Bookform getBookform() {
		return bookform;
	}

	public void setBookform(Bookform bookform) {
		this.bookform = bookform;
	}
	
	public List<BookformProductData> getBookformProductDatas() {
		return productDatas;
	}

	public void setBookformProductDatas(List<BookformProductData> productDatas) {
		this.productDatas = productDatas;
	}
	
	public LogPayment getLogPayment() {
		return logPayment;
	}
	
	
	//如果该订单需要在线支付＆车主尚未完成支付，则返回ｔｒｕｅ
	public boolean isRequireFinishPayment(){
		return this.bookform.getPayType() == 0 && 
			(this.getLogPayment() == null || this.getLogPayment().getStatus() != 1);
	}
	public void setLogPayment(LogPayment logPayment) {
		this.logPayment = logPayment;
	}
	public Factory getFactory() {
		return factory;
	}
	public void setFactory(Factory factory) {
		this.factory = factory;
	}
	//一下是基于支付的方法
	//获取订单的商品的名字 由于接口有限制，120个汉字以内，方法只返回一个商品名称
	public String getSubject(){
		String subject = "没有商品信息";
		if(productDatas.size()>0){
			subject = productDatas.get(0).getProductName()+" "+productDatas.get(0).getCount()+"件";
			if(productDatas.size()>1){
				subject += " 等等共:"+getProductCount()+"件商品!";
			}
		}
		return subject;
	}
	//获取订单的所有信息描述
	public String getBody(){
		String body = "订单号:"+bookform.getId();		
		if(productDatas.size()<=0){
			body += ",没有商品信息";
		}else{
			for(BookformProductData data : productDatas){
				body += ","+data.getProductName()+":"+data.getCount()+"件;";
			}
		}
		return body;
	}
	public String getFactoryAddr() {
		return factoryAddr;
	}
	public void setFactoryAddr(String factoryAddr) {
		this.factoryAddr = factoryAddr;
	}
	public boolean isAllOutStock() {
		for(BookformProductData data:productDatas){
			if(data.getCount()>data.getOutStockItemList().size()){
				return false;
			}
		}
		return true;
	}
	public void setAllOutStock(boolean isAllOutStock) {
		this.isAllOutStock = isAllOutStock;
	}
	
}
