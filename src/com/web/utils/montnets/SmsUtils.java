package com.web.utils.montnets;

import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.DefaultHttpClient;

import pub.functions.StrFuncs;

import com.sys.consts.Consts;
import com.web.utils.montnets.common.ISms;
import com.web.utils.montnets.common.StaticValue;
import com.web.utils.montnets.httpget.CHttpGet;

public class SmsUtils {

	public static String montnets_ip ;

	public static String montnets_port ;
	
	public static String montnets_account ;

	public static String montnets_password ;

	private static boolean bKeepAlive = false;

	private static HttpClient httpClient = null;

	public static String strSubPort = "*";
	
	public static String strUserMsgId = "0";
	/**
	 * 梦网HTTP短信接口,不提短信后台查看到达率
	 * 
	 * @param mobile 手机号码，用英文逗号(,)分隔，最大100个号码。
	 * @param content 短信内容， 最大支持350个字
	 * @return
	 */
	/*public static ResultData sendMsg(String mobile, String content) {

		System.out.println("<SMS>\n\t" + mobile + "\n\t" + content + "\n</SMS>");

		ResultData resultData = new ResultData();

		String ip = getValue("montnets_ip", montnets_ip);
		String port = getValue("montnets_port", montnets_port);
		String account = getValue("montnets_account", montnets_account);
		String password = getValue("montnets_password", montnets_password);

		try {
			// 通用参数
			StaticValue.ip = ip;
			StaticValue.port = port;

			httpClient = new DefaultHttpClient();

			ISms sms = new CHttpGet();
			StringBuffer strPtMsgId = new StringBuffer("");
			// 短信息发送接口（相同内容群发，可自定义流水号）GET请求,httpClient为空，则是短连接,httpClient不为空，则是长连接。
			int result = sms.SendSms(strPtMsgId, account, password, mobile,
					content, strSubPort, strUserMsgId, bKeepAlive, httpClient);
			if (result == 0) {
				System.out.println("发送成功：" + strPtMsgId.toString());
			} else {
				System.out.println("发送失败：" + strPtMsgId.toString());
				paserSmsReturn(strPtMsgId.toString());
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			resultData.isok = false;
			resultData.message = e.getMessage();
		} finally {
			// 关闭连接
			if (httpClient != null) {
				httpClient.getConnectionManager().shutdown();
			}
		}
		return resultData;
	}*/

	/**
	 * 梦网EMP Webservice短信接口
	 * 
	 * @param mobile 手机号码，用英文逗号(,)分隔，最大1000个号码。
	 * @param content 短信内容， 最大支持990个字
	 * @return
	 */
	public static ResultData sendMsg(String mobile, String content) {

		System.out.println("<SMS>\n\t" + mobile + "\n\t" + content + "\n</SMS>");

		ResultData resultData = new ResultData();

		String ip = getValue("montnets_ip", montnets_ip);
		String port = getValue("montnets_port", montnets_port);
		String account = getValue("montnets_account", montnets_account);
		String password = getValue("montnets_password", montnets_password);

		try {
			// 通用参数
			StaticValue.ip = ip;
			StaticValue.port = port;

			ISms sms = new CHttpGet();
			StringBuffer strPtMsgId = new StringBuffer("");
			// 短信息发送接口（相同内容群发，可自定义流水号）GET请求,httpClient为空，则是短连接,httpClient不为空，则是长连接。
			int result = sms.SendSmsNew(strPtMsgId, account, password, mobile, content, strSubPort);
			if (result == 0) {
				System.out.println("发送成功：" + strPtMsgId.toString());
			} else {
				System.out.println("发送失败：" + strPtMsgId.toString());
				paserSmsReturn(strPtMsgId.toString());
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			resultData.isok = false;
			resultData.message = e.getMessage();
		} finally {
		}
		return resultData;
	}
	private static boolean paserSmsReturn(String returnStr) throws Exception {

		if (returnStr != null && !"".equals(returnStr)) {

			if ("-1".equals(returnStr)) {
				throw new Exception("参数为空。信息、电话号码等有空指针，登陆失败");
			}else if ("-2".equals(returnStr)) {
				throw new Exception("电话号码个数超过1000");
			}else if ("-10".equals(returnStr)) {
				throw new Exception("申请缓存空间失败");
			}else if ("-11".equals(returnStr)) {
				throw new Exception("电话号码中有非数字字符");
			}else if ("-12".equals(returnStr)) {
				throw new Exception("异常电话号码");
			}else if ("-13".equals(returnStr)) {
				throw new Exception("电话号码个数与实际个数不相等");
			}else if ("-14".equals(returnStr)) {
				throw new Exception("实际号码个数超过100");
			}else if ("-101".equals(returnStr)) {
				throw new Exception("发送消息等待超时");
			}else if ("-102".equals(returnStr)) {
				throw new Exception("发送或接收消息失败");
			}else if ("-103".equals(returnStr)) {
				throw new Exception("接收消息超时");
			}else if ("-999".equals(returnStr)) {
				throw new Exception("网关web服务器内部错误");
			}else if ("-1002".equals(returnStr)) {
				throw new Exception("短信内容异常");
			}else if("-10001".equals(returnStr)){
	        	throw new Exception("短信网关帐号或密码错误");
	        }else if("-10029".equals(returnStr)){
	        	throw new Exception("此用户没有权限从此通道发送信息");
	        }else if("-10030".equals(returnStr)){
	        	throw new Exception("不能发送移动号码");
	        }else if("-10031".equals(returnStr)){
	        	throw new Exception("手机号码(段)非法");
	        }else if("-10057".equals(returnStr)){
	        	throw new Exception("IP受限");
	        }else if("-10056".equals(returnStr)){
	        	throw new Exception("连接数超限");
	        }else{
	        	throw new Exception("未知错误代码："+returnStr);
	        }
		}
		return false;
	}

	// 内部类
	public static class ResultData {
		public boolean isok = true;
		public String message;
	}

	private static String getValue(String key, String value) {
		if (StrFuncs.isEmpty(value)) {
			value = Consts.configs.get(key);
		}
		return value;
	}

	public static void main(String[] args) {
		sendMsg("11011980209", "您的注册验证码:" + 123456 + "，请勿向他人透露!~");
	}
}
