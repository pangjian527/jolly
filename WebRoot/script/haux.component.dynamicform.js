/**
	myq 2013-5-28 add
		根据后端动态生成的dynamocObject数据类型，动态生成对应的表单输入元素和文字提示内容
		* 
	组件调用方式：
		1.后端将DynamicObjectData实例转化为json字符串，采用el表达式写入前端jsp页面
		2.jsp页面获得该json字符串，并转换成js object对象
		3.调用createElement方法，生成用于查看/编辑该dynamicObject对象的html元素
		4.将html元素插入当前页面内进行显示
**/

/***********************************************************************************************
	Part 0 —— 定义DynamicForm的公共数、全局静态变量等
***********************************************************************************************/
haux.component.DynamicForm = function(dynData, namePrefix, config){
	//this._dynamicClass = dynData.dynamicClass;
	this._items = [];
	//this.additionalScripts = [];
	this._listeners = {};
	//this._id = DynamicForm.seriesIndex++;
	DynamicForm.registInstance(this);
	//var newPrototype = new DynamicProperty();
	for(var i = 0; i < dynData.dynamicItems.length; i++){
		var dynItem = dynData.dynamicItems[i];
		if(dynItem.dataType){
			var dynProperty = new DynamicProperty(dynItem);
			dynProperty.elementName = namePrefix ?  
				namePrefix + ".dynamicItems[" + i + "].value" : "dynamicItems[" + i + "].value" ;
			
			dynProperty.formId = this.id; 
			this._items.push(dynProperty);
		}
		else{
			var dynLabel = new DynamicLabel(dynItem);
			dynLabel.formId = this.id; 
			this._items.push(dynLabel);
		}
	}
}
DynamicForm = haux.component.DynamicForm;
DynamicForm.seriesIndex = 0;//popbox obj序列号起始值
DynamicForm.instances = {};//记录当前在页面创建的DynamicForm对象，类似java的静态公有变量
DynamicForm.registInstance = function(instance){
	if(instance instanceof DynamicForm){
		instance.id = this.seriesIndex++;
		DynamicForm.instances[instance.id] = instance;
	}
}

DynamicForm.getInstance = function(id){
	return this.instances[id];
}


/*	
	函数说明：根据dynamicObject对象内容，动态创建表单输入元素
	
	算法说明：
		1.遍历dynObject.dynItems数组
		2.如item为辅助性质的文字标签，生成对应的group div，或者文字提示div元素
		3.如item为基本数据类型的动态参数，则需要生成表单输入控件和文字提示
		4.如item.fieldValue为嵌套的子对象或子对象，则递归生成子对象/子对象数组的输入元素，并插入
		
	参数说明：
		dynObject：DynamicObjectData对象
		namePrefix：动态生成的text/select/radio等输入元素的name属性的前缀，便于save时通过pop方法一次性获取表单输入值
*/
DynamicForm.prototype.createElement = function(){
	if(this._items.length == 0)
		return null;
	
	this._additionalScripts = [];
	this._notifyItems = [];
	
	var divElement = document.createElement("div");
	divElement.className = "dynamic_form";
	this._element = document.createDocumentFragment();
	this._element.appendChild(divElement);
	var parentNode = divElement;//dynamicProperty,dynamicLabel生成的html的上级对象，默认是挂在this._element下
	
	DynamicForm.groupIndex = 0;
	for(var  i = 0; i < this._items.length; i++){
		var dynItem = this._items[i];
		//dynItem.formSeriesNo = this._seriesNo;
		if(dynItem.config.breakline == "before"){
			parentNode.appendChild(document.createElement("s"));		
		}
		
		var dynElement = dynItem.createElement();

		if(dynItem instanceof DynamicLabel){
			//生成辅助性的文字标签，如 一级标题/二级标题/文本说明 等 	 
			//dynElement = dynItem.createElement();
			if(dynItem.isMainTitle()){
				if(parentNode.innerHTML){
					parentNode.addClearElement();
				}
				//发现的是一级标题，说明要另起门户了
				this._element.appendChild(dynElement);
				parentNode = dynElement;//在其后出现的dynamicProperty都要附加在新的div下
			}
			else{
				//发现只是二级标题或者文本备注，插入生成的h4即可
				parentNode.appendChild(dynElement);
			}
		}
		else{
			//生成动态属性表单元素	
			parentNode.appendChild(dynElement);
		}
		
		if(dynItem.config.className){
			dynElement.addClass(dynItem.config.className);
		}
		if(dynItem.config.id){
			dynElement.id = dynItem.config.id;
		}
		
		if(dynItem.config.breakline == "after"){
			parentNode.appendChild(document.createElement("s"));		
		}
		
		//处理 config参数中的各类条件，主要是增加监听事件
		var visibleScript = dynItem.config.visible;
		var valueScript = dynItem.config.value;
		var optionScript = dynItem.config.options;
		if(visibleScript || valueScript || optionScript){
			//公式 
			var parameters = _getParameters(visibleScript + "\n" + valueScript + "\n" + optionScript);
			for(var j = 0; j < parameters.length; j++){
				this.registListener(parameters[j], dynItem);
			}
			//onload后，强制调用一次dynamic item对象的notify函数，执行对应的可见状态切换逻辑
			if(visibleScript || valueScript){
				this._notifyItems.push(dynItem)
			}
		}	

		//处理附加脚本
		var additonalScript = dynItem.config.additionalScript;
		if(additonalScript){
			var itemId = dynItem.config.id || "dyn_p_" + DynamicForm.seriesIndex++;
			if(!dynElement.id){
				dynElement.id = itemId;
			}
			var scriptText = additonalScript.replace(/\$\{dyn_p_id\}/g, itemId);
			this._additionalScripts.push(scriptText);
		}		
	}
	parentNode.addClearElement();
	//alert(divElement.innerHTML)
	if(!divElement.innerHTML){
		divElement.parentNode.removeChild(divElement);
	}
	
	//3.返回
	return this._element;
}

