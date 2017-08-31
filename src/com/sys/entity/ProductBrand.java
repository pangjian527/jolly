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
@Table(name = "T_PRODUCT_BRAND")
public class ProductBrand implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6534776990413721307L;
	
	public static final String TABLE_NAME = "T_PRODUCT_BRAND";
	
	public static int STATUS_VALID = 1;	//有效
	
	// 主键
	private String id;
	// 名称
	private String name;
	// 备注
	private String remark;
	// （sys_status）状态；0:无效； 1:有效
	private Integer status = 1;
	// 生成时间
	private Date createTime;
	// 更新时间
	private Date updateTime;
	//品牌介绍
	private String content;
	
	private Integer seq;
	
	private String category;

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
	
	
	@Column(name = "category")
	public String getCategory() {
		return category;
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

	public void setStatus(Integer status) {
		this.status = status;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "CONTENT")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	@Column(name = "SEQ")
	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	
}
