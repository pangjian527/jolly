package com.web.mmall.entity;

import pub.functions.StrFuncs;

public class ProductEntity {

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
		
		private int virtualCount;
		
		private String photoIds;

		private Integer status;
		
		private Integer stockCount;
		
		//真实销量
		private int realSalesCount;
		//前台显示的销量
		private int salesScount;

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public Double getPriceMart() {
			return priceMart;
		}

		public void setPriceMart(Double priceMart) {
			this.priceMart = priceMart;
		}

		public Double getPrice() {
			return price;
		}

		public void setPrice(Double price) {
			this.price = price;
		}

		public String getModel() {
			return model;
		}

		public void setModel(String model) {
			this.model = model;
		}

		public String getCoreType() {
			return coreType;
		}

		public void setCoreType(String coreType) {
			this.coreType = coreType;
		}

		public String getCapacity() {
			return capacity;
		}

		public void setCapacity(String capacity) {
			this.capacity = capacity;
		}

		public String getApplyBrand() {
			return applyBrand;
		}

		public void setApplyBrand(String applyBrand) {
			this.applyBrand = applyBrand;
		}

		public String getApplyPhoneType() {
			return applyPhoneType;
		}

		public void setApplyPhoneType(String applyPhoneType) {
			this.applyPhoneType = applyPhoneType;
		}

		public String getExecuteNormal() {
			return executeNormal;
		}

		public void setExecuteNormal(String executeNormal) {
			this.executeNormal = executeNormal;
		}

		public String getNormalVoltage() {
			return normalVoltage;
		}

		public void setNormalVoltage(String normalVoltage) {
			this.normalVoltage = normalVoltage;
		}

		public String getChargeVoltage() {
			return chargeVoltage;
		}

		public void setChargeVoltage(String chargeVoltage) {
			this.chargeVoltage = chargeVoltage;
		}

		public String getEnvironment() {
			return environment;
		}

		public void setEnvironment(String environment) {
			this.environment = environment;
		}

		public String getQuickCharge() {
			return quickCharge;
		}

		public void setQuickCharge(String quickCharge) {
			this.quickCharge = quickCharge;
		}

		public String getContentPhotoIds() {
			return contentPhotoIds;
		}

		public void setContentPhotoIds(String contentPhotoIds) {
			this.contentPhotoIds = contentPhotoIds;
		}

		public int getVirtualCount() {
			return virtualCount;
		}

		public void setVirtualCount(int virtualCount) {
			this.virtualCount = virtualCount;
		}

		public String getPhotoIds() {
			return photoIds;
		}

		public void setPhotoIds(String photoIds) {
			this.photoIds = photoIds;
		}

		public Integer getStatus() {
			return status;
		}

		public void setStatus(Integer status) {
			this.status = status;
		}

		public Integer getStockCount() {
			return stockCount;
		}

		public void setStockCount(Integer stockCount) {
			this.stockCount = stockCount;
		}

		public int getRealSalesCount() {
			return realSalesCount;
		}

		public void setRealSalesCount(int realSalesCount) {
			this.realSalesCount = realSalesCount;
		}

		public int getSalesScount() {
			return this.virtualCount + this.realSalesCount;
		}

		public void setSalesScount(int salesScount) {
			this.salesScount = salesScount;
		}
		
		public String getFirstPhotoId(){
			if(StrFuncs.notEmpty(this.photoIds)){
				return this.photoIds.split(",")[0];
			}
			return null;
		}
}
