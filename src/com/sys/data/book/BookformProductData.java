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
	// 速度符号
	private String speedSymbol;
	// 载重指数
	private String loadIndex;
	// 花纹
	private String pattern;
	// 胎面宽
	private String tread;
	// 扁平比
	private String flatRate;
	// 直径
	private String diameter;
	
	private Integer category; 
	
	///订单详情id
	private String id;
	//截止日期
	//private Date verificationDeadline;
	
	//获得有没有已经消费的券号,判断是否可以评价 true:已经有消费的了
	//private boolean checkAlreadyUseCode = false;
	
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
	
	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}
	
	public String getSpeedSymbol() {
		return speedSymbol;
	}

	public void setSpeedSymbol(String speedSymbol) {
		this.speedSymbol = speedSymbol;
	}

	public String getLoadIndex() {
		return loadIndex;
	}

	public void setLoadIndex(String loadIndex) {
		this.loadIndex = loadIndex;
	}

	public String getPattern() {
		return pattern;
	}

	public void setPattern(String pattern) {
		this.pattern = pattern;
	}

	public String getTread() {
		return tread;
	}

	public void setTread(String tread) {
		this.tread = tread;
	}

	public String getFlatRate() {
		return flatRate;
	}

	public void setFlatRate(String flatRate) {
		this.flatRate = flatRate;
	}

	public String getDiameter() {
		return diameter;
	}

	public void setDiameter(String diameter) {
		this.diameter = diameter;
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
	
}
