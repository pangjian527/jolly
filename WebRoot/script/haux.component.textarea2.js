/**
	myq 2013-8-1 add
		textarea2控件，实现类似163邮箱系统中，写邮件页面内的“发件人”输入框，具体效果请登录163邮箱查看，此处省略2000字... 
		* 
	组件调用方式：
		1.调用本函数的createSelect2方法，传递下列参数
		*   a.需要改造的 文本输入框or hidden元素 
		*   b.伪select2元素的外框（建议div元素，可以不是input元素的父节点）
		*   c.用户输入时的suggest options，可以是固定的 Array，也可以是ajax调用方式
		*   d.是否允许输入suggest options之外的数值
		*   e.如果d==false，设置后台保存 文本数组，还是id数组 
		*   f.是否只读
		
		2.text2组件生成相应的text2各项元素，并为各组建绑定相关方法
		
**/

/***********************************************************************************************
	Part 0 —— 定义Text2组件的公共数、全局静态变量等
***********************************************************************************************/
/*	
	函数说明：根据dynamicObject对象内容，动态创建表单输入元素
	
	算法说明：
		1.获得input.text或input.hidden元素，读取元素的value属性，再将该元素隐藏
		2.针对显示select2组建的包裹div元素，为其设置组件所需的外观，根据步骤1获得的value，
			在包裹div内增加已选中值的element。如果value存储的只是id，还需要读取optionArray，
			或异步调用suggest Options，将id转为text
		3.为包裹div增加接收用户键盘输入的input元素，以及辅助测量输入文本宽度的span元素。在用户点击包裹
			div的空白处时（包括两个选项element元素之间的间隙），在该处显示辅助input输入框，并setFocus
		4.为input元素绑定onkeyup响应函数，根据input.value搜索optionArray，或ajax调用，获取suggest选项
			采用popbox在input下方显示suggest选项
		5.为每一个suggest选项绑定onclick事件，点击suggest选项后，将该选项值写入步骤一的input元素，并
			在包裹div元素内，新增该选项的显示元素
			 
		4.如item.fieldValue为嵌套的子对象或子对象，则递归生成子对象/子对象数组的输入元素，并插入
		
	参数说明：
		1.inputElement，实际存储数值（以便提交后台服务器）的输入元素，支持文本输入框、隐藏域、textarea。
		
		2.wrapElement，用于显示text2组件的div元素，用于包裹text2创建的各类输入、显示元素，形成一个类似
			文本输入框的富文本编辑器
		
		3.config，创建text2所需的各类参数对象
			A.config.optionArray——候选数据数组，数组内的元素可以是{v:"gd", t:"广东", q:"gd|广东"}格式的object，
			* 也可以是基本的string/number类型。当设置了候选数组时，说明用户在text2控件中输入时，只需要查询
			* 本页面缓存的候选数据，无需调用ajax从后台获得suggest值，因此后续的XXX/XXX参数将被忽略。
			B.config.ajaxQueryFunc——用户在text2控件输入后，将输入值作为参数，调用ajaxQueryFunc，用于向
			* 后端发起ajax请求，获得返回值
			C.config.dataType——text，后台存储文本；id，后台存储id
			D.config.allowCustom——用于允许保存用户自定义输入的数值，而不是用户点击suggest获得的数值。
			* 当dataType=="id"时，本选项无效。
			E.config.separator——分隔符，用于多个被选中value的拼接，以便后台采用单个字段存储多个值
		
		4.readOnly，控件是否只读，用于某些不需要修改数据的查看页面。如无此参数，默认控件是可输入值的
*/

