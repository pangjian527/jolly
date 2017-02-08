/*
 * 版本信息：2013-12-23 myq add
 * 
 * 页面用于文件ajax上传类,函数
 *  config.display: 控制如何展示已上传的附件，标准的模式包括 "text"、"small-icon"、"big-icon"
 *  config.printer：如果不采用config.display标准的三个组件模式，则采用用户自定义的priner绘制html
                                                     以满足非标准、个性化的组件需求
 *  config.hiddenElemet，用于存储attachment id数值的input元素，一般采用hidden类型，可以为空
 * 	config.maxCount 最大上传附件个数
 *  config.maxFileSize:上传文件大小控制，单位为k
 *  config.fileType:上传文件类型限制，可以采用文件后缀数组，如["doc", "docx"];或者绝对的文件类型名称，如"word"、"image"
 *  
*/
haux.component.File = function(config){
	//0.根据config对象，初始化object
	this._id = "file-" + File._seriesIndex++;
	this._hiddenElement = config.hiddenElement || haux.dom.createElement("input", {type:"hidden"});
	this._containerElement = config.containerElement;
	this._containerElement.setAttribute("fileobj", this._id);
	this._fileElement = config.fileElement;
	this._fileType = config.fileType;
	this._maxCount = config.maxCount;
	this._maxFileSize = config.maxFileSize;
	this._progressCount = 0;//正在上传的任务数量

	//1.根据displayType, 初始化displayElement元素的外观
	var printer;
	if(config.display == "text"){
		//存粹的文件列表模式，采用表格显示文件名、修改时间、大小等属性，类似win7  文件夹下详细信息浏览模式
		printer = new TextFileListPrinter(this._containerElement);
		printer.initElement(this.reachMaxFileCount());
	}
	else if(config.display == "small-icon"){
		//小图标模式，类似win7  文件夹下小图标浏览模式，采用小图标+文件名称的形式展示，暂不实现
		printer = new SmallIconListPrinter(this._containerElement);
		printer.initElement(this.reachMaxFileCount());
	}
	else if(config.display == "big-icon"){
		//大图标模式，以显示文件类型的图标为主，类似win7  文件夹下大图标浏览模式
		printer = new BigIconPrinter(this._containerElement);
		this._fileElement = printer.initElement(this.reachMaxFileCount());
	}
	else{
		//用户自定义Priner
		printer = config.printer;
		if(printer.initElement)
			printer.initElement(this.reachMaxFileCount());
	}
	this._printer = printer;
	
	//2.根据hiddenElement存储的附件id数组，ajax从后台获取已上传附件的详细信息，并进行展示
	var attachmentIds = this._hiddenElement.value;
	
	if(attachmentIds && printer.showAttachments){
		$.ajax({url : home()+ "/common/file/upload.do?op=get&ids=" + attachmentIds,
		    type:"get",
			dataType: "json",
		    error: function(){
				alert("query error");
			}, 
			success:function(attachments){
				if(attachments && attachments.length){
					printer.showAttachments(attachments);
				}
			}
		});	
	}
	
	//3.为fileElement绑定onchange事件
	this._fileElement.onchange = function(){
		var fileObj = File.getObj(this.getAttribute("fileobj"));
		fileObj.startUpload();
	}
	this._fileElement.setAttribute("fileobj", this._id);
	
	//4.在公共地点注册，方便后续其他element元素根据id直接获得 File Object对象
	//而不采用闭包引用方式，因为闭包容易引发内存泄漏，写要求函数嵌套编写
	this._regist(this);
	
	//5.最大附件上传数量检验 
	
	this._fileElement.onclick = function(ev){
		var fileObj = File.getObj(this.getAttribute("fileobj"));
		if(fileObj.reachMaxFileCount()){
			alert("附件数量已达到最大值，无法继续上传。");
			haux.dom.stopDefaultEvent(ev);
			//haux.dom.stopPropagateEvent(ev);
		}
	}
	//6.检验fileElement.name是否等于fileUpload
	if(this._fileElement.name != "fileUpload")
		alert("文件元素名称属性必须为fileUpload，无法上传附件")
}

File = haux.component.File;

File._seriesIndex = 0;

