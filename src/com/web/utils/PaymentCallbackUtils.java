package com.web.utils;

import java.util.Map;

/**
 * myq add 2015-2-11,用于支付模块获得支付宝/taobao的支付反馈后，调用该Utils执行相关的业务逻辑
 * 这是一个虚类，对应的订单/结算模块如果需要回掉，应该扩展并实现success方法和error方法
 * @author newbaby
 *
 */
public abstract class PaymentCallbackUtils {
	public static void noticeSuccess(String className, final String logId, final String callbackConfig,final Map<String,String> params){
		try{
			final PaymentCallbackUtils callbackInstance = (PaymentCallbackUtils)Class.forName(className).newInstance();
			new Thread(){
				public void run(){
					callbackInstance.success(logId, callbackConfig,params);
				}
			}.start();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void noticeError(String className, final String logId, final String callbackConfig,final Map<String,String> params){
		try{
			final PaymentCallbackUtils callbackInstance = (PaymentCallbackUtils)Class.forName(className).newInstance();
			new Thread(){
				public void run(){
					callbackInstance.error(logId, callbackConfig,params);
				}
			}.start();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	protected abstract void success(String logId, String callbackConfig,Map<String,String> params);
	protected abstract void error(String logId, String callbackConfig,Map<String,String> params);
}