haux.component.Textarea2 = function(inputElement, wrapElement, config, readOnly){
	//初始化this对象
	this._inputElement = inputElement;
	this._value = inputElement.value;
	this._element = wrapElement;
	this._config = config;
	this._readOnly = readOnly;
	this._separator = config.separator || ","
	this._values = inputElement.value ? inputElement.value.split(this._separator) : [];
	this._items = [];
	this._uniqueValue = config.uniqueValue|| false;
	this._maxCount = isNaN(config.maxCount) ? 5 : parseInt(config.maxCount);
	//text,在后台存储可见文本；id，存储id数组；mix，混合存储
	this._valueType = config.valueType || "text";
	//1.读取config参数中变化的部分
	if(config.options){
		this._offlineOptions = [];
		for(var i = 0; i < config.options.length; i++){
			var option = config.options[i];
			if(!option){
				this._offlineOptions.push({t:"", v:"", q:""});
			}
			else if(typeof option == "object"){
				//1.1 发现中文汉化包
				if(haux.util.chn){
					option.q=haux.util.chn.getPyCode(option.v)+"||"+haux.util.chn.getJpCode(option.v)+"||"+option.v;
				}
				this._offlineOptions.push({t:option.v || "", v:option.t || "", 
					q:option.q || option.t || option.v || ""});
			}
			else if(typeof option == "string"){
				this._offlineOptions.push({t:option, v:option, q:option});
			}
			else if(typeof option == "number"){
				var option = "" + option;
				this._offlineOptions.push({t:option, v:option, q:option});
			}
		}
	}
	else{
		this._queryUrl = config.queryUrl;
		this._getEntityUrl = config.getEntityUrl;//valueType = "id"/"mix"时有效
		this._optionId = config.id;
		this._optionText = config.text;
	}
}
Textarea2 = haux.component.Textarea2;