File.prototype._objectPool = {};

File.prototype._regist = function(fileObj){
	this._objectPool[fileObj._id] = fileObj;
}

File.getObj = function(id){
	return this.prototype._objectPool[id];
}

File.prototype.reachMaxFileCount = function(){
	return this._maxCount > 0 
		&& (this.getAttachmentIds().length + this._progressCount) >= this._maxCount;
}

File.prototype.getAttachmentIds = function(){
	return this._hiddenElement.value ? this._hiddenElement.value.split(",") : [];
}
File.prototype.getAttachmentId = function(){
	var ids = this.getAttachmentIds();
	return ids.length ? ids[0] : null;
}
/*
 * 版本信息： 2013-12-24 myq 
 * 
 * 功能说明：用户处理ajaxfile文件上传，由fileElement.onchange事件调用，this对象为File对象
 * 
 * 方法说明：用于把文件把请求提交到服务器
 * 
 * 			1、调用jquery的ajaxFileUpload方法
 * 
 * 			2、设置需要上传文件的控件（input type=file）Id
 * 
 * 			3、设置成功后的回调函数（that.ajaxSuccess）
*/
File.prototype.startUpload = function (){
	//0.预处理，为file元素添加id属性(jquery fileUpload框架需要)
	var fileObj = this;	
	if(!this._fileElement.id){
		this._fileElement.id = this._id;
	}
	
	//1.检验文件扩展名是否有效
	var filePath = this._fileElement.value;
	var fileName = filePath.substring(filePath.lastIndexOf('\\') + 1);
	if(this._fileType && !_validateFileExtension(fileName, this._fileType)){
		return;
	}
	//
	this._progressCount++;
	var progressElement = this._printer.startUploadProgress(filePath, this.reachMaxFileCount());
	//1.1 先创建任务ID
	/*var progressId = haux.dom.createProgressClient({interval:500,
		refresh:function(progress){
			fileObj.refreshUploadProgress(progress, progressElement);
		}
	});*/
	
	//2.ajax提交文件上传请求
	
	var fileId = this._fileElement.id;
	$.ajaxFileUpload({
         url : home()+ "/common/file/upload.do?op=upload",           
         secureuri : false,
         fileElementId : fileId,
         data:{maxFileSize:this._maxFileSize},
         dataType : "json",       
         success: function (data, status){
        	 fileObj._progressCount--;
        	 if(data.error){
        		 fileObj.cancelUpload(data, progressElement);
        	 }
        	 else{
        		 fileObj.finishUpload(data, progressElement);
        	 }
         },
         error: function (data, status, e){
        	 this._progressCount--;
        	 fileObj.cancelUpload({error:"network-error"}, progressElement);
         }
     });
	
	//3.jquery.ajaxFileUpload框架处理时，会先clone一个file元素（类似替身）顶替其原有位置
	//随后再将真实选择了文件的file元素move到jquery生成的iframe内，修改元素id，再向服务器端发送http请求完成文件上传。
	//尽管clone产生的替身file元素表面上和原file元素的属性、位置完全一样，但其onchange响应函数为空，没有实际的上传文件能力
	//为确保在同一个file组件内无刷新的上传多个文件，需要重新绑定this._fileElement，并设置onchange响应函数
	var filePath = this._fileElement.value;
	var cloneFileElement = document.getElementById(fileId);
	cloneFileElement.onchange = this._fileElement.onchange;
	cloneFileElement.onclick = this._fileElement.onclick;
	
	this._fileElement.onchange = null;
	this._fileElement.onclick = null;
	this._fileElement = cloneFileElement;
	
}
//检验fileName是否符合fileType的限制条件
function _validateFileExtension(fileName, fileType){
	//1.取用户选的的文件扩展名
	var pos = fileName.lastIndexOf(".");
	var fileExtension = pos == -1 ? null : fileName.substring(pos + 1).toLowerCase();
	
	//2.取允许上传的文件扩展名列表
	var validFileExtensions = (fileType instanceof Array) ?
		fileType : _getFileExtensions(fileType);
	
	//3.比较是否合法
	if(validFileExtensions.length && !validFileExtensions.contain(fileExtension)){
		var errorStr = "请选择正确的上传文件，文件扩展名应当为 ";
		if(validFileExtensions.length == 1){
			errorStr += validFileExtensions[0] + "。";
		}
		else if(validFileExtensions.length == 2){
			errorStr += validFileExtensions[0] + " 或 " + validFileExtensions[1] + "。";
		}
		else{
			var len = validFileExtensions.length;
			errorStr += validFileExtensions.slice(0, len - 2).join("、") 
				+ " 或 " + validFileExtensions[len - 1] +　"。";
		}
		alert(errorStr)
		return　false;
	}
	return true;
}
/**
 * 由定时器调用，从service层获取文件上传的进度，随后在前端页面展现
 * finishedSize：整形，数值为已经上传的文件数量，单位为k（目前暂不实现，只是循环的1-2-3切换）
 * progressElement:上传任务在界面对应的div元素
 * @memberOf {TypeName} 
 */

