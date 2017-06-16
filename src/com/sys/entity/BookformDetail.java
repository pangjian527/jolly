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
@Table(name = "T_BOOKFORM_DETAIL")
// 订单明细信息
public class BookformDetail implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6757554050785201545L;

	public static String TABLE_NAME = "T_BOOKFORM_DETAIL";
	public static String STORE_PRICE = "STORE";
	
	// 唯一标识
	private String id;
	// 订单ID
	private String bookId;
	// 商品ID
	private String productId;
	// 数量
	private Integer count = 1;
	// 销售金额
	private Double price;
	// 市场价
	private Double priceMart;
	// 创建时间（触发器维护）
	private Date createTime;
	// 修改时间（触发器维护）
	private Date updateTime;
	// 验证码
	private String securityCode;
	
	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	@Column(name = "BOOK_ID")
	public String getBookId() {
		return bookId;
	}

	@Column(name = "PRODUCT_ID")
	public String getProductId() {
		return productId;
	}

	@Column(name = "COUNT")
	public Integer getCount() {
		return count;
	}

	@Column(name = "PRICE")
	public Double getPrice() {
		return price;
	}

	@Column(name = "PRICE_MART")
	public Double getPriceMart() {
		return priceMart;
	}

	@Column(name = "CREATE_TIME", updatable = false)
	public Date getCreateTime() {
		return createTime;
	}

	@Column(name = "UPDATE_TIME", updatable = false)
	public Date getUpdateTime() {
		return updateTime;
	}

	@Column(name = "SECURITY_CODE")
	public String getSecurityCode() {
		return securityCode;
	}


	public void setId(String id) {
		this.id = id;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public void setPriceMart(Double priceMart) {
		this.priceMart = priceMart;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}

}