package com.sys.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * SysOrganization entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "SYS_ORGANIZATION")
public class SysOrganization implements java.io.Serializable {

	// Fields

	private String id;
	private String name;
	private String parentId;
	private String config;
	private Integer seq;
	private String fullName;

	// Constructors

	/** default constructor */
	public SysOrganization() {
	}

	/** minimal constructor */
	public SysOrganization(String name) {
		this.name = name;
	}

	/** full constructor */
	public SysOrganization(String name, String parentId, String config,
			Integer seq, String fullName) {
		this.name = name;
		this.parentId = parentId;
		this.config = config;
		this.seq = seq;
		this.fullName = fullName;
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

	@Column(name = "NAME", nullable = false, length = 32)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "PARENT_ID", length = 32)
	public String getParentId() {
		return this.parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@Column(name = "CONFIG", length = 2000)
	public String getConfig() {
		return this.config;
	}

	public void setConfig(String config) {
		this.config = config;
	}

	@Column(name = "SEQ")
	public Integer getSeq() {
		return this.seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	@Column(name = "FULL_NAME", length = 300)
	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

}