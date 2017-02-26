MobileDialog = function (title,content,type,onCancel,onConfirm){
	this.title = title;
	this.content = content;
	this.type = type;
	this._onCancel = onCancel;
	this._onConfirm = onConfirm;
}

MobileDialog.prototype.initElement = function (){
	
	var bgBoxElement =  document.createElement("div");
	bgBoxElement.id = "dialog-box-bg-id";
	bgBoxElement.className = "dialog-box-bg";
	
	var boxElement =  document.createElement("div");
	boxElement.id = "dialog-box-id";
	boxElement.className = "dialog-box";
	
	var strongElement =  document.createElement("strong");
	strongElement.id = "dialog-strong-id";
	strongElement.innerHTML = this.title;
	
	var contentElement =  document.createElement("div");
	contentElement.id = "dialog-content-id";
	contentElement.className = "content";
	contentElement.innerHTML = this.content;
	
	var aLeftElement =  document.createElement("a");
	aLeftElement.className = "dialog-btn dialog-btn-left";
	var that = this;
	aLeftElement.onclick = function(){
		that.cancel.call(that);
	};
	aLeftElement.innerHTML="取消"
	
	var aRightElement =  document.createElement("a");
	aRightElement.className = "dialog-btn dialog-btn-main";
	aRightElement.onclick = function(){
			that.confirm.call(that);
	}
	aRightElement.innerHTML="确定"
	
	bgBoxElement.appendChild(boxElement);
	boxElement.appendChild(strongElement);
	boxElement.appendChild(contentElement);
	
	if(this.type == "alert"){
		aRightElement.className ="dialog-btn dialog-btn-main dialog-btn-alert";
		aRightElement.onclick = function(){
			that.cancel.call(that);
		}
		boxElement.appendChild(aRightElement);
		
	}else{
		boxElement.appendChild(aLeftElement);
		boxElement.appendChild(aRightElement);
	}
	document.body.appendChild(bgBoxElement);
}

MobileDialog.prototype.cancel = function(){
	var bgBox = document.getElementById("dialog-box-bg-id");
	document.body.removeChild(bgBox);
	
	if(this._onCancel&&typeof(this._onCancel)=="function"){
		this._onCancel();
	}
}

MobileDialog.prototype.confirm = function(){
	var bgBox = document.getElementById("dialog-box-bg-id");
	document.body.removeChild(bgBox);
	if(this._onConfirm&&typeof(this._onConfirm)=="function"){
		this._onConfirm();
	}
}

function dialogAlert(title,content,onCancel){
	var dialog = new MobileDialog("温馨提示",content,"alert",onCancel);
	dialog.initElement();
}

function dialogConfirm(title,content,onCancel,onConfirm){
	var dialog = new MobileDialog("温馨提示",content,"alert",onCancel,onConfirm);
	dialog.initElement();
}