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


/*	public BillDetail(String bookId, String bookformDetailId, Double pricePay, String productId, 
			String serviceFactoryId, String type, String describe, String detail) {
		super();
		this.bookId = bookId;
		this.bookformDetailId = bookformDetailId;
		this.pricePay = pricePay;
		this.productId = productId;
		this.serviceFactoryId = serviceFactoryId;
		this.type = type;
		this.describe = describe;
		this.detail = detail;
	}*/

	private static final long serialVersionUID = -2372294715215866068L;

	public static String TABLE_NAME = "T_BILL_DETAIL";

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
	private String serviceFactoryId;
	// 备注
	//private String remark;
	//状态，0：未结算，1：已结算 ,2:申请结算中
	private int status;
	//商品名称
	//private String productName;
	
	private String describe;
	

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
	
	@Column(name = "SERVICE_FACTORY_ID")
	public String getServiceFactoryId() {
		return serviceFactoryId;
	}
	@Column(name = "STATUS")
	public int getStatus() {
		return status;
	}
	
	@Column(name = "DESCRIBE")
	public String getDescribe() {
		return describe;
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

	public void setServiceFactoryId(String serviceFactoryId) {
		this.serviceFactoryId = serviceFactoryId;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	
}
