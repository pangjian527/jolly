/**
	myq 2013-5-9 add
	
		浩轩自定义popbox组件，用于在页面内动态显示一个信息提示框，该提示框结构如下
										  ____________________
										 |                    |
										<       提示内容          |
										 |____________________|
	组件调用方式：
		1.new Popbox object对象 
		2.调用setInnerHTML/appendContentElement函数，设置popbox内的显示内容
		3.调用show/showInRelative函数，在body内显pop box
		4.调用close函数，关闭窗口
**/

/***********************************************************************************************
	Part 0 —— 定义Popbox的构造函数、全局静态变量等
***********************************************************************************************/

/*
	版本信息：myq 2013-5-9 重构。
		
	函数说明：
		Popbox构造函数，创建一个Popbox对象，记录提示文本、
	
	算法说明：
		1.创建包含整个Popbox的外层DIV元素
		2.设置个性化皮肤
		3.创建Popbox所需要的箭头元素
		4.创建显示提示内容的内层DVI元素
		5.记录关闭popbox的方式
		6.生成对象的唯一编号，并在Popbox内注册，以方便后续找到页面内的全部popbox对象
	参数说明：
		manualCloseType：
			手工关闭Popbox组件的方式，包括 点击按钮“x”，鼠标点击popbox之外的内容等
		skin:
			自定义皮肤名称，用于修改Popbox控件的外观主题，目前支持orage/sea/....
		removeElementAfterClose:
			popbox被关闭后，强制将popbox obj创建时在document.body附加的element删除
			适用于临时创建的popbox，完成一次展示就被废弃的情况。如obj创建后需要进行反复show/close操作，则不能为true
			
*/
haux.component.Popbox = function(manualCloseType, skin, removeElementAfterClose){
	//1.创建Popbox的外层DIV元素
	var outerElement = document.createElement("div");
	outerElement.style.cssText = "position:absolute;display:none;z-index:100";
	outerElement.className = "pop_box";
	this._skin = skin;
	this._closeType = manualCloseType || "click_button";
	this._element = outerElement;
	this._removeElementAfterClose = removeElementAfterClose;
	
	
	//2.设置个性化皮肤，主要通过增加一个div元素，通过控制该element的className
	//配合对应的css文件，实现popbox内的element外观定义，形成不同的皮肤效果
	//if(skin){
		var skinElement = document.createElement("div");
		//skinElement.className = skin;
		outerElement.appendChild(skinElement);
		outerElement = skinElement;
	//}
	
	//3.创建Popbox所需要的箭头元素
	var arrowElement = document.createElement("div");
	arrowElement.className = "arrow";
	arrowElement.innerHTML = "<i></i>"
	outerElement.appendChild(arrowElement);
	this._arrowWrapper = arrowElement;
	
	//4.创建显示提示内容的内层DVI元素
	var contentElement = document.createElement("div");
	contentElement.className = "content";

	this._contentWrapper = contentElement; 
	outerElement.appendChild(contentElement);
	
	//5.记录关闭popbox的方式
	
	if(manualCloseType == "click_other"){
		
	}
	else if(manualCloseType == "none"){
		
	}
	else {
		//默认采用点击popbox内的“x”按钮，关闭组件。
		var buttonNode = document.createElement("button");
		buttonNode.className = "close";
		buttonNode.onclick = function(ev){
			var popboxNo = this.parentNode.getAttribute("popbox_no") || this.parentNode.parentNode.getAttribute("popbox_no");
			var popboxObj = Popbox.visiblePopboxes[popboxNo];
			if(popboxObj)
				popboxObj.close();
		}
		this._contentWrapper.parentNode.appendChild(buttonNode);
		this._closeButton = buttonNode;
	}
}

Popbox = haux.component.Popbox;
//定义Popbox类的静态变量
Popbox.seriesIndex = 0;//popbox obj序列号起始值
Popbox.visiblePopboxes = {};//记录当前在页面上正在显示的popbox对象

/***********************************************************************************************
	Part 1 —— 定义Popbox的public函数，此类函数用于外部调用，需要详细说明 用途、算法、参数要求等
***********************************************************************************************/

/*	
	函数说明：设置popbox内的显示内容
	
	算法说明：将innerHTML参数设置为popbox要显示的提示内容
		
	参数说明：
		boxContent：文本、node、node数组
*/

