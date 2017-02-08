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
@Table(name = "LOG_RECORD_CHANGE")
public class LogRecordChange implements Serializable {

	private static final long serialVersionUID = -7205767461025401824L;
	private String id;
	private String userId;
	private String userIp;
	private Date changeTime;
	// 1:新增;2:修改;3:删除
	private Integer changeType;
	private String tableName;
	private String recordId;

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

	@Column(name = "USER_IP")
	public String getUserIp() {
		return userIp;
	}

	@Column(name = "CHANGE_TIME")
	public Date getChangeTime() {
		return changeTime;
	}

	@Column(name = "CHANGE_TYPE")
	public Integer getChangeType() {
		return changeType;
	}

	@Column(name = "TABLE_NAME")
	public String getTableName() {
		return tableName;
	}

	@Column(name = "RECORD_ID")
	public String getRecordId() {
		return recordId;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}

	public void setChangeTime(Date changeTime) {
		this.changeTime = changeTime;
	}

	public void setChangeType(Integer changeType) {
		this.changeType = changeType;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public void setRecordId(String recordId) {
		this.recordId = recordId;
	}
	
	

}