/*
 * @(#) CatUserRoleRel.java May 20, 2010
 * Copyright 2010 GPDI. All right reserved.
 */
package com.sys.entity;

import java.io.Serializable;

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
@Table(name = "SYS_USERROLE")
public class SysUserRole implements Serializable {
	/**
	 * 目录册用户角色关联表
	 */
	private static final long serialVersionUID = 1L;

	// 唯一标识
	private String id;
	// 用户ID
	private String userId;
	// 角色ID
	private String roleId;
	
	public SysUserRole(){
		
	} 
	
	public SysUserRole(String userId, String roleId){
		this.userId = userId;
		this.roleId = roleId;
	}

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

	@Column(name = "ROLE_ID")
	public String getRoleId() {
		return roleId;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
	

}
