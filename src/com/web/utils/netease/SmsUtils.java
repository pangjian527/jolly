package com.web.utils.netease;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.web.utils.HttpUtil;
import com.wxpay.util.SignUtil;

public class SmsUtils {
	private static final String appKey="22805cdb3352be3e2e0884b69697501c";
	private static final String appSecret="33294c9d9a53";
	private static final String SENDCODE_URL="https://api.netease.im/sms/sendcode.action";//发送短信验证码
	private static final String VERIFYCODE_URL="https://api.netease.im/sms/verifycode.action";//校验验证码
	private static final String SENDTEMPLATE_URL="https://api.netease.im/sms/sendtemplate.action";//发送模板短信
	
	public static String sendMsg(String mobile,int codeLength,String templateId) throws Exception{
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
		params.put("templateid", templateId);
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
	
	public static void sendTempMsg(String tempId,JSONArray mobileArr,JSONArray tempParamArr) throws Exception{
		Map<String, String> headerParams = new HashMap<String, String>();
		long time =System.currentTimeMillis()/1000;
		String noncestr = SignUtil.getRandomStringByLength(32);
		headerParams.put("AppKey", appKey);
		headerParams.put("CurTime", String.valueOf(time));
		headerParams.put("Nonce", noncestr);
		headerParams.put("CheckSum", CheckSumBuilder.getCheckSum(appSecret, noncestr, String.valueOf(time)));
		headerParams.put("charset", "utf-8");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("templateid", tempId);
		params.put("mobiles", mobileArr.toString());
		params.put("params", tempParamArr.toString());
		try {
			HttpUtil.httpPost(SENDTEMPLATE_URL, headerParams, params);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}
	
	
	public static void main(String[] args) throws Exception {
		JSONArray arry=new JSONArray();
		arry.add("13760755956");
		
		JSONArray arry2=new JSONArray();
		arry2.add("123");
		
		sendTempMsg("3060166", arry,arry2);
	}
}