Popbox.prototype.setContent = function(boxContent){
	if(!boxContent){
		this.clearContent();
	}
	else if(typeof boxContent == "string"){
		this._contentWrapper.innerHTML = boxContent;
	}
	else if(typeof boxContent == "object"){
		this.clearContent();
		if(!boxContent.length){
			this._contentWrapper.appendChild(boxContent);
		}
		else{
			for(var i = 0, len = boxContent.length; i < len; i++){
				this._contentWrapper.appendChild(boxContent)
			}	
		}
	}
}

/*	
	函数说明：在popbox内的显示内容框内，附加node元素
	
	算法说明：将node元素附加到popbox内层的content div内
		
	参数说明：targetNode—可以为element、textnode、documentFragment等
*/
Popbox.prototype.appendContent = function(targetNode){
	this._contentWrapper.appendChild(targetNode);
}

/*	
	函数说明：清除popbox内的显示内容
*/
Popbox.prototype.clearContent = function(){
	this._contentWrapper.innerHTML = "";
}

Popbox.prototype.getContent = function(){
	return this._contentWrapper;
}

Popbox.prototype.getElementRec = function(){
	return haux.dom.getElementRec(this._element);
}
Popbox.prototype.containElement = function(targetElement){
	return this._element == targetElement 
		|| this._element.contain(targetElement);
}
/*记录0-11点位与position，align的关系 ，图文说明如下

                     PopBox                      PopBox                      PopBox
                       direction=top                direction=top              relativePos=top
                       align=left                   align=middle               align=right
                       relativePos=0                relativePos=1              relativePos=2
  PopBox           |*************************************************************************| PopBox
   direction=left  |                                                                         |   direction=right
   align=top       |                                                                         |   align=top
   relativePos=11  |                                                                         |   relativePos=3
  PopBox           |                                                                         | PopBox 
   direction=left  |                        参照物(referenceElement)                          |   direction=right
   align=middle    |                                                                         |   align=middle
   relativePos=10  |                                                                         |   relativePos=4
  PopBox           |                                                                         | PopBox
   direction=left  |                                                                         |   direction=right
   align=top       |*************************************************************************|   align=bottom
	 relativePos=9   PopBox                      PopBox                      PopBox              relativePos=5
                       direction=bottom            direction=bottom            direction=bottom
                       align=left                  align=middle                align=right
                       relativePos=8               relativePos=7               relativePos=6
*/
relPositions = [
	{direction:"top", align:"left"}, {direction:"top", align:"middle"}, {direction:"top", align:"right"},	
	{direction:"right", align:"top"}, {direction:"right", align:"middle"}, {direction:"right", align:"bottom"},	
	{direction:"bottom", align:"right"}, {direction:"bottom", align:"middle"}, {direction:"bottom", align:"left"},	
	{direction:"left", align:"bottom"}, {direction:"left", align:"middle"}, {direction:"left", align:"top"}];

reverseDirection = {left:"right", right:"left", top:"bottom", bottom:"top", middle:"midddle"}
/*	
	函数说明：在document.body内显示popbox，显示位置为固定的坐标值。
	
	算法说明：
		1.将被隐藏的popbox._element设置为可见，以便后续可以正确计算popbox的长、宽
			注意：element元素的style.display=none时，通过js获得的长款值都是0
		2.regist object in visible popbox list
		
	参数说明：
		x,y—
			popbox显示时的绝对坐标值；
		arrowPos—
			接受两种类型的参数 I.arrow相对于popbox的位置码 ，0-11之间的数字。II.object对象，包含正确的direction和align属性。
*/
Popbox.prototype.showInAbsolutePos = function(arrowPos, x, y){
	if(!this._element.parentNode)
		document.body.appendChild(this._element);
	var relPosObj = (arrowPos instanceof Object) ? arrowPos : relPositions[arrowPos];
//1.将被隐藏的popbox._element设置为可见，以便调用_initBoxSurface函数时可以根据popbox的长、宽，正确设置arrow的坐标
	//注意：element元素的style.display=none时，通过js获得的长款值都是0
	this._element.style.display = "block";
	this._initBoxSurface(relPosObj.direction, relPosObj.align);
	this._element.style.left = x + "px";
	this._element.style.top = y + "px";	
	
//2.regist object in visible popbox list
	if(!this._seriesNo){
		this._seriesNo = "pop_box_" + Popbox.seriesIndex++;;
		
		this._element.setAttribute("popbox_no", this._seriesNo);
	}
	Popbox.visiblePopboxes[this._seriesNo] = this;
	
	if(this._closeType == "click_other" && !this.windowClickAttached){
		//延迟500毫秒后才对window对象绑定click相应事件，目的是避免在 popbox.showXXXX前的鼠标点击事件被错误捕获
		//引起box被打开后瞬间又被关闭。如果点击某按钮时立即new popbox->show box->在window绑定click响应函数，
		//则点击button函数引起的event会被传递到 window.onclick，导致刚刚被打开的popbox瞬间被关闭。

		haux.dom.addEventHandler(window, "click", function(ev){
			ev = ev || window.event;
			var clickedElement = ev.target || ev.srcElement;
			var closePopboxes = [];
			for(r in Popbox.visiblePopboxes){
				var popboxObj = Popbox.visiblePopboxes[r];
				if(popboxObj._closeType != "click_other")
					continue;
				if(!popboxObj._element.containOrEqual(clickedElement))
					closePopboxes.push(popboxObj);
			}
			for(var i = 0; i < closePopboxes.length; i++)
				closePopboxes[i].close();
		});
		
		
		this.windowClickAttached = true;
	}
}

