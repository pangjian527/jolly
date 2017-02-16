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
@Table(name = "T_BILL")
// 账单
public class Bill implements Serializable {


	private static final long serialVersionUID = 1507151882906348555L;
	
	public static String TABLE_NAME = "T_BILL";
	public static final int STATUS_AUDIT_PENDING = 0;	//待审核
	//public static final int STATUS_AUDIT_THROUGH = 1;	//审核通过，等待总店付款
	public static final int STATUS_AUDIT_SUCCESS = 2;    //付款完成
	public static final int STATUS_CANCEL = -1;			//人为撤销
	//public static final int STATUS_WAIT_FACTORY = 4;	//等待门店在线支付欠款
	//public static final int PROCESS_RETURN = 5 ;		//驳回
	//public static final int STATUS_ABNORMAL_PAYMENT_REQUEST = 6;	//请款异常

	// 主键
	private String id;
	// 商家ID
	private String factoryId;
	// 金额(正值为总店应付款,负值为总店应付款收款)
	private Double amount;
	// 状态
	private Integer status;
	// 生成时间
	private Date createTime;
	// 更新时间
	private Date updateTime;
	// LOG_PAYMENT.ID
	private String remark;
	
	// 商家用户ID(sys_user.id)
	private String sysUserId;
	
	public Bill() {
		this.createTime = new Date();
	}
	
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

	@Column(name = "AMOUNT")
	public Double getAmount() {
		return amount;
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

	@Column(name = "REMARK")
	public String getRemark() {
		return remark;
	}
	
	@Column(name = "SYS_USER_ID")
	public String getSysUserId() {
		return sysUserId;
	}

	public void setId(String id) {
		this.id = id;
	}


	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
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

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public void setSysUserId(String sysUserId) {
		this.sysUserId = sysUserId;
	}

}
