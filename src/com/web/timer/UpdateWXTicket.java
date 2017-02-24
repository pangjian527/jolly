package com.web.timer;

import java.util.Map;

import pub.functions.JsonFuncs;

import com.wxpay.config.WXPayConfig;
import com.wxpay.util.HttpClientUtil;


public class UpdateWXTicket {
	public void execute(){
		System.out.println("缓存微信ticket任务开始...");
		try {
			System.out.println("缓存微信ticket任务进行中...");
			//初始化微信jssdk config参数
			//获取jsapi_ticket.此参数是为了生成 js api  加载时候的签名用.必须.jsapi_ticket只会存在7200秒.并且有时间限制,(好像一年还只能调用两万次.所以一定要缓存.)这是第三坑.
			//可以在java中模拟url请求.就能获取access_token 然后根据access_token 取得 jsapi_ticket,但一定要缓存起来..这个代码.我只提供获取.缓存你们自己处理.
			//SendGET方法我会在后面放出
			String tokenParam = "grant_type=client_credential&appid="+ WXPayConfig.PUBLIC_APP_ID+"&secret="+WXPayConfig.PUBLIC_APPSECRET;
			
			String tokenJsonStr = HttpClientUtil.SendGET(WXPayConfig.GET_TOKEN_URL, tokenParam);
			Map tokenMap = JsonFuncs.toMap(tokenJsonStr);
			//获取access_token
			String access_token = (String)tokenMap.get("access_token");
			
			String ticketParam = "access_token="+access_token+"&type=jsapi";
			System.out.println("获取票据参数"+ticketParam);
			String ticketJsonStr = HttpClientUtil.SendGET(WXPayConfig.GET_TICKET_URL, ticketParam);
			Map ticketMap = JsonFuncs.toMap(ticketJsonStr);
			
			WXPayConfig.WX_TOKEN=access_token;//缓存tocken
			WXPayConfig.WX_TICKET=(String)ticketMap.get("ticket");//缓存jsapi_ticket
			
			System.out.println("获取票据tickent:"+WXPayConfig.WX_TICKET);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("缓存微信ticket任务结束...");
	}
	public static void main(String[] args) {
		new UpdateWXTicket().execute();
	}
}
