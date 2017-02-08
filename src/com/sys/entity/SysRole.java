/*
 * @(#) CatRole.java May 20, 2010
 * Copyright 2010 GPDI. All right reserved.
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
 * @version 1.0 May 20, 2010
 */
@Entity
@Table(name = "SYS_ROLE")
public class SysRole implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3375419545559440449L;
	// 唯一标识
	private String id;
	// 角色名称
	private String name;
	// 角色备注
	private String remark;
	// 添加时间（触发器维护）
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

	@Column(name = "NAME")
	public String getName() {
		return name;
	}

	@Column(name = "REMARK")
	public String getRemark() {
		return remark;
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

	public void setName(String name) {
		this.name = name;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	

}
