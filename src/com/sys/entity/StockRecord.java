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
@Table(name = "T_STOCK_RECORD")
public class StockRecord implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7565117654738910000L;

	public static String TABLE_NAME = "T_STOCK_RECORD";

	// 唯一标识
	private String id;
	
	private String securityCode;
	//1:入库， 0：出库
	private Integer type;
	// 创建时间（触发器维护）
	private Date createTime;
	// 修改时间（触发器维护）
	private Date updateTime;
	private String bookId;//

	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	@Column(name = "SECURITY_CODE")
	public String getSecurityCode() {
		return securityCode;
	}

	@Column(name = "TYPE")
	public Integer getType() {
		return type;
	}

	@Column(name = "BOOK_ID")
	public String getBookId() {
		return bookId;
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


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}


}
