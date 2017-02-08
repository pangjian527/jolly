/**
	myq 2013-4-23 add，浩轩自定义js扩展库核心文件，每个页面都必须强制引用该文件，取代原有的public.js
	该文件主要作用如下：
		a.定义自定义js组建的名字空间 
		b.设置全局变量和函数
		c.完成通用的页面初始化工作
**/

/***********************************************************************************************
	Part 0 —— 定义huax js扩展库名字空间，创建通用的haux基础方法
***********************************************************************************************/
if(!window.haux){
	haux = {};
	//0.1 基本的js语法补充代码，涉及对象、数组、字符串等，与浏览器无关
	haux.util = {};
	
	//0.2 window、nagigator、screen、histroy、lication等浏览器框架相关js代码
	haux.bom = {};
	
	//0.3 dom相关代码，主要是针对document内的元素进行操作的代码
	haux.dom = {};
	
	//0.4 定义系统自定义的前端组件，如itree、imenu等
	haux.component = {};
}

/***********************************************************************************************
	Part 1 —— 定义全局变量，将全部通用常量都保存在这里
***********************************************************************************************/
var GLOBAL = {};
//2.1浏览器相关常量属性
GLOBAL.isIE = !!window.ActiveXObject;    
GLOBAL.isIE6 = GLOBAL.isIE && !window.XMLHttpRequest;    
GLOBAL.isIE7 = GLOBAL.isIE && !GLOBAL.isIE6 && !GLOBAL.isIE8;
GLOBAL.isIE8 = GLOBAL.isIE && !!document.documentMode;   
GLOBAL.isIE9 = document.documentMode && document.documentMode === 9;
GLOBAL.isIE10 = document.documentMode && document.documentMode === 10;
GLOBAL.isIE11 = document.documentMode && document.documentMode === 10;
GLOBAL.isChrome = window.chrome;
var ua = navigator.userAgent.toLowerCase();
if (document.getBoxObjectFor)
	GLOBAL.isFirefox = ua.match(/firefox\/([\d.]+)/)[1]
else if (window.MessageEvent && !document.getBoxObjectFor)
	GLOBAL.isChrome = ua.match(/chrome\/([\d.]+)/)[1]
else if (window.opera)
	GLOBAL.isOpera = ua.match(/opera.([\d.]+)/)[1]
else if (window.openDatabase)
	GLOBAL.isSafari = ua.match(/version\/([\d.]+)/)[1];
   
GLOBAL.windowPos = null;
if(window == window.top){
	GLOBAL.windowPos = "top";
}
else{
	var outIframe = window.parent.document.getElementsByName(window.name)[0];
	if(outIframe && outIframe.getAttribute("type") == "pop"){
		GLOBAL.windowPos = "iframe-pop";
	}
	else{
		GLOBAL.windowPos = "iframe";
	}
}
	
GLOBAL.topWindow = (function(){
	var pw = window.top;
	while(pw != pw.parent){
		pw = pw.parent;
	}
	return pw;
})();

/***********************************************************************************************
	Part 2 —— 创建全局haux基础方法，
***********************************************************************************************/

