package com.sys.data.book;

import com.sys.entity.BookformDetail;

import pub.functions.StrFuncs;

public class OrderDetailData {

	//订单明细ID
	private String bookDetailId;
	//商品ID
	private String productId;
	//商品名称
	private String productName;
	//图片ID
	private String photoIds;
	//购买的价格
	private double price;
	//市场价
	private double priceMart;
	//数量
	private int count;
	public OrderDetailData(BookformDetail bookformDetail) {
		this.bookDetailId = bookformDetail.getId();
		this.productId = bookformDetail.getProductId();
		this.price = bookformDetail.getPrice();
		this.priceMart = bookformDetail.getPriceMart();
	}
	public String getBookDetailId() {
		return bookDetailId;
	}
	public void setBookDetailId(String bookDetailId) {
		this.bookDetailId = bookDetailId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getPriceMart() {
		return priceMart;
	}
	public void setPriceMart(double priceMart) {
		this.priceMart = priceMart;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getPhotoIds() {
		return photoIds;
	}
	public void setPhotoIds(String photoIds) {
		this.photoIds = photoIds;
	}
	
	public String getFirstPhotos(){
		if(StrFuncs.notEmpty(this.photoIds)){
			return this.photoIds.split(",")[0];
		}else{
			return "0";
		}
	}
}
