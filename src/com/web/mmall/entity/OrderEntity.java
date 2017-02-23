package com.web.mmall.entity;

public class OrderEntity {

	private String man;
	
	private String mobile;
	
	private String provinceId;
	
	private String cityId;
	
	private String countyId;
	
	private int payType = 0;

	public OrderEntity(String man, String mobile, String provinceId, String cityId, String countyId, int payType) {
		super();
		this.man = man;
		this.mobile = mobile;
		this.provinceId = provinceId;
		this.cityId = cityId;
		this.countyId = countyId;
		this.payType = payType;
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

	public String getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public String getCountyId() {
		return countyId;
	}

	public void setCountyId(String countyId) {
		this.countyId = countyId;
	}

	public int getPayType() {
		return payType;
	}

	public void setPayType(int payType) {
		this.payType = payType;
	}
	
	
}
