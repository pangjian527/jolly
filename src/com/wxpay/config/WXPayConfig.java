package com.wxpay.config;

import com.sys.consts.Consts;


/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *版本：3.3
 *日期：2012-08-10
 *说明：
 */

public class WXPayConfig {
	//异步回调地址
	//public static final String NOTIFY_URL = Consts.configs.get("server_url")+"/wx_notify_url.html";
	//本机测试
	//public static final String NOTIFY_URL = Consts.configs.get("server_url")+"/wx_notify_url.html";
	//public static final String PAY_URL=Consts.configs.get("server_url")+"/mwebmall/bookform/book.do?op=resultView";
	//public static final String OAUTH2_REDIRECT_URL=Consts.configs.get("server_url");//授权页面重定向URL
	
	//付款页面
	//public static final String PAY_URL ="http://wersty.wicp.net/htw/mwebmall/bookform/book.do?op=resultView";

	//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	public static final String PUBLIC_APP_ID = "wx7a2a9989083b3725";// 移动应用，公众平台移动应用
	//public static final String PUBLIC_MCH_ID = "1238565702";// ，公众平台商户
	public static final String PUBLIC_APPSECRET = "c0ce8689442ddf64541dacff25e99934";//公众号密钥
	
	//public static final String PUBLIC_API_KEY="";//支付密钥
	// 字符编码格式 目前支持  utf-8
	//public static final String input_charset = "utf-8";
	
//	public static final String WX_PREPAY_URL="https://api.mch.weixin.qq.com/pay/unifiedorder";//统一支付接口 URL,获取预支付单号prepay_id
//	
	public static final String GET_TOKEN_URL="https://api.weixin.qq.com/cgi-bin/token";//获取token URL
//	
	public static final String GET_TICKET_URL="https://api.weixin.qq.com/cgi-bin/ticket/getticket";//获取ticket URL
//	
//	public static final String OAUTH2_URL="https://open.weixin.qq.com/connect/oauth2/authorize";//网页授权URL
//	
//	
	public static final String OAUTH2_TOKEN_URL="https://api.weixin.qq.com/sns/oauth2/access_token";
//	
//	//微信配置信息参数
	public static String WX_TICKET="";//缓存微信TICKET,jsapi_ticket只会存在7200秒.并且有时间限制,(接口的调用频率限制为2000次/天.所以一定要缓存.)这是第三坑.
//
	public static String WX_TOKEN="";//缓存微信TOKEN
//	
//	public static final String WX_ORDER_QUERY="https://api.mch.weixin.qq.com/pay/orderquery";//支付订单的查询
//	
//	public static final String RESULT_SUCCESS="SUCCESS";
//	
//	public static final String RESULT_FAIL="FAIL";
	
	
}
