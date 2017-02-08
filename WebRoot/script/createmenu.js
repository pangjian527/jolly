function logout() {
	if(window.confirm("你确认要退出本系统吗?"))
		top.location = 'login.action?op=quit';
}

//用于左侧菜单组的展开与关闭
function switchVisible(){
	if(this.className == "closed"){
		//已经关闭了，要打开
		this.className = "";
		for(var nextNode = this.nextSibling; nextNode && nextNode.nodeName != "DT"; nextNode = nextNode.nextSibling)
			if(nextNode.nodeName == "DD")
				nextNode.style.display = "";
	}
	else{
		//关闭
		this.className = "closed";
		for(var nextNode = this.nextSibling; nextNode && nextNode.nodeName != "DT"; nextNode = nextNode.nextSibling)
			if(nextNode.nodeName == "DD")
				nextNode.style.display = "none";
	}
}

function _getSubMenus(menus, parentId){
	var result = [];
	for(var i = 0; i < menus.length; i++){
		var menu = menus[i];
		if(menu.parentId == parentId){
			result.push(menu);
		}
	}
	result.sort(function(a, b){
		return parseInt(a.seq) - parseInt(b.seq);
	});
	
	return result;
}
		
//myq add 2011-7-16，根据menu json对象创建顶部的主菜单和左侧的辅菜单
createMenu = function(navTrees){
	//0.将SysNavTree数组，从parentId = 0开始，转变为树状结构
	var menus = _getSubMenus(navTrees, null);
	
	//1.创建顶部的主菜单
	var ulNode = document.createElement("ul");
	for(var i = 0; i < menus.length ; i++){
		//1.1创建2-3级menu
		childMenus = _getSubMenus(navTrees, menus[i].id);
		
		for(var j = 0; j < childMenus.length; j++){
			var childMenu = childMenus[j];
			childMenu.childs = _getSubMenus(navTrees, childMenu.id);
		}
		
		//1.2创建element元素
		var aNode = document.createElement("a");
		var menu = menus[i];
		aNode.innerHTML = menu.name;	//text
		aNode.setAttribute("code", menu.code);
		aNode._subMenus = childMenus;
		aNode.href="javascript:void()";
		aNode.onclick = function(){
			var selectedLiNode = this.parentNode.parentNode;
			//切换css,显示样式
			var liNodes = selectedLiNode.parentNode.getElementsByTagName("li");
			for(var i = 0, len = liNodes.length; i < len; i++){
				var liNode = liNodes[i];
				liNode.className = liNode == selectedLiNode ? "selected" : "";
			}
			//根据menuObj.subMenuItems的内容，动态创建该一级菜单对应的左侧2/3级菜单
			_createSubMenu(this._subMenus);
			
			//选定第一个三级菜单为focus，并展开相关的iframe内容
			document.getElementById("sub_menu")
				.getElementsByTagName("dl")[0]
				.getElementsByTagName("dd")[0]
				.getElementsByTagName("a")[0]
				.onclick();
		}
		
		var liNode = document.createElement("li");
		var spanNode = document.createElement("span");
		spanNode.appendChild(aNode);
		liNode.appendChild(spanNode);
		ulNode.appendChild(liNode)
	}
	var divNode = document.getElementById("main_menu");
	divNode.appendChild(ulNode);	
}

//myq add 2011-7-16，根据menu json对象创建顶部的左侧的辅菜单
_createSubMenu = function(menus){
	//1.清除现有侧边菜单
	var divNode = document.getElementById("sub_menu");
	while(divNode.firstChild){
		divNode.removeChild(divNode.firstChild);
	}
	//2.生成根据第N个主菜单下挂的menuData数组对象，创建2/3级菜单
	var dlNode = document.createElement("dl");
	for(var i = 0; i < menus.length ; i++){
		var menu = menus[i];
		
		//创建2级菜单对应的dt和+/-按钮
		var dtNode = haux.dom.createElement("dt", {innerHTML:menu.name});
		dtNode.onclick = switchVisible;
		dlNode.appendChild(dtNode);
		//根据2级菜单下的子菜单，创建3级菜单对应的dd
		for(var j = 0; j < menu.childs.length; j++){
			var ddNode = document.createElement("dd");
			var aNode = document.createElement("a");
			aNode.href="javascript:void()";
			var subMenu =  menu.childs[j];
			var aNode = haux.dom.createElement("a", {innerHTML:subMenu.name, 
				code : subMenu.code, iframesrc : subMenu.furl, href:"javascript:void()"});
			
			aNode.onclick = function(){
				var selectedDdNode = this.parentNode;	
				//1.清除之前选中的li元素的selected样式，将自身设置为selected
				var vislbleDdNodes = selectedDdNode.parentNode.parentNode.getElementsByTagName("dd");
				for(var i = 0, len = vislbleDdNodes.length; i < len; i++){
					var ddNode = vislbleDdNodes[i];
					ddNode.className = ddNode == selectedDdNode ? "selected" : "";
				}
				//2.更新iframe内的文档内
				var iframeNode = document.getElementById("frame_content");
				iframeNode.src = home() + this.getAttribute("iframesrc");	
			}	
			ddNode.appendChild(aNode);
			dlNode.appendChild(ddNode);
		}
		
	}
	divNode.appendChild(dlNode);
}

			