//
File.prototype.refreshUploadProgress = function(progress, progressElement){
	this._printer.refreshUploadProgress(progressElement, progress, this._fileSize);
}
//删除所有的附件
File.prototype.clearAttachments = function(){
	//1.更新 hidden元素的值
	var ids = this._hiddenElement.value.split(",");
	this._hiddenElement.value = "";
	
	//2.调用printer完成页面的重绘
	if(this._printer.deleteAttachment){
		for(var i = 0; i < ids.length; i++){
			this._printer.deleteAttachment(ids[i], this.reachMaxFileCount());
		}
	}
}
/**
 * 删除一个附件
 */
File.prototype.deleteAttachment = function(attachmentId){
	//1.更新 hidden元素的值
	var ids = this._hiddenElement.value.split(",");
	for(var i = 0; i < ids.length; i++){
		if(ids[i] == attachmentId){
			ids.splice(i, 1);
			break;
		}
	}
	this._hiddenElement.value = ids.join(",");
	
	//2.调用printer完成页面的重绘
	if(this._printer.deleteAttachment){
		this._printer.deleteAttachment(attachmentId, this.reachMaxFileCount());
	}
}

/**
 * 将一个附件的顺序向上提1位
 */
File.prototype.riseAttachment = function(attachmentId){
	//1.更新 hidden元素的值
	var ids = this._hiddenElement.value.split(",");
	var index = ids.indexOf(attachmentId);
	if(index == 0){
		return;
	}
	ids[index] = ids[index - 1];
	ids[index - 1] = attachmentId;
	
	this._hiddenElement.value = ids.join(",");
	
	//2.调用printer完成页面的重绘
	if(this._printer.riseAttachment){
		this._printer.riseAttachment(attachmentId);
	}
}

/**
 * 将一个附件的顺序向下降1位
 */
File.prototype.dropAttachment = function(attachmentId){
	//1.更新 hidden元素的值
	var ids = this._hiddenElement.value.split(",");
	var index = ids.indexOf(attachmentId);
	if(index == (ids.length - 1)){
		return;
	}
	ids[index] = ids[index + 1];
	ids[index + 1] = attachmentId;
	
	this._hiddenElement.value = ids.join(",");
	
	//2.调用printer完成页面的重绘
	if(this._printer.dropAttachment){
		this._printer.dropAttachment(attachmentId);
	}
}

/**
 * 由$.ajaxFileUpload执行成功后，success function调用
 * @param {Object} attachment：附件在服务器端保存后的attachment entity
 * @memberOf {TypeName} 
 */
File.prototype.finishUpload = function(attachment, progressElement){
	//0.停止从服务器端动态获取文件上传进度的定时器
	if(this._interval){
		clearInterval(this._interval);
		this._interval = null;
	}
	
	//1.更新hiddenElement.value
	if(this._hiddenElement.value){
		this._hiddenElement.value += "," + attachment.id;
	}
	else{
		this._hiddenElement.value = attachment.id;
	}
	
	//2.根据attachment 对象，跟新displayElement内显示的附件列表
	this._printer.finishUploadProgress(progressElement, attachment);
}

