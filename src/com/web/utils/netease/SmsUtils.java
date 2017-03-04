package com.web.utils.netease;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.web.utils.HttpUtil;
import com.wxpay.util.SignUtil;

public class SmsUtils {
	private static final String appKey="da85d433c65d70f703692bd1806b78d2";
	private static final String appSecret="4da44793ee55";
	private static final String SENDCODE_URL="https://api.netease.im/sms/sendcode.action";//发送短信验证码
	private static final String VERIFYCODE_URL="https://api.netease.im/sms/verifycode.action";//校验验证码
	public static String sendMsg(String mobile,int codeLength) throws Exception{
		Map<String, String> headerParams = new HashMap<String, String>();
		long time =System.currentTimeMillis()/1000;
		String noncestr = SignUtil.getRandomStringByLength(32);
		headerParams.put("AppKey", appKey);
		headerParams.put("CurTime", String.valueOf(time));
		headerParams.put("Nonce", noncestr);
		headerParams.put("CheckSum", CheckSumBuilder.getCheckSum(appSecret, noncestr, String.valueOf(time)));
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mobile", mobile);
		params.put("codeLen", String.valueOf(codeLength));
		try {
			String jsonTex = HttpUtil.httpPost(SENDCODE_URL, headerParams, params);
			JSONObject result = JSONObject.fromObject(jsonTex);
			if(200==result.getInt("code")){
				return result.getString("obj");
			}else{
				throw new Exception("发送短信失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.getMessage());
		}
	}
	/**
	 * 校验验证码
	 * @param mobile
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public static boolean validate(String mobile,String code) throws Exception{
		Map<String, String> headerParams = new HashMap<String, String>();
		long time =System.currentTimeMillis()/1000;
		String noncestr = SignUtil.getRandomStringByLength(32);
		headerParams.put("AppKey", appKey);
		headerParams.put("CurTime", String.valueOf(time));
		headerParams.put("Nonce", noncestr);
		headerParams.put("CheckSum", CheckSumBuilder.getCheckSum(appSecret, noncestr, String.valueOf(time)));
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mobile", mobile);
		params.put("code", code);
		try {
			String jsonTex = HttpUtil.httpPost(VERIFYCODE_URL, headerParams, params);
			JSONObject result = JSONObject.fromObject(jsonTex);
			if(200==result.getInt("code")){
				return true;
			}else if(413==result.getInt("code")){
				return false;
			}else{
				throw new Exception("校验验证码失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}
	public static void main(String[] args) throws Exception {
		String sendMsg = sendMsg("13760755956", 6);
		System.out.println(sendMsg);
		System.out.println(validate("13760755956", sendMsg));
	}
}