//myq add 2014-9-8日新增，强制调用附加的脚本和消息事件，结束创建过程 
DynamicForm.prototype.finalize = function(){
	for(var i = 0; i < this._additionalScripts.length; i++){
		var script = this._additionalScripts[i]
		try{
			eval(script);
		}
		catch(err){
			alert("script execute error\nscriptt is:" 
				+ script 
				+ "\nerror message:" + err.message);
		}
	}
	for(var i = 0; i < this._notifyItems.length; i++){
		try{
			this._notifyItems[i].notify("init");
		}
		catch(err){
			alert("message init error\ntarget is:" 
				+ haux.util.Json.getString(this._notifyItems[i]) 
				+ "\nerror message:" + err.message);
		}
	}
}

DynamicForm.prototype.registListener = function(propertyName, srcObj){
	if(this._listeners.hasOwnProperty(propertyName)){
		this._listeners[propertyName].push(srcObj);
	}
	else{
		this._listeners[propertyName] = [srcObj];
	}
}
DynamicForm.prototype.notify = function(eventName, propertyName){
	//暂时忽略eventName，默认只有onchange时间会通知
	if(this._listeners.hasOwnProperty(propertyName)){
		var listeners = this._listeners[propertyName];
		for(var i = 0; i < listeners.length; i++){
			try{
				listeners[i].notify(eventName, propertyName);
			}
			catch(e){
				
			}
		}
	}
} 

