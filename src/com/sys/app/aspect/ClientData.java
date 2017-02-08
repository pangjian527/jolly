package com.sys.app.aspect;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2009-5-7
 * Time: 15:19:23
 */
public class ClientData implements Serializable {

	private static final long serialVersionUID = 1L;

	public static ThreadLocal<ClientData> contextData = new ThreadLocal<ClientData>();

	public static void setContextData(String userId, String ipAddr, Integer moduleId) {
		ClientData data = new ClientData();
		data.setUserId(userId);
		data.setIpAddr(ipAddr);
		data.setModuleId(moduleId);
		contextData.set(data);
	}

	public static ClientData current() {
		return contextData.get();
	}
 
	private String userId;
	private String ipAddr;
	private Integer moduleId;

	public ClientData() {

	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getIpAddr() {
		return ipAddr;
	}
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}
	public Integer getModuleId() {
		return moduleId;
	}
	public void setModuleId(Integer moduleId) {
		this.moduleId = moduleId;
	}
}