File.prototype.cancelUpload = function(errorObj, progressElement){
	//0.停止从服务器端动态获取文件上传进度的定时器
	if(this._interval){
		clearInterval(this._interval);
		this._interval = null;
	}
	
	//1.根据errorObj.error值 ，分情况告知错误原因
	if(errorObj.error == "file-size-overflow"){
		//上传文件过大，超出了 this._config.maxFileSize允许的范围
		alert("上传文件大小不能超过" + this.getFileSizeDescribe(this._maxFileSize * 1024) + "。");
	}
	else if(errorObj.error == "network-error"){
		//网络异常
		alert("与服务器连接出现异常，请检查网络是否正常。")
	}
	
	//2.从界面上删除进度块
	this._printer.cancelUploadProgress(progressElement);
}



//fileSize单位为 byte
File.prototype.getFileSizeDescribe = function(fileSize){
	var unit;
	var size;
	if(fileSize < 1024){
		//byte级别
		unit = " Byte";
		size = fileSize
	}
	else if(fileSize < 1024 * 1024){
		//k级
		unit = " K";
		size = fileSize / 1024;
	}
	else if(fileSize < 1024 * 1024 * 1024){
		//m级
		unit = " M";
		size = fileSize / 1024 / 1024;
	}
	else{
		//g级
		unit = " G";
		size = fileSize / 1024 / 1024 / 1024;
	}
	
	if(size > 99)
		return Math.floor(size) + unit;
	else if(size > 9)
		return Math.floor(size * 10) / 10 + unit;
	else
		return Math.floor(size * 100) / 100 + unit;
}
File.getFileSizeDescribe = function(fileSize){
	return File.prototype.getFileSizeDescribe(fileSize);
}

_fileExtensionMap = {
	word:["doc", "docx"], 
	excel:["xls", "xlsx"],
	pdf:["pdf"],
	zip:["zip", "rar", "7z"],
	image:["jpg", "jpeg", "jpe", "jfif", "png", "bmp", "dib", "gif", "tif", "tiff"],
	audio:["mp3", "wav", ""],
	video:["avi", "rmvb", "rm", "asf", "divx", "mpg", "mpeg", "mpe", "wmv", "mp4", "mkv", "vob","flv"]
}
/**
 * 返回该类型允许的文件扩展名数组
 * fileType:字符串，文件类型，可选项包括doc/excel/pdf/zip/image/audio/video...，
 */

_getFileExtensions = function(fileType){
	return fileType ? _fileExtensionMap[fileType.toLowerCase()] : [];
}

_fileTypeMap = {};
for(var property in _fileExtensionMap){
	var fileExtensions = _fileExtensionMap[property];
	for(var i = 0; i < fileExtensions.length; i++){
		_fileTypeMap[fileExtensions[i]] = property;
	}
}
/**
 * 返回某个文件名对应的文件类型,返回值包括doc/excel/pdf/zip/image/audio/video...
 * fileExtension:字符串，文件扩展名，如"doc", "docx"，
 */
_getFileType = function(fileName){
	//1.找到文件扩展名（也有可能扩展名为空）
	var pos = fileName.lastIndexOf(".");
	var fileExtension = pos == -1 ? null : fileName.substring(pos + 1).toLowerCase();
	
	//2.从字典_fileTypeMap里面找
	return fileExtension ? _fileTypeMap[fileExtension.toLowerCase()] || "unknown" : "none";
}

/*
 * File组件的辅助HTML渲染类，负责响应file组件的各种事件，在html显示对应内容
 */
BigIconPrinter = function(containerElement){
	this._containerElement = containerElement;	
}
/*
 * file组件初始化时调用此函数，初始化containerElement的外观
  这里是要生成以下结构的html，用于显示 上传附件 按钮
	<div class="add">
		<a>+</a>
		<input type="file" />
	</div>
*/
BigIconPrinter.prototype.initElement = function(reachMaxFileCount){
	this._containerElement.addClass("files_big_icon");
	
	var divElement = haux.dom.createElement("div", {className : "add"});
	var aElement = haux.dom.createElement("a", {innerHTML : "+"});
	
	divElement.appendChild(aElement);
	
	var fileElement = haux.dom.createElement("input", {type : "file", name:"fileUpload"});
	divElement.appendChild(fileElement);
	if(reachMaxFileCount){
		divElement.style.display = "none";
	}
	
	this._containerElement.appendChild(divElement);
	
	this._containerElement.addClearElement();
	
	return fileElement;
}
/*
 * file组件初始化时，如果根据hidden.value中保存的id数组，从后端服务器能找到attachment数组
 * 则file组件会调用该函数，传递attachment数组，在container中显示已上传的附件列表
*/
BigIconPrinter.prototype.showAttachments = function(attachments){
	//1.识别出包含file的operate div
	var divElements = this._containerElement.getElementsByTagName("div");
	var addElement = divElements[divElements.length - 2];
	
	//2.按新的attachments数组，重新生成html
	for(var i = 0; i < attachments.length; i++){
		var divElement = this._createAttachmentDiv(attachments[i], true)
		this._containerElement.insertBefore(divElement, addElement);
	}
}

