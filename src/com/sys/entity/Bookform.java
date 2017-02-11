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
@Table(name = "T_BOOKFORM")
// 订单表
public class Bookform implements Serializable {
	private static final long serialVersionUID = -9082237943550720260L;
	public static String TABLE_NAME = "T_BOOKFORM";

	/* 订单状态 */
	public static int STATUS_CONFIRM_WAIT = 0;	//订单待确认
	public static int STATUS_CONFIRMED = 1;		//订单已确认
	public static int STATUS_FINISH = 2;		//订单已完成
	public static int STATUS_CANCEL = 3;		//订单取消
	//public static int STATUS_SHIPPED = 4;		//订单待发货
	
	/* 配送状态 */
	public static int TRACKING_WAIT = 0;		//未发货
	public static int TRACKING_SEND = 1;		//已发货
	public static int TRACKING_FINISH = 2;		//已收货
	
	
	// 订单id（客户订单号）
	private String id;
	// 商家id
	private String factoryId;
	// 联系人姓名
	private String contactMan;
	// 联系人省(T_AREA.ID)
	private String contactProvinceId;
	// 联系人市(T_AREA.ID)
	private String contactCityId;
	// 联系人区(T_AREA.ID)
	private String contactCountyId;
	// 联系地址（收货人地址）
	private String contactAddr;
	// 订单状态  订单状态(0 待确认、1 已确认、2 已完成、3 撤销)
	private Integer status = 0;
	// 销售额
	private Double sales;
	private Double deliveryCost;//运费
	// 付款方式（0：在线支付,1:到店支付）
	private Integer payType = 0;
	// 订单备注--
	private String remark;
	// 生成时间
	private Date createTime;
	// 更新时间
	private Date updateTime;
	
	
	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}


	@Column(name = "CONTACT_MAN")
	public String getContactMan() {
		return contactMan;
	}

	@Column(name = "CONTACT_ADDR")
	public String getContactAddr() {
		return contactAddr;
	}

	@Column(name = "FACTORY_ID")
	public String getFactoryId() {
		return factoryId;
	}

	@Column(name = "STATUS")
	public Integer getStatus() {
		return status;
	}

	@Column(name = "REMARK")
	public String getRemark() {
		return remark;
	}

	@Column(name = "CREATE_TIME", updatable = false)
	public Date getCreateTime() {
		return createTime;
	}

	@Column(name = "UPDATE_TIME", updatable = false)
	public Date getUpdateTime() {
		return updateTime;
	}


	@Column(name = "SALES")
	public Double getSales() {
		return sales;
	}

	@Column(name = "PAY_TYPE")
	public Integer getPayType() {
		return payType;
	}

	@Column(name = "CONTACT_PROVINCE_ID")
	public String getContactProvinceId() {
		return contactProvinceId;
	}

	@Column(name = "CONTACT_CITY_ID")
	public String getContactCityId() {
		return contactCityId;
	}

	@Column(name = "CONTACT_COUNTY_ID")
	public String getContactCountyId() {
		return contactCountyId;
	}


	public void setId(String id) {
		this.id = id;
	}


	public void setContactMan(String contactMan) {
		this.contactMan = contactMan;
	}


	public void setContactAddr(String contactAddr) {
		this.contactAddr = contactAddr;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}


	public void setSales(Double sales) {
		this.sales = sales;
	}


	public void setPayType(Integer payType) {
		this.payType = payType;
	}




	public void setContactProvinceId(String contactProvinceId) {
		this.contactProvinceId = contactProvinceId;
	}

	public void setContactCityId(String contactCityId) {
		this.contactCityId = contactCityId;
	}

	public void setContactCountyId(String contactCountyId) {
		this.contactCountyId = contactCountyId;
	}


	@Column(name = "DELIVERY_COST")
	public Double getDeliveryCost() {
		return deliveryCost;
	}

	public void setDeliveryCost(Double deliveryCost) {
		this.deliveryCost = deliveryCost;
	}


	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}


	
}
