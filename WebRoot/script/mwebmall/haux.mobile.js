/***********************************************************************************************
	Part 0 —— 定义huax js扩展库名字空间，创建通用的haux基础方法
***********************************************************************************************/
if(!window.haux){
	//0.1 基本的js语法补充代码，涉及对象、数组、字符串、信数传输等
	haux = {};
	
	//0.2 window、nagigator、screen、histroy、lication等浏览器框架相关js代码
	haux.bom = {};
	
	//0.3 dom相关代码，主要是针对document内的元素扩展的代码
	haux.dom = {};
	
	//0.4 定义系统自定义的前端组件，如itree、imenu等
	haux.ui = {};
	
	//0.5 页面位置相关的功能，包括导航、获取页面参数等
	haux.location = {};
}

haux.isDebug = function(){
	var ua = navigator.userAgent;
	return ua.indexOf("Chrome") > -1 && !(ua.indexOf('Android') > -1 || ua.indexOf('Linux') > -1)
}

function home() {
	return "/jolly";
	/*
	var _home;
	var win = window;
	while (!_home && win) {
		_home = win._home || win.top._home;
		win = win.opener;_home="/htw";
	}
	return _home;*/
}

/*
 * @版本信息：2015-3-19 myq 重构，抛弃jquery的ajax + jsonP方式，改用自身处理
 * @功能说明：统一的请求服务器数据的方法
 * @参数说明：
 * 		dataObj.data: json格式传参数
 * 		dataObj.url: 请求路径
 */
haux._callbackMethodIndex = 0;
haux.getData = function(config){
	//0.展示进度条
	if(config.showProgress){
		haux.showLoading();
	}
	
	$.ajax({url:config.url,
		data:config.data,
		type:"post",
		success:function(data){
			haux.clearLoading();
			data=JSON.parse(data);
			if(config.success){
				config.success(data);
			}
		}
	});
}

function _addUrlPara(src, key, value){
	if(!key || value === null){
		return src;
	}
	if(src.indexOf("?") >= 0){
		src += "&" + key + "=" + encodeURIComponent(value);
	}
	else{
		src += "?" + key + "=" + encodeURIComponent(value);
	}
	return src;
}

haux.log = function(text){
	console.log(text);
}

haux.createElement = function(tagName, attributeObj){
	var targetElement;
	var targetElement = document.createElement(tagName);
	if(attributeObj){
		for(property in attributeObj){
			var proValue = attributeObj[property];
			if(proValue == null || proValue == undefined)
				continue;
			if(property == "innerHTML")
				targetElement.innerHTML = proValue;
			else if(property == "className")
				targetElement.className = proValue;
			else
				targetElement.setAttribute(property, proValue);
		}
	}
	return targetElement;
}



/* 开始定义haux.location */
// 获取页面url内get方式传递的参数
haux.location.getPara = function(name){
	var url = window.location.href;
	var index = url.indexOf("?");
	if(!index){
		return null;
	}
	
	var params = url.substr(index + 1).split("&");
	for(var i= 0; i < params.length; i++){
		var pairs = params[i].split("=");
		if(pairs.length == 2 && pairs[0] == name){
			return decodeURIComponent(pairs[1]);
		}
	}
	return null;
}

// 封装页面跳转逻辑，统一取代现有的window.location = XXXX 的写法
haux.location.forward = function(pageLocation, paras){
	//0.拼接地址
	var url = home() + pageLocation;
	for(var name in paras){
		var value = paras[name];
		if(value instanceof Array ){
			for(var i = 0; i < value.length; i++){
				url = _addUrlPara(url, name, value[i]);	
			}
		}
		else{
			url = _addUrlPara(url, name, value);	
		}
	}
	//1.
	window.location = url;
}
//响应android手机的返回按钮
haux.location._backActionChain = [];
haux.location.regBackAction = function(){

}
haux.location.back = function(){

}


