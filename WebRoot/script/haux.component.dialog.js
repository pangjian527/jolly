/*

	调用页面要求：
		1.页面声明DocType，避免ie默认的Quirks Mode渲染模式造成的兼容性问题
*/
Dialog = function(type, content, /*width, height, */title, showDefaultButton, allowDrag, onShow, onClose){
	//1.
	this._type = type;//iframe、alert、confirm、custom 4种 
	//this._width = width || 400;		//DIV窗口宽度
	//this._height = height || 300;	//DIV窗口高度
	this._title = title || "";		//DIV上方标题栏显示的内容
	this._content = content;				//内嵌页面的url地址
	this._showDefaultButton = showDefaultButton || false;//是否显示DIV窗口自带的“关闭”、“取消”按钮
	this._allowDrag = allowDrag || false;	//是否允许窗口被鼠标点击上方标题栏后拖拽
	
	//记录该dialog obj对象是来自哪个window对象，便于当Dialog窗口被关闭后，调用parentWindow的回调函数
	this.parentWindow = window;	
	
	//记录onshow和onclose事件相应函数
	this._onShow = onShow;
	this._onClose = onClose;
}

haux.component.Dialog = Dialog;


//计算DIV窗口左上角的坐标，以及灰色背景层的长、宽，并将dialog element设置为可见
Dialog.prototype.displayDialogElement = function(){
	
	if(this._element.style.visibility == "visible")
		return;
	
	var topDocument = GLOBAL.topWindow.document;
	var topBody = topDocument.body;
	var topDocElement = topDocument.documentElement;
	
	//1.计算出现滚动条时，页面相对于body左上角的偏移量
	var scrollLeft = Math.max(topDocElement.scrollLeft, topBody.scrollLeft);
	var scrollTop = Math.max(topDocElement.scrollTop, topBody.scrollTop);
	
	//2.计算dianlog应该出现的位置
	var leftPos = Math.floor((topDocElement.clientWidth - this._element.offsetWidth)/2) + scrollLeft;
	var topPos = Math.floor((topDocElement.clientHeight - this._element.offsetHeight)/2) + scrollTop
	
	//3.防止因为dialog的长、宽大于window的可见区域引起的负坐标值
	this._element.style.left = Math.max(0, leftPos) + "px";
	this._element.style.top = Math.max(0, topPos) + "px";
	
	//4. 显示注意要在调整好位置之后，否则速度过慢，用户将看到调整的过程 2013-10-21 pj add
	this._element.style.height = "auto";
	this._element.style.visibility = "visible";
}

/*	版本信息：myq 2013-4-23 add。
		
	函数说明：
		根据dialog obj对象属性，创建对应的dom元素，并在文档内显示该模态DIV窗口
	
	算法说明：
		1.根据dialog obj属性，在obj._targetWindow内动态创建div元素及其内嵌的iframe、关闭按钮等。
		2.创建DIV窗口背后的阴影背景所需的dom元素。
		3.设置Dialog和background元素的位置、尺寸，并在文档内显示。 
*/
Dialog.prototype.show = function(dialogWidth, dialogHeight){
	GLOBAL.topWindow.activeDialog = this;
	var topDocument = GLOBAL.topWindow.document;
	var topBodyElement = topDocument.body;
	
//1.创建DIV窗口背后的阴影背景所需的dom元素。
	GLOBAL.topWindow.addShadow();
	
//2.根据dialog obj属性，在obj._targetWindow内动态创建div元素及其内嵌的iframe、关闭按钮等。
	var dialogElement = topDocument.createElement("div");	//创建div浮动层
	dialogElement.className = "dialog_wrapper";
	dialogElement.id="dialog_wrapper_effect"
	
	dialogElement.style.width = (dialogWidth || 300) + "px";
	if(dialogHeight)
		dialogElement.style.height = dialogHeight + "px";
	
	dialogElement.appendChild(this._getDialogContentHtml());
	topBodyElement.appendChild(dialogElement);
	this._element = dialogElement;

	//3.根据topWindow.document大小，计算Dialog元素的显示位置，并将Dialog的dom元素设置为可见
	if(this._type != "iframe"){
		//如果dialog内是alert/conform信息，则可以马上获得dialogElement的高度，并显示该对象
		this.displayDialogElement();
	}
	else{
		//如果dialog内是iframe，则需要iframe完成文档加载后，才能获得整个dialog element的高度，需要利用iframe.onload来异步设置
		//如果要避免iframe内文档加载时间过长引起的假死现象，可以在此处设立一个interval，强制1秒后将dialog element设为可见
		setTimeout(function(){GLOBAL.topWindow.activeDialog.displayDialogElement()}, 1000);
	}
	
	if(this._onShow){
		this._onShow.call(this.parentWindow);
	}
	
}

