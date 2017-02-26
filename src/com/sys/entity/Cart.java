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
@Table(name = "T_CART")
// 购物车
public class Cart implements Serializable {

	private static final long serialVersionUID = -8423686766946877271L;

	public static String TABLE_NAME = "T_CART";

	// 主键
	private String id;
	// 客户ID（T_CUSTOMER.ID）
	private String userId;
	// 商品ID
	private String productId;
	// 数量
	private Integer count;
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

	@Column(name = "USER_ID")
	public String getUserId() {
		return userId;
	}
	
	@Column(name = "PRODUCT_ID")
	public String getProductId() {
		return productId;
	}

	@Column(name = "COUNT")
	public Integer getCount() {
		return count;
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

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public void setProductId(String productId) {
		this.productId = productId;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
}