/*	
	函数说明：在document.body内显示popbox，并以body内的element元素为参照物，设置popbox的显示位置。
	
	算法说明：
		如果用户指定了popbox与参照物之间的位置关系——
			1.先调用show函数，在body内显示popbox元素，并将popbox元素定位到用户不可见的区域
			2.根据 参照物(referenceElement)在html内的x,y坐标、popbox出现在参照物的相对位置、
				popbox自身的长宽(this._element)、人工偏移量(offsetLeft, offsetTop)，计算popbox的绝对定位坐标
			3.调整popbox的绝对定位坐标，使得popbox元素出现在body内正确的位置
		如果用户没有说明位置关系——
			1.在12个可用位置中，寻找一个合适的
			2.在该位置显示popbox

	参数说明：
		referenceElement—
			相对定位的element元素，popbox正是围绕着参照物定位的，element类型
		arrowPos—
			接受两种类型的参数 I.arrow相对于popbox的位置码 ，0-11之间的数字。II.object对象，包含正确的direction和align属性。
			               
		offsetLeft/offsetTop—
			popbox位置的偏移量，用于微调popbox与参照物之间的距离。当popbox与参照物距离过近时，
			即可设置3-5像素的offsetLeft和offsetTop，使得二者在视觉上不至于太拥挤
*/
Popbox.prototype.showInRelativePos = function(referenceElement, boxPos, offsetLeft, offsetTop){

	if(boxPos == null || boxPos.length){
	//如果参数只有referenceElement，没有boxPos、offsetLeft, offsetTop，则由系统根据页面内容自动找一个合适的点位
	//1.先调用show函数，在body内显示popbox元素，并将popbox元素定位到用户不可见的区域
		this.showInAbsolutePos(0, -10000, -10000);
	
	//2.获取候选的12个点位或直接用户指定的候选点位顺序
		var optionalPositions = null;
		if(!boxPos){
			optionalPositions = relPositions;
		}
		else{
			optionalPositions = [];
			for(var i = 0; i < boxPos.length; i++){
				optionalPositions.push(relPositions[boxPos[i]]);
			}
		}
	
	//3.按顺序遍历每个候选相对位置，检测popbox在此位置显示时，是否超出html元素范围，是否与其它可见的popbox重叠 
		//3.1 先获取页面内全部可见popbox的位置属性(recatange 数组)，用于后续和当前popbox的位置进行比较，看是否发生重叠
		var visiblePopboxPositions = [];//留空，有空再补齐吧
		for(var i = 0; i < optionalPositions.length; i++){
			//3.0 先按照待选pos，设置popbox的外形
			var relativePos = optionalPositions[i]; 
			this._initBoxSurface(reverseDirection[relativePos.direction], relativePos.align);
			
			//3.1 获取box采用此位置显示时，popbox的x,y坐标和高度、宽度 
			var popboxPos = this._getPopboxPos(referenceElement, relativePos.direction, relativePos.align);
			
			//3.2 如果计算出popbox的任何一侧已经超出了html的边界(上、下、左、右)，说明这个点位不好，需要试探下一个位置
			if(popboxPos.x < 0 || popboxPos.y < 0 
				|| (popboxPos.x + popboxPos.width) > Math.max(document.documentElement.clientWidth, document.documentElement.scrollWidth)
				|| (popboxPos.y + popboxPos.height) > Math.max(document.documentElement.clientHeight, document.documentElement.scrollHeight))
				continue;
			//3.3  如果计算出popbox与页面内可见的popbox相重叠，说明也是一个不好的点位，需要试探下一个位置
			for(var j = 0; j < visiblePopboxPositions.length; j++){
				var visiblePopboxPos = 	visiblePopboxPositions[j];
				if(popboxPos.intersect(visiblePopboxPos))
					continue;
			}
			//3.4 如果代码执行到这里，说明第i个点位不错，是个可用的点位，直接根据popboxRec数值，设置popbox的位置
			//this._element.style.left = popboxPos.x + "px";
			//this._element.style.top =  popboxPos.y + "px";	
			this._element.style.left = popboxPos.x + "px";
			this._element.style.top =  popboxPos.y + "px";
			return;
		}
	
		//4.如果运行到这里，说明12个点位显示时都有冲突，全部匹配不成功，只能强制显示第一个点位了
		this.showInRelativePos(referenceElement, optionalPositions[0]);
	}
	else if(typeof boxPos == "number" || boxPos.direction){
		var relPosObj = boxPos.direction ? boxPos : relPositions[boxPos];
	//1.先调用show函数，在body内显示popbox元素，并将popbox元素定位到用户不可见的区域
		this.showInAbsolutePos({direction:reverseDirection[relPosObj.direction], align:relPosObj.align}, -10000, -10000);
		
	//2.根据 参照物(referenceElement)在html内的x,y坐标、popbox出现在参照物的相对位置、
	//popbox自身的长宽(this._element)、人工偏移量(offsetLeft, offsetTop)，计算popbox的绝对定位坐标
		var boxPos = this._getPopboxPos(referenceElement, 
			relPosObj.direction, relPosObj.align, offsetLeft, offsetTop);
			
	//3.调整popbox的绝对定位坐标，使得popbox元素出现在body内正确的位置
		this._element.style.left = boxPos.x + "px";
		this._element.style.top =  boxPos.y + "px";	
	}
}