/*	版本信息：myq 2013-6-27 add。
		
	函数说明：
		根据dialog obj对象属性，创建dialog内显示内容所需的node对象
	
	算法说明：
		1.根据dialog obj属性，在targetDocument内动态创建div元素。
		2.创建div窗口内的标题元素。
		3.创建div窗口内的内容元素(iframe等)。
		4.创建各类操作按钮，如“确定”、“取消”、“关闭等”
		5.返回div元素
*/
Dialog.prototype._getDialogContentHtml = function(){
	var contentFragment = document.createDocumentFragment();
	//1.创建标题栏
	var headElement = document.createElement("div");
	headElement.className = "head";
	headElement.innerHTML = "<i></i> " + this._title;
	//if(this._allowDrag)
	//	headElement.onmousedown = prepareDrag;
	contentFragment.appendChild(headElement);
	
	//2.创建内容栏
	var bodyElement = document.createElement("div");
	bodyElement.className = "body";
	
	if(this._type == "alert" || this._type == "confirm" || this._type == "custom" || this._type == "prompt"){
		//var divElement = document.createElement("div");
		bodyElement.className = this._type + "_content";
		
		var spanElement = document.createElement("span");
		if(this._content instanceof Node){
			spanElement.appendChild(this._content);
		}
		else{
			spanElement.innerHTML = this._content;
		}
		bodyElement.appendChild(spanElement);
	}
	else if(this._type == "iframe"){
		var iframeElement = haux.dom.createElement("iframe", 
			{src:this._content, iframeborder:0, type:"pop", name:"iframe"});
		iframeElement.style.cssText = "border:0;margin:0;padding:0;width:100%";
		iframeElement.onload = function(){
			GLOBAL.topWindow.activeDialog.displayDialogElement()
		}
		bodyElement.appendChild(iframeElement);
	}
	contentFragment.appendChild(bodyElement);
	
	//3.创建Div窗口下方的“确定”、“取消”按钮
	if(this._showDefaultButton){
		var footElement = document.createElement("div");
		footElement.className = "foot operate";
		
		var buttonElement = haux.dom.createElement("button", {type:"button"});
		buttonElement.innerHTML = "<i></i> 确定";
		buttonElement.className = "ok fire";
		buttonElement.onclick = function(){
			closeActiveDialog(GLOBAL.topWindow.activeDialog._okCallbackFunc)
		}
		footElement.appendChild(buttonElement);
		
		var buttonElement = haux.dom.createElement("button", {type:"button"});
		buttonElement.innerHTML = "<i></i> 取消";
		buttonElement.className = "cancel";
		buttonElement.onclick = function(){
			closeActiveDialog(GLOBAL.topWindow.activeDialog._cancelCallbackFunc)
		}
		footElement.appendChild(buttonElement);
		contentFragment.appendChild(footElement);
	
	}
	
	//4.Div窗口右上角的快捷关闭按钮
	var quickOpElement = document.createElement("span");
	quickOpElement.className = "quick_operate";
	
	var aElement =document.createElement("a");
	aElement.className = "quick_operate";
	aElement.onclick = function(){
		closeActiveDialog(GLOBAL.topWindow.activeDialog._closeCallbackFunc)
	}
	
	quickOpElement.appendChild(aElement);
	contentFragment.appendChild(quickOpElement);
	
	//5.return
	return contentFragment;
}
Dialog.prototype.close = function(){
	var topDocument = GLOBAL.topWindow.document;
	//1.解决ie焦点丢失bug,2013.2.1  IE防止焦点丢失的情况
	//切记，在IE中，如果焦点在某一个节点中，此时如果把此节点移除，则会丢失焦点
	if(GLOBAL.isIE){
		var focusDiv= topDocument.getElementById("focus-div-node");
		var focusNode= topDocument.getElementById("focus-node-input");;
		if(!focusDiv){
			focusDiv=topDocument.createElement("div");
			focusDiv.id="focus-div-node";
			focusDiv.className="focus-div-node";
			focusNode=topDocument.createElement("input");
			focusNode.id="focus-node-input";
			focusNode.type="text";
			focusDiv.appendChild(focusNode);
			topDocument.body.appendChild(focusDiv);
		}
		focusNode.focus();
	}

	
	//2.删除相应的dom元素
	GLOBAL.topWindow.clearShadow();
	topDocument.body.removeChild(this._element);
	this._element = null;
	GLOBAL.topWindow.activeDialog = null;
	
	//3.调用new Dialog对象时预置的事件相应函数
	if(this._onClose){
		this._onClose.call(this.parentWindow);
	}
}

Dialog.prototype.setCancelCallbackFunc = function(callbackFunc){
	this._cancelCallbackFunc = callbackFunc;
}
Dialog.prototype.setCloseCallbackFunc = function(callbackFunc){
	this._closeCallbackFunc = callbackFunc;
}
Dialog.prototype.setOkCallbackFunc = function(callbackFunc){
	this._okCallbackFunc = callbackFunc;
}

