package com.sys.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "T_BILL_DETAIL")
// 账单明细
public class BillDetail implements Serializable {


	private static final long serialVersionUID = -2372294715215866068L;

	public static String TABLE_NAME = "T_BILL_DETAIL";

	public final static int BILL_DETAIL_NOT_SETTLE = 0;
	public final static int BILL_DETAIL_YES_SETTLE = 1;
	
	// 主键
	private String id;
	// T_BILL.ID
	private String billId;
	// 结算价格(正值为总店应付款,负值为总店应收款)
	private Double pricePay;
	// 创建时间（触发器维护）
	private Date createTime;
	// 修改时间（触发器维护）
	private Date updateTime;
	// 商家id
	private String factoryId;
	// 备注
	//private String remark;
	//状态，0：未结算，1：已结算 ,2:申请结算中
	private int status;
	//商品名称
	//private String productName;
	
	private String description;
	
	// 订单ID
	private String bookId;
	// 订单明细ID
	private String bookformDetailId;
	

	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	@Column(name = "BILL_ID")
	public String getBillId() {
		return billId;
	}


	@Column(name = "PRICE_PAY")
	public Double getPricePay() {
		return pricePay;
	}

	@Column(name = "CREATE_TIME", updatable = false)
	public Date getCreateTime() {
		return createTime;
	}

	@Column(name = "UPDATE_TIME", updatable = false)
	public Date getUpdateTime() {
		return updateTime;
	}
	
	@Column(name = "FACTORY_ID")
	public String getFactoryId() {
		return factoryId;
	}
	@Column(name = "STATUS")
	public int getStatus() {
		return status;
	}
	
	@Column(name = "DESCRIPTION")
	public String getDescription() {
		return description;
	}

	@Column(name = "BOOK_ID")
	public String getBookId() {
		return bookId;
	}

	@Column(name = "BOOKFORM_DETAIL_ID")
	public String getBookformDetailId() {
		return bookformDetailId;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setBillId(String billId) {
		this.billId = billId;
	}

	public void setPricePay(Double pricePay) {
		this.pricePay = pricePay;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}
	public void setStatus(int status) {
		this.status = status;
	}


	public void setDescription(String description) {
		this.description = description;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public void setBookformDetailId(String bookformDetailId) {
		this.bookformDetailId = bookformDetailId;
	}

	
}
