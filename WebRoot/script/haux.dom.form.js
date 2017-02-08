/*
	表单元素处理功能
*/
haux.dom.form = {};

/*	版本信息：myq 2013-4-23 add。
		
	函数说明：
		用于html查询页面提交时，将<form>元素内的所有表单元素的name和value拼接成一个完整的json字符串后，将该字符串做为附加参数上传至服务器
	
	算法说明：
		1.根据formName获取目标表单对象，如果formName为空，则默认选取页面内的第一个表单。
		2.读取表单内的全部name-value，写入json对象。
		3.将json对象转换成字符串，并将字符串值附加到表单内，提交后台服务器处理。 
		
	参数说明：formName—表单元素的name属性，可为空
*/
haux.dom.form.submit = function(form){
//1.根据formName获取目标表单对象，如果formName为空，则默认选取页面内的第一个表单。
	form = form || document.forms[0];
	if(!form){
		return;	
	}	
//2.读取表单内的全部元素的name-value，写入json对象。
	var data = {};
	for(var i = 0; i < form.length; i++){
		var childNode = form[i];
		var nodeName = childNode.name;
		//过滤form内的非表单元素
		if(!nodeName || childNode.disabled)
			continue;
		
		//获取表单元素的value，并写入data对象
		if(childNode.tagName == "INPUT" && childNode.type != "checkbox" && childNode.type != "radio"
			|| childNode.tagName == "INPUT" && childNode.type == "radio" && childNode.checked
			|| childNode.tagName == "TEXTAREA" 
			|| childNode.tagName == "SELECT"){
			data[nodeName] = 	childNode.value;
		}
		else if(childNode.tagName == "INPUT" && childNode.type == "checkbox" && childNode.checked){
			//如果checkbox被选中了会比较麻烦，value要写入数组，因为checkbox是允许多选的
			var checkboxValues = data[nodeName];
			if(!checkboxValues instanceof Array){
				checkboxValues = [];
				data[nodeName] = checkboxValues;
			}
			checkboxValues.push(childNode.value);
		}
	}
	data.formName = form.getAttribute("name");
		
	//3.将json对象转换成字符串，并将字符串值附加到表单内，提交后台服务器处理。 
	var formStr = haux.util.Json.getString(data);
	
	var hiddenInput = document.createElement("input");
	hiddenInput.type = "hidden";
	hiddenInput.name = "data";
	hiddenInput.value = haux.util.Json.getString(data);
	form.appendChild(hiddenInput);
	form.submit();
	//form.submit();
}

haux.dom.form.getData = function(form){
//1.根据formName获取目标表单对象，如果formName为空，则默认选取页面内的第一个表单。
	form = form || document.forms[0];
	if(!form){
		return null;	
	}	
	
//2.读取表单内的全部元素的name-value，写入json对象。
	var result = {};
	for(var i = 0; i < form.length; i++){
		var element = form[i];
		var nodeName = element.name;
		//过滤form内的非表单元素
		if(!nodeName || element.disabled)
			continue;
		
		//获取表单元素的value，并写入data对象
		if(element.tagName == "INPUT" && element.type == "text"
			|| element.tagName == "INPUT" && element.type == "password"
			|| element.tagName == "INPUT" && element.type == "hidden"
			|| element.tagName == "INPUT" && element.type == "radio" && element.checked
			|| element.tagName == "TEXTAREA" 
			|| element.tagName == "SELECT"){
			result[nodeName] = 	element.value;
		}
		else if(element.tagName == "INPUT" && element.type == "checkbox" && element.checked){
			//如果checkbox被选中了会比较麻烦，value要写入数组，因为checkbox是允许多选的
			var checkboxValues = data[nodeName];
			if(!checkboxValues instanceof Array){
				checkboxValues = [];
				data[nodeName] = checkboxValues;
			}
			result(element.value);
		}
	}

	return result;
}

/*	版本信息：myq 2013-4-23 add。
		
	函数说明：
		用于html加载完毕后，根据后端服务器传递过来的json字符串值，填充对应表单内的各项表单元素的数值
	
	算法说明：
		1.将后端服务器传递的json字符串，转变为js的Object对象
		2.遍历表单内的全部表单元素，从Object对象中读取该node对应的value，并设置node.value属性。
		
	参数说明：data—表单元素name-value组成的object对象
*/
haux.dom.form.setData = function(data, form){
//1.将后端服务器传递的json字符串，转变为js的Object对象
	if(!data)
		return;
		
	//2.遍历表单内的全部表单元素，从Object对象中读取该node对应的value，并设置node.value属性。
	form = form || document.forms[0];
	if(!form){
		return;	
	}	
	
	for(var i = 0; i < form.length; i++){
		var element = form[i];
		var targetName = element.name;

		//过滤form内的非表单元素
		if(element && !element.disabled && data.hasOwnProperty(targetName)){
			var value = data[targetName];
			//设置表单元素的数值
			haux.dom.setElementValue(element, value);
		}
		
	}
}


