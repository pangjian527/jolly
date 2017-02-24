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
	
	
	/*
	 * 
	 * 1、到店订单：代发货--》取消（发货前）--》待收货--》完成
		2、在线订单：代付款--》取消（发货前）--》代发货--》带收货--》完成
	 * */
	public static int STATUS_WAIT_PAY = 0;	//代付款（针对在线付款的）
	public static int STATUS_WAIT_SEND_DELIVERY = 1;	//代发货
	public static int STATUS_WAIT_TAKE_DELIVERY = 2;	//代收货
	public static int STATUS_CANCEL = 3;	//取消
	public static int STATUS_FINISH = 4;	//完成
	
	
	/* 配送状态 */
	public static int TRACKING_WAIT = 0;		//未发货
	public static int TRACKING_SEND = 1;		//已发货
	public static int TRACKING_FINISH = 2;		//已收货
	
	
	// 订单id（客户订单号）
	private String id;
	
	// 订单id（客户订单编号）
	private String code;
	// 商家id
	private String factoryId;
	// 联系人姓名
	private String contactMan;
	// 联系人姓名
	private String contactTel;
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
	
	private String paymentId;
	
	private Date cancelTime;
	private String cancelReason;
	
	// 配送商
	private String deliveryFactory;
	// 快递单号
	private String trackingNumber;
	// 快递跟踪信息
	private String trackingInfo;
	// 配送状态（0未发货 1已发货 2已收货）
	private Integer trackingStatus;
	private Date deliveryTime;	
	private Date confirmTime;
	
	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	@Column(name = "CODE")
	public String getCode() {
		return code;
	}

	@Column(name = "CONTACT_MAN")
	public String getContactMan() {
		return contactMan;
	}

	
	@Column(name = "CONTACT_TEL")
	public String getContactTel() {
		return contactTel;
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

	@Column(name = "PAYMENT_ID")
	public String getPaymentId() {
		return paymentId;
	}
	
	@Column(name = "CANCEL_TIME")
	public Date getCancelTime() {
		return cancelTime;
	}

	@Column(name = "CANCEL_REASON")
	public String getCancelReason() {
		return cancelReason;
	}
	
	@Column(name = "DELIVERY_FACTORY")
	public String getDeliveryFactory() {
		return deliveryFactory;
	}

	@Column(name = "TRACKING_NUMBER")
	public String getTrackingNumber() {
		return trackingNumber;
	}

	@Column(name = "TRACKING_INFO")
	public String getTrackingInfo() {
		return trackingInfo;
	}

	@Column(name = "TRACKING_STATUS")
	public Integer getTrackingStatus() {
		return trackingStatus;
	}

	@Column(name = "DELIVERY_TIME")	
	public Date getDeliveryTime() {
		return deliveryTime;
	}
	
	@Column(name = "CONFIRM_TIME")	
	public Date getConfirmTime() {
		return confirmTime;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public void setCode(String code) {
		this.code = code;
	}


	public void setContactMan(String contactMan) {
		this.contactMan = contactMan;
	}

	

	public void setContactTel(String contactTel) {
		this.contactTel = contactTel;
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

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public void setCancelTime(Date cancelTime) {
		this.cancelTime = cancelTime;
	}

	public void setCancelReason(String cancelReason) {
		this.cancelReason = cancelReason;
	}

	public void setDeliveryFactory(String deliveryFactory) {
		this.deliveryFactory = deliveryFactory;
	}

	public void setTrackingNumber(String trackingNumber) {
		this.trackingNumber = trackingNumber;
	}

	public void setTrackingInfo(String trackingInfo) {
		this.trackingInfo = trackingInfo;
	}

	public void setTrackingStatus(Integer trackingStatus) {
		this.trackingStatus = trackingStatus;
	}

	public void setDeliveryTime(Date deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

	public void setConfirmTime(Date confirmTime) {
		this.confirmTime = confirmTime;
	}
	
}