/*
 * 删除某个附件后，file组件会调用该函数，以便从界面上删除该附件的显示元素
*/
BigIconPrinter.prototype.deleteAttachment = function(attachmentId, reachMaxFileCount){
	var divElement = document.getElementById("attachment_" + attachmentId);
	
	var addDivElement = divElement.nextSibling;
	while(addDivElement){
		if(addDivElement.containClass("add")){
			if(!reachMaxFileCount){
				addDivElement.style.display = "block";
			}
			break;
		}
		addDivElement = addDivElement.nextSibling;
	}
	divElement.parentNode.removeChild(divElement);
	
}

/*
 * 上升某个附件的排名后，file组件会调用该函数，以便从界面上改变元素的顺序
*/
BigIconPrinter.prototype.riseAttachment = function(attachmentId, reachMaxFileCount){
	var targetElement = document.getElementById("attachment_" + attachmentId);
	var relativeElement = targetElement.previousSibling;
	while(relativeElement.tagName != "DIV"){
		relativeElement = relativeElement.previousSibling;
	}
	targetElement.parentNode.insertBefore(targetElement, relativeElement);
}

/*
 * 上升某个附件的排名后，file组件会调用该函数，以便从界面上改变元素的顺序
*/
BigIconPrinter.prototype.dropAttachment = function(attachmentId, reachMaxFileCount){
	var targetElement = document.getElementById("attachment_" + attachmentId);
	var relativeElement = targetElement.nextSibling;
	while(relativeElement.tagName != "DIV"){
		relativeElement = relativeElement.nextSibling;
	}
	targetElement.parentNode.insertBefore(relativeElement, targetElement);
}