/*	版本信息：myq 2013-4-23 add。
		
	函数说明：
		将文档/表单内<ul><li><label><input>....结构的表单元素转变为<ul><li><label><div>...的只读结构
	
	算法说明：
		1.获取目标form下的目标ul对象。
		2.遍历所有ul，改变ul/li的css属性
			3.1读取ul->li->表单元素，数值和文本显示内容。注意radio、checkbox、select应该显示相关文本，而非元素的value
			3.2删除li包含的表单元素，创建<div>+文本显示内容</div>的node结构，附加到li的label元素之后
		
	参数说明：formName—需要设置成只读的表单名称，如果为空表示document下默认的第一个表单元素改为只读
*/
haux.dom.form.toView = function(form){
	//1.根据formName获取目标表单对象，如果formName为空，则默认选取页面内的第一个表单。
	form = form || document.forms[0];
	if(!form){
		return;	
	}	
	//2.读取表单内的全部输入元素，将其修改为只读的文本元素。
	for(var i = 0; i < form.length; i++){
		var element = form[i];
		
		if(element.parentNode.tagName != "LI" 
			&& element.parentNode.parentNode.tagName != "LI"
			&& element.parentNode.tagName != "DD"
			&& element.parentNode.parentNode.tagName != "DD"){
			continue;
		}
		
		
		//过滤form内的非表单元素
		if(!element.name || element.offsetHeight == 0 || element.offsetWidth == 0)
			continue;
		
		//获取表单元素的value，并写入data对象
		if(element.tagName == "INPUT" 
			&& !["radio", "checkbox", "submit", "reset", "button", "hidden"].contain(element.type)){
			element.parentNode.insertBefore( _createDescribeNode(element.value), element);
			element.style.display = "none";
		}
		else if(element.tagName == "INPUT" && element.type == "radio"){
			if(element.checked){
				element.style.display = "none";
			}
			else{
				element.parentNode.style.display = "none"
			}
			
		}
		else if(element.tagName == "TEXTAREA" ){
			element.parentNode.insertBefore(_createDescribeNode(element.value), element);
			element.style.display = "none";
		}
		else if(element.tagName == "SELECT"){
			var option = element.options[element.selectedIndex];
			var text = option && (option.value || option.value === 0) ? option.innerHTML : "";
			element.parentNode.insertBefore(_createDescribeNode(text), element);
			element.style.display = "none";
		}
		else if(element.tagName == "INPUT" && element.type == "checkbox"){
			//如果checkbox被选中了会比较麻烦，value要写入数组，因为checkbox是允许多选的
			if(element.checked){
				element.style.display = "none";
			}
			else{
				element.parentNode.style.display = "none";
			}
		}
	}
}

_createDescribeNode = function(value){
	if(value || value === 0){
		return document.createTextNode(value);
	}
	else{
		return haux.dom.createElement("code", {innerHTML:"(空白)"})
	}
}

/*	版本信息：pj 2013-6-6 add。
		
	函数说明：
		表单提交之前，按照元素节点的规则，验证元素内容是否合法
	
	算法说明：
		1.获取目标form下的目标所有表单对象。
		2.遍历所有表单元素，获取表单相关的验证规则进行验证
		3.如果节点配置了className='required',则需要验证节点是否允许为null
		4.表单验证有误，则给节点设置一个error_msg属性，并且绑定onfocus和onblur事件
			
		
	参数说明：formName—需要设置成只读的表单名称，如果为空表示document下默认的第一个表单元素改为只读
*/
haux.dom.form.validate = function (form){
	//1.根据formName获取目标表单对象，如果formName为空，则默认选取页面内的第一个表单。
	form = form || document.forms[0];
	if(!form){
		return false;	
	}
	var invalidNames = [];
	var result = true;
	var invalidCount = 0;
	
	//2.读取表单内的全部元素,根据元素属性的规则验证
	var firstInvalidElement = null;
	for(var i = 0; i < form.length; i++){
		var target = form[i];
		if(target.disabled || !target.name || invalidNames.contain(target.name)){
			continue;
		}
				
		if(!haux.dom.form.validateFormElement(target)){
			if(firstInvalidElement == null){
				firstInvalidElement = target;
			}
			invalidCount++;
			var formType = haux.dom.getFormType(target);
			if(formType == "CHECKBOX" || formType == "RADIO"){
				invalidNames.push(target.name);
			}
		}
	}
	
	//3.如果有错，alert提示，并且将错误的元素高亮进行提示
	if(invalidCount){
		//这里需要在alert中提示颜色
		if(!GLOBAL.topWindow.activeDialog){
			var alertContent = "共有<span style='color:red;margin:5px'>" + invalidCount + "</span>条数据填写错误，"
				+ "请按提示进行修改<br/>问题数据已标记为：<input readonly='readonly' type='text' class='formextend_invalid_value' style='width:40px' />"
			haux.component.Dialog.alert({content:alertContent, width:400});
		}
		else{
			alert("共有" + invalidCount + "条数据填写错误\请按提示进行修改");
			firstInvalidElement.focus();
		}
		
		return false;
	}
	
	return true;
}

