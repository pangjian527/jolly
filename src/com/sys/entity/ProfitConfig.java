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
@Table(name = "T_PROFIT_CONFIG")
public class ProfitConfig implements Serializable {

	public final static String STATUS_EFFECTIVE="EFFECTIVE";
	public final static String STATIC_INVALID ="INVALID";
	
	private String id;
	//地推直接开发费用，金额元
	private double pushDirectOpenFactory;
	//地推间接开发费用，金额元
	private double pushIndirectOpenFactory;
	//地推的订单提成
	private double pushOrder;
	//上级商家订单提成
	private double factoryOrder;
	
	private Date createTime;
	
	private Date updateTime;
	//安装费用（二期）
	private double installAmount;
	
	//状态（有效和无效）
	private String status;

	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "PUSH_DIRECT_OPEN_FACTORY")
	public double getPushDirectOpenFactory() {
		return pushDirectOpenFactory;
	}

	public void setPushDirectOpenFactory(double pushDirectOpenFactory) {
		this.pushDirectOpenFactory = pushDirectOpenFactory;
	}

	@Column(name = "PUSH_INDIRECT_OPEN_FACTORY")
	public double getPushIndirectOpenFactory() {
		return pushIndirectOpenFactory;
	}

	public void setPushIndirectOpenFactory(double pushIndirectOpenFactory) {
		this.pushIndirectOpenFactory = pushIndirectOpenFactory;
	}

	@Column(name = "PUSH_ORDER")
	public double getPushOrder() {
		return pushOrder;
	}

	public void setPushOrder(double pushOrder) {
		this.pushOrder = pushOrder;
	}

	@Column(name = "FACTORY_ORDER")
	public double getFactoryOrder() {
		return factoryOrder;
	}

	public void setFactoryOrder(double factoryOrder) {
		this.factoryOrder = factoryOrder;
	}

	@Column(name = "CREATE_TIME")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Column(name = "UPDATE_TIME")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	@Column(name = "INSTALL_AMOUNT")
	public double getInstallAmount() {
		return installAmount;
	}

	public void setInstallAmount(double installAmount) {
		this.installAmount = installAmount;
	}
	@Column(name = "STATUS")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
