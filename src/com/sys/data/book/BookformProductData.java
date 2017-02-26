package com.sys.data.book;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import com.sys.entity.BookformDetail;

/*
 * @版本说明：2014-11-10 pj
 */
public class BookformProductData implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7758841218546720917L;
	// 订单ID
	private String bookId;
	// 商品ID
	private String productId;
	// 商品名称
	private String productName;
	// 数量
	private Integer count ;
	// 销售金额
	private Double price;
	// 结算价格(正值为总店应收款,负值为总店应付款)
	private Double pricePay;
	// 市场价
	private Double priceMart;
	// 结算状态(0:未结算,1:已结算)
	private Integer isSettlement = 0;
	//商品图片ID
	private String imageId;
	///订单详情id
	private String id;
	// 数量
	private Integer outStockCount ;
	
	public BookformProductData(BookformDetail detail){
		try{
			BeanUtils.copyProperties(this, detail);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
/*	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}*/
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
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
	public Integer getCount() {
		return count;
	}
/*	public void setCount(Integer count) {
		this.count = count;
	}*/
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getPricePay() {
		return pricePay;
	}
	public void setPricePay(Double pricePay) {
		this.pricePay = pricePay;
	}
	public Double getPriceMart() {
		return priceMart;
	}
	public void setPriceMart(Double priceMart) {
		this.priceMart = priceMart;
	}
	public Integer getIsSettlement() {
		return isSettlement;
	}
	public void setIsSettlement(Integer isSettlement) {
		this.isSettlement = isSettlement;
	}


	public void setImageId(String imageId) {
		this.imageId = imageId;
	}
	
	public String getImageId() {
		return imageId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public void setCount(Integer count) {
		this.count = count;
	}


	public Integer getOutStockCount() {
		return outStockCount;
	}


	public void setOutStockCount(Integer outStockCount) {
		this.outStockCount = outStockCount;
	}
	
}
