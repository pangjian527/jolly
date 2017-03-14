package com.wxpay.util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import pub.functions.JsonFuncs;
import pub.functions.StrFuncs;
import pub.spring.BeanUtils;

import com.sys.consts.Consts;
import com.web.timer.UpdateWXTicket;
import com.wxpay.config.WXPayConfig;

/* *
 *类名：WXConfig
 *功能：微信js初始化所需要参数设置
 *版本：3.3
 *日期：2015-07-16
 *说明：
 */
public class WXConfigUtil {
	public static void createWXConfigParam(HttpServletRequest request) {
		
		//初始化微信jssdk config参数
		String noncestr = SignUtil.getRandomStringByLength(32);//生成随机字符串
		String timestamp = String.valueOf((System.currentTimeMillis()/1000));//生成1970年到现在的秒数.
		
		request.setAttribute("appId", WXPayConfig.PUBLIC_APP_ID);
		request.setAttribute("timeStamp", timestamp);        //时间戳
		request.setAttribute("nonceStr", noncestr);            //随机字符串
		
		String url = request.getRequestURL().toString();	//请求URL
		if(StringUtils.isNotEmpty(request.getQueryString())){
			url=url+ "?" + request.getQueryString();//请求参数
		}
				
		if(StrFuncs.isEmpty(WXPayConfig.WX_TICKET)){//如果微信票据未取，手动进得获取
			UpdateWXTicket updateWXTicket=BeanUtils.getBean(UpdateWXTicket.class);
			updateWXTicket.execute();
		}
		String signValue = "jsapi_ticket="+WXPayConfig.WX_TICKET+"&noncestr="+noncestr+"&timestamp="+timestamp+"&url="+url.split("#")[0];
		System.out.println("微信初始化配置签名参数："+signValue);
		//这个签名.主要是给加载微信js使用.别和上面的搞混了.
		String signature = SignUtil.getSha1(signValue);
		request.setAttribute("signature", signature);
	}

	public static Map<String, String> getOauthResult(String code) {
		String oauthTokenParam="appid="+WXPayConfig.PUBLIC_APP_ID+"&secret="+WXPayConfig.PUBLIC_APPSECRET+"&code="+code+"&grant_type=authorization_code";
		String oauthTokenJsonStr = HttpClientUtil.SendGET(WXPayConfig.OAUTH2_TOKEN_URL, oauthTokenParam);
		Map<String, String> oauthTokenMap = JsonFuncs.toMap(oauthTokenJsonStr);
		return oauthTokenMap;
	}
	
	public static Map<String, String> getBaseInfo(String token,String openid) {
		String param="access_token="+token+"&openid="+openid+"&lang=zh_CN";
		String baseInfoJsonStr = HttpClientUtil.SendGET(WXPayConfig.BASE_INFO_URL, param);
		Map<String, String> baseInfonMap = JsonFuncs.toMap(baseInfoJsonStr);
		return baseInfonMap;
	}
	
	public static void createWXShareParam(HttpServletRequest request,String factoryId) {
		request.setAttribute("title", "倬利商城");
		request.setAttribute("content", "专注于做最好的手机电池，主营苹果等市场上各类手机电池，质量高，服务好！");        //时间戳
		request.setAttribute("link", WXPayConfig.SERVER_URL+"mmall/factoryuser/register.do?pid="+factoryId);            //随机字符串
		request.setAttribute("imgUrl", WXPayConfig.SERVER_URL+"image/favicon.ico");  
	}
}
