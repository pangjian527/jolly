package com.web.pmanager;

import pub.functions.StrFuncs;

public abstract class PMallAction extends com.web.common.action.BaseAction{
	private static final String HTW_ACCOUNT = "acc";
	private static final String HTW_CITY = "city";
	private static final String HTW_CART = "cart";
	
	protected void clearCartData(){
		//1.清除Session中的CartData
		this.removeSession(HTW_CART);
				
		//2.清除cookie
		
		
		this.removeCookie(HTW_CART);
	}
	
	private static String[] decodeCookieStr(String text, int paraCount){
		//1.处理head
		String[] paras = new String[paraCount];
		int[] paraLens = new int[paraCount];
		int minLen = 100;//设定一个不可能的大数字
		for(int i = 0; i < paraCount; i++){
			String subStr = text.substring(i * 2, i * 2 + 2);
			paraLens[i] = Integer.valueOf(subStr);
			minLen = Math.min(minLen, paraLens[i]);
		}
		
		int tailIndex = paraCount * minLen + paraCount * 2;
		for(int i = 0; i < paraCount; i++){
			//2.解析 body
			char[] chars = new char[minLen];
			for(int j = 0; j < minLen; j++){
				chars[j] = text.charAt(2 * paraCount + paraCount * j + i);
			}
			paras[i] = String.valueOf(chars);
			
			//3.解析tail
			int paraLen = paraLens[i];
			if(paraLen > minLen){
				int nextTailIndex = tailIndex + paraLen - minLen;
				paras[i] += text.substring(tailIndex, nextTailIndex);
				tailIndex = nextTailIndex;
			}
		}
		//4.返回
		return paras;
	}
	
	protected void clearCustomer(){
		//1.读取商城用户的Session，如果已经缓存了，返回
		this.removeSession(HTW_ACCOUNT);
			
		//2.cookie
		this.removeCookie(HTW_ACCOUNT);
	}
	private static String encodeCookieStr(String... paras){
		//1.遍历 paras数组，计算所有字符串的长度总和、最短长度
		int paraCount = paras.length;
		int totalLen = paras[0].length();
		int minLen = paras[0].length();
		for(int i = 1; i < paraCount; i++){
			int len = paras[i].length();
			totalLen += len;
			minLen = Math.min(minLen, len);
		}
		//2.
		char[] bodyChars = new char[paraCount * minLen];//主题，采用paras混合编制
		StringBuffer head = new StringBuffer();//头部，存储各个变量的长度
		StringBuffer tail = new StringBuffer();//尾部，存储各个各个变量超出minLen的尾部
		
		for(int i = 0; i < paraCount; i++){
			String para = paras[i];
			//a.计算para的长度字符串，2位数字
			String lenText = String.valueOf(para.length());
			if(lenText.length() == 1){
				lenText = "0" + lenText;
			}
			head.append(lenText);
			
			//b.将para中不超过minLen范围的chars，分散写 到bodyChars中去
			for(int j = 0; j < minLen; j++){
				bodyChars[paraCount * j + i] = para.charAt(j);
			}
			//c.计算尾部
			tail.append(para.substring(minLen));
		}
		
		
		return head.append(bodyChars).append(tail).toString();
	}
	
	/**
	 * 自动获取车主在哪个分站，根据session/cookie/ip等多种途径获取
	 * @return
	 */
	protected String getCityId(){
		//1.检查session里面有没有
		String cityId = (String)this.getSession(HTW_CITY);
		if(cityId != null){
			return cityId;
		}
		
		//2.检查cookie里面有没有
		cityId = this.getCookie(HTW_CITY);
		if(StrFuncs.notEmpty(cityId)){
			return cityId;
		}
		
		//3.根据ip智能判断（预留）
		String ip = this.getIp();
		if(StrFuncs.notEmpty(ip)){
			//a.调用baidu/ali/tencent等网站的api，获取ip所在的城市
			//注意：一定要通过多线程发起htpp请求，再通过while轮询检测返回值(不超过1秒)，超时就退出；如果采用单线程，万一对方挂了，我们也就跟着挂了
			
		}
		
		//4.实在没办法了，就强制定位到广州吧
		return "2251";
	}
	
	protected void setCity(String id){
		this.setSession(HTW_CITY, id);
		this.setCookie(HTW_CITY, id);
	}
	
	protected String[] getRecentTyres(){
		return this.getSession("RECENT_TYRES", "").toString().split(",");
	}
	
	protected String[] getRecentServices(){
		return this.getSession("RECENT_SERVICES", "").toString().split(",");
	}
	
	protected String[] getRecentShops(){
		return this.getSession("RECENT_SHOPS", "").toString().split(",");
	}
	
	private String[] addRecentId(String id, String key){
		String value = this.getSession(key, "").toString();
		if(StrFuncs.isEmpty(value)){
			value = id;
		}
		else{
			value += "," + id;
		}
		this.setSession(key, value);
		return value.split(",");
	}
	
	protected String[] addRecentTyre(String id){
		return addRecentId(id, "RECENT_TYRES");
	}
	
	protected String[] addRecentService(String id){
		return addRecentId(id, "RECENT_SERVICES");
	}
	
	protected String[] addRentShop(String id){
		return addRecentId(id, "RECENT_SHOPS");
	}
	
}
