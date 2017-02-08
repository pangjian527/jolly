/**
 * myq add 2014-2-6，单个页面内的向导组件，自动生成的内容有三部分——
 *   1、页面上方的步骤提示
 *   2、页面中部的步骤操作界面
 *   3、底部的“下一步”、“上一步”按钮
 */
haux.component.Wizard = function(){
	//1.创建顶部的向导组件容器
	//this._describeElement = document.createElement("ul");	
	
	//2.创建中部的操作元素容器
	this._contentElement = document.createElement("div");
	this._contentElement.className = "wizard_content";
	
	//3.
	this._steps = [];
	this._stepIterator = 0;
}

Wizard = haux.component.Wizard;

Wizard.prototype.add = function(stepName, contentElement, callbackFunc, nextDescribe){
	this._steps.push({name : stepName, 
		element : contentElement, callbackFunc : callbackFunc, nextDescribe : nextDescribe});
	return this;
}

Wizard.prototype.start = function(){
	for(var i = 0; i < this._steps.length; i++){
		var step = this._steps[i];
		this._createStepContent(i, step.name, step.element, step.callbackFunc, step.nextDescribe);	
	}
	this.activeCurrent();
}

Wizard.prototype._createStepContent = function(index, stepName, stepElement, callbackFunc, nextDescribe){
	//0.将Wizard对应的导航、操作html元素，插入第一个stepElement的前面
	if(!this._describeElement){
		var divElement = document.createElement("div");
		divElement.className = "wizard_progress_info";
		divElement.innerHTML = "<ul></ul><div class='clear'></div>";
		this._describeElement = divElement.getElementsByTagName("ul")[0];
		
		var wrapElement = stepElement.parentNode;
		wrapElement.insertBefore(divElement, stepElement);
		wrapElement.insertBefore(this._contentElement, stepElement);
	}
	//1.create 顶部的提示元素
	var liElement = document.createElement("li");
	liElement.innerHTML = "<dl><dt>" + (index + 1) + "</dt><dd>" + stepName + "</dd></dl>";
	this._describeElement.appendChild(liElement);
	this._steps[index].describeElement = liElement;
	
	//2.create 中部的操作元素
	var divElement = document.createElement("div");
	divElement.className = "sleep";
	divElement.appendChild(stepElement);
	this._contentElement.appendChild(divElement);
	
	//3.如果stepElement中没有自定义导航元素，则为该步骤创建默认的导航栏
	var containNavigate = false;
	var childElement = stepElement.firstChild;
	while(childElement){
		if(childElement.tagName == "DIV" && childElement.containClass("wizard_navigate")){
			containNavigate = true;
			break;
		}
		childElement = childElement.nextSibling;
	}
	if(!containNavigate){
		var navElement = document.createElement("div");
		navElement.className = "wizard_navigate";
		var nextBtnElement = haux.dom.createElement("button", {type:"button", innerHTML:"下一步"});
		nextBtnElement.className = "next_step";
		if(nextDescribe){
			nextBtnElement.appendChild(haux.dom.createElement("span", {innerHTML:nextDescribe}));
		}
		nextBtnElement.appendChild(document.createElement("s"));
		nextBtnElement.onclick = function(){
			wizardObj.loadNext();
		}
		navElement.appendChild(nextBtnElement);
		divElement.appendChild(navElement);
	}	
}

Wizard.prototype.loadNext = function(){
	if(this._stepIterator >= this._steps.length - 1)
		return;
	//0.
	var callbackFunc = this._steps[this._stepIterator].callbackFunc;
	if(callbackFunc)
		callbackFunc();
	//1.关闭前一个
	this._steps[this._stepIterator].element.parentNode.className = "finish";
	this._steps[this._stepIterator].describeElement.className = "finish";
	
	//2.显示下一个
	this._stepIterator++;
	this.activeCurrent();
}
Wizard.prototype.activeCurrent = function(){
	this._steps[this._stepIterator].element.parentNode.className = "active";
	this._steps[this._stepIterator].describeElement.className = "active";
}

Wizard.prototype.forwardCurrent = function(){
	this._steps[this._stepIterator].element.parentNode.className = "forward";
}

haux.dom.addEventHandler(window, "load", function(){
	haux.dom.addCssFile(home() + "/style/wizard.css");
});