package com.sys.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.GenericGenerator;

/**
 * TFile entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_file", catalog = "play")
public class File implements java.io.Serializable {

	// Fields

	private String id;
	private String fileName;
	private Integer fileSize;
	private String contentType;
	private byte[] content;
	private Date updateTime;
	private Date createTime;
	private String tableName;
	private String referenceId;
	private String code;

	// Constructors

	/** default constructor */
	public File() {
		this.createTime=new Date();
	}

	/** full constructor */
	public File(String fileName, Integer fileSize, String contentType,
			byte[] content, Date updateTime, Date createTime, String tableName,
			String referenceId, String code) {
		this.fileName = fileName;
		this.fileSize = fileSize;
		this.contentType = contentType;
		this.content = content;
		this.updateTime = updateTime;
		this.createTime = createTime;
		this.tableName = tableName;
		this.referenceId = referenceId;
		this.code = code;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "file_name", length = 100)
	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Column(name = "file_size", precision = 10, scale = 0)
	public Integer getFileSize() {
		return this.fileSize;
	}

	public void setFileSize(Integer fileSize) {
		this.fileSize = fileSize;
	}

	@Column(name = "content_type", length = 10)
	public String getContentType() {
		return this.contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	@Column(name = "content")
	public byte[] getContent() {
		return this.content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "update_time", length = 10)
	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "create_time", length = 10)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "table_Name", length = 20)
	public String getTableName() {
		return this.tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	@Column(name = "reference_Id", length = 32)
	public String getReferenceId() {
		return this.referenceId;
	}

	public void setReferenceId(String referenceId) {
		this.referenceId = referenceId;
	}

	@Column(name = "code", length = 30)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}