package com.web.utils;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import com.web.utils.netease.CheckSumBuilder;
import com.wxpay.util.SignUtil;
/*
 * request tools
 * by dgs 2014-12-30
 * **/
public class HttpUtil {
	
	
	
	
	private static final int SO_TIMEOUT = 10000;
	private static final int CON_TIMEOUT = 10000;
	private static final int BUFFER_SIZE = 1024;
	
	public static String httpPost(String url, Map<String, String> params) {
		URL u = null;
		HttpURLConnection con = null;
		// 构建请求参数
		StringBuffer sb = new StringBuffer();
		if (params != null) {
			boolean first = true;
			for (Entry<String, String> e : params.entrySet()) {
				if (first) {
					first = false;
				} else {
					sb.append('&');
				}
				sb.append(e.getKey());
				sb.append("=");
				sb.append(e.getValue());
			}
			//sb.substring(0, sb.length() - 1);
		}
		System.out.println("send_url:" + url);
		System.out.println("send_data:" + sb.toString());
		System.out.println("====");
		// 尝试发送请求
		try {
			u = new URL(url);
			con = (HttpURLConnection) u.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setUseCaches(false);
			con.setConnectTimeout(CON_TIMEOUT);
			con.setReadTimeout(SO_TIMEOUT);
			con.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream(), "UTF-8");
			osw.write(sb.toString());
			osw.flush();
			osw.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				con.disconnect();
			}
		}
		// 读取返回内容
		StringBuffer buffer = new StringBuffer();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String temp;
			while ((temp = br.readLine()) != null) {
				buffer.append(temp);
				buffer.append("\n");
			}
			System.out.println(buffer.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return buffer.toString();
	}
	
	public static String httpPost(String url,Map<String, String> headerParams, Map<String, String> params) {
		URL u = null;
		HttpURLConnection con = null;
		// 构建请求参数
		StringBuffer sb = new StringBuffer();
		
		if (params != null) {
			boolean first = true;
			for (Entry<String, String> e : params.entrySet()) {
				if (first) {
					first = false;
				} else {
					sb.append('&');
				}
				sb.append(e.getKey());
				sb.append("=");
				sb.append(e.getValue());
			}
			//sb.substring(0, sb.length() - 1);
		}
		System.out.println("send_url:" + url);
		System.out.println("send_data:" + sb.toString());
		System.out.println("====");
		// 尝试发送请求
		try {
			u = new URL(url);
			con = (HttpURLConnection) u.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setUseCaches(false);
			con.setConnectTimeout(CON_TIMEOUT);
			con.setReadTimeout(SO_TIMEOUT);
			con.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			
			for (Entry<String, String> e : headerParams.entrySet()) {
				con.setRequestProperty(e.getKey(), e.getValue());
			}
			
			OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream(), "UTF-8");
			osw.write(sb.toString());
			osw.flush();
			osw.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				con.disconnect();
			}
		}
		// 读取返回内容
		StringBuffer buffer = new StringBuffer();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String temp;
			while ((temp = br.readLine()) != null) {
				buffer.append(temp);
				buffer.append("\n");
			}
			System.out.println(buffer.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return buffer.toString();
	}
	
	//模拟手机请求json
	public static String httpGet(String json_url,Map<String, Object> params) throws Exception{
		InputStream inputStream = null;
		ByteArrayOutputStream bytes = null;
		URL url = new URL(makeUrlUtil(json_url,params));
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setDoInput(true);
		conn.setConnectTimeout(CON_TIMEOUT);
		conn.setReadTimeout(SO_TIMEOUT);
		//conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31");
		conn.connect();
		int respCode = conn.getResponseCode();
		if (respCode != -1) {
			if (respCode == 200) {
				byte[] data = null;
				byte[] buffer = new byte[BUFFER_SIZE];
				inputStream = conn.getInputStream();
				bytes = new ByteArrayOutputStream();
				int len = -1;
				while ((len = inputStream.read(buffer)) != -1) {
					bytes.write(buffer, 0, len);
				}
				bytes.flush();
				data = bytes.toByteArray();
				if (data == null || data.length == 0) {
					return null;
				} else {
					String str = new String(data,"utf-8");
					return str;
				}
			}			
		}
		return null;		
	}
	
	public static String makeUrlUtil(String baseUrl, Map<String, Object> params) {

		if(params==null)
			return baseUrl;
		
		StringBuilder sb = new StringBuilder(baseUrl);
		if (params.size() > 0) {
			if (baseUrl.indexOf('?') == -1) {
				sb.append('?');
			} else {
				sb.append('&');
			}
		}
		boolean first = true;
		for (Map.Entry<String, Object> param : params.entrySet()) {
			if (first) {
				first = false;
			} else {
				sb.append('&');
			}
			String sValue = param.getValue() == null ? "" : param.getValue()
					.toString();
			try {
				sValue = URLEncoder.encode(sValue, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			sb.append(param.getKey()).append('=').append(sValue);
		}
		return sb.toString();
	}
	
	public static void main(String[] args) {
		Map<String, String> headerParams = new HashMap<String, String>();
		headerParams.put("AppKey", "da85d433c65d70f703692bd1806b78d2");
		long time =System.currentTimeMillis()/1000;
		String noncestr = SignUtil.getRandomStringByLength(32);
		headerParams.put("CurTime", String.valueOf(time));
		headerParams.put("Nonce", noncestr);
		headerParams.put("CheckSum", CheckSumBuilder.getCheckSum("4da44793ee55", noncestr, String.valueOf(time)));
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mobile", "13760755956");
		params.put("codeLen", "6");
		String httpPost = httpPost("https://api.netease.im/sms/sendcode.action", headerParams, params);
		System.out.println(httpPost);
	}
}