//输入错误的表单元素的focus事件，用于popbox弹出提示信息
function _enterErrorForm(){
	if(!this._errorDescribe){
		return;
	}
	//创建popbox，并在周围显示
	var popbox = new Popbox("click_button", "dark", false);
	popbox.setContent(this._errorDescribe);
	//popbox.setContent(boxContent);
	popbox.showInRelativePos(this);
	haux.dom.form._popbox = popbox;
}

function _leaveErrorInfo(){
	//1.再次验证表单内容是否正确
	haux.dom.form.validateFormElement(this._relatedRadio || this._relatedCheckbox || this);

	//2.不管验证是否通过，都要关闭并注销之前打开的popbox对象
	if(haux.dom.form._popbox){
		haux.dom.form._popbox.close();
		haux.dom.form._popbox = null;
	}
}

//返回true or false
haux.dom.form.validateFormElement = function(target){
	var formType = haux.dom.getFormType(target);
	var errorInfo = null;
	var targetElement = target;
	switch(formType){
		case "TEXT":
			errorInfo = this._validText(target);
			break;
		case "TEXTAREA":
			errorInfo = this._validTextarea(target);
			break;
		case "RADIO":
			errorInfo = this._validRadio(target);
			var targetElement = target.parentNode.parentNode;
			targetElement._relatedRadio = target;
			break;
		case "CHECKBOX":
			errorInfo = this._validCheckbox(target);
			var targetElement = target.parentNode.parentNode;
			targetElement._relatedCheckbox = target;
			break;
		case "SELECT":
			errorInfo = this._validSelect(target);
			break;
		default:
			return true;
	}
	
	if(errorInfo){
		targetElement._errorDescribe = errorInfo;
		//设置元素高亮效果
		targetElement.addClass("formextend_invalid_value");
		//设置onfocus事件响应函数：弹出popbox提示框
		haux.dom.addEventHandler(targetElement, "mouseover", _enterErrorForm);
		//设置onfocus事件响应函数：关闭popbox提示框
		haux.dom.addEventHandler(targetElement, "mouseout", _leaveErrorInfo);
		return false;
	}
	else{
		//取消元素高亮效果
		targetElement.removeClass("formextend_invalid_value");
		//取消onfocus事件响应函数：弹出popbox提示框
		haux.dom.removeEventHandler(targetElement, "mouseover", _enterErrorForm);
		//设置onfocus事件响应函数：关闭popbox提示框
		haux.dom.removeEventHandler(targetElement, "mouseout", _leaveErrorInfo);
		return true;
	}
}

