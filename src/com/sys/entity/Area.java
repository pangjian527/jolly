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
@Table(name = "T_AREA")
// 区域信息表
public class Area implements Serializable {

	private static final long serialVersionUID = 832155796474663532L;

	public static String TABLE_NAME = "T_AREA";
	
	//省级的parentId = 100
	public static String PROVICE_PARENT_ID = "100";

	// 主键
	private String id;
	// 父ID
	private String parentId;
	// 区域名称
	private String name;
	// 查询关键字
	private String keyword;
	// 行政区划代码
	private String code;
	// 创建时间（触发器维护）
	private Date createTime;
	// 修改时间（触发器维护）
	private Date updateTime;
	private String fullName;
	// 区号
	private String cityCode;

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

	@Column(name = "KEYWORD")
	public String getKeyword() {
		return keyword;
	}

	@Column(name = "CODE")
	public String getCode() {
		return code;
	}

	@Column(name = "CREATE_TIME", updatable = false)
	public Date getCreateTime() {
		return createTime;
	}

	@Column(name = "UPDATE_TIME", updatable = false)
	public Date getUpdateTime() {
		return updateTime;
	}

	@Column(name = "FULL_NAME")
	public String getFullName() {
		return fullName;
	}

	@Column(name = "CITY_CODE")
	public String getCityCode() {
		return cityCode;
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

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	
	

}