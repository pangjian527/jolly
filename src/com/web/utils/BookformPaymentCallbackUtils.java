package com.web.utils;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import pub.functions.DateFuncs;
import pub.functions.JsonFuncs;
import pub.functions.XmlFuncs;
import pub.spring.BeanUtils;

import com.sys.entity.LogPayment;
import com.sys.service.BookformService;
import com.sys.service.LogPaymentService;
import com.wxpay.util.LogUtil;

public class BookformPaymentCallbackUtils extends PaymentCallbackUtils{
	
	protected void success(String logId, String orderId, Map<String,String> params){		
		//1.有效性验证，因为多次回掉
		LogPaymentService logPaymentService = BeanUtils.getBean(LogPaymentService.class);		
		LogPayment logPayment = logPaymentService.get(logId);
		if(logPayment == null || logPayment.getStatus() == 1){
			return;
		}
		
		//2.更新logPayment表，记录日志
		logPayment.setStatus(1);//已付款
		logPayment.setReturnContent(params.toString());//返回的参数
		logPaymentService.update(logPayment);
		
		String result_log = "logPaymentId:"+logId+" 成功支付:"+logPayment.getAmount()+"元,"+DateFuncs.toString(new Date());
		LogUtil.logResult(result_log);
			
		//3.更新关联的t_bookform.log_payment_id对象
		try{
			BookformService bookformService = BeanUtils.getBean(BookformService.class);
			bookformService.finishPayment(orderId, logId);
			System.out.println("bookform in action is:\n" + JsonFuncs.toJson(bookformService.get(orderId)));
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}

	protected void error(String logId, String config,Map<String,String> params){
		/*由于NotifyAction把关不严，没有及时告知支付宝停止通知，反而这里会出问题
		 * LogPaymentService logPaymentService = BeanUtils.getBean(LogPaymentService.class);;
		
		LogPayment logPayment = logPaymentService.get(logId);
		if(logPayment.getStatus().intValue()==0){
			if(logPayment.getSysType()==LogPayment.payType_alipay){//支付宝支付
				String result_log = "logPaymentId=:"+logId+" 失败支付:"+logPayment.getAmount()+","+DateFuncs.toString(new Date());
				AlipayCore.logResult(result_log);
			}	
			logPayment.setStatus(2);//付款失败
			logPayment.setReturnContent(params.toString());//返回的参数
			logPaymentService.update(logPayment);
		}*/
	}
	
}
