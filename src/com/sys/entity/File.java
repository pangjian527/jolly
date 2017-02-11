/*
 * @(#) File.java Mar 03, 2010
 * Copyright 2010 GPDI. All right reserved.
 */
package com.sys.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * @author dgs
 * @version 1.0 Mar 03, 2010
 */
@Entity
@Table(name = "T_FILE")
public class File implements Serializable {
	/**
	 *
	 */
	
	private static final long serialVersionUID = 1L;

	// 唯一标识
	private String id;
	// 文件名
	private String fileName;
	// 大小（字节）
	private Integer fileSize;
	// MIME
	private String contentType;
	// 内容
	private byte[] content;
	// 上传时间
	private Date uploadTime;
	
	// 对应的业务实体的表名
	private String tableName;
	// 对应的业务实体的id
	private String referenceId;

	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	@Column(name = "FILE_NAME")
	public String getFileName() {
		return fileName;
	}

	@Column(name = "FILE_SIZE")
	public Integer getFileSize() {
		return fileSize;
	}

	@Column(name = "CONTENT_TYPE")
	public String getContentType() {
		return contentType;
	}

	@Column(name = "CONTENT")
	public byte[] getContent() {
		return content;
	}

	@Column(name = "UPLOAD_TIME")
	public Date getUploadTime() {
		return uploadTime;
	}
	
	@Column(name = "TABLE_NAME")
	public String getTableName() {
		return tableName;
	}

	@Column(name = "REFERENCE_ID")
	public String getReferenceId() {
		return referenceId;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setFileSize(Integer fileSize) {
		this.fileSize = fileSize;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public void setReferenceId(String referenceId) {
		this.referenceId = referenceId;
	}
	
}