/*
 *根据attachment对象创建 显示已上传附件的div。内部函数,file组建不调用。生成的html结构如下
	<div class="attachment">
	  <i></i>
	  <a>文件名称</a>
	  <span>文件大小</span>
	  <button>删除</button>
	</div>
*/
BigIconPrinter.prototype._createAttachmentDiv = function(attachment, allowDelete){
	var divElement = haux.dom.createElement("div", {className : "attachment",id:"attachment_" + attachment.id});
	var fileName = attachment.fileName;
	var fileType = _getFileType(fileName);
	//var fileSrc = "/htw/file/get.do?id=" + attachment.id;
	
	
	//1.i标签
	if(fileType == "image"){
		var imgSrc = home() + "/img-" + attachment.id + ".do";
		var imgThumbSrc = home() + "/img-" + attachment.id + "_100X100.do";
		var imgShellDiv = haux.dom.createElement("div", {className:"img-shell"});
		
		imgShellDiv.innerHTML = "<span><a href=\"" + imgSrc 
			+ "\" target=\"_blank\"><img src=\"" + imgThumbSrc + "\" /></a></span>";
		///htw/img-f8985e774adebdb7014ae2993ba3009f_100x100.do
		divElement.appendChild(imgShellDiv);
	}
	else{
		var iElement = document.createElement("i");
		iElement.className = fileType;
		//iElement.innerHTML = fileName;
		divElement.appendChild(iElement);
	}
	
	
	//2.a标签
	//var href = home() + "/" + attachment.dir + "/" + encodeURI(attachment.serviceName);
	var href = '#';
	var aElement = haux.dom.createElement("a", {innerHTML : fileName, title : fileName, href : href, target : "_blank"});
	aElement.href = home() + "/" + attachment.dir + "/" + attachment.serviceName;
	aElement.href = "/htw/file/get.do?id=" + attachment.id;
	divElement.appendChild(aElement);
	
	//3.span标签

	
	//4.button标签
	if(allowDelete){
		var buttonElement = haux.dom.createElement("button", {type:"button", innerHTML:"删除", title:"删除"});
		buttonElement.onclick = function(){
			//a.删除node
			var fileObj = File.getObj(this.parentNode.parentNode.getAttribute("fileobj"));
			fileObj.deleteAttachment(attachment.id);
			//b.删除元素
			//this.parentNode.parentNode.removeChild(this.parentNode);
		}
		divElement.appendChild(buttonElement);
		
		//调整顺序的按钮，用于向前一位
		var buttonElement = haux.dom.createElement("button", 
			{type:"button", className:"rise", innerHTML:"前进", title:"前进"});
		buttonElement.onclick = function(){
			//a.删除node
			var fileObj = File.getObj(this.parentNode.parentNode.getAttribute("fileobj"));
			fileObj.riseAttachment(attachment.id);
			//b.删除元素
			//this.parentNode.parentNode.removeChild(this.parentNode);
		}
		divElement.appendChild(buttonElement);
		
		//调整顺序的按钮，用于向后一位
		var buttonElement = haux.dom.createElement("button", 
			{type:"button", className:"drop", innerHTML:"后退", title:"后退"});
		buttonElement.onclick = function(){
			//a.删除node
			var fileObj = File.getObj(this.parentNode.parentNode.getAttribute("fileobj"));
			fileObj.dropAttachment(attachment.id);
			//b.删除元素
			//this.parentNode.parentNode.removeChild(this.parentNode);
		}
		divElement.appendChild(buttonElement);
	}
	/*
	//5.myq add 2014-2-12,仿照网易预览附件popbox效果，鼠标进入附件范围后浮现 下载、打开、播放等操作栏
	divElement.onmouseover = function(){
		//5.1 鼠标进入时，创建一个popbox窗口
		if(!haux.component.Popbox)
			return;
		if(this.popboxObj)
			return;
		
		var dlElement = document.createElement("dl");
		dlElement.className = "files_attachment_operate";
		dlElement.appendChild(haux.dom.createElement("dt", {innerHTML:attachment.logicName}));
		
		var attachmentObj = attachment;
		var ddElement = haux.dom.createElement("dd", {className:"download", innerHTML:"<i></i>下载"});
		dlElement.appendChild(ddElement);
		ddElement.onclick = function(){
			window.location.href=home()+"/common.attachment.OperateAction!execute.action?fileName="+attachmentObj.serviceName;
			///alert("这里要实现下载文件到本地，attachment来自闭包对象\n" + haux.util.Json.getString(attachmentObj));
		}
		var ddElement = haux.dom.createElement("dd", {className:"open", innerHTML:"<i></i>打开"});
		dlElement.appendChild(ddElement);
		ddElement.onclick = function(){
			window.open(home()+"/"+attachmentObj.dir+"/"+attachmentObj.serviceName,"newwindow");
			//alert("这里要实现浏览器打开文件，attachment来自闭包对象\n" + haux.util.Json.getString(attachmentObj));
		}
		
		if(fileType == "video"){
			//视频，在线播放
			var ddElement = haux.dom.createElement("dd", {className:"display", innerHTML:"<i></i>播放"});
			dlElement.appendChild(ddElement);
			ddElement.onclick = function(){
				//alert("这里要实现播放视频功能，attachment来自闭包对象\n" + haux.util.Json.getString(attachmentObj));
				var operateUrl =home()+"/common.attachment.OperateAction!openFile.action?id="+attachmentObj.id;
				openDivWindow(operateUrl, 520, 300, '视频播放', false);
			}
		}
		else if(fileType == "audio"){
			//音频，在线播放
			var ddElement = haux.dom.createElement("dd", {className:"display", innerHTML:"<i></i>播放"});
			dlElement.appendChild(ddElement);
			ddElement.onclick = function(){
				alert("这里要实现播放音频功能，attachment来自闭包对象\n" + haux.util.Json.getString(attachmentObj));
			}
		}
		
		var ddElement = haux.dom.createElement("dd", {className:"delete", innerHTML:"<i></i>删除"});
		dlElement.appendChild(ddElement);
		ddElement.onclick = function(that){
			
			//使用闭包
			return function(){
				if(!window.confirm("确认删除此附件吗？"))
					return;
				$.ajax({
			    url: home()+"/common.attachment.OperateAction!delete.action?id="+attachmentObj.id,
			    type: 'get',
			    error: function(jdata){alert("操作失败");},
			    success: function(result){
			    	if(result=="success"){
			    		var fileObj = File.getObj(that.parentNode.getAttribute("fileobj"));
						fileObj.deleteAttachment(attachmentObj.id);
						that.popboxObj.close();
			    	}
			    }});
			}
			//alert("这里要实现删除附件功能，attachment来自闭包对象\n" + haux.util.Json.getString(attachmentObj));
		}(this);
		var popboxContent = document.createDocumentFragment();
		popboxContent.appendChild(dlElement);
		popboxContent.appendChild(haux.dom.createElement("div", {className:"clear"}));
		
		divElement.popboxObj = showPopboxInRelativePos(popboxContent, 
			this.getElementsByTagName("i")[0], 
			1, "dark", 0, -10, "");
		
	}
	divElement.onmouseout = function(ev){
		if(!this.popboxObj)
			return;
		
		ev = ev || event;
		var toElement = ev.relatedTarget || ev.toElement;//获知鼠标移到了哪个元素
		if(this.contain(toElement) || this.popboxObj.containElement(toElement)){
			//如果鼠标移到了divElement的子元素，或者popbox上，不用关闭
			return;
		}
		//5.2鼠标移到其它区域，则需要关闭这个窗口
		if(divElement.popboxObj){
			divElement.popboxObj.close();
			delete divElement.popboxObj;
		}
	}
	*/
	return divElement;
}