Popbox.prototype.close = function(){
	//1.hid dom element in body
	this._element.style.display = "none";
	
	//2.如果有事件响应函数，则调用
	if(this._closeCallbackFunc)
		this._closeCallbackFunc();
		
	//3.unregist object from visible popbox list
	delete Popbox.visiblePopboxes[this._seriesNo];
	
	//4.如果是一次性obj，关闭后不再需要使用了，则从body删除关联的_element对象
	if(this._removeElementAfterClose){
		document.body.removeChild(this._element);
	}
	
	//5.
	delete this.windowClickAttached;
}

/***********************************************************************************************
	Part 2 —— 定义Popbox的private函数，此类函数限定内部调用，函数说明可稍微简单一些
***********************************************************************************************/

//设置箭头位置和所选皮肤，使得popbox外观符合要求
Popbox.prototype._initBoxSurface = function(direction, align){
	var skinElement = this._element.getElementsByTagName("div")[0];
	if(this._skin){
		skinElement.className = this._skin + " " + direction + "_" + align;
	}
	else{
		skinElement.className = direction + "_" + align;
	}
}

//根据参照物在html中的坐标，以及popbox与参照物的相对位置、popbox自身的长/宽，计算popbox的绝对定位坐标
Popbox.prototype._getPopboxPos = function(referenceElement, direction, align, offsetLeft, offsetTop){
	//var arrowHeight = this._arrowWrapper.offsetHeight;
	//var arrowWidth = this._arrowWrapper.offsetWidth;
	var boxHeight = this._element.offsetHeight;
	var boxWidth = this._element.offsetWidth;
	var elementPos = haux.dom.getElementRec(referenceElement);
	
	var boxTop;
	var boxLeft; 
	if(direction == "left" && align == "top"){//左上，direction=12
		boxLeft = elementPos.x - boxWidth;
		boxTop = elementPos.y;
	}
	else if(direction == "left" && align == "middle"){//左中，direction=11
		boxLeft = elementPos.x - boxWidth;
		boxTop = Math.ceil(elementPos.y + referenceElement.offsetHeight / 2 - boxHeight / 2);
	}
	else if(direction == "left" && align == "bottom"){//左下，direction=10
		boxLeft = elementPos.x - boxWidth;
		boxTop = elementPos.y + referenceElement.offsetHeight;
	}	
	if(direction == "right" && align == "top"){//右上，direction=4
		boxLeft = elementPos.x + referenceElement.offsetWidth;
		boxTop = elementPos.y;
	}
	else if(direction == "right" && align == "middle"){//右中，direction=5
		boxLeft = elementPos.x + referenceElement.offsetWidth;
		boxTop = Math.ceil(elementPos.y + referenceElement.offsetHeight / 2 - boxHeight / 2);
	}
	else if(direction == "right" && align == "bottom"){//右下，direction=6
		boxLeft = elementPos.x + referenceElement.offsetWidth;
		boxTop = elementPos.y + referenceElement.offsetHeight - boxHeight;
	}	
	else if(direction == "top" && align == "left"){//上左，direction=1
		boxLeft = elementPos.x;
		boxTop = elementPos.y - boxHeight;
	}
	else if(direction == "top" && align == "middle"){//上中，direction=2
		boxLeft = Math.ceil(elementPos.x + referenceElement.offsetWidth / 2 - boxWidth / 2);
		boxTop = elementPos.y - boxHeight;
	}
	else if(direction == "top" && align == "right"){//上左，direction=3
		boxLeft = elementPos.x + referenceElement.offsetWidth - boxWidth;
		boxTop = elementPos.y - boxHeight;
	}
	else if(direction == "bottom" && align == "left"){//下左，direction=9
		boxLeft = elementPos.x;
		boxTop = elementPos.y + referenceElement.offsetHeight;
	}
	else if(direction == "bottom" && align == "middle"){//下中，direction=8
		boxLeft = Math.ceil(elementPos.x + referenceElement.offsetWidth / 2 - boxWidth / 2);
		boxTop = elementPos.y + referenceElement.offsetHeight;
	}
	else if(direction == "bottom" && align == "right"){//下右，direction=7
		boxLeft = elementPos.x + referenceElement.offsetWidth - boxWidth;
		boxTop = elementPos.y + referenceElement.offsetHeight;
	}
	return new haux.util.Rectangle(boxLeft + (offsetLeft || 0), boxTop + (offsetTop || 0), boxWidth, boxHeight);
}