//myq add 2014-9-8日新增，类似java中的静态方法，逐步取代openDivWindow方法
//config 包含以下属性
//  1.content,用于显示的dom元素，由调用者创建，适合window窗口内元素比较简单，直接js创建元素的情况
//  2.url，用于显示的页面的url，适合已经有单独的页面，在弹出窗口用iframe显示的情况。目前还不支持相对路径
//  3.width, 窗口宽度 ，单位为px
//  4.height，窗口高度，单位为px。此高度会在页面完成加载后，按窗口内实际内容进行调整，仅适用于初始化估算高度
//  5.title，窗口的文本标题
Dialog.open = function(config){
	if(GLOBAL.topWindow.activeDialog){
		return;	
	}
	
	var dialogObj;
	if(config.content){
		dialogObj = new Dialog("custom", config.content, config.title, false, true, config.onOpen, config.onClose);
	}
	else{
		var url = "http://" + window.location.host + config.url;
		dialogObj = new Dialog("iframe", config.url, config.title, false, true, config.onOpen, config.onClose);
	}
	dialogObj.show(config.width || 600, config.height || 400);
}

//myq add 2014-9-8日新增，类似java中的静态方法，逐步取代openAlertWindow方法
//config 包含以下属性
//  1.content,用于显示的dom元素，或文本值 
//  2.width, 窗口宽度 ，单位为px
//  3.title，窗口的文本标题
//  4.ok，点击确定或者右上角关闭按钮的事件响应函数
Dialog.alert = function(config){
	if(GLOBAL.topWindow.activeDialog){
		return;	
	}
	
	if(!config.content){
		return
	}
	dialogObj = new Dialog("alert", config.content, config.title || "确定", true, true);
	
	if(config.ok){
		dialogObj.setOkCallbackFunc(config.ok);
		dialogObj.setCloseCallbackFunc(config.ok);
		dialogObj.setCloseCallbackFunc(config.ok);
	}
	
	dialogObj.show(config.width || 400);
}

//myq add 2014-9-8日新增，类似java中的静态方法，逐步取代openAlertWindow方法
//config 包含以下属性
//  1.content,用于显示的dom元素，或文本值 
//  2.width, 窗口宽度 ，单位为px
//  3.title，窗口的文本标题
//  4.ok，点击确定按钮触发的事件响应函数
//  5.cancel，点击取消或右上角关闭按钮触发的事件响应函数
Dialog.confirm = function(config){
	if(GLOBAL.topWindow.activeDialog){
		return;	
	}
	
	if(!config.content){
		return
	}
	dialogObj = new Dialog("confirm", config.content, config.title || "选择", true, true);
	
	if(config.ok){
		dialogObj.setOkCallbackFunc(config.ok);
	}
	
	if(config.cancel){
		dialogObj.setCancelCallbackFunc(config.cancel);
		dialogObj.setCloseCallbackFunc(config.cancel);
	}
	
	dialogObj.show(config.width || 400);
}

//myq add 2015-1-25日新增，模拟js的promt方法，并加入字数校验规则
//config 包含以下属性
//  1.content,用于显示的dom元素，或文本值 
//  2.width, 窗口宽度 ，单位为px
//  3.title，窗口的文本标题
//  4.ok，点击确定按钮触发的事件响应函数
//  5.cancel，点击取消或右上角关闭按钮触发的事件响应函数
//  6.min, 输入文本的最小长度
//  7.max, 输入文本的最大长度
Dialog.prompt = function(config){
	if(GLOBAL.topWindow.activeDialog){
		return;	
	}
	
	if(!config.content){
		return
	}
	
	var content = document.createDocumentFragment();
	var pElement = document.createElement("p");
	pElement.innerHTML = config.content;

	var textarea = document.createElement("textarea");
	textarea.setAttribute("placeholder", config.placeholder + "，限" + config.min + "-" + config.max + "字");
	content.appendChild(pElement);
	content.appendChild(textarea);
	dialogObj = new Dialog("prompt", content, config.title || "选择", true, true);
	
	if(config.ok){
		dialogObj.setOkCallbackFunc(config.ok);
	}
	
	if(config.cancel){
		dialogObj.setCancelCallbackFunc(config.cancel);
		dialogObj.setCloseCallbackFunc(config.cancel);
	}
	
	dialogObj.show(config.width || 400);
	
	//需要改掉"确定"按钮的onclick函数，使得点击"确定"按钮时，获取文本内容，并校验长度
	var buttonElement = dialogObj._element.getElementsByTagName("button")[0];
	buttonElement.onclick = function(){
		var textareaElement = this.parentNode.parentNode.getElementsByTagName("textarea")[0];
		var text = textareaElement.value;
		if(text.length < config.min || text.length > config.max){
			alert("请输入长度在 " + config.min + "-" + config.max + " 的文字内容");
			textareaElement.focus();
			return;
		}
		closeActiveDialog(GLOBAL.topWindow.activeDialog._okCallbackFunc, [text]);
	}
}

//  0.url，提交删除的url链接
//  1.title,标题
//  2.content,提示语言
Dialog.confirmDelete = function(config){
	Dialog.confirm({content:config.content, 
		title:config.title,
		ok:function(){
			Dialog.open({url:config.url, title:"操作结果", width:600, height:400});
		}
	});
}

//onload函数自动加载
haux.dom.addEventHandler(window, "load", function (){
    //1. 动态加载jquery的select2文件
	haux.dom.addCssFile(home() + "/style/dialog.css");
    
});