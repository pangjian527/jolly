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
@Table(name = "LOG_PAYMENT")
// 支付日志表
public class LogPayment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2808146152874278865L;
	
	//支付宝支付
	public static int payType_alipay = 0;	
	//微信支付
	public static int payType_weixin = 1;

	public static String TABLE_NAME = "LOG_PAYMENT";

	//支付成功
	public static final int statusPaySuccess = 1 ;
	
	// 主键
	private String id;
	// 金额
	private Double amount;
	// 支付状态(0 未付款,1 已付款,2 付款失败,3 付款待确认)
	private Integer status = 0;
	// 支付系统类型(0:支付宝)
	private Integer sysType;
	// 请求内容（扣费请求）
	private String reqContent;
	// 请求响应内容（扣费请求响应）
	private String reqResult;
	// 返回内容（支付 结果通知）
	private String returnContent;
	// 创建时间（触发器维护）
	private Date createTime;
	// 修改时间（触发器维护）
	private Date updateTime;
	// (冗余)
	//private String tableName;

	//回调函数的className,注意·是full class name，由业务模块负责写入
	private String callbackTask;
	//调用回掉函数(success/error)的参数，由业务模块负责写入
	private String callbackConfig;

	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	@Column(name = "AMOUNT")
	public Double getAmount() {
		return amount;
	}

	@Column(name = "STATUS")
	public Integer getStatus() {
		return status;
	}

	@Column(name = "SYS_TYPE")
	public Integer getSysType() {
		return sysType;
	}

	@Column(name = "REQ_CONTENT")
	public String getReqContent() {
		return reqContent;
	}

	@Column(name = "REQ_RESULT")
	public String getReqResult() {
		return reqResult;
	}

	@Column(name = "RETURN_CONTENT")
	public String getReturnContent() {
		return returnContent;
	}

	@Column(name = "CREATE_TIME", updatable = false)
	public Date getCreateTime() {
		return createTime;
	}

	@Column(name = "UPDATE_TIME", updatable = false)
	public Date getUpdateTime() {
		return updateTime;
	}



	
	@Column(name = "CALLBACK_TASK")
	public String getCallbackTask() {
		return callbackTask;
	}
	
	@Column(name = "CALLBACK_CONFIG")
	public String getCallbackConfig() {
		return callbackConfig;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public void setSysType(Integer sysType) {
		this.sysType = sysType;
	}

	public void setReqContent(String reqContent) {
		this.reqContent = reqContent;
	}

	public void setReqResult(String reqResult) {
		this.reqResult = reqResult;
	}

	public void setReturnContent(String returnContent) {
		this.returnContent = returnContent;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}



	public void setCallbackTask(String callbackTask) {
		this.callbackTask = callbackTask;
	}

	public void setCallbackConfig(String callbackConfig) {
		this.callbackConfig = callbackConfig;
	}
	
	
	

}
