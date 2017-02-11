package com.sys.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import pub.functions.StrFuncs;

@Entity
@Table(name = "T_PRODUCT")
// 产品表
public class Product implements Serializable {

	private static final long serialVersionUID = 6278495930884698772L;

	public static String TABLE_NAME = "T_PRODUCT";
	
	
	public static final int STATUS_INVALID =0 ;	//无效 删除
	public static final int STATUS_VALID =1 ;	//有效 {审核通过}
	public static final int STATUS_APPROVE =2 ;	//待审核
	public static final int STATUS_AUDITFAIL =3 ;//草稿   -->待审核
	public static final int STATUS_OUT_OF_STOCK=4;//被下架了
	
	// 主键
	private String id;
	// 名称
	private String name;
	// 市场价
	private Double priceMart;
	// 优惠价格
	private Double price;
	
	private String model;
	
	private String coreType;
	
	private String capacity;
	
	private String applyBrand;
	
	private String applyPhoneType;
	
	private String executeNormal;
	
	private String normalVoltage;
	
	private String chargeVoltage;
	
	private String environment;
	
	private String quickCharge;
	
	// 商品详情
	private String content;
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

	@Column(name = "NAME")
	public String getName() {
		return name;
	}

	@Column(name = "PRICE_MART")
	public Double getPriceMart() {
		return priceMart;
	}

	@Column(name = "PRICE")
	public Double getPrice() {
		return price == null ? 0.0 : price;
	}

	@Column(name = "CONTENT")
	public String getContent() {
		return content;
	}

	@Column(name = "CREATE_TIME", updatable = false)
	public Date getCreateTime() {
		return createTime;
	}

	@Column(name = "UPDATE_TIME", updatable = false)
	public Date getUpdateTime() {
		return updateTime;
	}

	@Column(name = "MODEL")
	public String getModel() {
		return model;
	}

	@Column(name = "CORE_TYPE")
	public String getCoreType() {
		return coreType;
	}

	@Column(name = "CAPACITY")
	public String getCapacity() {
		return capacity;
	}

	@Column(name = "APPLY_BRAND")
	public String getApplyBrand() {
		return applyBrand;
	}

	@Column(name = "APPLY_PHONE_TYPE")
	public String getApplyPhoneType() {
		return applyPhoneType;
	}

	@Column(name = "EXECUTE_NORMAL")
	public String getExecuteNormal() {
		return executeNormal;
	}

	@Column(name = "NORMAL_VOLTAGE")
	public String getNormalVoltage() {
		return normalVoltage;
	}

	@Column(name = "CHARGE_VOLTAGE")
	public String getChargeVoltage() {
		return chargeVoltage;
	}

	@Column(name = "ENVIRONMENT")
	public String getEnvironment() {
		return environment;
	}

	@Column(name = "QUICK_CHARGE")
	public String getQuickCharge() {
		return quickCharge;
	}

	public void setId(String id) {
		this.id = id;
	}


	public void setName(String name) {
		this.name = name;
	}


	public void setPriceMart(Double priceMart) {
		this.priceMart = priceMart;
	}

	public void setPrice(Double price) {
		this.price = price;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public void setCoreType(String coreType) {
		this.coreType = coreType;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public void setApplyBrand(String applyBrand) {
		this.applyBrand = applyBrand;
	}

	public void setApplyPhoneType(String applyPhoneType) {
		this.applyPhoneType = applyPhoneType;
	}

	public void setExecuteNormal(String executeNormal) {
		this.executeNormal = executeNormal;
	}

	public void setNormalVoltage(String normalVoltage) {
		this.normalVoltage = normalVoltage;
	}

	public void setChargeVoltage(String chargeVoltage) {
		this.chargeVoltage = chargeVoltage;
	}

	public void setEnvironment(String environment) {
		this.environment = environment;
	}

	public void setQuickCharge(String quickCharge) {
		this.quickCharge = quickCharge;
	}


}