/*
	版本信息：myq 2013-5-8 add。
		
	函数说明：
		扩展document.createElement函数，解决ie6-ie8下element.type属性只读的bug，同时可快速设定各项attribute值
	
	编码背景：
		1.ie6-ie8下,input、button的type、name、id等属性是只读的，导致通过document.createElement创建元素后，无法继续设置上述属性值
			需要利用ie提供的非标准语法，创建跨浏览器通用的createElement方法，满足创建element时自定义type属性的需求
		2.同时，采用标准dom语法创建element时，如果element的自定义属性比较多的时候，还存在需要连续设置id、value、innerHTML等属性，
			比较复杂，宜采用一次性生成的方式；
	参数说明：
		tagName：element的tagName，如input、button、textarea等；
		attributeObj：element属性对象，记录element所需要设置的属性名和属性值（限文本类型），格式如下{name:"age", type:"text", value:"30", disabled:"true"}
*/
haux.dom.createElement = function(tagName, attributeObj){
	var targetElement;
	if(GLOBAL.isIE6 || GLOBAL.isIE7 || GLOBAL.isIE8){
		var elementHtml = "<" + tagName;
		if(attributeObj)
			for(property in attributeObj){
				var proValue = attributeObj[property];
				if(proValue == null || proValue == undefined)
					continue;
				if(property == "innerHTML" || property == "className")
					continue;//innerHTML需要创建
				else
					elementHtml += " " + property + "=\"" + proValue.replace(/\"/g, "&quot;") + "\"";
			}
		elementHtml += "></" + tagName + ">";
		//alert("生成：" + elementHtml);
		targetElement = document.createElement(elementHtml);
		//补充innerHTML等属性
		if(attributeObj.innerHTML){
			targetElement.innerHTML = attributeObj.innerHTML;
		}
		if(attributeObj.className){
			targetElement.className = attributeObj.className;
		}
	}
	else{
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
	}
	return targetElement;
}

haux.dom.createOptions = function(selectElement, optionArray, valueName, textName, selectedValue){
	if(typeof optionArray == "string"){
		try{
			optionArray = eval("(" + optionArray + ")");
		}
		catch(e){
			optionArray = [];
		}
	}
		
	for(var i = 0; i < optionArray.length; i++){
		var optionObj = optionArray[i];
		var optionValue;
		var optionText;
		if(typeof optionObj == "string" || typeof optionObj == "number"){
			optionText = optionObj;
			optionValue = optionObj;
		}
		else{
			optionValue = optionObj[valueName];
			optionText = optionObj[textName];
		}
		var optionElement = document.createElement("option");
		optionElement.value = optionValue;
		optionElement.innerHTML = optionText;
		if(optionValue == selectedValue)
			optionElement.selected = "selected";
		
		selectElement.appendChild(optionElement);
	}
}

haux.dom.createCheckboxes = function(wrapElement, options,valueProperty, textProperty, 
	selectedValues, elName){
	if(!options){
		return;
	}	
	else if(typeof options == "string"){
		try{
			options = eval("(" + options + ")");
		}
		catch(e){
			options = [];
		}
	}
	var checkboxElements = [];
	
	if(!selectedValues){
		selectedValues = [];
	}
	else if(typeof selectedValues == "string"){
		try{
			selectedValues = eval("(" + selectedValues + ")");
		}
		catch(e){
			selectedValues = [];
		}
	}
	
	for(var i = 0; i < options.length; i++){
		var optionObj = options[i];
		var optionValue = null;
		var optionText = null;
		if(typeof optionObj == "string" || typeof optionObj == "number"){
			optionText = optionObj;
			optionValue = optionObj;
		}
		else{
			optionValue = optionObj[valueProperty];
			optionText = optionObj[textProperty];
		}
		
		var spanElement = haux.dom.createElement("span", {innerHTML:optionText, 
			className:"checkbox"}); 
		
		var checkboxElement = haux.dom.createElement("input", {name:elName, 
			className:"checkbox", type:"checkbox", value:optionValue});
		
		if(selectedValues.contain(optionValue))
			checkboxElement.checked = "checked";
		
		spanElement.insertBefore(checkboxElement, spanElement.firstChild);
		checkboxElements.push(checkboxElement);
		wrapElement.appendChild(spanElement);
	}
	return checkboxElements;
}

haux.dom.createRadios = function(wrapElement, options, valueProperty, textProperty, 
	selectedValue, elName){
	var radioElements = [];
	if(!options){
		return;
	}	
	else if(typeof options == "string"){
		try{
			options = eval("(" + options + ")");
		}
		catch(e){
			options = [];
		}
	}
	
	for(var i = 0; i < options.length; i++){
		var optionObj = options[i];
		var optionValue = null;
		var optionText = null;
		if(typeof optionObj == "string" || typeof optionObj == "number"){
			optionText = optionObj;
			optionValue = optionObj;
		}
		else{
			optionValue = optionObj[valueProperty];
			optionText = optionObj[textProperty];
		}
		
		var spanElement = haux.dom.createElement("span", {innerHTML:optionText, 
			className:"radio"}); 
		
		var radioElement = haux.dom.createElement("input", {name:elName, 
			className:"radio", type:"radio", value:optionValue});
		
		if(selectedValue == optionValue)
			radioElement.checked = "checked";
		
		spanElement.insertBefore(radioElement, spanElement.firstChild);
		radioElements.push(radioElement);
		wrapElement.appendChild(spanElement);
	}
	return radioElements;
}
//
haux.dom.getFormType = function(element){
	if(element.tagName == "INPUT")
		return element.type.toUpperCase();
	else
		return element.tagName;
}
//myq add 2014-1-12，获取页面中name对应的value，类似java httpRequst.getParameter
haux.dom.getFormValue = function(name){	
	var result = haux.dom.getFormValues(name);
	return result ? result.join(",") : "";
}

haux.dom.getFormValues = function(name){
	var formElements = document.getElementsByName(name);
	var result = [];
	for(var i = 0, len = formElements.length; i < len; i++){
		var formElement = formElements[i];
		if(formElement.disabled)
			continue;

		if(formElement.tagName == "INPUT" 
			&& (formElement.type == "radio" || formElement.type == "checkbox")){
			if(formElement.checked)
				result.push(formElement.value);
		}
		else{
			//text,hidden,file,password,textarea, select...
			result.push(formElement.value);
		}
	}
	return result;
}
//myq add 2014-6-3,根据value的值，设置单个的input/radio/checkbox/select元素的value/checked/selected Option属性
haux.dom.setElementValue = function(targetElement, value){
	if(!targetElement){
		return;
	}
	if(!value && value !== 0){
		value = "";
	}
	if(targetElement.tagName == "INPUT" && targetElement.type != "radio" && targetElement.type != "checkbox"){
		targetElement.value = value;
		if(targetElement.containClass("Wdate")){
			targetElement.value = value ? value.substr(0, 10) : value;
		}
	}
	else if(targetElement.tagName == "INPUT" && targetElement.type == "radio"){
		//radio
		targetElement.checked = (targetElement.value == value);
	}
	else if(targetElement.tagName == "SELECT"){
		//select
		targetElement.value = value;
	}
	else if(targetElement.tagName == "TEXTAREA"){
		//textarea
		targetElement.value = value;
	}
	else if(targetElement.tagName == "INPUT" && targetElement.type == "checkbox" ){
		var values = [];
		if(value instanceof Array){
			values = value;
		}
		else if(value){
			values = value.split(",");
		}
		//checkbox比较麻烦，因为可以多选导致value是一个数组，需要比较checkbox.value是否在数组中出现
		targetElement.checked = values.contain(targetElement.value);
	}
}
///myq add 2014-6-4，根据valueObj内存储的key-value关系，跟新targetElement内包含的全部input/select/textarea/radio/checkbox数值
haux.dom.setElementsValue = function(targetElement, valueObj){
	if(!targetElement || !valueObj){
		return;
	}
	var iterator = document.createNodeIterator(targetElement, NodeFilter.SHOW_ELEMENT, null, false);
	var node = iterator.nextNode();
	while(node){
		if(node.name){
			haux.dom.setElementValue(node, valueObj[node.name])
		}
		node = iterator.nextNode()
	}
}
///myq add 2014-6-4，读取targetElement内包含的全部input/select/textarea/radio/checkbox
//将name-value关系转换为json对象后返回
haux.dom.getElementsValue = function(targetElement){
	var result = {};
	if(!targetElement){
		return result;
	}
	var iterator = document.createNodeIterator(targetElement, NodeFilter.SHOW_ELEMENT, null, false);
	var node = iterator.nextNode();
	while(node){
		if(node.name && !node.disabled){
			//获取表单元素的value，并写入formValues对象
			if(node.tagName == "INPUT" && node.type != "checkbox" && node.type != "radio"
				|| node.tagName == "INPUT" && node.type == "radio" && node.checked
				|| node.tagName == "TEXTAREA" 
				|| node.tagName == "SELECT"){
				result[node.name] = node.value;
			}
			else if(node.tagName == "INPUT" && node.type == "checkbox" && node.checked){
				//如果checkbox被选中了会比较麻烦，value要写入数组，因为checkbox是允许多选的
				var values = result[node.name];
				if(!values instanceof Array){
					values = [];
					result[node.name] = values;
				}
				values.push(node.value);
			}
		}
		node = iterator.nextNode();
	}
	return result;
}

/*
	版本信息：myq 2013-5-8 add。
		
	函数说明：扩展dom二级事件处理程序，包括添加事件响应函数、删除事件响应函数等
	参数说明：element—目标element元素，eventName—事件名称(去掉开头的on),handlerFunc—事件响应函数
*/
haux.dom.addEventHandler = function(element, eventName, handlerFunc){
	if(element.addEventListener){
		//chrome/firefox
		element.addEventListener(eventName, handlerFunc, false);
	}
	else if(element.attachEvent){
		//ie6+，注意采用这种方法邦定的事件响应函数，函数执行时this=window，而非element对象
		//此时，需要在响应函数中，通过参数event的target属性，才能找回element对象
		element.attachEvent("on" + eventName, handlerFunc)
	}
	else{
		//ie5 or更古老的ie浏览器，基本不会出现此现象
		element["on" + eventName] = handlerFunc;
	}
}

haux.dom.removeEventHandler = function(element, eventName, handlerFunc){
	if(element.removeEventListener){
		//chrome/firefox
		element.removeEventListener(eventName, handlerFunc, false);
	}
	else if(element.detachEvent){
		//ie6+
		element.detachEvent("on" + eventName, handlerFunc)
	}
	else{
		//ie5 or更古老的ie浏览器，基本不会出现此现象
		element["on" + eventName]= null;
	}
}
//阻止event事件冒泡，使得event不再触发外层element的对应事件响应函数
haux.dom.stopPropagateEvent = function(ev){
	if(GLOBAL.isIE)
		ev.cancelBubble = true;
	else
		ev.stopPropagation();
}

//阻止event事件引发的浏览器默认行为
haux.dom.stopDefaultEvent = function(ev){
	if(GLOBAL.isIE){
		ev.returnValue = false;
	}
	else{
		ev.preventDefault();
	}
}

haux.dom.addCssFile = function(fileSrc){
	var linkElement = document.createElement('link');
	linkElement.setAttribute("rel", "stylesheet");
	linkElement.setAttribute("type", "text/css");
	linkElement.setAttribute("href", fileSrc);
	document.getElementsByTagName("head")[0].appendChild(linkElement);
}

haux.dom.addJsFile = function(fileSrc){
	var scriptElement= document.createElement("script"); 
    scriptElement.type = "text/javascript"; 
    scriptElement.src = fileSrc; 
	document.getElementsByTagName("head")[0].appendChild(scriptElement);
}

//定义 point和rectang辅助类，支持dom内位置相关的计算
haux.util.Point = function(x, y){
	this.x = x;
	this.y = y;	
}

haux.util.Rectangle = function(x, y, width, height){
	this.x = x;
	this.y = y;
	this.width = width;
	this.height = height;
}

haux.util.Rectangle.prototype.intersect =function(target){
		var horizontalIntersect = (this.x > target.x) && (this.x < target.x + target.width) 
			|| (this.x + this.width > target.x) && (this.x + this.width < target.x + target.width);
		
		var verticalIntersect = (this.y > target.y) && (this.y < target.y + target.height) 
			|| (this.y + this.height > target.y) && (this.y + this.height < target.y + target.height);
		
		return horizontalIntersect && verticalIntersect;
}

haux.util.Rectangle.prototype.getBottomPos = function(){
	return this.y + this.height;
}
haux.util.Rectangle.prototype.getRightPos = function(){
	return this.x + this.width;
}

haux.util.getDateInterval = function(firstDateStr, secondDateStr){
	var result = {describe:""};
	var firstDate = new Date(Date.parse(firstDateStr.replace(/-/g, "/")));
	var secondDate = new Date(Date.parse(secondDateStr.replace(/-/g, "/")));
	
	//计算两个日期之间相差的毫秒数
	var milliseconds = firstDate.getTime() - secondDate.getTime();
	var secondCount = Math.floor(milliseconds / 1000);
	result.seconds = secondCount;
	
	var second = secondCount % 60;
	var minute = Math.floor(secondCount / 60) % 60;
	var hour = Math.floor(secondCount / 60 / 60) % 24;
	var day = Math.floor(secondCount / 60 / 60 / 24);
	
	if(day)
		result.describe += day + "天";
	if(hour)
		result.describe += hour + "小时";
	if(minute)
		result.describe += minute + "分钟";
	if(second && !day && !hour)
		result.describe += second + "秒";
	
	return result;
}
/*版本信息：myq 2013-4-27 add。
		
	函数说明：
		获取targetNode元素距离其上级元素containerNode的左上角的x,y偏移量。
		如果containerNode为空，则计算相对body左上角的偏移。返回体现targetNode的rectangle对象
	
	算法说明：
		1.非ie，直接从event对象中获取坐标即可
		2.ie，需要考虑文档存在滚动条时的参数修正，因为window.event中存的坐标是相对于屏幕左上角，而不是文档的左上角
		
	参数说明：targetNode:目标对象，containerNode：包含targetNode的上层对象
*/
haux.dom.getElementRec = function(targetNode, containerNode){

	//0.计算targetNode->contanerNode之间发生了多少次滚动，因为offsetLeft和offsetTop无法体现元素因parentNode滚动而引起的位置变化
	var scrollLeft = 0
	var scrollTop = 0;
	var parentNode = targetNode.parentNode;
	while(parentNode && parentNode != document.body){
		scrollTop += parentNode.scrollTop ? parentNode.scrollTop : 0;
		scrollLeft += parentNode.scrollLeft ? parentNode.scrollLeft : 0;
		if(parentNode == containerNode)
			break;
		parentNode = parentNode.parentNode;
	}
	var height = targetNode.offsetHeight;
	var width = targetNode.offsetWidth;
	//1. 通过targetNode距offsetParent的偏移值递归计算偏移量
	var left = 0 - scrollLeft;
	var top = 0 - scrollTop;
	while(targetNode.offsetParent){
		left += targetNode.offsetLeft;
		top += targetNode.offsetTop;

		if(containerNode)
			if(targetNode.offsetParent == containerNode)//如果containerNode是绝对定位或相对定位，则肯定会有一次循环满足此条件
				return new haux.util.Rectangle(left, top, width, height);
			else if(targetNode.offsetParent == containerNode.offsetParent){//如果containerNode是流动定位或者浮动定位，则此条件能被满足。此时要减去多算的偏移量
				left -= containerNode.offsetLeft;
				top -= containerNode.offsetTop;
				return new haux.util.Rectangle(left, top, width, height);
			}
		targetNode = targetNode.offsetParent;
	}
	return new haux.util.Rectangle(left, top, width, height);
}

//计算页面内html元素的长、宽（如存在滚动条，按可滚动的最大长、宽计算），返回Rectangle对象
haux.dom.getHtmlRec= function(windowObj){
	windowObj = windowObj || window;
	var htmlElement = windowObj.document.documentElement;
	var htmlHeight = Math.max(htmlElement.scrollHeight, htmlElement.clientHeight);
	var htmlWidth = Math.max(htmlElement.scrollWidth, htmlElement.clientWidth);
	return new haux.util.Rectangle(0, 0, htmlWidth, htmlHeight);
}

/*版本信息：myq 2013-4-27 add。
		
	函数说明：
		根据dom事件发生时的event数据，获取鼠标相对于html左上角x,y的距离
	
	算法说明：
		1.非ie，直接从event对象中获取坐标即可
		2.ie，需要考虑文档存在滚动条时的参数修正，因为window.event中存的坐标是相对于屏幕左上角，而不是文档的左上角
		
	参数说明：event对象，由调用者写入中获取
*/
haux.dom.getMousePos = function(ev){
	if(ev.pageX)//ff
  		return new haux.util.Point(ev.pageX, ev.pageY);
 	else//ie
		return new haux.util.Point(ev.clientX + document.documentElement.scrollLeft - document.body.clientLeft,
			ev.clientY + document.documentElement.scrollTop  - document.body.clientTop);
}
//获取event事件发生时，鼠标距离触发该事件的element左上角的x,y偏移量
haux.dom.getMousePosInElement = function(ev){
	if(GLOBAL.isIE){
		//ie比较简单，自带的offsetX，offsetY属性就是相对element的距离
		return {x : ev.offsetX, y : ev.offsetY};
	}
	else{
		//标准dom浏览器比较麻烦，event.clientX和clientY代表鼠标距离html元素左上角的x,y偏移量，无法直接得出结果
		//需要先计算触发事件的element距离body左上角的偏移，再和event.clientX/clientY相减
		var targetElement = ev.target || ev.srcElement;
		var targetElementPos = haux.dom.getElementRec(targetElement); 
		return{x : ev.pageX - targetElementPos.x, y : ev.pageY - targetElementPos.y};
	}
}

//生成服务器端的任务id，并创建一个监听器，定期从服务器扫描该id关联的progress对象，并依次更新前端页面
// config.interval 定期获取任务进度的间隔，单位为毫秒。如果为空，则默认1秒
// config.refresh，更新任务进展的回调函数
// config.finish,任务已经执行完毕的回调函数
// config.cancel，任务被取消的回掉函数
haux.dom.createProgressClient = function(config){
	//1.采用ajax同步调用方式，在服务器端创建唯一的progressId
	if(!config.id){
		var ajaxUrl = home() + "/common.backgroundtask.operateAction!createId.action";
		var htmlobj = $.ajax({url:ajaxUrl,async:false});
		config.id = htmlobj.responseText.replace("\n", "").replace("\r", "");
	}
	var exceptionCount = 0;//计数器，如果连续10次都没找到或者异常，就自动终止了
	//2.创建定时器，从服务器端获取任务进展
	var ajaxUrl = null;
	if(config.type == "application"){
		ajaxUrl = home() 
			+ "/common.backgroundtask.operateAction!getApplicationProgress.action?id=" + config.id;
	}
	else{
		ajaxUrl = home() 
			+ "/common.backgroundtask.operateAction!getSessionProgress.action?id=" + config.id;
	}
	
	var interval = setInterval(function(){
		//alert(ajaxUrl);
		$.ajax({url : ajaxUrl + "&t=" + new Date().getTime(),
			type:"get",
			dataType: "json",
			error: function(){
				if(++exceptionCount > 100)
					clearInterval(interval);;
			},
			success:function(progress){
				if(!progress){
					if(++exceptionCount > 9)
						clearInterval(interval);
					return;
				}
				
				//4.开启step-4，显示读取结果&补充数据
				switch(progress.status){
					case "finish":
						clearInterval(interval);
						if(config.finish){
							config.finish(progress);
						}
						break;
					case "cancel":
						clearInterval(interval);
						if(config.cancel){
							config.cancel(progress);
						}
						break;
					case "active":
						if(config.refresh){
							config.refresh(progress);
						}
						break;
					default:
						break;
					
				}

			}
		});
	}, config.interval || 1000);
	
	//3.
	return config.id;
}

haux.util.getType = function(obj){
	if(obj === null)
		return "null";
	
	var type = typeof(obj);
	if ("object" == type) {
		if (Object.prototype.toString.call(obj) === '[object Array]')
			return "array";
		if (Object.prototype.toString.call(obj) === '[object RegExp]')
			return "regexp";
	}
	return type;
}

/*
	json对象-字符串转换功能
*/
haux.util.Json = {};

/*	版本信息：myq 2013-4-24 add。
		
	函数说明：
		将js数据类型转换为json字符串,支持object,array,string,function,number,boolean,regexp等
	
	算法说明：
		1.判断数据类型
		2.分类处理
		
	参数说明：jsonObj—目标js对象
*/
haux.util.Json.getString = function (jsonObj) {
	//0.预处理空值
	if(jsonObj === null)
		return null;
	//1.判断对象的数据类型	
	var type =  haux.util.getType(jsonObj);
	
	//2.处理不同的数据类型
	switch (type) {
	  case "undefined":
	  	return "undefined";
	  case "unknown":
		return;
	  case "function":
	  	return;
	  case "boolean":
	    return jsonObj ? "true" : "false";
	  case "regexp":
		return jsonObj.toString();
	  case "number":
		return isFinite(jsonObj) ? jsonObj.toString() : "null";
	  case "string":
		return "\"" + jsonObj.replace(/(\\|\")/g, "\\$1").replace(/\n|\r|\t/g, function () {
			var a = arguments[0];
			return (a == "\n") ? "\\n" : (a == "\r") ? "\\r" : (a == "\t") ? "\\t" : "";
		}) + "\"";
		break;
	  case "object":
		if (jsonObj === null) {
			return "null";
		}
		var results = [];
		for (var property in jsonObj) {
			
			var value = jsonObj[property];
			if(value === jsonObj)//防止属性指向自己，形成死循环
				continue;

			if (value !== undefined) {
				results.push('"'+property +'"'+ ":" + haux.util.Json.getString(value));
			}
		}
		return "{" + results.join(",") + "}";
		break;
	  case "array":
		var results = [];
		for (var i = 0; i < jsonObj.length; i++) {
			var value = haux.util.Json.getString(jsonObj[i]);
			if (value !== undefined) {
				results.push(value);
			}
		}
		return "[" + results.join(",") + "]";
		break;
	}
};

/*	版本信息：myq 2013-4-24 add。
		
	函数说明：
		将json字符串转换为js对象
	
	算法说明：
		1.使用eval方式将String转为对象
		2.对不正确的json数据格式，返回null
		
	参数说明：jsonObj—目标js对象
*/
haux.util.Json.getObject = function (jsonStr, defaultObj){
	if(!jsonStr)
		return defaultObj || null;
	
	try{
		return eval("(" + jsonStr + ")");
	}
	catch(err){
		
	}
	return defaultObj || null;
	
}
/***********************************************************************************************
	Part 3 —— 全局页面修正、框架调整、页面渲染等
***********************************************************************************************/
haux.dom.addEventHandler(window,"load", function(){
	//升级全部a标签，避免点击链接后出现的虚线框
	//在ie下，鼠标点击超连接后会留下一个难看的虚线框，需要明确设置所有a标签的hidefocus属性，才能避免此现象
	if(GLOBAL.isIE){
		var aNodes = document.getElementsByTagName("a");
		for(var i = 0; i < aNodes.length; i++){
			var targetNode = aNodes[i];
			targetNode.hideFocus = true; 
		}
	}
		
	//根据文档自身高度，改变外层的Iframe 高度
	synchronizeIFrameSize(); 
	
	//禁止点击backspace自动返回上一个页面，防止误操作
	haux.dom.addEventHandler(document.body, function(ev){
		ev = ev || window.event;
		var targetElement = ev.srcElement || ev.target;
		var pressedKeyCode = ev.which || ev.keyCode;
		if(pressedKeyCode != 8)
			return;
		haux.dom.stopPropagateEvent(ev);
		haux.dom.stopDefaultEvent(ev);
	});//end function:document.body.onkeydown
});

function preventDefaultEnterPress(ev){
	ev = ev || window.event;
	var targetElement = ev.srcElement || ev.target;
	var pressedKeyCode = ev.which || ev.keyCode;
	if(pressedKeyCode != 13)
		return;
	haux.dom.stopPropagateEvent(ev);
	haux.dom.stopDefaultEvent(ev);
}

//对于被Iframe内嵌的window，由window根据自身document的实际高度，调整外层Iframe元素的高度，以避免Iframe元素出现垂直滚动条
synchronizeIFrameSize = function() {
	//0.预处理，如果当前window已经是顶层，则说明该窗口没有被iframe或frameset包含，不需要做任何调整
	if(GLOBAL.windowPos != "iframe-pop")
		return;
	
	//1.获取包含该页面的iframe对象
	var parentWindow = window.parent;
	//如果iframe指定了id或name，则被包含的html页面的window.name属性会取iframe.id或iframe.name
	var outerIframe = parentWindow.document.getElementsByName(window.name)[0];
	if(!outerIframe)
		return;

/*	myq add 2014-9-11，窗口大小发生变化时，冻结后面的setInterval方法执行，防止因为body出现水品滚动条引发高度反复变化的死循环	haux.dom.addEventHandler(window, "resize", function(){
		GLOBAL.freezeHeight = true;
		freezeTimeout = setTimeout(function(){
			if(freezeTimeout){
				clearTimeout(freezeTimeout);
			}
			GLOBAL.freezeHeight = false;
		}, 1000);
	})*/
	
	setInterval(function(){
		/*if(GLOBAL.freezeHeight){
			return;
		}*/
		//2.计算本页面的body高度
		var bodyHeight = _getBodyHeight();
		//alert("高度" + bodyHeight);
		//3.根据body高度，调整外层iframe的高度
		var topWindowHeight = GLOBAL.topWindow.document.documentElement.clientHeight;
		outerIframe.style.height = bodyHeight + 15 + "px";
		outerIframe.parentNode.parentNode.style.height = "";//废除show方法强制指定的高度
	}, 500);
	
}

//获取window下body的实际高度
function _getBodyHeight(){
	//ie和firefox对body实际内容的长度解释不同，ie、opera认为scrollHeight是body内容的实际长度，而firefox、ns下认为是clientHeight
	if(document.documentElement.scrollHeight > document.documentElement.clientHeight){
		//如果html的滚动高度>可见高度，说明现在窗口已产生了垂直滚动条，应以scrollHeight为准，此时ie和chrome是一样的
		return document.documentElement.scrollHeight;
	}
	else{
		//页面没有滚动条，html可见高度>body的实际内容高度，此时ie和chrome的解释开始不一致了
		if(GLOBAL.isIE){
			//ie下.documentElement.scrollHeight和clientHeight都等于html的可见高度，此时需要取body的clientHeight
			return document.scrollHeight;
		}
		else{
			//chrome下，documentElement和body的clientHeight属性为窗口可见高度,而scrollHeight反而代表真实的body高度
			return document.documentElement.scrollHeight;
		}
	}
	
}

/***********************************************************************************************
	Part 4 —— 全局页面修正、框架调整、页面渲染等
*********************************************************************s**************************/
//4.公用js函数定义

function home() {
	var _home;
	var win = window;
	while (!_home && win) {
		_home = win._home || win.top._home;
		win = win.opener;_home="/jolly";
	}
	return _home;
}

//关闭模态窗口，由于模态窗口只有一个，不再需要传递dialog.id
function closeActiveDialog(callBackAction, args){
	//1.从顶层window获取正在显示的DivDialog 对象
	var dialogObj = GLOBAL.topWindow.activeDialog;
	if(!dialogObj)
		return;
		
	//2.清除痕迹，释放内存
	//GLOBAL.topWindow.visibleDivDialog = null;
	
	//3.关闭打开的窗口iu	
	var parentWindow = dialogObj.parentWindow;
	dialogObj.close();	
	
	//4.处理关闭后dialog object的父窗体的界面刷新问题
	if(!callBackAction){
		//空值，什么都不用干
	}
	else if(callBackAction == "reload"){
		parentWindow.location.reload();
	}
	else if(callBackAction == "close"){
		parentWindow.close();
	}
	else{
		//parentWindow内的钩子函数调用，closeAction参数为对应函数的名称
		callBackAction.apply(parentWindow, args);
	}
}
/*
//根据url，打开浏览器默认的新窗口
function openWindow(url, width, height, left, top){
	width = width || 900;
	height = height || 600;
	var left = left || (screen.availWidth - width) / 2;
	var top = top || (screen.availHeight - height) / 2;
	var traits = "height=" + height + ",width=" + width + ",left=" + left + ",top=" + top 
		+ ",toolbar=no,menubar=no,scrollbars=yes," + "status=yes,resizable=yes";

	window.open(url, "", traits);
}
//根据url，打开浏览器默认的模态窗口
function openDialogWindow(url, width, height, left, top){
	var width = width || 900;
	var left = left || (screen.availWidth - width) / 2;
	var traits = "resizable:yes;dialogWidth:" + width + "px;dialogLeft:" + left + "px";
	if(height){
		var top = top || (screen.availHeight - height) / 2;
		traits += ";dialogHeight:" + height + "px;dialogTop:" + top + "px";
	}
	var result = window.showModalDialog(url, null, traits);
	return result;
}
*/
function addShadow(isload){
	var shadowElement = document.getElementById("bg_shadow");
	if(shadowElement){
		shadowElement.parentNode.removeChild(shadowElement);
	}
	shadowElement = document.createElement("div");	//创建背景模湖芝照层
	shadowElement.id = "bg_shadow";
	
	document.body.appendChild(shadowElement);
	if(isload){
		var loadElement = document.createElement("div");	//创建背景模湖芝照层
		loadElement.id = "bg_shadow_load";
		document.body.appendChild(loadElement);
	}
	
	_setShadowSize();
	//
	haux.dom.addEventHandler(window, "resize", _setShadowSize);
	//document.body.onresize = _setShadowSize;
}

function clearShadow(shadowEle){
	var shadowElement = document.getElementById("bg_shadow");
	var shadowLoadElement=document.getElementById("bg_shadow_load");
	if(!shadowElement)
		return;
	haux.dom.removeEventHandler(window, "resize", _setShadowSize)
	shadowElement.parentNode.removeChild(shadowElement);
	if(!shadowLoadElement)
		return;
	haux.dom.removeEventHandler(window, "resize", _setShadowSize)
	shadowLoadElement.parentNode.removeChild(shadowLoadElement);
}

function _setShadowSize(){
	//alert("set");
	var htmlEl = document.documentElement;
	var shadowElement = document.getElementById("bg_shadow");
	shadowElement.style.width = Math.max(htmlEl.scrollWidth, htmlEl.clientWidth) + "px";
	shadowElement.style.height = Math.max(htmlEl.scrollHeight, htmlEl.clientHeight) + "px";
}

/***********************************************************************************************
	Part 5 —— 基本类型扩展
***********************************************************************************************/
String.prototype.trim = function(){  
    // 用正则表达式将前后空格  
    // 用空字符串替代。  
    return this.replace(/(^\s*)|(\s*$)/g, "");  
}
Array.prototype.indexOf = function(target){
	for(var i = 0; i < this.length; i++)
		if(this[i] === target)
			return i;
	return -1;
}
Array.prototype.remove = function(target){
	var index = this.indexOf(target)
	if(index >= 0)
  		this.splice(index, 1);
}
Array.prototype.contain = function(el){
	for (var i = 0; i < this.length; i++){
		if (this[i] == el){
			return true;
		}
	}
	return false;
};

//ie不支持修改Node类型的原型，如果修改了，但会引起其它代码莫名其妙的报错，只能重载element类型
haux.dom._elementExtFuncs = {
	containClass : function(className){
		if(!className || ! this.className)
			return false;
			
		return this.className == className 
			|| (new RegExp("^" + className + " | " + className + "$| " + className + " ")).test(this.className);
	},
	removeClass : function(className){
		if(this.containClass(className)){
			//this.className = nodeClassName.replace(new RegExp("^" + className + " | " + className + "$| " + className + " "), ""); 
			var classNames = this.className.split(" ");
			
			for(var i = 0; i < classNames.length; i++){
				if (classNames[i] == className){
					classNames.splice(i, 1);
					this.className = classNames.join(" ");
					return true;
				}
			}
		}
		return false;
	},
	replaceClass : function(oldClassName, newClassName){
		if(this.containClass(oldClassName)){
			//this.className = nodeClassName.replace(new RegExp("^" + className + " | " + className + "$| " + className + " "), ""); 
			var classNames = this.className.split(" ");
			for(var i = 0; i < classNames.length; i++){
				if (classNames[i] == oldClassName){
					classNames[i] = newClassName;
					this.className = classNames.join(" ");
					return true;
				}
			}
		}
		return false;
	},
	addClass : function(className){
		if(this.containClass(className))
			return false;
		
		this.className = !this.className ? className : this.className + " " + className;
		
		return true;
	},
	hasChild : function(targetElement){
		var parentNode = targetElement.parentNode;
		while(parentNode){
			if(this == parentNode)
				return true;
			parentNode = parentNode.parentNode;
		}
		return false;
	},
	containOrEqual : function(targetElement){
		return this == targetElement || this.contain(targetElement);
	},
	getElementsByClassName : function(className){
		var result = [];
		var elements = [this];
		//ie6-7浏览器不支持document.createNodeIterator，只能自己写 
		while(elements.length){
			var targetElement = elements.shift();
			if(targetElement.className && targetElement.className.split(" ").contain(className)){
				result.push(targetElement);
			}
			var childNode = targetElement.firstChild; 
			while(childNode){
				if(childNode.tagName){
					elements.push(childNode);
				}
				childNode = childNode.nextSibling;
			}
		}
		
		return result;
	}
};
if(window.Element){
	for(var funcName in haux.dom._elementExtFuncs){
		if(!Element.prototype[funcName])
			Element.prototype[funcName] = haux.dom._elementExtFuncs[funcName]
	}
}

//myq add 2014-11-18，针对ie6/ie7/ie8被过度保护的问题，手动扩展具体的element元素
haux.dom.fixElement = function(targetElement){
	if(window.Element)
		return;
	
	for(var funcName in haux.dom._elementExtFuncs){
		if(!targetElement[funcName])
			targetElement[funcName] = haux.dom._elementExtFuncs[funcName]
	}
}
Element.prototype.containClass = function(className){
	if(!className || ! this.className)
		return false;
		
	return this.className == className 
		|| (new RegExp("^" + className + " | " + className + "$| " + className + " ")).test(this.className);
}

Element.prototype.removeClass =function(className){
	if(this.containClass(className)){
		//this.className = nodeClassName.replace(new RegExp("^" + className + " | " + className + "$| " + className + " "), ""); 
		var classNames = this.className.split(" ");
		
		for(var i = 0; i < classNames.length; i++){
			if (classNames[i] == className){
				classNames.splice(i, 1);
				this.className = classNames.join(" ");
				return true;
			}
		}
	}
	return false;
}

Element.prototype.replaceClass = function(oldClassName, newClassName){
	if(this.containClass(oldClassName)){
		//this.className = nodeClassName.replace(new RegExp("^" + className + " | " + className + "$| " + className + " "), ""); 
		var classNames = this.className.split(" ");
		for(var i = 0; i < classNames.length; i++){
			if (classNames[i] == oldClassName){
				classNames[i] = newClassName;
				this.className = classNames.join(" ");
				return true;
			}
		}
	}
	return false;
}

Element.prototype.addClass = function(className){
	if(this.containClass(className))
		return false;
	
	this.className = !this.className ? className : this.className + " " + className;
	
	return true;
}
//myq add 2013.5.30, 对内含浮动块的element，附加一个div清理元素
Element.prototype.addClearElement = function(){
	var divElement = document.createElement("div");
	divElement.style.cssText = "clear:both;position:static";
	this.appendChild(divElement);
}
//myq add 2013-7-23,判断元素是否包含某个targetElement
Element.prototype.contain = function(targetElement){
	var parentNode = targetElement.parentNode;
	while(parentNode){
		if(this == parentNode)
			return true;
		parentNode = parentNode.parentNode;
	}
	return false;
}
//myq add 2013-7-23,判断元素是否包含或等于某个targetElement
Element.prototype.containOrEqual = function(targetElement){
	return this == targetElement || this.contain(targetElement);
}
