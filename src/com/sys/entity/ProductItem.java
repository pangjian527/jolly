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
@Table(name = "T_PRODUCT_ITEM")
// 产品表
public class ProductItem implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 838906171700354296L;


	public static String TABLE_NAME = "T_PRODUCT_ITEM";
	
	public static final int STATUS_EFFECTIVE =1 ;//有效，未出库
	public static final int STATUS_OUT_STOCK =2;//已经出库
	public static final int STATUS_INVALID =3;//无效
	
	// 主键
	private String id;
	// 名称
	private String productId;
	
	private String securityCode;
	
	private Integer status;
	
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

	@Column(name = "PRODUCT_ID")
	public String getProductId() {
		return productId;
	}

	@Column(name = "SECURITY_CODE")
	public String getSecurityCode() {
		return securityCode;
	}

	@Column(name = "STATUS")
	public Integer getStatus() {
		return status;
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

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}



}