Textarea2.prototype.createElement = function(){
	var textarea2Obj = this;//用于闭包调用
	if(!this._popbox){
		this._popbox = new Popbox("click_other", "pop_menu", false);
	}
	
	//1.获得input.text或input.hidden元素，读取元素的value属性，再将该元素隐藏
	if(this._inputElement.type == "text")
		this._inputElement.style.display = "none";
	
	
	//2.针对显示select2组建的包裹div元素，为其设置组件所需的外观,并根据
	//this._inputElement.value内存储的数组，初始化textarea2控件内的显示内容
	this._element.addClass("textarea2");
	
	//3.为包裹div增加接收用户键盘输入的input元素，以及辅助测量输入文本宽度的span元素。
	var divElement = haux.dom.createElement("div", {className:"edit_content"});
	divElement.style.cssText = "border:0;display:inline-block;width:auto";
	this._editContent = divElement;
	this._element.appendChild(divElement);
	
	var inputElement = haux.dom.createElement("input", {type:"text"});
	inputElement.style.cssText= "border:0;width:30px";
	this._editContentInput = inputElement;
	divElement.appendChild(inputElement);
	
	var spanElement = document.createElement("span");
	spanElement.style.cssText = "visibility:hidden";
	this._editContentTxt = spanElement;
	divElement.appendChild(spanElement);
	
	//4.为input元素绑定onkeyup响应函数，根据input.value搜索optionArray，或ajax调用，获取suggest选项采用popbox在input下方显示suggest选项
	//var querySuggestInterval = null;//闭包参数，用于input.onkeyup响应函数访问
	this._editContentInput.onkeyup = function(ev){
		ev = ev || window.event;
		var keyCode = ev.keyCode;
		var currentValue = this.value;//用于setTimeout内的函数闭包引用
		var previousValue = this.previousValue;
		if(previousValue != currentValue){
			//input元素的内容发生了改变，需要自动调整input元素的宽度，并发起查询
			this.previousValue = currentValue;
			textarea2Obj.autoAdjustInputWidth();
			
			//用户连续输入N个字母时（以时间为判断标准），只有停止键盘输入200毫秒后才发起查询，避免浪费
			if(this.querySuggestInterval){
				clearTimeout(this.querySuggestInterval);
				this.querySuggestInterval = null;
			}
			this.querySuggestInterval = setTimeout(function(){
				textarea2Obj.querySuggestOptions(currentValue);
			}, 200);
		}
		else if(keyCode == 13){
			//用户按下回车，在Textarea2新增selected状态的suggest选项
			if(!textarea2Obj.selectFocusedSuggest() && currentValue && textarea2Obj._valueType != "id"){
				textarea2Obj.insertItem("", currentValue);
				//itemObj.element.addClass("text_only");
				textarea2Obj.resetEditContent(true);
			}
		}
		else if(keyCode == 38){
			//用户按下方向键向上，切换当前页面可见的suggest options 的focus状态
			textarea2Obj.focusPreviousSuggest();
		}
		else if(keyCode == 40){
			//用户按下方向键向下，切换当前页面可见的suggest options 的focus状态
			textarea2Obj.focusNextSuggest();
		}
	}
	
	this._editContentInput.onfocus = function(){
		haux.dom.addEventHandler(window, "keydown", preventDefaultEnterPress);
	}
	if(this._valueType == "id"){
		this._editContentInput.onblur = function(){
			haux.dom.removeEventHandler(window, "keydown", preventDefaultEnterPress);
		}
	}
	else{
		//支持混合方式，即输入框失去焦点时，如果不是因为鼠标点击suggest选项引发的，则将当前输入框
		//内的文本内容作为新的item(tt=当前输入内容，v=null)，插入input元素的前方
		this._editContentInput.onblur = function(){
			haux.dom.removeEventHandler(window, "keydown", preventDefaultEnterPress);
			var currentText = this.value;
			if(currentText){
				//之所以不直接调用insertItem函数，是因为如果用户点击文本框下方的suggest元素进行选择时
				//产生的时间响应顺序为 input.onblur->li.onclick，但在业务逻辑上，li.onclick优先级更高
				//采用input.onblur内的实际业务逻辑延迟200毫秒执行，则li.onlick就可以提前将该代码清除掉
				this.addItemInterval = setTimeout(function(){
					textarea2Obj.insertItem("", currentText);
					textarea2Obj.updateValues();
					textarea2Obj.resetEditContent();
					textarea2Obj.closeSuggestOptions();
				}, 300);
			}
			
		}
	}
	
	//5.为textarea2设置onclick响应函数，使得鼠标点击textarea2空白区域时，将输入焦点
	//自动放在文本输入框，用户可以立即展开输入工作
	this._element.onclick = function(ev){
		//鼠标左键点击divElement时
		ev = ev || window.event;
		var scrElement = ev.target || ev.srcElement;
		var mousePos = haux.dom.getMousePos(ev);
		var previousItemRec = null;
		
		if(scrElement == this){
			//鼠标点击到Textarea2的空白地带，在此处显示Textarea2._editContent，并设置输入焦点
			var index = 0;
			var editContentDiv = this.getElementsByClassName("edit_content")[0];
			
			for(var itemElement = this.firstChild; itemElement != null; itemElement = itemElement.nextSibling){
				if(itemElement.tagName != "DIV" || itemElement.className != "item_content")
					continue;
				var itemRec = haux.dom.getElementRec(itemElement);
				if(mousePos.y >= itemRec.y && mousePos.y <= itemRec.y + itemRec.height){
					if(itemRec.height && mousePos.x <= itemRec.x){
						//第一次发现鼠标位于item的左侧，且与item同一行，editContentDiv插入item之前
						this.insertBefore(editContentDiv, itemElement);
						editContentDiv.getElementsByTagName("input")[0].focus();
						return;
					}	
				}
				else if(mousePos.y < itemRec.y){
					//第一次检测到位于鼠标位置下方的第一行,即鼠标在item的上一行，且上一行的item都在鼠标
					//的左侧，,应该将editContentDiv插入该item之前、上一行最后一个item之后
					this.insertBefore(editContentDiv, itemElement);
					editContentDiv.getElementsByTagName("input")[0].focus();
					return;
				}
			}
			//运行到这里还没返回，说明应该在最后一个item之后
			this.appendChild(editContentDiv);
			editContentDiv.getElementsByTagName("input")[0].focus();
		}
	}
	
	//6.根均this._itemValues数组值，初始化textarea2控件内已有的item
	if(this._offlineOptions){
		if(this._itemValues){
			for(var i = 0; i < this._itemValues.length; i++){
				var itemValue = this._itemValues[i];
				if(this._valueType == "text"){
					this.inertItem(itemValue, itemValue);
				}
				else if(this._valueType == "id"){
					var itemText = this._getOfflineText(itemValue);
					this.addItem(itemValue, itemText);
				}
				else{
					var itemText = this._getOfflineText(itemValue);
					this.addItem(itemValue, itemText || itemValue);
				}
			}
		}
	}
	else{
		for(var i = 0; i < this._values.length; i++){
			var itemValue = this._values[i];
			if(this._valueType == "text"){
				this.insertItem("", itemValue);
			}
			else{
				var item = this.insertItem(itemValue, itemValue);
				//get itemValue according itemId,by ajax query
				(function(item){
					$.ajax({url:home() + textarea2Obj._getEntityUrl + "?queryData=" + item.id,
					    type:"get",
						dataType: "json",
					    error: function(){
							alert("query error");
						}, 
						success:function(obj){
							if(obj){//查到了，更新textarea2._items[n]对象，以及对应item element内容
								item.text = obj[textarea2Obj._optionText];
								item.element.getElementsByTagName("span")[0].innerHTML = item.text;
							}
							else{//没查到，说明id=null,更新
								item.id = "";
								if(textarea2Obj._valueType == "mix")
									item.element.addClass("empty_id");
							}
						}
					});	
				})(item)
			}
			
		}
	}
	
}