/*
	版本信息：2014-5-26 pj add 
	功能说明：用于获取静态页面你之间URL传递的参数
*/
function ReqFuncs(name){

	var url=window.location.href;
	
	var queryString=url.substr(url.indexOf("?")+1);
	
	var params=queryString.split("&");
	
	for(var i=0;i<params.length;i++){
		
		var paramItem=params[i].split("=");
		if(paramItem[0]==name){
			return decodeURIComponent(paramItem[1]);
		}
	}
	return null;
}

/*
版本信息：2014-5-26 pj add 
功能说明：返回事件
*/
function back(url){
	if(url){
		window.location=url
	}else{
		window.history.back();
	}
}


/*
 * 版本信息：2014-11-6 pj add
 * 
 * 功能说明：模仿android的 toast
 * 
 * 参数说明：context：显示的内容，time消失的时间，单位是秒
 */
haux.showToast = function(context, time, callbackFunc){
	time = time || 1;
	var toastElement=document.createElement("div");
	toastElement.className="toast";
	toastElement.id="toastElemnt";
	
	var labelElement=document.createElement("label");
	
	labelElement.innerHTML=context;
	toastElement.appendChild(labelElement);
	document.body.appendChild(toastElement);
	
	setTimeout(function (){
		var step = 20;//渐变消失动画分为20帧
		var interval = 1 * 1000 / step;//1秒完成渐变
		var opacity = 1;
		//启动渐变动画
		setTimeout(function(){
			opacity -= 1 / step;
			if(opacity > 0){
				toastElement.style.opacity = opacity;
				setTimeout(arguments.callee, interval);
			}
			else{
				document.body.removeChild(toastElement);
				if(callbackFunc){
					callbackFunc();
				}
			}
		
		}, interval);
	}, time*1000);
}

/*
 * 版本信息：2014-11-9 pj add
 * 
 * 功能说明：用户登录后将用户信息存到本地存储
 * 
 * 参数说明：
 */
function setSession(obj){
	window.localStorage.setItem("USER_KEY",obj);
}
/*
 * 版本信息：2014-11-9 pj add
 * 
 * 功能说明：返回用户的
 * 
 * 参数说明：
 */
function getSessionUser(){
	var customer=window.localStorage.getItem("USER_KEY");
	
	if(customer==null)
		return null;
	
	var cusObj=JSON.parse(customer);
	
	return cusObj;
}
/*
 * @版本信息：2014-11-4 pj
 * 
 * @功能说明：判断用户是否登录
 */
function isLogin(){
	return window.localStorage.getItem("USER_KEY")==null?false:true;
}

/*
	版本信息：2014-11-25 pj add 
	功能说明：设置城市
*/
function setCity(code,name){
	window.localStorage.setItem("cityCode", code);
	window.localStorage.setItem("cityName", name);
}

/*
	版本信息：2014-11-25 pj add 
	功能说明：获取城市编码
*/
function getCityCode(){
	var code=window.localStorage.getItem("cityCode");
	return code == null ? "2251":code;
}
/*
	版本信息：2014-11-25 pj add 
	功能说明：获取城市名称
*/
function getCityName(){
	var name=window.localStorage.getItem("cityName");
	return name==null?"广州市":name;
}


/*
 * @版本信息：2014-11-11 pj
 * 
 * @功能说明：显示加载层
 */
function showLoading(){
	var divElement=document.createElement("div");
	divElement.className="loading";
	divElement.id="loading";
	divElement.onclick=function(){
		clearLoading();
	}
	
	var shieldElement=document.createElement("div");
	shieldElement.className="shield";
	
	var imgElement=document.createElement("img");
	imgElement.className="loadimg";
	imgElement.src="file:///android_asset/www/images/5-121204193948.gif";
	
	divElement.appendChild(shieldElement);
	divElement.appendChild(imgElement);
	
	document.body.appendChild(divElement);
}
/*
 * @版本信息：2014-11-11 pj
 * 
 * @功能说明：移除加载层
 */
function clearLoading(){
	if(document.getElementById("loading")){
		document.body.removeChild(document.getElementById("loading"));
	}
}

/*
 * @版本信息：2014-11-11 pj
 * 
 * @功能说明：显示加载层
 */