/*
 * 开始上传某个附件后，file组件会调用一次该函数，以便从界面上显示上传信息
*/
BigIconPrinter.prototype.startUploadProgress = function(filePath, reachMaxFileCount){
	//1.取得文件名称、后缀等信息
	var fileName = filePath.substring(filePath.lastIndexOf('\\') + 1);
	//var suffix = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
	
	var addElement = this._containerElement.getElementsByTagName("div")[0];
	
	//2.插入html，显示当前正在进行上传工作
	var divElement = haux.dom.createElement("div", {className : "progress"});
	var iElement = document.createElement("i");
	iElement.className = _getFileType(fileName);
	divElement.appendChild(iElement);
	
	var aElement = haux.dom.createElement("a", {innerHTML : fileName, title : fileName});
	divElement.appendChild(aElement);
		
	var spanElement = haux.dom.createElement("span", {innerHTML : "正在上传..."});
	divElement.appendChild(spanElement);
	var intervalCount = 0;
	this._interval = setInterval(function(){
		var innerHTML = spanElement.innerHTML;
		
		if(intervalCount == 0){
			spanElement.innerHTML = "正在上传.";
			intervalCount++;
		}
		else if(intervalCount == 1){
			spanElement.innerHTML = "正在上传..";
			intervalCount++;
		}
		else if(intervalCount == 2){
			spanElement.innerHTML = "正在上传...";
			intervalCount = 0;
		}
	}, 500);
	
	//2.找到add element
	var addElement = null;
	var divElements = this._containerElement.getElementsByTagName("div");
	for(var i = 0, len = divElements.length; i < len; i++){
		if(divElements[i].className == "add"){
			addElement = divElements[i];
			break;
		}		
	}
	
	//3.插入元素
	this._containerElement.insertBefore(divElement, addElement);
	
	//4.
	var addDivElement = divElement.nextSibling;
	while(addDivElement){
		if(addDivElement.containClass("add")){
			if(reachMaxFileCount){
				addDivElement.style.display = "none";
			}
			break;
		}
		addDivElement = addDivElement.nextSibling;
	}
	
	//5.返回生成的divElement
	return divElement;
}