//关键字查询，获取suggest选项
Textarea2.prototype.querySuggestOptions = function(keyword){
	if(!keyword){
		this.clearSuggestOptions();
		return;
	}
	
	if(this._offlineOptions){		
		//从预设的js数组中进行搜索，无需调用ajax向后台发送异步查询请求
		//var keyword = this._editContentInput.text;
		if(this._offlineOptions.length == 0)
			return;
		
		var suggestOptions = [];
		for(var i = 0; i < this._offlineOptions.length; i++){
			var optionObj = this._offlineOptions[i];
			if(!optionObj)
				continue;
			if(optionObj.q.indexOf(keyword) >= 0){
				suggestOptions.push(optionObj);
			}
		}
		this.showSuggestOptions(suggestOptions);
	}
	else{
		//调用config.ajaxQueryFunc，发送异步请求，并将input元素作为该函数的this对象
		var textarea2Obj = this;
		$.ajax({url:  home() + this._queryUrl + "?queryData=" + keyword + "&maxCount=" + this._maxCount,
		    //data: {queryData:keyword, maxCount:this._maxCount}, 
		    //type: 'POST', 
		    type:"get",
			dataType: "json",
		    error: function(){
				alert("query error");
			}, 
		    success: function(resultRows){
				//queryExeInfo.results = resultRows;
				//alert(haux.dom.toString(resultRows));
				var options = [];
				for(var i = 0; i < resultRows.length; i++){
					var resultObj = resultRows[i];
					options.push({v:resultObj[textarea2Obj._optionId], 
						t:resultObj[textarea2Obj._optionText]});
				}
				textarea2Obj.showSuggestOptions(options);
		    }
		});
	}
}

//计算Textarea2可见区域的input输入框内文本的实际长度，并根据文本长度调整input的宽度
Textarea2.prototype.autoAdjustInputWidth = function(){
	//通过将assistInput内的文本值同步到assistSpan元素，然后通过span.offsetWidth获得input元素内
	//已输入文本的宽度，从而调整input宽度，模拟实现Input元素宽度自适应
	this._editContentTxt.innerHTML = this._editContentInput.value;
	var textWidth = this._editContentTxt.offsetWidth;
	
	//最小20像素，最大100像素宽度
	this._editContentInput.style.width = Math.min(Math.max(textWidth + 10, 20), 100) + "px";
}

