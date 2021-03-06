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
	public static final int STATUS_OUT_OF_STOCK=3;//被下架了
	
	public static final String CATEGORY_MOBILE_BATTERY = "MOBILE_BATTERY";//手机电池
	public static final String CATEGORY_MOBILE_SCREEN = "MOBILE_SCREEN";//手机屏幕
	public static final String CATEGORY_OTHER = "OTHER";//其他
	
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
	private String contentPhotoIds;
	// 生成时间
	private Date createTime;
	// 更新时间
	private Date updateTime;
	
	private int virtualCount;
	
	private String photoIds;

	private Integer status;
	
	private Integer stockCount;
	
	private Integer saleCount;
	
	private String category;//品类
	
	private String brandId;//品牌id
	
	//-------------以下为手机屏幕属性
	private String color;//颜色
	
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

	@Column(name = "CONTENT_PHOTO_IDS")
	public String getContentPhotoIds() {
		return contentPhotoIds;
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
	
	@Column(name = "VIRTUAL_COUNT")
	public int getVirtualCount() {
		return virtualCount;
	}
	
	
	@Column(name = "PHOTO_IDS")
	public String getPhotoIds() {
		return photoIds;
	}


	@Column(name = "STATUS")
	public Integer getStatus() {
		return status;
	}
	
	@Column(name = "STOCK_COUNT")
	public Integer getStockCount() {
		return stockCount;
	}
	
	
	@Column(name = "SALE_COUNT")
	public Integer getSaleCount() {
		return saleCount;
	}
	
	@Column(name = "CATEGORY")
	public String getCategory() {
		return category;
	}

	@Column(name = "BRAND_ID")
	public String getBrandId() {
		return brandId;
	}
	
	@Column(name = "COLOR")
	public String getColor() {
		return color;
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


	public void setContentPhotoIds(String contentPhotoIds) {
		this.contentPhotoIds = contentPhotoIds;
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


	public void setVirtualCount(int virtualCount) {
		this.virtualCount = virtualCount;
	}

	public void setPhotoIds(String photoIds) {
		this.photoIds = photoIds;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public void setStockCount(Integer stockCount) {
		this.stockCount = stockCount;
	}
	
	
	public void setSaleCount(Integer saleCount) {
		this.saleCount = saleCount;
	}


	public void setCategory(String category) {
		this.category = category;
	}

	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}
	
	public void setColor(String color) {
		this.color = color;
	}

	//photos_ids转为list
	public List<String> imgIds(){
		if(StrFuncs.notEmpty(getPhotoIds())){
			return Arrays.asList(getPhotoIds().split(","));
		}else{
			return new ArrayList<String>();
		}
	}

}
