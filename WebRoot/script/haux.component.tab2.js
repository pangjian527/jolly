/*
 * myq add 2015-6-2新增，采用下面的新表达方式，用于取代原先的haux.component.tab组件
<dl class="tab-box">
	<dt class="tab-label">
		<ul>
			<li class="selected">第1个tab选项</li>
			<li>第2个tab选项</li>
			<li>第3个tab选项</li>
		</ul>
		<div class="clear"></div>
	</dt>
	<dd class="tab-content selected">第1个tab内容</dd>
	<dd class="tab-content">第2个tab内容</dd>
	<dd class="tab-content">第3个tab内容</dd>
</dl>
*/
haux.component.tab2 = function(config){
	this._element = config.element;	
	this._action = config.action || "click";//支持 click、hover两种模式，默认click
	var dlElement = this._element.getElementsByTagName("dl")[0];
	
	var tabLabels = [];
	var tabContents = [];
	//var childNode = dlElement.firstChild;
	
	var liElements = config.element.getElementsByTagName("dt")[0].getElementsByTagName("li");
    for(var i = 0; i < liElements.length; i++){
    	var liElement = liElements[i];
    	liElement.tabIndex = i;
    	var action = config.action || "click";
    	haux.dom.addEventHandler(liElement, action, function(){
    		if(this.className == "selected"){
    			return;
    		}
    		//tab-label閫夐」
    		var liElements = this.parentNode.getElementsByTagName("li");
    		for(var i = 0; i < liElements.length; i++){
    			var liElement = liElements[i];
    			liElement.className = liElement == this ? "selected" : "";
    		}
    		
    		//tab-content閫夐」
    		var ddElement = this.parentNode.parentNode.nextSibling;
    		var ddElements = [];
    		while(ddElement){
    			if(ddElement.tagName == "DD"){
    				ddElements.push(ddElement);
    				if(ddElement.className != "tab-content"){
    					ddElement.className = "tab-content";
    				}
    			}
    			ddElement = ddElement.nextSibling;
    		}
    		ddElements[this.tabIndex].className = "tab-content selected";
    	});
    }
    
}