Textarea2.prototype.clearSuggestOptions = function(){
	if(this._popbox){
		this._popbox.clearContent();
		this._popbox.close();
	}
}

/*	
	函数说明：用于在用户在text2控件进行键盘输入时，采用popbox组件，鼠标下方显示suggest 元素
				
	算法说明：
		1.读取suggestArray数组，生成对应的dom element，创建popbox并显示，将第一个suggest item设置为selected
		
		2.为sugguest 选项 绑定onmousein事件，使得鼠标在suggest选项上移动时，自动切换focused状态

		3.为生成的suggest element绑定onlick事件，使得鼠标点击suggest选项后，在wrapElement增加选中项目的
		* text文本（用于界面显示），并将value写入对应的input元素中（用于保存）
		
	参数说明:
		1.suggestArray，内含根据用户输入匹配出的suggest选项数组
	注意:
		本函数绑定辅助的文本输入框的onclick事件，this对象为assist input元素
*/

Textarea2.prototype.showSuggestOptions = function(options){
		//0.预处理
	if(!options || !(options instanceof Array) || !options.length){
		this.clearSuggestOptions();
		return;
	}

	this._popbox.close();
	
	//1.读取suggestArray数组，生成对应的dom element，创建popbox并显示，将第一个suggest item设置为selected
	var ulElement = document.createElement("ul");
	var textarea2Obj = this;//用于闭包调用
	for(var i = 0; i < options.length; i ++){
		var option = options[i];

		var liElement = haux.dom.createElement("li", {innerHTML:option.t,
			describe:option.t, value:option.v});
		if(i == 0)
			liElement.className = "focused";
		ulElement.appendChild(liElement);
		
		//2.为sugguest 选项 绑定onmousein事件，使得鼠标在suggest选项上移动时，自动切换focused状态
		liElement.onmouseover = function(){
			for(var target = this.parentNode.firstChild; target; target = target.nextSibling){
				if(target != this && target.className == "focused"){
					target.className = "";
					break;
				}
			}
			this.className = "focused";
		}
		//3.为生成的suggest element绑定onlick事件，使得鼠标点击suggest选项后，在wrapElement增加选中项目的
		liElement.onclick = function(ev){
			textarea2Obj.selectFocusedSuggest();
			textarea2Obj.closeSuggestOptions();
		}
		liElement = null;
	}
	this._popbox.setContent(ulElement);
	//4.显示popbox
	this._popbox.showInRelativePos(this._editContentInput, [8, 6], 0, 0);
	
}

Textarea2.prototype.focusPreviousSuggest = function(){
	if(!this._popbox)
		return;
	
	var liElements = this._popbox.getContent().getElementsByTagName("li");
	for(var i = 0, len = liElements.length; i < len; i++){
		var liElement = liElements[i];
		if(liElement.className == "focused"){
			liElement.className = "";
			liElements[i == 0 ? len - 1 : i - 1].className = "focused";
			return;
		}
	}
}
Textarea2.prototype.focusNextSuggest = function(){
	if(!this._popbox)
		return;
	
	var liElements = this._popbox.getContent().getElementsByTagName("li");
	for(var i = 0, len = liElements.length; i < len; i++){
		var liElement = liElements[i];
		if(liElement.className == "focused"){
			liElement.className = "";
			liElements[(i + 1) % len].className = "focused";
			return;
		}
	}
}

