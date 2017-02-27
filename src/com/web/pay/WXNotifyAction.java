package com.web.pay;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pub.functions.XmlFuncs;

import com.sys.entity.LogPayment;
import com.sys.service.LogPaymentService;
import com.web.utils.PaymentCallbackUtils;
import com.wxpay.util.SignUtil;

/**
 * User: dgs
 * Date: 2015-2-5
 * 微信异步通知
 */
@Controller("/wx_notify_url.html")
@SuppressWarnings("unchecked")
public class WXNotifyAction  {

	
	
	@RequestMapping
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			String inputLine;
			String notityXml = "";
			while((inputLine = request.getReader().readLine()) !=null){
				notityXml += inputLine;
			}
			request.getReader().close();
			System.out.println("接收到微信异步回调报文="+notityXml);
			//LogUtil.logResult(DateFuncs.toString(new Date(), "yyyy-MM-dd HH:mm:ss")+" "+notityXml);
			
			Map<String, String> notityMap = XmlFuncs.xml2map(notityXml);
			if(notityMap.containsKey("return_code") && notityMap.get("return_code").contains("SUCCESS")){//调用成功
				if(notityMap.containsKey("result_code")){//
					if(notityMap.get("result_code").contains("SUCCESS")){//交易成功
						String out_trade_no = notityMap.get("out_trade_no");//logpaymentId
						String sign = notityMap.get("sign");//签名
						//验证合法性
						notityMap.remove("sign");
						LogPayment logPayment = logPaymentService.get(out_trade_no);
						if(logPayment == null){		
							throw new Exception("无效对应的支付记录");
						}
						String signature=SignUtil.getPublicResultSign(notityMap);
						
						if(signature.equals(sign)){//用返回的结果，去掉sign,然后签名，比较验证合法性
							System.out.println("签名成功");
							notityMap.put("sign", sign);
							PaymentCallbackUtils.noticeSuccess(logPayment.getCallbackTask(), 
									out_trade_no, logPayment.getOrderId(),notityMap);
						}else{
							System.out.println("签名失败");
							notityMap.put("sign", sign);
							PaymentCallbackUtils.noticeError(logPayment.getCallbackTask(), 
									out_trade_no, logPayment.getOrderId(),notityMap);
						}
					}
				}
			}
			//告诉微信，不要再发了
			response.getWriter().write(createResult(""));
		} catch (Exception e) {
			e.printStackTrace();
			//response.getWriter().write("fail");
		}
		
	}
	
	private String createResult(String error){
		String xml = 
		"<xml>"+
		   "<return_code>SUCCESS</return_code>"+
		   "<return_msg></return_msg>"+
		"</xml> ";
		return xml;
	}
	
	@Autowired
	private LogPaymentService logPaymentService;
	
	
}
