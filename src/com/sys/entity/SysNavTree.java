/*
 * @(#) CatNavtree.java May 20, 2010
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
@Table(name = "sys_navtree")
public class SysNavTree implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7673453141627655974L;
	
	private String id;
	private String parentId;
	private String name;
	private String moduleId;
	// 0 不可见,1可见
	//private Integer isVisible;
	private String code;
	private String furl;
	private Integer seq;

	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	@Column(name = "PARENT_ID")
	public String getParentId() {
		return parentId;
	}

	@Column(name = "NAME")
	public String getName() {
		return name;
	}

	@Column(name = "MODULE_ID")
	public String getModuleId() {
		return moduleId;
	}

/*	@Column(name = "IS_VISIBLE")
	public Integer getIsVisible() {
		return isVisible;
	}*/

	@Column(name = "CODE")
	public String getCode() {
		return code;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}

/*	public void setIsVisible(Integer isVisible) {
		this.isVisible = isVisible;
	}*/

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "FURL")
	public String getFurl() {
		return furl;
	}

	public void setFurl(String furl) {
		this.furl = furl;
	}

	@Column(name = "seq")
	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

}
