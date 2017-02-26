package com.web.utils.montnets.httpget;

public class ParamsNew {

	private String userId;   ///用户账号
	private String password; ///用户密码
	private String pszMobis;  //目标号码，用英文逗号(,)分隔，最大1000个号码。一次提交的号码类型不受限制，但手机会做验证，若有不合法的手机号将会被退回。号码段类型分为：移动、联通、电信手机 注意：请不要使用中文的逗号
	private String pszMsg;    //短信内容， 内容长度不大于990个汉字
	private String iMobiCount;		//号码个数（最大1000个手机）
	private String pszSubPort;  //子端口号码，不带请填*号长度由账号类型定4-6位，通道号总长度不能超过20位。如：10657****主通道号，3321绑定的扩展端口，主+扩展+子端口总长度不能超过20位。
	private String SvrType;     //业务类型,最大长度32字节,必须是字母、数字、字母数字混合 (可选)
	private String Param1;		//用户自定义参数1,最大长度64字节 (可选)
	private String Param2;		//用户自定义参数2,最大长度64字节 (可选)
	private String Param3;		//用户自定义参数3,最大长度64字节 (可选)
	private String Param4;		//用户自定义参数4,最大长度64字节 (可选)
	private String MsgId;		//（可选）一个8字节64位的大整型（INT64），格式化成的字符串。因此该字段必须为纯数字，且范围不能超过INT64的取值范围（-(2^63）……2^63-1） 即-9223372036854775807……9223372036854775808。格式化成字符串后最大长度不超过20个字节。
	private String ModuleId;		//模块ID，4字节整型正数（0~2^31-1），0视为无效值，请填写非0值（可选）
	private String Attime;		//短信定时发送时间（可选）。此处格式为：yyyyMMddHHmmss，即年月日时分秒，14位，24小时制计时。 例如2012年12月31日16时59分0秒，即为20121231165900。 小于或等于0或无该字段时视为不需定时。 定时时间不能小于当前时间。
	private String Validtime;   //短信有效存活时间（可选）。此处格式为：yyyyMMddHHmmss，即年月日时分秒，14位，24小时制计时。 例如2012年12月31日16时59分0秒，即为20121231165900小于或等于0或无该字段时按系统默认有效期（48小时）执行。存活时间不能小于当前时间。
	private String RptFlag;		//是否需要状态报告（可选）。0:表示不需要，非0:表示需要。该值若不填，系统默认为需要状态报告
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPszMobis() {
		return pszMobis;
	}
	public void setPszMobis(String pszMobis) {
		this.pszMobis = pszMobis;
	}
	public String getPszMsg() {
		return pszMsg;
	}
	public void setPszMsg(String pszMsg) {
		this.pszMsg = pszMsg;
	}
	public String getIMobiCount() {
		return iMobiCount;
	}
	public void setIMobiCount(String iMobiCount) {
		this.iMobiCount = iMobiCount;
	}
	public String getPszSubPort() {
		return pszSubPort;
	}
	public void setPszSubPort(String pszSubPort) {
		this.pszSubPort = pszSubPort;
	}
	public String getSvrType() {
		return SvrType;
	}
	public void setSvrType(String svrType) {
		SvrType = svrType;
	}
	public String getParam1() {
		return Param1;
	}
	public void setParam1(String param1) {
		Param1 = param1;
	}
	public String getParam2() {
		return Param2;
	}
	public void setParam2(String param2) {
		Param2 = param2;
	}
	public String getParam3() {
		return Param3;
	}
	public void setParam3(String param3) {
		Param3 = param3;
	}
	public String getParam4() {
		return Param4;
	}
	public void setParam4(String param4) {
		Param4 = param4;
	}
	public String getMsgId() {
		return MsgId;
	}
	public void setMsgId(String msgId) {
		MsgId = msgId;
	}
	public String getModuleId() {
		return ModuleId;
	}
	public void setModuleId(String moduleId) {
		ModuleId = moduleId;
	}
	public String getAttime() {
		return Attime;
	}
	public void setAttime(String attime) {
		Attime = attime;
	}
	public String getValidtime() {
		return Validtime;
	}
	public void setValidtime(String validtime) {
		Validtime = validtime;
	}
	public String getRptFlag() {
		return RptFlag;
	}
	public void setRptFlag(String rptFlag) {
		RptFlag = rptFlag;
	}
	
	
}
