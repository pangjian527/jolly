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
@Table(name = "T_USAGE_RECORD")
public class UsageRecord implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7113165990731071061L;

	public static String TABLE_NAME = "T_USAGE_RECORD";

	// 唯一标识
	private String id;
	
	private String securitCode;
	private String factoryId;//
	// 创建时间（触发器维护）
	private Date createTime;

	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	@Column(name = "SECURIT_CODE")
	public String getSecuritCode() {
		return securitCode;
	}


	@Column(name = "CREATE_TIME", updatable = false)
	public Date getCreateTime() {
		return createTime;
	}

	
	@Column(name = "FACTORY_ID")
	public String getFactoryId() {
		return factoryId;
	}

	public void setId(String id) {
		this.id = id;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public void setSecuritCode(String securitCode) {
		this.securitCode = securitCode;
	}

	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}


}
