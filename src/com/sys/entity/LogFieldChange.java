package com.sys.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "LOG_FIELD_CHANGE")
public class LogFieldChange implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4466114266805612370L;
	private String id;
	private String fieldName;
	private String oldValue;
	private String newValue;
	private String recordChangeId;

	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	@Column(name = "FIELD_NAME")
	public String getFieldName() {
		return fieldName;
	}

	@Column(name = "OLD_VALUE")
	public String getOldValue() {
		return oldValue;
	}

	@Column(name = "NEW_VALUE")
	public String getNewValue() {
		return newValue;
	}

	@Column(name = "RECORD_CHANGE_ID")
	public String getRecordChangeId() {
		return recordChangeId;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public void setOldValue(String oldValue) {
		this.oldValue = oldValue;
	}

	public void setNewValue(String newValue) {
		this.newValue = newValue;
	}

	public void setRecordChangeId(String recordChangeId) {
		this.recordChangeId = recordChangeId;
	}
	
	

}