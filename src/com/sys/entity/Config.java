package com.sys.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_config")
public class Config implements Serializable {

	private static final long serialVersionUID = 1258893852997775897L;

	public static String TABLE_NAME = "T_CONFIG";

	// 主键
	private String id;
	private String key;
	private String value;

	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	public String getId() {
		return id;
	}

	@Column(name = "KEY")
	public String getKey() {
		return key;
	}

	@Column(name = "VALUE")
	public String getValue() {
		return value;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	

}
