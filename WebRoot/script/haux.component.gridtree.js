haux.component.GridTree = function(tableElement, treeCol, scrollBodyOnly){
	//1.
	this._table = tableElement;
	this._table.addClass("grid_tree");
	this._tBody = this._table.tBodies[0];
	
	//2.
	this._treeColIndex = treeCol;
	
	//3.如果是固定head、只滚动body，还需要加模拟的div框
//alert(this._table.offsetWidth);
	if(scrollBodyOnly){
		var tableWidth = this._table.offsetWidth;//强迫html重绘，以便准确获知table的宽度
		var cloneTable = this._table.cloneNode();
		//alert(cloneTable.innerHTML);
		cloneTable.id = null;
		//var colElements = this._table.getElementsByTagName("col");
		//for(var i = 0, len = colElements.length; i < len; i++){
		//	cloneTable.appendChild(colElements[i].cloneNode());
		//}
		//cloneTable.appendChild(this._table.tHead.cloneNode(true));
		cloneTable.addClass("clone");
		this._table.parentNode.insertBefore(cloneTable, this._table);
		//alert(cloneTable.innerHTML)
		
		var divElement = document.createElement("div");
		divElement.style.cssText = "margin:0;padding:0;border:0;overflow-x:hidden;overflow-y:auto;border-bottom:1px solid #ccc";
		divElement.style.height = cloneTable.parentNode.clientHeight - cloneTable.offsetHeight - 5 + "px";
		divElement.style.width = tableWidth + "px";
		this._table.parentNode.insertBefore(divElement, this._table);
		divElement.appendChild(this._table);
		this._table.tHead.style.display = "none";
		this._table.style.borderTop = 0;
		setInterval(function(){
			divElement.style.height = cloneTable.parentNode.clientHeight - cloneTable.offsetHeight - 5 + "px";
			divElement.style.width = cloneTable.offsetWidth + "px";
		}, 1000);
	}
}

haux.component.GridTree.prototype.clearRows = function(){
	this._tBody.innerHTML = "";
}

haux.component.GridTree.prototype.addRow = function(level, containChild, cellValues){
	//1.创建数据行tr
	var trElement = haux.dom.createElement("tr", {level:level, className:"level_" + level});
	
	//2.创建行内第0-N个td
	for(var i = 0; i < cellValues.length; i++){
		var tdElement = haux.dom.createElement("td", {className:"col_" + i});
		var cellContent = cellValues[i];
		if(i == this._treeColIndex){
			tdElement.className += " tree_cell";
			tdElement.appendChild(document.createElement("s"));
			
			var divElement = haux.dom.createElement("div", 
				{className: !containChild ? "leaf" : "folder_open"});
			if(cellContent instanceof Node){
				divElement.appendChild(cellContent)	
			}
			else{
				divElement.innerHTML = cellContent;
			}
			
			if(containChild){
				var buttonElement = haux.dom.createElement("button", {type:"button", innerHTML:"+/-"});
				//buttonElement.treeColIndex = this._treeColIndex;
				buttonElement.onclick = swithChild;
				divElement.insertBefore(buttonElement, divElement.firstChild);
			}
			tdElement.appendChild(divElement);
		}
		else{
			if(cellContent instanceof Node){
				tdElement.appendChild(cellContent)	
			}
			else{
				tdElement.innerHTML = cellContent;
			}
		}
		trElement.appendChild(tdElement);
	}
	this._tBody.appendChild(trElement);
	return trElement;
}

haux.component.GridTree.prototype.addRows = function(rowDatas, childPropertyName, createRowFunc){
	//dataSoucrce.gridTreeLevel = 1;
	var stack = [];
	for(var i = rowDatas.length - 1; i >=0; i--){
		rowDatas[i].gridTreeLevel = 1;
		stack.push(rowDatas[i]);
	}
	
	while(stack.length){
		var targetData = stack.pop();
		var cellValues = createRowFunc(targetData);
		var childDatas = targetData[childPropertyName];
		var level = targetData.gridTreeLevel;
		delete targetData.gridTreeLevel;
		if(childDatas && childDatas.length){
			this.addRow(level, true, cellValues);
			//加子节点了 
			for(var i = childDatas.length - 1; i >= 0; i--){
				var childData = childDatas[i];
				childData.gridTreeLevel = level + 1;
				stack.push(childDatas[i]);
			}
		}
		else{
			this.addRow(level, false, cellValues);
		}
		
	}
}

