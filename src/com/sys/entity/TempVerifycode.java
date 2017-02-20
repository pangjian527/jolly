package com.sys.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.GenericGenerator;

/**
 * TTempVerifycode entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "T_TEMP_VERIFYCODE")
public class TempVerifycode implements java.io.Serializable {

	// Fields

	private String id;
	private Integer type;
	private String codeKey;
	private String codeValue;
	private Date createTime;
	private Date deadline;
	// Constructors

	/** default constructor */
	public TempVerifycode() {
	}

	/** full constructor */
	public TempVerifycode(Integer type, String codeKey, String codeValue) {
		this.type = type;
		this.codeKey = codeKey;
		this.codeValue = codeValue;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "TYPE", nullable = false, precision = 2, scale = 0)
	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Column(name = "CODE_KEY", nullable = false, length = 40)
	public String getCodeKey() {
		return codeKey;
	}

	public void setCodeKey(String codeKey) {
		this.codeKey = codeKey;
	}

	@Column(name = "CODE_VALUE", nullable = false, length = 40)
	public String getCodeValue() {
		return codeValue;
	}

	public void setCodeValue(String codeValue) {
		this.codeValue = codeValue;
	}

	@Column(name = "CREATE_TIME")
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "DEADLINE")
	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

}