DynamicForm.prototype.getPropertyValue = function(propertyName){
	for(var i = 0; i < this._items.length; i++){
		var dynamicItem = this._items[i];
		if(dynamicItem instanceof DynamicProperty && dynamicItem.name == propertyName){
			return dynamicItem.getValue();
		}
	}
	return null;
}
//myq 2014-8-3 add，执行动态脚本，返回值
DynamicForm.prototype.eval = function(evalScript){
	if(!evalScript){
		return null;
	}
	var parameters = _getParameters(evalScript);
	for(var i = 0; i < parameters.length; i++){
		var proName = parameters[i];
		
		var proValue = this.getPropertyValue(proName);
		var valueJsonStr = haux.util.Json.getString(proValue);
		var pattern = new RegExp("\\$\\{" + proName + "\\}", "g");
		evalScript = evalScript.replace(pattern, valueJsonStr);
	}
	;
	try{
		return eval(evalScript);	
	}
	catch(e){
		return null;
	}
}
/***********************************************************************************************
	Part 2 —— 定义DynamicLabel, DynamicProperty
***********************************************************************************************/
DynamicLabel = function(dynamicItem){
	for(var property in dynamicItem){
		var value = dynamicItem[property];
		if(value != null)
			this[property] = dynamicItem[property];
	}
	this.config = haux.util.Json.getObject(this.config, {});	
}
//创建group、comment等辅助性标签元素
DynamicLabel.prototype.createElement = function(){
	if(this.isMainTitle()){
		//一级标题，创建<div><h3>XXX</h3></div>的html结构
		var divElement = haux.dom.createElement("div"); 
		divElement.className = "dynamic_form";
		var h3Element = document.createElement("h3");
		h3Element.innerHTML = this.title;
		divElement.appendChild(h3Element);
		//h3Element.insertBefore(haux.dom.createElement("span", {className:"index", innerHTML:++DynamicForm.groupIndex}), h3Element.firstChild);
		divElement.appendChild(h3Element);
		this.element = divElement;
		if(this.config.cssText){
			divElement.style.cssText = this.config.cssText;
		}
		return divElement;
	}
	else if(this.isSubTitle()){
		var h4Element = document.createElement("h4");
		h4Element.innerHTML = this.subTitle;
		this.element = h4Element;
		if(this.config.cssText){
			h4Element.style.cssText = this.config.cssText;
		}
		return h4Element;
	}
	else if(this.formType == "comment"){
		//纯备注，还没想好怎么写
		
	}
	
}
//myq add 2014-5-1，判断是否为主标题
DynamicLabel.prototype.isMainTitle= function(){
	return this.formType == "group" && this.title;
}
//myq add 2014-5-1，判断是否为辅标题
DynamicLabel.prototype.isSubTitle = function(){
	return this.formType == "group" && !this.title;
}
//myq add 2014-5-1，判断是否为文本备注
DynamicLabel.prototype.isComment = function(){
	return this.formType == "comment";
}

DynamicLabel.prototype.notify = function(eventName, propertyName){
	var dynFormObj = DynamicForm.getInstance(this.formId);
	var visibleScript = this.config.visible;
	if(visibleScript){
		var visible = dynFormObj.eval(visibleScript);
		this.element.style.display = visible ? "" : "none";
	}
}

DynamicProperty = function(dynamicItem){
	for(var property in dynamicItem){
		var value = dynamicItem[property];
		if(value != null)
			this[property] = dynamicItem[property];
	}
	this.config = haux.util.Json.getObject(this.config, {});	
}

DynamicProperty.prototype.createElement = function(){
	var dlElement = document.createElement("dl");
	dlElement.setAttribute("propertyname", this.name);
	dlElement.addClass(this.name);
	//0.设置内联样式
	if(this.config.cssText){
		dlElement.style.cssText = this.config.cssText;
	}
	//1.设置列宽，以解决某些属性输入控件超宽的问题
	var colCount = this.config.colCount || 1;
	if(colCount > 1){
		dlElement.addClass("colspan_" + colCount);
	}
	//2.设置必填属性的样式
	if(!this.allowNull){
		dlElement.addClass("mandatory");
	}
	//3.处理浮动clear问题
	if(this.config.clear){
		dlElement.style.clear = this.config.clear;
	}
	
	//4.生成描述field的元素
	var labelText = this.config.leftText || this.describe || "";
	var dtElement = haux.dom.createElement("dt", {title : labelText, innerHTML : labelText});
	if(this.config.dtCssText){
		dtElement.style.cssText = this.config.dtCssText;
	}
	dlElement.appendChild(dtElement);
	
	//5.生成查看/修改 field值的输入表单元素
	var ddElement = document.createElement("dd");
	var inputElement = this._createInputElement();
	if(inputElement){
		ddElement.appendChild(inputElement);
	}
	if(this.config.ddCssText){
		ddElement.style.cssText = this.config.ddCssText;
	}
	dlElement.appendChild(ddElement);
	
	//5.填充右侧文本信息
	if(this.config.rightText){
		ddElement.appendChild(document.createTextNode(" " + this.config.rightText));
	}
	//5.绑定obj与element之间的关联关系；
	//this.inputElement = inputElement;
	this.element = dlElement;
	return dlElement;
}