haux.showLoading = function(){
	//0.预处理
	
	//1.生成半透明层
	var divElement = haux.createShadowBox();
	
	//2.生成显示内容
	divElement = document.createElement("div");
	divElement.id="progress-box";
	divElement.innerHTML = "<i></i><p>正在加载数据</p>";
	document.body.appendChild(divElement);
	
	//后续考虑转变成响应手机的返回按钮
	divElement.addEventListener("onclick", haux.clearLoading, false); 
}

/*
 * @版本信息：2014-11-11 pj
 * 
 * @功能说明：移除加载层
 */
haux.clearLoading = function(){
	haux.clearShadowBox();
	
	var divElement = document.getElementById("progress-box");
	if(divElement){
		document.body.removeChild(divElement);
	}
}
//增加一个半透明的层，覆盖整个页面（header和footer不覆盖）
haux.createShadowBox = function(config){
	//1.只能出现一个
	if(document.getElementById("shadow-box")){
		return;
	}
	//2.创建
	var divElement=document.createElement("div");
	divElement.id="shadow-box";
	if(config){
		if(config.opacity){
			divElement.style.opacity = config.opacity;
		}
		if(config.zIndex){
			divElement.style.zIndex = config.zIndex;
		}
	}
	
	//3.显示
	document.body.appendChild(divElement);
	return divElement;
}

haux.clearShadowBox = function(config){
	var divElement = document.getElementById("shadow-box")
	//1.只能出现一个
	if(divElement && divElement.parentNode){
		divElement.parentNode.removeChild(divElement);
	}
}
/*
 * @版本信息：2014-11-11 pj
 * 
 * @功能说明：清除浮动
 */
function createClearElement(){
	var clearElement=document.createElement("div");
	clearElement.style.clear="both";
	return clearElement;
}
/*
 * @版本信息：2014-11-12 pj
 * 
 * @功能说明：提示无数据
 */
function showNotDataPrompt(targetElement,title){
	var promptElement=document.createElement("div");
	promptElement.className="not-data-prompt";
	
	var labelElement=document.createElement("label");
	labelElement.innerHTML=title?title:"没有更多的商品";
	
	promptElement.appendChild(labelElement);
	targetElement.appendChild(promptElement);
}

/*
 * @版本信息：2014-11-12 pj
 * 
 * @功能说明：关闭窗体
 */
function closeWindow(data){
	var funcName=ReqFuncs("funcName");
	if(funcName!="undefined")
		window.parent[funcName](data);
	window.parent.document.body.removeChild(window.parent.document.getElementById("iframe"));
}
/*
 * @版本信息：2014-11-12 pj
 * 
 * @功能说明：打开窗体
 */
function openWindow(url,funcName){
	var iframe=document.createElement("iframe");
	iframe.id="iframe";
	iframe.src=url+"?funcName="+funcName;
	document.body.appendChild(iframe);
}
/*
 * @版本信息：2014-11-12 pj
 * 
 * @功能说明：显示屏蔽层
 */
function showShieldLayer(){
	var layer=document.createElement("div");
	layer.id="shield-layer";
	layer.className="shield-layer";
	document.body.appendChild(layer);
}
/*
 * @版本信息：2014-11-12 pj
 * 
 * @功能说明：显示屏蔽层
 */
function closeShieldLayer(){
	document.body.removeChild(document.getElementById("shield-layer"));
}

/*
 * @版本信息：2014-11-12 pj,myq 3-19重构
 * 
 * @功能说明：通过gps、wifi、3g获取到当前的地址信息
 */
 

haux.getCurrentLocation = function(success, error){
	if(haux.isDebug()){
		var virtualLocation = {coords:{longitude:"113.329188", latitude:"23.139042"}};//模拟广州
		//var virtualLocation = {coords:{longitude:"104.065048", latitude:"30.668513"}};//模拟成都
		success(virtualLocation);
	}
	else{
		window.locationService.getCurrentPosition(success, error);
	}
}
/*
 * @版本信息：2015-02-04 pj
 * 
 * @功能说明：清除全局变量标识
 */
function clearCitySwitch(){
	window.localStorage.removeItem("citySwitch");
}
/*
 * @版本信息：2015-02-04 pj
 * 
 * @功能说明：是否需要提示切换城市
 */