/*	版本信息：pj 2013-6-6 add,myq 2014-09-09modify
		
	函数说明：
		验证text类型的表单元素是否合法
	
	验证说明：
		0.验证not null 规则
		1.如果文本框数据类型是整数，依次检验数据有效性、最大值、最小值
		1.获取元素的最小值属性，验证最小值。
		2.获取表单max--最大值，min--最小值 验证规则进行验证
		
	参数说明：formName—需要设置成只读的表单名称，如果为空表示document下默认的第一个表单元素改为只读
*/
haux.dom.form._validText = function(target){
	if(!target)
		return;
	//返回文本输入框内的字符串
	var value = "" + target.value;
	
	//0.验证not null 规则
	if(!value){
		if(target.containClass("required")){
			return "必填项，请输入内容";
		}
		else{
			return;
		}
	}
	
	if(target.containClass("int")){
		//1.如果文本框数据类型是整数，依次检验数据有效性、最大值、最小值
		var intReg = /^[-]?([0-9]+\d*)$/;
		if(!intReg.test(value)){
			return "请输入整数";
		}
		var intValue = parseInt(value);
		
		var max = target.getAttribute("max");
		if(intReg.test(max) && intValue > parseInt(max)){
			return "请输不超过" + max + "的整数";
		}
		
		var min = target.getAttribute("min");
		if(intReg.test(min) && intValue < parseInt(min)){
			return "请输不小于" + min + "的整数";
		}
	}
	else if(target.containClass("real")){
		//2.如果文本框数据类型是浮点数，依次检验数据有效性、最大值、最小值
		var realReg = /^(-?\d+)(\.\d+)?$/;
		if(!realReg.test(value)){
			return "请输入整数";
		}
		var intValue = parseInt(value);
		
		var max = target.getAttribute("max");
		if(realReg.test(max) && intValue > parseInt(max)){
			return "请输入不超过" + max + "的整数";
		}
		
		var min = target.getAttribute("min");
		if(realReg.test(min) && intValue < parseInt(min)){
			return "请输入不小于" + min + "的整数";
		}
	}
	else if(target.containClass("Wdate") || target.containClass("date")){
		//3.如果文本框数据类型是日期，依次检验数据有效性、最大值、最小值
		var dateReg = /^(\d{4})-(\d{2})-(\d{2})$/;
					
		if(!dateReg.test(value)){
			return "请输入正确的日期，如2014-09-21";
		}
		//暂时不检查年、月、日具体是否符合要求了，以后再考虑补充
		//最大值检查
		var max = target.getAttribute("max");
		if(dateReg.test(max) && value > max){
			return "请输不大于" + max + "的日期";
		}
		//最小值检查，预留
		var min = target.getAttribute("min");
		if(dateReg.test(min) && value < min){
			return "请输不小于" + min + "的日期";
		}
	}
	else{
		//4.如果文本框数据类型是文本，依次检验输入字符串的长度是否符合max和min
		var intReg = /^[-]?([1-9]+\d*)$/;
		var length = value.length;
		//最大长度检查
		var max = target.getAttribute("max");
		if(intReg.test(max) && length > max){
			return "文本长度不能超过" + max + "个字符";
		}
		//最小长度检查，预留
		var min = target.getAttribute("min");
		if(intReg.test(min) && length < min){
			return "文本长度不能少于" + min + "个字符";
		}
	}
		
	return null;
}

/*	版本信息：myq 2014-09-09 add
		
	函数说明：
		验证textarea类型的表单元素是否合法
	
	验证说明：
		0.验证not null 规则
		1.获取表单max--最大值，min--最小值 验证规则进行验证
*/
haux.dom.form._validTextarea = function(target){
	if(!target)
		return;
	
	//返回文本输入框内的字符串
	var value = "" + target.value;
	
	//0.验证not null 规则
	if(!value){
		if(target.containClass("required")){
			return "必填项，请输入内容";
		}
		return;
	}
	
	//1.依次检验输入字符串的长度是否符合max和min
	var intReg = /^[-]?([1-9]+\d*)$/;
	var length = value.length;
	//最大长度检查
	var max = target.getAttribute("max");
	if(intReg.test(max) && length > max){
		return "文本长度不能超过" + max + "个字符";
	}
	//最小长度检查，预留
	var min = target.getAttribute("min");
	if(intReg.test(min) && length < min){
		return "文本长度不能少于" + min + "个字符";
	}	
	return null;
}

/*	版本信息：myq 2014-09-10 add
		
	函数说明：
		验证select类型的表单元素是否合法
	
	验证说明：
		0.验证not null 规则
*/
haux.dom.form._validSelect = function(target){
	if(!target)
		return;
	
	//返回文本输入框内的字符串
	var value = "" + target.value;
	
	//0.验证not null 规则
	if(!value && target.containClass("required")){
		return "必填项，请输入内容";
	}
	return;
}

/*	版本信息：myq 2014-09-10 add
		
	函数说明：
		验证checkbox类型的表单元素是否合法
	
	验证说明：
		0.验证not null 规则
*/
haux.dom.form._validCheckbox = function(target){
	if(!target)
		return;
	
	//0.验证not null 规则
	if(target.containClass("required") && !haux.dom.getFormValues(target.name)){
		return "必填项，请输入内容"; 
	}
	
	return;
}

/*	版本信息：myq 2014-09-10 add
		
	函数说明：
		验证radio类型的表单元素是否合法
	
	验证说明：
		0.验证not null 规则
*/
haux.dom.form._validRadio = function(target){
	if(!target)
		return;
	
	//0.验证not null 规则
	if(target.containClass("required") && !haux.dom.getFormValues(target.name)){
		return "必填项，请输入内容"; 
	}
	
	return;
}



