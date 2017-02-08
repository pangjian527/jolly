/*
 * @(#) SysUser.java Aug 27, 2008
 * Copyright 2008 GPDI. All right reserved.
 */
package com.sys.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * @author dgs
 * @date Sep 26, 2010
 * @version 1.0
 */
@Entity
@Table(name = "SYS_USER")
public class SysUser implements Serializable {
	//myq add 2015-3-6，姓名、账号都为SYSTEM的用户，用于表示非人为操作（系统自动运行）时的操作者
	public final static SysUser SYSTEM = new SysUser();
	static{
		SYSTEM.setName("SYSTEM");
		SYSTEM.setCode("SYSTEM");
	}
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6520308778937101340L;
	// 用户ID
	private String id;
	// 工号
	private String code;
	// 密码
	private String password;
	// 用户名称
	private String name;
	// 联系电话
	private String telNo;
	// 状态
	private Integer status;

	// 密码编辑时间
	//private Date pwdEditTime;

	// 添加时间（触发器维护）
	private Date createTime;
	// 修改时间（触发器维护）
	private Date updateTime;
	
	private String organizationId;

	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	@Column(name = "CODE")
	public String getCode() {
		return code;
	}

	@Column(name = "PASSWORD")
	public String getPassword() {
		return password;
	}

	@Column(name = "NAME")
	public String getName() {
		return name;
	}

	@Column(name = "TEL_NO")
	public String getTelNo() {
		return telNo;
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

	public void setCode(String code) {
		this.code = code;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setTelNo(String telNo) {
		this.telNo = telNo;
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

	@Column(name = "ORGANIZATION_ID")
	public String getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(String organizationId) {
		this.organizationId = organizationId;
	}

	
}