function swithChild(){
	var divElement = this.parentNode;
	var treeColIndex = this.parentNode.parentNode.cellIndex;
	if(divElement.className == "folder"){
		//当前目录是关闭的，需要展开子节点
		var currentTrElement = divElement.parentNode.parentNode;
		var currentLevel = parseInt(currentTrElement.getAttribute("level"));
		var nextTrElement = currentTrElement.nextSibling;
		while(nextTrElement){
			if(nextTrElement.tagName == "TR"){
				var level = parseInt(nextTrElement.getAttribute("level")); 
				if(currentLevel < level){
					nextTrElement.style.display = "";
					var childDivElement = nextTrElement.cells[treeColIndex].getElementsByTagName("DIV")[0];
					if(childDivElement.className == "folder")
						childDivElement.className = "folder_open";
				}
				else{
					//子节点已扫描完毕，碰到和自己平级或者更高级别的节点，退出 
					break;
				}
			}
			nextTrElement = nextTrElement.nextSibling;
		}
		divElement.className = "folder_open";
	}
	else{
		//当前目录是打开的，需要关闭子节点
		var currentTrElement = divElement.parentNode.parentNode;
		var currentLevel = parseInt(currentTrElement.getAttribute("level"));
		var nextTrElement = currentTrElement.nextSibling;
		while(nextTrElement){
			if(nextTrElement.tagName == "TR"){
				var level = parseInt(nextTrElement.getAttribute("level")); 
				if(currentLevel < level){
					nextTrElement.style.display = "none";
				}
				else{
					//子节点已扫描完毕，碰到和自己平级或者更高级别的节点，退出 
					break;
				}
			}
			nextTrElement = nextTrElement.nextSibling;
		}
		divElement.className = "folder";
	}
}

haux.dom.addEventHandler(window, "load", function(){
	haux.dom.addCssFile(home() + "/style/gridtree.css");
});

haux.component.GridTree.prototype.initSearchBox = function(divElement, excludeCols){
	//1.
	divElement.addClass("grid_tree_search_box");
	//2.
	this._search = {};
	this._search._inputElement = divElement.getElementsByTagName("input")[0];
	this._search._spanElement = divElement.getElementsByTagName("span")[0];
	this._search._nextButton = divElement.getElementsByTagName("button")[0];
	this._search._nextButton.className = "next";
	this._search._previousButton = divElement.getElementsByTagName("button")[1];
	this._search._previousButton.className = "previous";
	this._search._excludeCols = excludeCols;
	this._search._cells = [];
	//3.
	var gridTreeObj = this;//用于闭包引用
	this._search._inputElement.onkeyup = function(){
		if(haux.component.GridTree._interval){
			clearTimeout(haux.component.GridTree._interval);
			haux.component.GridTree._interval = null;
		}
		haux.component.GridTree._interval = setTimeout(function(){
			//1.获取关键字
			var keyword = gridTreeObj._search._inputElement.value;
			if(!keyword)
				return;
			
			gridTreeObj.searchTable(keyword);	
		}, 500);	
	}
	this._search._nextButton.onclick = function(){
		gridTreeObj.focusNext();
	}
	this._search._previousButton.onclick = function(){
		gridTreeObj.focusPrevious();
	}
}

haux.component.GridTree.prototype.searchTable = function(keyword){
	//1.清除上一次搜索的痕迹
	this._clearQueryTrace();
	
	//2.根据keyword,搜索 gridTree中的 cells	
	this._search._keyword = keyword;
	var queryResult = [];
	var cells = this._table.getElementsByTagName("td");
	for(var i = 0; i < cells.length; i++){
		var cell = cells[i]
		if(this._search._excludeCols && this._search._excludeCols.contain(cell.cellIndex))
			continue;
		if(cell.innerText.indexOf(keyword) >= 0){
			queryResult.push(cells[i]);
		}
	}
	this._search._cells = queryResult;

	//3.展现搜索结果
	if(this._search._cells.length){
		this._search._iterator = 0;
		this._search._spanElement.className = "";
		//3.如果本次搜索结果 有数据，聚焦到第一个匹配项
		this._focusCurrent();
	}
	else{
		this._search._spanElement.innerHTML = "未找到匹配内容";
		this._iterator = null;
		this._search._cells = [];
		this._search._spanElement.className = "empty_result";
	}
}

