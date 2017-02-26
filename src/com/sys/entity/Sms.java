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
@Table(name = "T_SMS")
// 短信发件箱
public class Sms implements Serializable {

	private static final long serialVersionUID = -1725977038487079802L;

	public static String TABLE_NAME = "T_SMS";

	// ID
	private String id;

	// 目标号码
	private String mobile;
	// 短信内容
	private String content;
	// 预定发送时间
	private Date preSendTime;
	// 最终发送时间
	private Date finalSendTime;
	// 处理状态 0 待处理 1 已处理 2 处理异常
	private Integer status = 0;
	// 生成时间
	private Date createTime;
	// 更新时间
	private Date updateTime;
	// 预留字段
	//private String column1;
	// 优先级（0:普通,1:加急）
	//private Integer priority = 0;
	private String ipAddr;
	private String remark;

	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

/*	@Column(name = "SRC_MOBILE")
	public String getSrcMobile() {
		return srcMobile;
	}*/

	@Column(name = "OBJ_MOBILE")
	public String getMobile() {
		return mobile;
	}

	@Column(name = "CONTENT")
	public String getContent() {
		return content;
	}

	@Column(name = "PRE_SEND_TIME")
	public Date getPreSendTime() {
		return preSendTime;
	}

	@Column(name = "FINAL_SEND_TIME")
	public Date getFinalSendTime() {
		return finalSendTime;
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

/*	@Column(name = "COLUMN1")
	public String getColumn1() {
		return column1;
	}

	@Column(name = "PRIORITY")
	public Integer getPriority() {
		return priority;
	}*/
	
	@Column(name = "IP_ADDR")
	public String getIpAddr() {
		return ipAddr;
	}

	@Column(name = "REMARK")
	public String getRemark() {
		return remark;
	}
	
	public void setId(String id) {
		this.id = id;
	}

/*	public void setSrcMobile(String srcMobile) {
		this.srcMobile = srcMobile;
	}*/

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setPreSendTime(Date preSendTime) {
		this.preSendTime = preSendTime;
	}

	public void setFinalSendTime(Date finalSendTime) {
		this.finalSendTime = finalSendTime;
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

/*	public void setColumn1(String column1) {
		this.column1 = column1;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}
*/

	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	

}