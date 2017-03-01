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
@Table(name = "T_AD")
// 广告位实例化表
public class Ad implements Serializable {

	private static final long serialVersionUID = -9003826481721717684L;

	public static String TABLE_NAME = "T_AD";

	public static final int STATUS_INVALID =0 ;	//无效
	public static final int STATUS_VALID =1 ;	//有效
	
	// 唯一标识
	private String id;
	private String title;
	// 广告链接
	private String url;
	// 广告最新修改人ID
	private String userId;
	// （sys_status）状态；0:无效； 1:有效
	private Integer status = 1;
	private String adPhotoId;
	private String contentPhotoId;
	private Integer seq = 10000;
	// 生成时间
	private Date createTime;
	// 更新时间
	private Date updateTime;
	
	

	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	
	@Column(name = "AD_PHOTO_ID")
	public String getAdPhotoId() {
		return adPhotoId;
	}


	@Column(name = "CONTENT_PHOTO_ID")
	public String getContentPhotoId() {
		return contentPhotoId;
	}



	@Column(name = "URL")
	public String getUrl() {
		return url;
	}

	@Column(name = "USER_ID")
	public String getUserId() {
		return userId;
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

	@Column(name = "SEQ")
	public Integer getSeq() {
		return seq;
	}
	
	
	@Column(name = "TITLE")
	public String getTitle() {
		return title;
	}


	public void setId(String id) {
		this.id = id;
	}


	public void setUrl(String url) {
		this.url = url;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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


	public void setSeq(Integer seq) {
		this.seq = seq;
	}



	public void setTitle(String title) {
		this.title = title;
	}


	public void setAdPhotoId(String adPhotoId) {
		this.adPhotoId = adPhotoId;
	}


	public void setContentPhotoId(String contentPhotoId) {
		this.contentPhotoId = contentPhotoId;
	}

}
