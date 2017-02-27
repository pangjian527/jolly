package com.sys.data.pay;

import com.sys.entity.LogPayment;

public class PayInfo{
	public String title;
	public double amount;
	public String task;
	public String orderId;
	public int payChanel;
	public PayInfo(String title, double amount, String task, String orderId) {
		super();
		this.title = title;
		this.amount = amount;
		this.task = task;
		this.orderId = orderId;
		this.payChanel = LogPayment.payType_weixin;
	}
}