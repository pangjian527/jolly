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
@Table(name = "T_FACTORY_USER")
// 商家用户帐号表
public class FactoryUser implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3211969374834952703L;

	public static String TABLE_NAME = "T_FACTORY_USER";

	public static final int STATUS_INVALID =0 ;	//无效
	public static final int STATUS_VALID =1 ;	//有效
	public static final int STATUS_DISABLED =2 ;	//冻结
	//未同意注册协议
	public static String DISAGREE_PROTOCOL = "0";
	//已同意注册协议
	public static String AGREE_PROTOCOL = "1";
	
	// 主键
	private String id;
	// 商家ID
	private String factoryId;
	// 登录账号
	private String account;
	// 商家密码
	private String pwd;
	// 备注
	private String remark;
	// （sys_status）状态；0:无效； 1:有效
	private Integer status = 1;
	// 生成时间
	private Date createTime;
	// 更新时间
	private Date updateTime;
	
	private Integer role;
	private String mobile;
	//是否阅读协议 0:未同意 1：已同意
	private Integer protocol;

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

	@Column(name = "ACCOUNT")
	public String getAccount() {
		return account;
	}

	@Column(name = "PWD")
	public String getPwd() {
		return pwd;
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
	
	@Column(name = "PROTOCOL")
	public Integer getProtocol() {
		return protocol;
	}

	public void setProtocol(Integer protocol) {
		this.protocol = protocol;
	}
	public void setId(String id) {
		this.id = id;
	}

	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	@Column(name = "ROLE")
	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	@Column(name = "MOBILE")
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
}