//将页面上被选中的suggest加入textarea2控件，可能是由鼠标点击popbox导致，也可能是由键盘回车引发
Textarea2.prototype.selectFocusedSuggest = function(){
	if(!this._popbox)
		return false;
	
	var liElement = this._popbox.getContent().getElementsByClassName("focused")[0];
	if(!liElement)
		return false;
	
	//如果是text或者mix模式，还需要清除this._editContentInput.onblur的新增Item(id="")的逻辑
	if(this._editContentInput.addItemInterval){
		clearTimeout(this._editContentInput.addItemInterval);
		this._editContentInput.addItemInterval = null;
	}
	var index = _getItemIndex(this._editContent);
	
	this.insertItem(liElement.getAttribute("value"), liElement.getAttribute("describe"));
	this.updateValues();
	this.resetEditContent(true);
	this.clearSuggestOptions();
	
	return true;
}

Textarea2.prototype.resetEditContent = function(focusInput){
	this._editContentInput.value = "";
	this._editContentInput.previousValue = "";
	this._editContentInput.style.width = "30px";
	if(focusInput)
		this._editContentInput.focus();
}
//根据editContentDiv元素在外层DIV组件中的位置，判断当前操作是针对textarea2Obj._items中的第几个
function _getItemIndex(contentElement){
	var index = 0;
	for(var previousItem = contentElement.previousSibling; previousItem != null; previousItem = previousItem.previousSibling){
		if(previousItem.tagName == "DIV" && previousItem.className != "edit_content")
			index++;
	}
	return index;
}

Textarea2.prototype.updateValues = function(){
	//3.更新this._inputElement.value
	this._values = [];
	for(var i = 0; i < this._items.length; i++){
		var itemObj = this._items[i];
		if(this._valueType == "text")
			this._values.push(itemObj.text);
		else if(this._valueType == "id")
			this._values.push(itemObj.id);
		else
			this._values.push(itemObj.id || itemObj.text);
	}
	this._inputElement.value = this._values.join(this._separator);
}
Textarea2.prototype.insertItem = function(id, text){
	//0.预处理
	if(this._uniqueValue &&(this._valueType == "text" && this._values.contain(text)
		|| this._valueType == "id" && this._values.contain(id)
		|| this._valueType == "mix" && this._values.contain(id ||text))){
		return null;
	}
	//1.创建html元素，并帮定事件响应函数“删除”
	var divElement = haux.dom.createElement("div", {className:"item_content", 
		innerHTML:"<span>" + text + "</span>"});
	if(this._valueType == "mix" && !id){
		divElement.addClass("empty_id");
	}
	divElement.style.cssText = "width:" + (this._itemWidth ? this._itemWidth + "px" : "auto");
	
	if(!this._readOnly){
		var buttonElement = haux.dom.createElement("button", {type:"button", innerHTML:"删除"});
		divElement.appendChild(buttonElement);
		var textarea2Obj = this;
		buttonElement.onclick = function(){
			var index = _getItemIndex(this.parentNode);
			textarea2Obj.removeItem(index);
			textarea2Obj.updateValues();
		}
		buttonElement = null;
	}
	
	//2.插入this._items数组
	var index = _getItemIndex(this._editContent);
	this._element.insertBefore(divElement, this._editContent);
	var item = {id:id, text:text, element:divElement};
	if(index < this._items.length){
		this._items.splice(index, 0, item);
	}
	else{
		this._items.push(item);
	}
	
	return item;
}

Textarea2.prototype.removeItem = function(index){
	var itemElement = this._items[index].element;
	this._items.splice(index);
	this._element.removeChild(itemElement);
}
Textarea2.prototype.closeSuggestOptions = function(){
	this._popbox.close();
}

//将Editbox(文本输入框)设置为可见，并插入第N个Item元素前
Textarea2.prototype.showEditbox = function(index){
	if(index){
		this._editContent.index = index;
		this._element.insertBefore(this._editContent, this._items[index].element);
	}
	else{
		this._element.appendChild(this._editContent);
	}
}





haux.dom.addEventHandler(window, "load", function(){
	haux.dom.addCssFile(home() + "/style/textarea2.css");
});








