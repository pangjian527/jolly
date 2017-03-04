package com.web.mmall.order.action;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pub.functions.JsonFuncs;
import pub.functions.XmlFuncs;
import pub.types.Pair;

import com.sys.data.book.OrderData;
import com.sys.data.cart.CartData;
import com.sys.data.pay.PayInfo;
import com.sys.entity.Bookform;
import com.sys.entity.Factory;
import com.sys.entity.FactoryUser;
import com.sys.entity.LogPayment;
import com.sys.service.AreaService;
import com.sys.service.BookformService;
import com.sys.service.CartService;
import com.sys.service.ExpressFeeService;
import com.sys.service.FactoryService;
import com.sys.service.LogPaymentService;
import com.sys.service.ProductService;
import com.sys.service.ScoreService;
import com.web.mmall.MMallActon;
import com.web.mmall.consts.Consts;
import com.web.mmall.entity.OrderEntity;
import com.wxpay.config.WXPayConfig;
import com.wxpay.util.HttpClientUtil;
import com.wxpay.util.SignUtil;
import com.wxpay.util.WXConfigUtil;

@Controller
public class OrderAction extends MMallActon{

	/*public static JSONArray cartDatas = null;
	static{
		JSONObject object = new JSONObject();
		object.element("productId", "4028ad815a4f0157015a4f42f1060019").element("count", 2);
		JSONObject object1 = new JSONObject();
		object1.element("productId", "4028ad815a4ff856015a5001111e000b").element("count", 2);
		cartDatas = new JSONArray();
		cartDatas.add(object);
		cartDatas.add(object1);
	}*/
	
	/*下单加载页面*/
	@RequestMapping
	public String execute(HttpServletRequest request,HttpServletResponse response){
		//1. 获取到商家
		FactoryUser factoryUser = this.getUser();
		Factory factory = factoryService.get(factoryUser.getFactoryId());
		
		String items = this.getParam("cartItems");
		//2. 获取到商品
		CartData cartData = cartService.getCartData(items);
		
		//3.获取积分
		double totalScore = scoreService.getFactoryHistoryScore(factory.getId());
		double consumeScore = scoreService.getFactoryConsumeScore(factory.getId());
		
		//4. 省市区
		
		//5. 邮费
		double deliveryCost = expressFeeService.getDeliveryCost(cartData.getAllTotal());
		
		request.setAttribute("cartData", cartData);
		request.setAttribute("factory",factory);
		request.setAttribute("score", totalScore - consumeScore);
		request.setAttribute("items",items);
		request.setAttribute("deliveryCost",deliveryCost);
		
		request.setAttribute("appId", WXPayConfig.PUBLIC_APP_ID);
		request.setAttribute("oauthUrl", WXPayConfig.OAUTH2_URL);
		return "/mmall/order/submit";
	}
	
	//订单提交
	@RequestMapping
	public void submit(HttpServletRequest request,HttpServletResponse response){
		
		Object object = request.getSession().getAttribute(Consts.FACTORY_USER_SESSION_KEY);
		String man = request.getParameter("man");
		String mobile = request.getParameter("mobile");
		String provinceId = request.getParameter("provinceId");
		String cityId = request.getParameter("cityId");
		String countyId = request.getParameter("countyId");
		String addr = request.getParameter("addr");
		int payType = Integer.valueOf(request.getParameter("payType"));
		String cartDatas = request.getParameter("cartDatas");
		
		JSONObject resultObj = new JSONObject();
		if(object == null){
			resultObj.element("code", "loginerr").element("content","未登录，请先登录");
			this.writeJson(resultObj);
			return ;
		}
		//2. 获取到商品
		CartData cartData = cartService.getCartData(cartDatas);
		
		FactoryUser factoryUser = (FactoryUser) object;
		OrderEntity entity = new OrderEntity(man,mobile,provinceId,cityId,countyId,payType,addr);
		//3. 提交订单
		String bookformId = "";
		try {
			bookformId = bookformService.submitBookform(cartData, factoryUser, entity);
		} catch (Exception e) {
			resultObj.element("code", "dataerr").element("content",e.getMessage());
			this.writeJson(resultObj);
			return ;
		}
		
		resultObj.element("code", "success").element("bookformId", bookformId);
		this.writeJson(resultObj);
	}
	
	/*立即付款*/
	@RequestMapping
	public String pay(HttpServletRequest request,HttpServletResponse response,String bookformId){
		
		Bookform bookform = bookformService.get(bookformId);
		
		request.setAttribute("bookform", bookform);
		
		WXConfigUtil.createWXConfigParam(request);//参数初始化
		return "/mmall/order/pay";
	}
	