DynamicProperty.prototype.getValue = function(){
	switch(this.formType){
		case "text":
			return this._input.value;
		case "textarea":
			return this._textarea.value;
		case "richtext":
			return this._richtext.value;
		case "select":
			return this._select.value;
		case "radio":
			var value = [];
			for(var i = 0; i < this._radios.length; i++){
				var radio = this._radios[i];
				if(radio.checked){
					return radio.value;
				}
			}
			return null;
		case "checkbox":
			var value = [];
			for(var i = 0; i < this._checkboxes.length; i++){
				var checkbox = this._checkboxes[i];
				if(checkbox.checked)
					value.push(checkbox.value);
			}
			return value;
		case "file":
			return null;
		default:
			return null;
	}
}

DynamicProperty.prototype.setValue = function(value){
	switch(this.formType){
		case "text":
			this._input.value = value;
			return;
		case "textarea":
			this._textarea.value = value;
			return;
		case "richtext":
			;
		case "select":
			;
		case "radio":
			;
		case "checkbox":
			;
		case "file":
			return null;
		default:
			return null;
	}
}
//根据dynProperty的内容，生成对应的input/select/radio等输入控件，并设置好相关的校验规则和附加属性
DynamicProperty.prototype._createInputElement = function(){
	switch(this.formType){
		case "text":
			return this._createTextElement();
		case "textarea":
			return this._createTextareaElement();
		case "richtext":
			return this._createRichTextElement();
		case "select":
			return this._createSelectElement();
		case "radio":
			return this._createRadioElement();
		case "checkbox":
			return this._createCheckboxElement();
		case "file":
			return this._createFileElement();
		default:
			return null;
	}
}

DynamicProperty.prototype._createTextElement = function() {
	
	var el = {name:this.elementName, type:"text", value:(this.value === null ? "" : this.value),
		formType : this.formType, dataType : this.dataType};
	var className;
	//1.根据 不同的数据类型 ，从 动态属性读取input元素所需要的属性 
	switch(this.dataType){
		case "text":
			el.className = this.allowNull ? "text" : "text required";
			if(this.max)
				el.maxlength = this.max;
			if(this.min)
				el.minlength = this.min;
			break;
		case "int":
			el.className = this.allowNull ? "int" : "int required";
			//el.constraint = "integer";
			if(this.max)
				el.max = this.max;
			if(this.min)
				el.min = this.min;
			break;
		case "real":
			el.className = this.allowNull ? "real" : "real required";
			//el.constraint = "double";
			if(this.max)
				el.max = this.max;
			if(this.min)
				el.min = this.min;
			break;
		case "date":
			el.className = this.allowNull ? "Wdate" : "Wdate required";
			el.value = this.text;
			if(this.max)
				el.max = this.max;
			if(this.min)
				el.min = this.min;
			break;
/*		case "time":
			el.className = "text Wdate";
			el.value = this.text;
			el.data_type = "time";
			if(this.max)
				el.max = this.max;
			if(this.min)
				el.min = this.min;
			break;*/
		default:
			break;
	}
	
	//2.创建 input元素 
	var inputElement = haux.dom.createElement("input", el);
	var dynamicProperty = this;
	haux.dom.addEventHandler(inputElement, "change", function(){
		//var dynamicForm = DynamicForm.visibleForms[dynamicProperty.formSeriesNo];
		var dynamicForm = DynamicForm.getInstance(dynamicProperty.formId);
		dynamicForm.notify("change", dynamicProperty.name);
	});
	
	if(this.config.inputCssText){
		inputElement.style.cssText = this.config.inputCssText;
	}

	this._input = inputElement;
	//3.返回 
	return inputElement;
}

DynamicProperty.prototype._createTextareaElement = function() {
	var el = {name:this.elementName, 
		formType:this.formType, 
		innerHTML:!this.value && this.value !== 0 ? "" : this.value,
		rows:3};

	if(this.max)
		el.maxlength = this.max;
	if(this.min)
		el.minlength = this.min;

	//2.创建 input 对象，并设置相应的内部属性 
	if(!this.allowNull){
		el.className = " required";
	}
	
	var textareaElement = haux.dom.createElement("textarea", el);
	var dynamicProperty = this;
	haux.dom.addEventHandler(textareaElement, "change", function(){
		//var dynamicForm = DynamicForm.visibleForms[dynamicProperty.formSeriesNo];
		var dynamicForm = DynamicForm.getInstance(dynamicProperty.formId);
		dynamicForm.notify("change", dynamicProperty.name);
	})
	//textareaElement = null;
	
	this._textarea = textareaElement;
	if(this.config.inputCssText){
		textareaElement.style.cssText = this.config.inputCssText;
	}
	//3.返回 
	return textareaElement;
}