/***********************************************************************************************
	Part 3 —— 定义快速使用Popbox的函数，使得在无特殊要求时，可以直接调用单个函数完成"创建popbox对象+文档内展现"的全流程
***********************************************************************************************/

/*	
	函数说明：快速创建popbox对象，并在body显示box内容
	
		
	参数说明：
		popboxContent—
			接受两种参数，字符串类型的innerHTML，或者node节点，如element/textnode/documentFrame等
		arrowPos—
			接受两种类型的参数 I.arrow相对于popbox的位置码 ，0-11之间的数字。II.object对象，包含正确的direction和align属性。
		skin-自定义皮肤名称
*/
//快速显示popbox
function showPopboxInAbsolutePos(popboxContent, x, y, arrowPos, skin, closeType){
	setTimeout(function(){
		var popboxObj = new Popbox(closeType, skin, true);
		popboxObj.setContent(popboxContent);
		popboxObj.showInAbsolutePos(arrowPos, x, y);
	}, 100);
}

/*	
	函数说明：快速创建popbox对象，并一referenceElement为参照物，在body显示box内容，
		
	参数说明：
		popboxContent—
			接受两种参数，字符串类型的innerHTML，或者node节点，如element/textnode/documentFrame等
		boxPos—
			popbox相对于referenceElement的位置，接受两种类型的参数。如果该参数为空，则系统将自动找一个合适的位置。
			I.arrow相对于popbox的位置码 ，0-11之间的数字。II.object对象，包含正确的direction和align属性。
			
		skin-自定义皮肤名称
*/
//快速显示popbox
function showPopboxInRelativePos(popboxContent, referenceElement, boxPos, skin, offsetLeft, offsetTop, closeType){
	var popboxObj = new Popbox(closeType, skin, true);
	popboxObj.setContent(popboxContent);
	if(closeType == "click_other"){
		setTimeout(function(){
			popboxObj.showInRelativePos(referenceElement, boxPos, offsetLeft, offsetTop);
		}, 100);
	}
	else{
		popboxObj.showInRelativePos(referenceElement, boxPos, offsetLeft, offsetTop);
	}
	return popboxObj;
}
//由popbox._element包含的元素调用，找到popbox顶层dom元素，获得popbox_no，获取popbox obj，关闭popbox
function closeOuterPopbox(elementInPopBox){
	while(elementInPopBox){
		var popboxNo = elementInPopBox.getAttribute("popbox_no");
		if(popboxNo){
			var popboxObj = Popbox.visiblePopboxes[popboxNo];
			if(popboxObj){
				popboxObj.close();
				return;
			}
		}
		elementInPopBox = elementInPopBox.parentNode;
	}
}

haux.dom.addEventHandler(window, "load", function(){
	haux.dom.addCssFile(home() + "/style/popbox.css");
});