package com.web.utils;



public class SessionDataUtil {
	
	public static String cityName = "广州市";
	public static String cityId = "2251";
	
/*	//获取用户选择的区域
	public static String getDefaultProviceId(){
		HttpSession session = ServletUtils.getSession();
		String defaultProvinceId = (String) session.getAttribute(SessionConsts.PMALL_DEFAULT_PROVINCE_ID);
		if(defaultProvinceId==null){
			defaultProvinceId = CookieUtil.getCookie(CookieUtil.HTW_COOKIE_PROVINCE_ID);
			if(defaultProvinceId==null){
				defaultProvinceId = "2250";//广东省
			}else{
				session.setAttribute(SessionConsts.PMALL_DEFAULT_PROVINCE_ID, defaultProvinceId);
			}
		}
		return defaultProvinceId;
	}*/
	
/*	public static void setDefaultProviceId(String defaultProviceId){
		HttpSession session = ServletUtils.getSession();
		session.setAttribute(SessionConsts.PMALL_DEFAULT_PROVINCE_ID, defaultProviceId);
		CookieUtil.setToCookie(CookieUtil.HTW_COOKIE_PROVINCE_ID, defaultProviceId);
	}*/
	
/*	public static String getDefaultCityId(){
		HttpSession session = ServletUtils.getSession();
		String defaultCityId = (String) session.getAttribute(SessionConsts.PMALL_DEFAULT_CITY_ID);
		if(defaultCityId==null){
			defaultCityId = CookieUtil.getCookie(CookieUtil.HTW_COOKIE_CITY_ID);
			if(defaultCityId==null){
				defaultCityId = cityId;//广州市
			}else{
				session.setAttribute(SessionConsts.PMALL_DEFAULT_CITY_ID, defaultCityId);
				IdText aIdText = JsonConfigUtils.getByCityId(defaultCityId);
				if(aIdText!=null){
					cityName = aIdText.getText();
				}
			}
		}
		return defaultCityId;
	}*/
	
/*	public static void setDefaultCityId(String defaultCityId){
		HttpSession session = ServletUtils.getSession();
		session.setAttribute(SessionConsts.PMALL_DEFAULT_CITY_ID, defaultCityId);
		CookieUtil.setToCookie(CookieUtil.HTW_COOKIE_CITY_ID, defaultCityId);
	}*/
	//检查有没有set过defaultCityId，也就是检查session中有没有defaultCityId
/*	public static boolean checkDefaultCityId(){
		HttpSession session = ServletUtils.getSession();
		String defaultCityId = (String) session.getAttribute(SessionConsts.PMALL_DEFAULT_CITY_ID);
		if(defaultCityId==null){
			defaultCityId = CookieUtil.getCookie(CookieUtil.HTW_COOKIE_CITY_ID);
		}
		return defaultCityId!=null;
	}*/
	
/*	public static CartData getCartData(){
		HttpSession session = ServletUtils.getSession();
		CartData cartData = (CartData) session.getAttribute(SessionConsts.PMALL_CART_SESSION_DATA);
		if(cartData == null){
			cartData = new CartData();
			setCartData(cartData);
		}
		return cartData;
	}*/
	
/*	public static void setCartData(CartData cartData){
		HttpSession session = ServletUtils.getSession();
		session.setAttribute(SessionConsts.PMALL_CART_SESSION_DATA, cartData);
	}*/
	
/*	public static void removeCartData(){
		HttpSession session = ServletUtils.getSession();
		session.removeAttribute(SessionConsts.PMALL_CART_SESSION_DATA);
	}
	
	public static Customer getCustomer(){
		HttpSession session = ServletUtils.getSession();
		return (Customer) session.getAttribute(SessionConsts.PMALL_CUSTOMER_SESSION_DATA);
	}*/
	//登录成功，设置session
/*	public static void setCustomer(Customer customer){
		HttpSession session = ServletUtils.getSession();
		session.setAttribute(SessionConsts.PMALL_CUSTOMER_SESSION_DATA, customer);
		
		CookieUtil.setCookie(CookieUtil.HTW_COOKIE_CUSTOMER_ID, customer.getId());
		CookieUtil.removeCookie(CookieUtil.HTW_COOKIE_CART_ID);//去掉cookie中的购物车信息
		
	}*/
	
/*	public static void removeCustomer(){
		CookieUtil.removeCookie(CookieUtil.HTW_COOKIE_CUSTOMER_ID);
		HttpSession session = ServletUtils.getSession();
		session.removeAttribute(SessionConsts.PMALL_CUSTOMER_SESSION_DATA);
		session.removeAttribute(SessionConsts.PMALL_CART_SESSION_DATA);
	}*/
	
