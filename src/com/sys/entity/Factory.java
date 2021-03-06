package com.sys.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import pub.functions.StrFuncs;

@Entity
@Table(name = "t_factory")
// 商家信息表
public class Factory implements Serializable {
	/**
	 * 
	 */
	public static String TABLE_NAME = "T_FACTORY";
	
	//总店ID
	public static String MAIN_STORE_ID = "-1";
	
	private static final long serialVersionUID = 4151476512260152999L;
//	public static final int DELETED = -1;   //删除
//	public static final int OFFLINE = 0;	//下架
//	public static final int ONLINE = 1;		//上架
	//public static final int APPROVE = 2;		//待审核
	
	public static final int STATUS_INVALID =0 ;	//无效 删除
	public static final int STATUS_VALID =1 ;	//有效 {认证通过}
	public static final int STATUS_APPROVE =2 ;	//待认证
	public static final int STATUS_DRAFT =3 ;//未进行认证
	public static final int STATUS_OUT_OF_STOCK=4;//被人为下架了
	
	public static final int PROTOCOL_AGREE =1 ;//同意
	public static final int PROTOCOL_NOT_AGREE=0;//不同意
	
	
	// 主键
	private String id;
	// 商家名称
	private String name;
	// 商家联系人
	private String man;
	//商家电话
	private String mobile;
	// 省(T_AREA.ID)
	private String provinceId;
	// 市(T_AREA.ID)
	private String cityId;
	// 区(T_AREA.ID)
	private String countyId;
	// 商家地址
	private String addr;
	// gps坐标X
	private Double gpsX;
	// gps坐标Y
	private Double gpsY;
	//营业执照名称
	private String licenseName;
	
	//营业执照名称
	private String licenseFileIds;
	
	private String photoIds;
	// 生成时间
	private Date createTime;
	// 更新时间
	private Date updateTime;
	private String refereeId;// 
	
	private String sysUserId;// 
	// （sys_status）状态；0:无效； 1:有效 2:待审核3:草稿4:被下架了
	private Integer status;
	
	private String moneyAccount;
	
	private Integer agreeProtocol;
	
	private String bankName;
	
	private String bankBranchName;
	
	private String bankOwnerName;
	
	public Factory() {
		this.createTime = new Date();
	}
	
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
	
	@Column(name = "MAN")
	public String getMan() {
		return man;
	}
	

	@Column(name = "MOBILE")
	public String getMobile() {
		return mobile;
	}

	@Column(name = "PROVINCE_ID")
	public String getProvinceId() {
		return provinceId;
	}

	@Column(name = "CITY_ID")
	public String getCityId() {
		return cityId;
	}

	@Column(name = "COUNTY_ID")
	public String getCountyId() {
		return countyId;
	}

	@Column(name = "ADDR")
	public String getAddr() {
		return addr;
	}

	@Column(name = "GPS_X")
	public Double getGpsX() {
		return gpsX;
	}

	@Column(name = "GPS_Y")
	public Double getGpsY() {
		return gpsY;
	}

	@Column(name = "LICENSE_NAME")
	public String getLicenseName() {
		return licenseName;
	}
	
	@Column(name = "LICENSE_FILE_IDS")
	public String getLicenseFileIds() {
		return licenseFileIds;
	}

	@Column(name = "PHOTO_IDS")
	public String getPhotoIds() {
		return photoIds;
	}

	@Column(name = "CREATE_TIME", updatable = false)
	public Date getCreateTime() {
		return createTime;
	}

	@Column(name = "UPDATE_TIME", updatable = false)
	public Date getUpdateTime() {
		return updateTime;
	}

	@Column(name = "REFEREE_ID")
	public String getRefereeId() {
		return refereeId;
	}

	@Column(name = "SYS_USER_ID")
	public String getSysUserId() {
		return sysUserId;
	}

	@Column(name = "STATUS")
	public Integer getStatus() {
		return status;
	}
	
	@Column(name = "MONEY_ACCOUNT")
	public String getMoneyAccount() {
		return moneyAccount;
	}
	
	@Column(name = "AGREE_PROTOCOL")
	public Integer getAgreeProtocol() {
		return agreeProtocol;
	}

	@Column(name = "BANK_NAME")
	public String getBankName() {
		return bankName;
	}

	@Column(name = "BANK_BRANCH_NAME")
	public String getBankBranchName() {
		return bankBranchName;
	}

	@Column(name = "BANK_OWNER_NAME")
	public String getBankOwnerName() {
		return bankOwnerName;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public void setMan(String man) {
		this.man = man;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public void setCountyId(String countyId) {
		this.countyId = countyId;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public void setGpsX(Double gpsX) {
		this.gpsX = gpsX;
	}

	public void setGpsY(Double gpsY) {
		this.gpsY = gpsY;
	}

	public void setLicenseName(String licenseName) {
		this.licenseName = licenseName;
	}
	

	public void setPhotoIds(String photoIds) {
		this.photoIds = photoIds;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	

	public void setRefereeId(String refereeId) {
		this.refereeId = refereeId;
	}

	public void setSysUserId(String sysUserId) {
		this.sysUserId = sysUserId;
	}
	
	public void setStatus(Integer status) {
		this.status = status;
	}

	public void setLicenseFileIds(String licenseFileIds) {
		this.licenseFileIds = licenseFileIds;
	}


	public void setMoneyAccount(String moneyAccount) {
		this.moneyAccount = moneyAccount;
	}

	public void setAgreeProtocol(Integer agreeProtocol) {
		this.agreeProtocol = agreeProtocol;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public void setBankBranchName(String bankBranchName) {
		this.bankBranchName = bankBranchName;
	}

	public void setBankOwnerName(String bankOwnerName) {
		this.bankOwnerName = bankOwnerName;
	}

}
