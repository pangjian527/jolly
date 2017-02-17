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
@Table(name = "T_EXPRESS_FEE")
// 邮费信息表
public class ExpressFee implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1735035106401866620L;

	public static String TABLE_NAME = "T_EXPRESS_FEE";

	// 主键
	private String id;
	// 快递公司ID
	private String expressCompanyId;
	// 区域名称
	private String fee;
	// 订单总额满多少可免费
	private String amountForFree;
	// 区域ID
	private String areaId;
	// 创建时间（触发器维护）
	private Date createTime;
	// 修改时间（触发器维护）
	private Date updateTime;

	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	@Column(name = "EXPRESS_COMPANY_ID")
	public String getExpressCompanyId() {
		return expressCompanyId;
	}

	@Column(name = "FEE")
	public String getFee() {
		return fee;
	}

	@Column(name = "AMOUNT_FOR_FREE")
	public String getAmountForFree() {
		return amountForFree;
	}

	@Column(name = "AREA_ID")
	public String getAreaId() {
		return areaId;
	}


	@Column(name = "CREATE_TIME", updatable = false)
	public Date getCreateTime() {
		return createTime;
	}

	@Column(name = "UPDATE_TIME", updatable = false)
	public Date getUpdateTime() {
		return updateTime;
	}


	public void setId(String id) {
		this.id = id;
	}


	public void setExpressCompanyId(String expressCompanyId) {
		this.expressCompanyId = expressCompanyId;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

	public void setAmountForFree(String amountForFree) {
		this.amountForFree = amountForFree;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	

}