function isPromptSwitchCity(){
	var isPrompt=window.localStorage.getItem("citySwitch");
	if(isPrompt=="true")
		return false;
	else
		return true;
}
/*
 * @版本信息：2015-02-04 pj
 * 
 * @功能说明：是否需要提示切换城市
 */
function setSwitchCity(){
	window.localStorage.setItem("citySwitch","true");
}

/*由于在系统上面用的是符文本编辑器记录的路径是相对路径，所以需要重新构建路径*/
function setImageSrc(targetId){
	var imgElements=document.getElementById(targetId).getElementsByTagName("img");
	for(var i=0;i<imgElements.length;i++){
		var homeIndex=imgElements[i].src.indexOf("/htw/");
		if(homeIndex>0){
			//imgElements[i].src=servicePath()+imgElements[i].src.substring(homeIndex+5);
			imgElements[i].removeAttribute("width");
			imgElements[i].removeAttribute("height");
			imgElements[i].style.width="100%";
		}
	}
}
/*单位转换*/
function unitConversion(distance){
	if(distance>100){
		return (distance/1000).toFixed(2)+"km";
	}
	return distance.toFixed(2)+"m";
}
/*判断当前页面是否首页*/
function isIndexPage(){
	var url=window.location.href;
	
	var currentPage=url.substring(url.lastIndexOf('/')+1);
	
	if(currentPage=="index.html"){
		return true;
	}
	return false;
}

/**
 * 扩展js默认类
 */
Element.prototype.appendClearDiv = function(){
	var clearElement = document.createElement("div");
	clearElement.style.cssText = "clear:both;display:block;margin:0;padding:0;float:none";
	this.appendChild(clearElement);
}

haux.getGpsLocation=function(callback,errorCallBack,config){
     
	if(config!=null&&config.showProgress==true){
		haux.showLoading();
	}
	
     if(BMap==null){
    	 _getBrowserGps(callback,errorCallBack,config);
     }else{
    	 _getBMapGps(callback,errorCallBack,config);
     }
 }

/*
	@功能说明：百度地图获取网络gps
*/
function _getBMapGps(callback,errorCallBack,config){
	var geolocation = new BMap.Geolocation();  
	geolocation.getCurrentPosition(function(r){   
	    if(this.getStatus() == 0){
	    	callback(r.point.lng,r.point.lat);
	    }
	    else {
	       errorCallBack();
	    }     
	    haux.clearLoading();
	},{enableHighAccuracy: true});
}

/*
	@功能说明：根据HTML5获取到gps
*/
function _getBrowserGps(callback,errorCallBack,config){
	var options={
         enableHighAccuracy:true, 
         maximumAge:1000
     }
	
     navigator.geolocation.getCurrentPosition(function(position){
    	 //经度
         var longitude =position.coords.longitude;
         //纬度
         var latitude = position.coords.latitude;
         
    	 callback(longitude,latitude);
    	 
    	 //清除屏蔽层
    	 haux.clearLoading();
     },function(error){
    	 // 回调失败函数
    	 errorCallBack();
    	 
    	 //清除屏蔽层
    	 haux.clearLoading();
    	 switch(error.code){
	         case 1:
	        	  haux.showToast("位置服务被拒绝");
	         break;
	         case 2:
	        	   haux.showToast("暂时获取不到位置信息");
	         break;
	         case 3:
	        	  haux.showToast("获取信息超时");
	         break;
	         case 4:
	        	  haux.showToast("获取定位失败，获取位置超时");
	         break;
	     }
     },options);
}
/**页面加载完成后，默认执行的函数**/
window.addEventListener("load", function(){
	//pc端chrome或safari调试
	if(typeof(initBody) != "undefined"){
		initBody();
	}
}, false);