haux.component.GridTree.prototype.focusNext = function(){
	if(!this._search._cells.length)
		return;
	this._search._iterator = this._search._iterator >= this._search._cells.length - 1 ? 0 : this._search._iterator + 1;
	this._focusCurrent();
}
haux.component.GridTree.prototype.focusPrevious = function(){
	if(!this._search._cells.length)
		return;
	this._search._iterator = this._search._iterator <= 0 ? this._search._cells.length - 1 : this._search._iterator - 1;
	this._focusCurrent();
}
//聚焦搜索结果 
haux.component.GridTree.prototype._focusCurrent = function(){
	//1.清除上一个聚焦点的高亮效果 
	if(this._search._focusCell){
		this._restoreCell(this._search._focusCell);
		//focusCell.innerHTML = focusCell.innerHTML.replace(/<i>|<\/i>/g, "");
	}
	//2.为当前聚焦点 设置高亮 效果 
	var focusCell = this._search._cells[this._search._iterator];
	this._highlightCell(focusCell, this._search._keyword);
	
	//3.确保 当前聚焦点出现 在窗口可见范围
	var divElement = this._table.parentNode;
	
	if(divElement.scrollHeight > divElement.offsetHeight){
		//发生滚动时才可能出现focusCell出现在屏幕外的场景 
		if(focusCell.offsetTop < divElement.scrollTop){
			//focus cell在可见区域的上方，需要减少scrollTop值 
			var scrollTop = focusCell.offsetTop;
			scrollTop = Math.max(0, scrollTop - Math.floor(divElement.clientHeight / 2) + focusCell.offsetHeight);
			divElement.scrollTop = scrollTop;
		}
		else if(focusCell.offsetTop + focusCell.offsetHeight > divElement.scrollTop + divElement.clientHeight){
			//focus cell在可见区域的上方，需要增加 scrollTop值
			var scrollTop =  focusCell.offsetTop + focusCell.offsetHeight - divElement.clientHeight;
			scrollTop = Math.min(scrollTop + Math.floor(divElement.clientHeight / 2), divElement.scrollHeight);
			divElement.scrollTop = scrollTop;
		}
	}
	
	//3.记录 历史 
	this._search._focusCell = this._search._cells[this._search._iterator];
	
	//4.更新span
	this._search._spanElement.innerHTML = "第 " + (this._search._iterator + 1) + "条，共" + this._search._cells.length + "条 ";
}

//清除查询痕迹，包括spanElement中的提示内容，GreetTree中的高亮块，GridtreeQuery对象中的各属性
haux.component.GridTree.prototype._clearQueryTrace = function(){
	if(!this._search._cells.length)
		return;
	//1.清除spanElement
	this._search._spanElement.innerHTML = "";
	this._search._spanElement.className = "";
	
	//2.清除 greed tree中的高亮块
	this._restoreCell(this._search._focusCell);
	
	//3.清除 GridtreeQuery对象的私有变量
	this._search._cells = [];
	this._search._iterator = null;
	this._search._keyword = "";
}
haux.component.GridTree.prototype._restoreCell = function(targetCell){
	targetCell.innerHTML = targetCell.innerHTML.replace(/<i>|<\/i>/g, "");
}
haux.component.GridTree.prototype._highlightCell = function(targetCell, keyword){
	//暂时没使用正则表达式，先凑合用遍历dom tree中全部textNode的笨办法
	//出于效率考虑，不递归循环遍历，而是采用stack模拟递归，一次性找出全部的TextNode
	var nodeStack = [];
	nodeStack.push(targetCell);
	var keywordRegExp = new RegExp(keyword, "g");
	while(nodeStack.length){
		var currentNode = nodeStack.splice(0, 1)[0];
		switch(currentNode.nodeType){
			case 1://node节点，还需要继续遍历子节点 
				for(var i = 0, len = currentNode.childNodes.length; i < len; i++)
					nodeStack.push(currentNode.childNodes[i]);
				break;
			case 3://文本节点，只需要检查是否符合高亮要求
				var htmlText = currentNode.nodeValue
				if(htmlText.indexOf(keyword) >= 0){
					var innerHTML = htmlText.replace(keywordRegExp, "<i>" + keyword + "</i>");
					var tempElement = document.createElement("span");
					tempElement.innerHTML = innerHTML;
					var parentNode = currentNode.parentNode;
					while(tempElement.firstChild)
						parentNode.insertBefore(tempElement.firstChild, currentNode);
					parentNode.removeChild(currentNode);
					delete tempElement;
				}
				break;
			default:
				break;//对Comment Attribute DocumentFragment类型，只出堆，什么都不做
		
		}
	}
}