	//判断客户是否已经登录  true:已经登录   false: 没有登录
/*	public static boolean isCustomerLogin(){
		return getCustomer()!=null;
	}
	*/
/*	public static String getCustomerId(){
		Customer customer = getCustomer();
		return customer == null ? null : customer.getId();
	}*/
	
/*	//手机验证码的
	public static String getTelCode(){
		HttpSession session = ServletUtils.getSession();
		return (String) session.getAttribute(SessionConsts.PMALL_TEL_CHECKCODE);
	}*/
	
/*	public static void setTelCode(String telcode){
		HttpSession session = ServletUtils.getSession();
		session.setAttribute(SessionConsts.PMALL_TEL_CHECKCODE, telcode);
	}*/
	
/*	public static void removeTelCode(){
		HttpSession session = ServletUtils.getSession();
		session.removeAttribute(SessionConsts.PMALL_TEL_CHECKCODE);
	}*/
	
	//最近浏览的轮胎
	/*public static List<String> getLuntais(){
		HttpSession session = ServletUtils.getSession();
		List<String> ids = (List<String>) session.getAttribute(SessionConsts.LAST_LUNTAIS);
		if(ids==null){
			ids = new ArrayList<String>();
			session.setAttribute(SessionConsts.LAST_LUNTAIS, ids);
		}
		return ids;
	}
	
	public static void setLuntais(String id){
		HttpSession session = ServletUtils.getSession();
		List<String> ids = getLuntais();
		boolean isexist = false;
		for(String str : ids){
			if(str.equals(id)){
				isexist = true;
				break;
			}
		}
		if(!isexist){
			ids.add(0,id);
		}
		if(ids.size()>5){
			ids.remove(5);
		}
		session.setAttribute(SessionConsts.LAST_LUNTAIS, ids);
	}
	
	//最近浏览的服务
	public static List<String> getCares(){
		HttpSession session = ServletUtils.getSession();
		List<String> ids = (List<String>) session.getAttribute(SessionConsts.LAST_CARES);
		if(ids==null){
			ids = new ArrayList<String>();
			session.setAttribute(SessionConsts.LAST_CARES, ids);
		}
		return ids;
	}
	
	public static void setCares(String id){
		HttpSession session = ServletUtils.getSession();
		List<String> ids = getCares();
		boolean isexist = false;
		for(String str : ids){
			if(str.equals(id)){
				isexist = true;
				break;
			}
		}
		if(!isexist){
			ids.add(0,id);
		}
		if(ids.size()>5){
			ids.remove(5);
		}
		session.setAttribute(SessionConsts.LAST_CARES, ids);
	}
	
	//最近浏览的店铺
	public static List<String> getShops(){
		HttpSession session = ServletUtils.getSession();
		List<String> ids = (List<String>) session.getAttribute(SessionConsts.LAST_SHOPS);
		if(ids==null){
			ids = new ArrayList<String>();
			session.setAttribute(SessionConsts.LAST_SHOPS, ids);
		}
		return ids;
	}
	
	public static void setShops(String id){
		HttpSession session = ServletUtils.getSession();
		List<String> ids = getShops();
		boolean isexist = false;
		for(String str : ids){
			if(str.equals(id)){
				isexist = true;
				break;
			}
		}
		if(!isexist){
			ids.add(0,id);
		}
		if(ids.size()>5){
			ids.remove(5);
		}
		session.setAttribute(SessionConsts.LAST_SHOPS, ids);
	}*/

}