/* 创建 页面底部的广告，比如说引导下载app */
function createFooterBanner(){
	var footerElement=document.createElement("div");
	footerElement.className="footer-apk-banner";
	
	var closeElement=document.createElement("i");
	closeElement.className="close";
	closeElement.innerHTML="x";
	closeElement.onclick=function(){
		document.body.removeChild(this.parentNode);
	}
	
	var iconElement=document.createElement("i");
	iconElement.className="icon";
	
	var labelElement=document.createElement("label");
	labelElement.className="icon";
	labelElement.innerHTML="洗车补贴 APP专享！";
	
	var aElement=document.createElement("a");
	
	aElement.href="http://a.app.qq.com/o/simple.jsp?pkgname=com.haux.htw.mall";//先跳应用宝再跳到APPSTORE，直接跳转微信什么拦截
	/*if(isAppleDevice()){
		//window.location="http://itunes.apple.com/cn/app/id1034170550";
	}else{
		aElement.href= "http://zt.91htw.com/91htw.apk";
	}*/
	
	aElement.innerHTML="立即去抢";
	
	footerElement.appendChild(closeElement);
	footerElement.appendChild(iconElement);
	footerElement.appendChild(labelElement);
	footerElement.appendChild(aElement);
	
	document.body.appendChild(footerElement);
}

function urlencode (str) {  
    str = (str + '').toString();   

    return encodeURIComponent(str).replace(/!/g, '%21').replace(/'/g, '%27').replace(/\(/g, '%28').  
    replace(/\)/g, '%29').replace(/\*/g, '%2A').replace(/%20/g, '+');  
} 

/*分享代码 start*/
function showShareWindow(url,titleName){
	
	var divWrapElement =document.getElementById("pop-top-share");
	if(divWrapElement){
		divWrapElement.style.display="block";
		return ;
	}
	
	var textArr=["新浪微博", "QQ空间", "腾讯微博"];
	var classArr=["item sinat", "item qqzone", "item tcent"];
	var divElement=haux.createElement("div",{className:"pop-con"});
	divWrapElement=haux.createElement("div",{className:"pop-share",id:"pop-top-share"});
	divWrapElement.style.display="block";
	
	//创建关闭按钮
	var aElement=haux.createElement("a",{id:"share_close",className:"bar-close",innerHTML:"×"});
	aElement.onclick=function(){
		document.getElementById("pop-top-share").style.display="none";
	}
	divElement.appendChild(aElement);
	var h5Element=haux.createElement("h5",{innerHTML:"分享到："});
	divElement.appendChild(h5Element);
	
	var ulElement=haux.createElement("ul",{className:"share-min-list fix"});
	for(var i=0;i<3;i++){
		var liElement=document.createElement("li");
		var asubElement=haux.createElement("a",{className:classArr[i],title:"分享到"+textArr[i]});
		
		asubElement.onclick=function(index){
			return function(){
				shareToOthers(index,url,titleName);
			}
		}(i)
		
		var h6Element=haux.createElement("h6",{innerHTML:textArr[i]});
		
		liElement.appendChild(asubElement);
		liElement.appendChild(h6Element);
		ulElement.appendChild(liElement);
	}
	
	divElement.appendChild(ulElement);
	divWrapElement.appendChild(divElement);
	document.body.appendChild(divWrapElement);
}
function shareToOthers(num,url,name,imgUrl,content){
	var targetUrl;
	if(num==0){//新浪微博
		targetUrl="http://service.weibo.com/share/share.php?url="+urlencode(url)+"&title="+urlencode(name);
		if(imgUrl){
			targetUrl=targetUrl+"&pic="+urlencode(imgUrl);
		}
		if(content){
			targetUrl=targetUrl+"&desc="+urlencode(content);
		}
	}else if(num==1){//qq空间
		targetUrl="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url="+urlencode(url)+"&title="+urlencode(name);//"&title="+urlencode('${product.name }')+"&pics="+urlencode("http://www.91htw.com/img-"+data.photoIds.split(",")[0]+"_400X400.do")+"&site="+urlencode("http://www.91htw.com");
		if(imgUrl){
			targetUrl=targetUrl+"&pics="+urlencode(imgUrl);
		}
		if(content){
			targetUrl=targetUrl+"&desc="+urlencode(content);
		}
	}else if(num==2){//腾讯微博
		targetUrl="http://share.v.t.qq.com/index.php?c=share&a=index&title="+urlencode(name)+"&url="+urlencode(url);//+"&pics="+urlencode("http://www.91htw.com/img-"+data.photoIds.split(",")[0]+"_400X400.do")+"&site="+urlencode("http://www.91htw.com")
		if(imgUrl){
			targetUrl=targetUrl+"&pics="+urlencode(imgUrl);
		}
		if(content){
			targetUrl=targetUrl+"&desc="+urlencode(content);
		}
	}
	//window.location=targetUrl;
	window.open(targetUrl);
}
/*分享代码 end*/
/*判断是否微信浏览器打开*/
function is_weixn(){  
    var ua = navigator.userAgent.toLowerCase();  
    if(ua.match(/MicroMessenger/i)=="micromessenger") {  
        return true;  
    } else {  
        return false;  
    }  
} 

