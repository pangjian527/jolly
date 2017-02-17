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
@Table(name = "T_SCORE")
public class Score implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5300798087486526406L;

	public static String TABLE_NAME = "T_SCORE";

	// 唯一标识
	private String id;
	// 用户ID
	private String factoryId;
	// 积分值(正值为增加，负值为抵扣)
	private Integer score;
	// 创建时间（触发器维护）
	private Date createTime;
	// 修改时间（触发器维护）
	private Date updateTime;
	private String source;//积分来源（第一下级推荐积分，下单积分，签到积分等）
	private String relationId;//订单id或者下线的商家ID
	private String sysUserId;//地推人员积分

	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	@Column(name = "FACTORY_ID")
	public String getFactoryId() {
		return factoryId;
	}

	@Column(name = "SOURCE")
	public String getSource() {
		return source;
	}

	@Column(name = "RELATION_ID")
	public String getRelationId() {
		return relationId;
	}

	@Column(name = "SYS_USER_ID")
	public String getSysUserId() {
		return sysUserId;
	}


	@Column(name = "SCORE")
	public Integer getScore() {
		return score;
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


	public void setScore(Integer score) {
		this.score = score;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public void setRelationId(String relationId) {
		this.relationId = relationId;
	}

	public void setSysUserId(String sysUserId) {
		this.sysUserId = sysUserId;
	}


}