DynamicProperty.prototype._createPasswordElement = function() {
	return null;//预留函数，有需要再扩展
}

DynamicProperty.prototype._createSelectElement = function() {
	//1.创建 select 对象，并设置相应的内部属性 
	var selectNode = haux.dom.createElement("select", {name:this.elementName});

	if(this.config.options){
		var dynFormObj = DynamicForm.getInstance(this.formId);
		var optionScript = this.config.options;
		if(optionScript){
			var optionStr = dynFormObj.eval(optionScript);
			if(optionStr !== null){
				selectNode.innerHTML = optionStr;
				selectNode.value = this.value;
			}
		}
	}
	else{
		var options = this.dataType == "bool" ? [{v:1, t:"是"}, {v:0, t:"否"}] : this.options;
		haux.dom.createOptions(selectNode, options, "v", "t", this.value)
	}
	//设置 class和 option
	if(!this.allowNull){
		selectNode.className = "required";
	}
	else{
		selectNode.insertBefore(document.createElement("option"), selectNode.firstChild);
	}
	var dynamicProperty = this;
	haux.dom.addEventHandler(selectNode, "change", function(){
		//var dynamicForm = DynamicForm.visibleForms[dynamicProperty.formSeriesNo];
		var dynamicForm = DynamicForm.getInstance(dynamicProperty.formId);
		dynamicForm.notify("change", dynamicProperty.name);
	})
	if(this.config.inputCssText){
		selectNode.style.cssText = this.config.inputCssText;
	}
	this._select = selectNode;
	//3.返回 
	return selectNode;
}

DynamicProperty.prototype._createRadioElement = function() {
	var contentElement = document.createDocumentFragment();

	var options = this.dataType == "bool" ?
		[{v:1, t:"是"}, {v:0, t:"否"}] : this.options;
	
	var radioElements = haux.dom.createRadios(contentElement, options, "v", "t", this.value, this.elementName);
	if(!this.allowNull){
		radioElements[0].addClass("required");
	}
	
	//2.如果还允许“自定义输入”选项，附加一个"其它"radio选项，选中后显示出一个文本输入框，用于用户自定义输入非标准内容
	if(this.config.allowCustom){
		var spanElement = haux.dom.createElement("span", {innerHTML:"其它", className:"radio"});
		//2.1直接调用	_createTextareaElement函数，按照dynProperty参数类型，生成对应的文本输入框
		var customRadioElement = haux.dom.createElement("input", {type:"radio", className:"radio", name:this.elementName});
		customRadioElement.value = "";
		spanElement.insertBefore(customRadioElement, spanElement.firstChild);
		
		//2.2创建 文本输入框
		var customInputElement = haux.dom.createElement("input", {type:"text", name:this.elementName});
		customInputElement.style.cssText = "width:200px;margin-left:0.5em";
		spanElement.appendChild(customInputElement);
		//低效率方法，后续有待改进
		setInterval(function(){
			customInputElement.disabled = !customRadioElement.checked;
			customInputElement.style.display = customRadioElement.checked ? "" : "none";
		}, 1000);
		
		//2.3如果this.value不为空，且不等于option中的任何值，说明选中了“其它”选项，
		//并要在customInputElement文本输入框显示用户自定义输入的内容
		if(this.value){
			var showCustomValue = true;
			for(var i = 0; i < radioElements.length; i++){
				var radioElement = radioElements[i];
				if(radioElement.checked){
					showCustomValue = false;
					break;
				}
			}
			if(showCustomValue){
				customRadioElement.checked = true;
				customInputElement.value = this.value;
			}
		}
		
		//建立radio于text输入框之间的切换显示关系
		contentElement.appendChild(spanElement);
	}
	
	var dynamicProperty = this;
	for(var i = 0; i < radioElements.length; i++){
		var radioElement = radioElements[i];
		haux.dom.addEventHandler(radioElement, "click", function(){
			//var dynamicForm = DynamicForm.visibleForms[dynamicProperty.formSeriesNo];
			var dynamicForm = DynamicForm.getInstance(dynamicProperty.formId);
			dynamicForm.notify("change", dynamicProperty.name);
		})
	}
	
	this._radios = radioElements;
	return contentElement;
}