/*是否为手机端*/
function is_mobile_browser(){  
    var mobileAgent = new Array("iphone", "android", "phone", "mobile",
				"wap", "netfront", "java", "opera mobi", "opera mini", "ucweb",
				"windows ce", "symbian", "series", "webos", "sony",
				"blackberry", "dopod", "nokia", "samsung", "palmsource", "xda",
				"pieplus", "meizu", "midp", "cldc", "motorola", "foma",
				"docomo", "up.browser", "up.link", "blazer", "helio", "hosin",
				"huawei", "novarra", "coolpad", "webos", "techfaith",
				"palmsource", "alcatel", "amoi", "ktouch", "nexian",
				"ericsson", "philips", "sagem", "wellcom", "bunjalloo", "maui",
				"smartphone", "iemobile", "spice", "bird", "zte-", "longcos",
				"pantech", "gionee", "portalmmm", "jig browser", "hiptop",
				"benq", "haier", "^lct", "320x320", "240x320", "176x220",
				"w3c ", "acs-", "alav", "alca", "amoi", "audi", "avan", "benq",
				"bird", "blac", "blaz", "brew", "cell", "cldc", "cmd-", "dang",
				"doco", "eric", "hipt", "inno", "ipaq", "java", "jigs", "kddi",
				"keji", "leno", "lg", "maui", "maxo",
				"midp", "mits", "mmef", "mobi", "mot-", "moto", "mwbp", "nec-",
				"newt", "noki", "oper", "palm", "pana", "pant", "phil", "play",
				"port", "prox", "qwap", "sage", "sams", "sany", "sch-", "sec-",
				"send", "seri", "sgh-", "shar", "sie-", "siem", "smal", "smar",
				"sony", "sph-", "symb", "t-mo", "teli", "tim-", "tsm-",
				"upg1", "upsi", "vk-v", "voda", "wap-", "wapa", "wapi", "wapp",
				"wapr", "webc", "winw", "winw", "xda", "xda-",
				"Googlebot-Mobile","ipod", "ipad", "incognito", "webmate", "bada", "skyfire");
	var browser = navigator.userAgent.toLowerCase(); 
	var isMobile = false; 
	for (var i=0; i<mobileAgent.length; i++){ 
		if (browser.indexOf(mobileAgent[i])!=-1){ 
			isMobile = true; 
			break; 
		}
	} 
	return isMobile;
}
function isAppleDevice(){
	var browser = {
		versions : function() {
			var u = navigator.userAgent, app = navigator.appVersion;
			return { // 移动终端浏览器版本信息
				ios : !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), // ios终端
				iPhone : u.indexOf('iPhone') > -1, // 是否为iPhone或者QQHD浏览器
				iPad : u.indexOf('iPad') > -1, // 是否iPad
			};
		}(),
	}
	if (browser.versions.iPhone || browser.versions.iPad
			|| browser.versions.ios) {
		return true;
	}
	return false;
}


function formatMoney(s, n)   {   
   n = n > 0 && n <= 20 ? n : 2;   
   s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";   
   var l = s.split(".")[0].split("").reverse(),   
   r = s.split(".")[1];   
   t = "";   
   for(i = 0; i < l.length; i ++ )   
   {   
      t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");   
   }   
   return t.split("").reverse().join("") + "." + r;   
} 
