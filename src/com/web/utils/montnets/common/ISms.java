package com.web.utils.montnets.common;

import java.util.List;

public interface ISms
{
	
	
	/**
	 * 1.短信息发送接口（相同内容群发，可自定义流水号）
	 * @param strPtMsgId 平台返回的流水号
	 * @param strUserId  帐号
	 * @param strPwd 密码
	 * @param strMobiles 手机号
	 * @param strMessage 短信内容
	 * @param strSubPort 扩展子号
	 * @param strUserMsgId 用户自编流水号
	 * @param bKeepAlive 长连接或短连接,默认短连接,false短连接,true长连接
	 * @param connection 连接对象,如果是短连接，传null
	 * @return 0:成功 非0:返回webservice接口返回的错误代码
	 */
	public int SendSms(StringBuffer strPtMsgId, String strUserId, String strPwd, String strMobiles, String strMessage, String strSubPort, String strUserMsgId, boolean bKeepAlive,Object connection);
	
	
	/**
	 * 2.短信息发送接口（不同内容群发，可自定义不同流水号，自定义不同扩展号）
	 * @param strPtMsgId 平台返回的流水号
	 * @param strUserId 帐号
	 * @param strPwd 密码
	 * @param MultixMt 批量请求包
	 * @param bKeepAlive 长连接或短连接,默认短连接,false短连接,true长连接
	 * @param connection 连接对象,如果是短连接，传null
	 * @return 0:成功 非0:返回webservice接口返回的错误代码
	 */
	public int SendMultixSms(StringBuffer strPtMsgId,String strUserId, String strPwd, List<MULTIX_MT> MultixMt, boolean bKeepAlive,Object connection);
	
	
	/**
	 * 3.查询余额接口
	 * @param nBalance 帐号费用
	 * @param strUserId 帐号
	 * @param strPwd 密码
	 * @param bKeepAlive 长连接或短连接,默认短连接,false短连接,true长连接
	 * @param connection 连接对象,如果是短连接，传null
	 * @return 0:成功 非0:返回webservice接口返回的错误代码
	 */
	public int QueryBalance(StringBuffer nBalance, String strUserId, String strPwd, boolean bKeepAlive,Object connection);
	
	
	/**
	 * 4.获取上行
	 * @param strUserId 帐号
	 * @param strPwd 密码
	 * @param bKeepAlive 长连接或短连接,默认短连接,false短连接,true长连接
	 * @param connection 连接对象,如果是短连接，传null
	 * @return 返回上行集合
	 */
	public List<MO_PACK> GetMo(String strUserId, String strPwd, boolean bKeepAlive,Object connection);
	
	
	/**
	 * 5.状态报告
	 * @param strUserId 帐号
	 * @param strPwd 密码
	 * @param bKeepAlive 长连接或短连接,默认短连接,false短连接,true长连接
	 * @param connection 连接对象,如果是短连接，传null
	 * @return 返回状态报告集合
	 */
	public List<RPT_PACK> GetRpt(String strUserId, String strPwd, boolean bKeepAlive,Object connection);
	
	
	/**
	 * 6. EMP Webservice 短信发送
	 * @param strPtMsgId 平台返回的流水号
	 * @param userId 账号
	 * @param password 密码
	 * @param pszMobis 手机号
	 * @param pszMsg   短信内容
	 * @param pszSubPort 子端口号码
	 * @return
	 */
	public int SendSmsNew(StringBuffer strPtMsgId,String userId, String password,String pszMobis, String pszMsg,String pszSubPort);

	
	/**
	 * 6. EMP Webservice 短信发送，全量参数
	 * @param strPtMsgId 平台返回的流水号
	 * @param userId
	 * @param password
	 * @param pszMobis
	 * @param pszMsg
	 * @param iMobiCount
	 * @param pszSubPort
	 * @param SvrType
	 * @param Param1
	 * @param Param2
	 * @param Param3
	 * @param Param4
	 * @param MsgId
	 * @param ModuleId
	 * @param Attime
	 * @param Validtime
	 * @param RptFlag
	 * @return
	 */
	public int SendSmsNew(StringBuffer strPtMsgId,String userId, String password,String pszMobis, String pszMsg,String pszSubPort,String SvrType,String Param1,String Param2,String Param3,String Param4,String MsgId,int ModuleId, String Attime, String Validtime ,int RptFlag);
}