DynamicProperty.prototype._createCheckboxElement = function() {
	var contentElement = document.createDocumentFragment();
	
	var checkboxElements = null;
	//1.遍历this.opetions数组，并创建相应的radio + text 元素
	if(this.dataType == "bool"){
		checkboxElements = haux.dom.createCheckboxes(contentElement, [{v:1, t:this.describe}], "v", "t", 
			this.value ? [1] : [], this.elementName);
	}
	else{
		var selectedValues = this.value ? this.value.toString().split(",") : null;
		checkboxElements = haux.dom.createCheckboxes(contentElement, this.options, "v", "t", selectedValues, this.elementName);
	}
	var dynamicProperty = this;
	if(checkboxElements && checkboxElements.length){
		for(var i = 0; i < checkboxElements.length; i++){
			var checkboxElement = checkboxElements[i];
			haux.dom.addEventHandler(checkboxElement, "click", function(){
				//var dynamicForm = DynamicForm.visibleForms[dynamicProperty.formSeriesNo];
				var dynamicForm = DynamicForm.getInstance(dynamicProperty.formId);
				dynamicForm.notify("change", dynamicProperty.name);
			})
		}
		
		if(!this.allowNull){
			checkboxElements[0].addClass("required");
		}
	}

	this._checkboxes = checkboxElements;
	return contentElement;
}

DynamicProperty.prototype._createFileElement = function() {
	var divElement = document.createElement("div");
	divElement.className = "file_list content_wrap";
	//divElement.innerHTML = "this is my image input";
	var hiddenElement = haux.dom.createElement("input", {name:this.elementName, type:"hidden"});
	hiddenElement.value = this.value;
	divElement.appendChild(hiddenElement);
	
	new haux.component.File({display : "big-icon",
		hiddenElement : hiddenElement,
		containerElement : divElement,
		//fileElement : document.getElementsByName("uploadFile")[0],
		//fileType : "zip", 
		maxCount : 5, 
		maxFileSize : 5*1024
	});

	return divElement;
}


DynamicProperty.prototype.notify = function(eventName, propertyName){
	var dynFormObj = DynamicForm.getInstance(this.formId);
	
	var visibleScript = this.config.visible;
	if(visibleScript){
		var visible = dynFormObj.eval(visibleScript)
		this.element.style.display = visible ? "" : "none";
		
		//myq add 2014-09-14，遍历this.element下的所有node节点，如果是input/select/textarea，切换其disable状态
		var iterator = document.createNodeIterator(this.element, NodeFilter.SHOW_ELEMENT, null, false);
		var node = iterator.nextNode();
		while(node){
			if(node.name && (node.tagName == "INPUT" || node.tagName == "TEXTAREA" || node.tagName == "SELECT")){
				node.disabled = visible ? false : true;
			}
			node = iterator.nextNode()
		}
	}
	
	var valueScript = this.config.value;
	if(valueScript){
		var newValue = dynFormObj.eval(valueScript);
		if(newValue !== null){
			this.setValue(newValue);
		}
	}

	var optionScript = this.config.options;
	if(optionScript && eventName != "init"){
		var optionStr = dynFormObj.eval(optionScript);
		if(optionStr !== null){
			this._select.innerHTML = optionStr;
		}
	}
}

function _getParameters(evalScript){
	var result = [];
	//alert("${pcibxg}.contain('LM-LCX') && ${aa-12a}".match(/\$\{[A-Z|a-z|0-9|\-|\_]+\}/g).join("\n"))
	var parameters = evalScript.match(/\$\{[A-Z|a-z|0-9|\-|\_]+\}/g);
	var proNameSet = {};
	if(parameters && parameters.length){
		for(var i = 0; i < parameters.length; i++){
			var parameter = parameters[i];
			var proName = parameter.substr(2, parameter.length - 3);
			if(proNameSet[proName]){
				continue;
			}
			proNameSet[proName] = true;
			result.push(proName)
		}
	}
	return result;
}

haux.dom.addEventHandler(window, "load", function(){
	haux.dom.addCssFile(home() + "/style/dynamicform.css");
	if(!haux.component.File){
		haux.dom.addJsFile(home() + "/script/haux.component.file.js");
	}
});