package com.sys.data.book;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sys.entity.Bookform;

public class OrderData {

	//订单ID
	private String bookId;
	//订单状态
	private int status;
	//订单时间
	private Date createTime;
	//订单联系人
	private String man ;
	//订单联系人
	private String mobile;
	//地址
	private String addr;
	//订单编号
	private String code;
	//付款类型
	private int payType;
	//订单金额
	private double sales;
	
	private List<OrderDetailData> details =new ArrayList<OrderDetailData>();
	
	public OrderData(){}
	public OrderData(Bookform bookform){
		this.status = bookform.getStatus();
		this.bookId = bookform.getId();
		this.man = bookform.getContactMan();
		this.mobile = bookform.getContactTel();
		this.code = bookform.getCode();
		
		this.payType = bookform.getPayType();
		this.addr = bookform.getContactAddr();
		this.sales = bookform.getSales();
		this.createTime = bookform.getCreateTime();
		
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getMan() {
		return man;
	}

	public void setMan(String man) {
		this.man = man;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getPayType() {
		return payType;
	}

	public void setPayType(int payType) {
		this.payType = payType;
	}

	public double getSales() {
		return sales;
	}

	public void setSales(double sales) {
		this.sales = sales;
	}

	public List<OrderDetailData> getDetails() {
		return details;
	}

	public void setDetails(List<OrderDetailData> details) {
		this.details = details;
	}
	
}