	/*
	 * @功能说明：微信付款之前创建logPayment记录
	 * 
	 */
	@RequestMapping
	public void preparePay(HttpServletRequest request, HttpServletResponse response) throws Exception{		
		try {		
			String orderId = request.getParameter("orderId");
			PayInfo payInfo = bookformService.getPayInfo(orderId);
			LogPayment logPayment = logPaymentService.createAndSave(payInfo.amount, payInfo.payChanel, 
				null, payInfo.task, payInfo.orderId);
			
			JSONObject object=new JSONObject();
			//调用微信统一支付接口
			
			
			//下面就到了获取openid,这个代表用户id.
			//获取openID
			String openid =request.getParameter("openId");
			String noncestr = SignUtil.getRandomStringByLength(32);//生成随机字符串
			String timestamp = String.valueOf((System.currentTimeMillis()/1000));//生成1970年到现在的秒数.
			
			Map<String,Object> parameters=new HashMap<String, Object>();
			parameters.put("appid", WXPayConfig.PUBLIC_APP_ID);
			parameters.put("mch_id", WXPayConfig.PUBLIC_MCH_ID);
			parameters.put("nonce_str", noncestr);
			parameters.put("body", payInfo.title);
			parameters.put("out_trade_no", logPayment.getId());
			String total_fee=String.valueOf(payInfo.amount*100);
			//parameters.put("total_fee", total_fee.substring(0, total_fee.indexOf(".")));
			parameters.put("total_fee", 1);
			parameters.put("spbill_create_ip",request.getRemoteAddr());
			parameters.put("notify_url", WXPayConfig.NOTIFY_URL);
			parameters.put("trade_type", "JSAPI");
			parameters.put("openid", openid);
			String sign = SignUtil.getPublicSign(parameters);
			parameters.put("sign", sign);
			
			String result=HttpClientUtil.httpsRequest(WXPayConfig.WX_PREPAY_URL, "POST", SignUtil.mapToXML(parameters));
			
			Map<String, String> resultMap = XmlFuncs.xml2map(result);
			//得到的预支付id
			String prepay_id = resultMap.get("prepay_id");
			
			Map<String,Object> payParams = new HashMap<String,Object>();
			payParams.put("appId", WXPayConfig.PUBLIC_APP_ID);
			payParams.put("timeStamp",timestamp);
			payParams.put("nonceStr", noncestr);
			payParams.put("package", "prepay_id="+prepay_id);
			payParams.put("signType", "MD5");
			//生成支付签名,这个签名 给 微信支付的调用使用
			String paySign =  SignUtil.getPublicSign(payParams); 
			
			object.element("timeStamp", timestamp);        //时间戳
			object.element("nonceStr", noncestr);            //随机字符串
			object.element("signType", "MD5");        //加密格式
			object.put("packageValue", "prepay_id="+prepay_id);//这里用packageValue是预防package是关键字在js获取值出错
			object.element("paySign", paySign); 
			
			
			this.writeJson(object);
		} 
		catch (Exception e) {
			//4.如果支付请求被拒绝，显示具体原因
			e.printStackTrace();
			this.writeErrorJson( e.getMessage());
		}
	}
	
	/*订单列表*/
	@RequestMapping
	public String list(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		FactoryUser user = this.getUser();
		String status = request.getParameter("status");
		String pn =  request.getParameter("pn");
		int pageNo  = pn ==null ? 1:Integer.valueOf(pn); 
		
		//1. 返回列表和总页数
		Pair<List<OrderData>, Integer> pair =queryOrder(request,status,pageNo,user);
		request.setAttribute("pair", pair);
		request.setAttribute("status", status);
		
		WXConfigUtil.createWXConfigParam(request);//参数初始化
		request.setAttribute("oauthUrl", WXPayConfig.OAUTH2_URL);
		
		return "/mmall/order/list";
	}
	
	private Pair<List<OrderData>, Integer> queryOrder(HttpServletRequest request,String status,int pageNo,FactoryUser user) throws Exception{
		String[] statusList =null ;
		if(status!=null &&status.equals("uncomplete")){
			statusList  = "0,1,2,3".split(",");
		}else if (status!=null && status.equals("complete")){
			statusList = new String[]{"4"};
		}
		//1. 返回列表和总页数
		Pair<List<OrderData>, Integer> pair = bookformService.getBookformByFactory(user.getFactoryId(), statusList, pageNo);
		return pair;
	}
	
	/* 异步加载列表 */
	@RequestMapping
	public void listAsync(HttpServletRequest request,HttpServletResponse response) throws Exception{
		FactoryUser user = this.getUser();
		String status = request.getParameter("status");
		String pn =  request.getParameter("pn");
		int pageNo  = pn ==null ? 1:Integer.valueOf(pn); 
		
		//1. 返回列表和总页数
		Pair<List<OrderData>, Integer> pair =queryOrder(request,status,pageNo,user);
		
		this.writeJson(JsonFuncs.toJsonObject(pair));
	}
	
	/*订单详情*/
	@RequestMapping
	public String detail(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String bookId = request.getParameter("bookId");
		OrderData orderData = bookformService.getOrderDataByBookId(bookId);
		
		request.setAttribute("orderData", orderData);
		
		WXConfigUtil.createWXConfigParam(request);//参数初始化
		request.setAttribute("oauthUrl", WXPayConfig.OAUTH2_URL);
		return "/mmall/order/detail";
	}
	
	@Autowired
	private FactoryService factoryService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ScoreService scoreService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private BookformService bookformService;
	@Autowired
	private CartService cartService;
	@Autowired
	private LogPaymentService logPaymentService;
	@Autowired
	private ExpressFeeService expressFeeService;
}