/*
 * 在附件上传的过程，如果file组件采用ajax方式获取到了已上传的字节数
 * 则会调用本函数，以便持续的更新上传进度，告知用户上传任务的完成比例（目前是假的）
*/
BigIconPrinter.prototype.refreshUploadProgress = function (progressElement, progress, totalSize){
	//1.更新div下的span
	var spanElement = progressElement.getElementsByTagName("span")[0];
	
	if(progress.describe)
		spanElement.innerHTML = progress.describe;
}
/*
 * 附件上传成功后，file组件调用本函数，以便告知用户上传结果
 * 并将containerElement内显示上传进度的html元素删除，改为显示新上传的文件信息
*/
BigIconPrinter.prototype.finishUploadProgress = function(progressElement, attachment){
	var divElement = this._createAttachmentDiv(attachment, true);
	var spanElement = haux.dom.createElement("span", {innerHTML : "文件已完成上传"});
	divElement.appendChild(spanElement);
	this._containerElement.replaceChild(divElement, progressElement);
}
/*
 * 附件上传不成功或被取消，file组件调用本函数，以便从containerElement内将显示上传进度的html元素删除
*/
BigIconPrinter.prototype.cancelUploadProgress = function(progressElement){
	this._containerElement.replaceChild(progressElement);
}



/********************************************************************************************
 * 写一个空白的printer例子
 * File组件的辅助HTML渲染类，负责响应file组件的各种事件，在html显示对应内容
 *******************************************************************************************/
SamplePrinter = function(containerElement){
	this._containerElement = containerElement;	
}

/*
 * file组件初始化时调用此函数，初始化containerElement的外观，包括设置css样式、初始化组件外观等
 */
SamplePrinter.prototype.initElement = function(reachMaxFileCount){
	//1.设置container的样式
	
	//2.创建需要的html元素
	
}

/*
 * file组件初始化时，如果根据hidden.value中保存的id数组，从后端服务器能找到attachment数组
 * 则file组件会调用该函数，传递attachment数组，在container中显示已上传的附件列表
 */
SamplePrinter.prototype.showAttachments = function(attachments){
	//按attachments数组，生成显示已上传附件的html
	for(var i = 0; i < attachments.length; i++){
		//
	}
}

/*
 * 删除某个附件后，file组件会调用该函数，以便从界面上删除该附件的显示元素
 */
SamplePrinter.prototype.deleteAttachment = function(attachmentId, reachMaxFileCount){
	//1.从containerElement删除该附件对应的html元素
	
	//2.根据reachMaxFileCount，切换file元素的外观
}

/*
 * 开始上传某个附件后，file组件会调用一次该函数，以便从界面上显示上传信息
*/
SamplePrinter.prototype.startUploadProgress = function(filePath, reachMaxFileCount){
	//1.取得文件名称、后缀等信息
	var fileName = filePath.substring(filePath.lastIndexOf('\\') + 1);
	
	//2.在containerElement插入html元素，显示当前正在进行上传工作
	
	//3.根据reachMaxFileCount，切换file元素的外观
	
	//4.返回progress对应的element
	return divElement;
}

/*
 * 在附件上传的过程，如果file组件采用ajax方式获取到了已上传的字节数
 * 则会调用本函数，以便持续的更新上传进度，告知用户上传任务的完成比例（目前是假的）
*/
SamplePrinter.prototype.refreshUploadProgress = function (progressElement, finishSize, totalSize){
	//1.根据上传比例，更新progressElement内容，显示上传进度
	
}
/*
 * 附件上传成功后，file组件调用本函数，以便告知用户上传结果
 * 并将containerElement内显示上传进度的html元素删除，改为显示新上传的文件信息
*/
SamplePrinter.prototype.finishUploadProgress = function(progressElement, attachment){
	var divElement = this._createAttachmentDiv(attachment, true);
	this._containerElement.replaceChild(divElement, progressElement);
}
/*
 * 附件上传不成功或被取消，file组件调用本函数，以便从containerElement内将显示上传进度的html元素删除
*/
SamplePrinter.prototype.cancelUploadProgress = function(){
	this._containerElement.removeChild(progressElement);
}

haux.dom.addEventHandler(window, "load", function(){
	haux.dom.addCssFile(home() + "/style/file.css");
});
