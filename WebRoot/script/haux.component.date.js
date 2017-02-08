haux.component.date = {};
/*	版本信息：pj 2013-6-6 add。
		
	函数说明：
		批量设置文档内的日期输入框时间相应函数，使得输入框获取光标后可以调用trip-calendar.js显示日历控件
		同时支持用户手工输入，在用户输入错误的数据格式后，系统自动回退输入框内日期值
		
	算法说明：
		1.获取文档内全部className包含自定义的className的input元素。
		2.根据日历输入框的数据类型（yyyy-mm-dd,yyyy-mm-dd h24:mi:ss,h24:mi:ss等），为input元素绑定事件响应函数
		3.为input控件设置onblur相应函数，用于检验用户手工输入的日期值是否合法，并在发生非法输入时回退
		
	使用说明：在页面加载时，由具体需要此项处理的jsp页面内的customizeBody函数直接调用，不再放到通用的window.onload函数中
*/
haux.component.date.setInputDates = function (){
	//预处理,不是每一个jsp页面都需要引入taobao日历js包处理日期控件
	if(typeof(YUI) == "undefined"){
		return;
	}
	var calendarContainer = document.getElementById("J_Calendar");
	if(!calendarContainer){
		calendarContainer = document.createElement("J_Calendar");
		document.body.appendChild(calendarContainer);
	}
	
	YUI({
	    modules: {
	        'trip-calendar': {
	            fullpath: '../../script/calendar/trip-calendar.js',
	            type    : 'js',
	            requires: ['trip-calendar-css']
	        },
	        'trip-calendar-css': {
	            fullpath: '../../script/calendar/skin/trip-calendar.css',
	            type    : 'css'
	        }
	    }
	}).use('trip-calendar', function(Y) {
		//a.创建taobao日历对象
	   oCal = new Y.TripCalendar({
	        //绑定日历的节点，支持选择器模式，可批量设置（必选）
	        //triggerNode: '.Wdate',
	        container: "J_Calendar",
	        count:1,
	        isDateInfo:false,
	        isSelect:true
	    });
		
		//b.获取页面内全部的input.Wdate对象，绑定onclick事件
	    var inputElements = document.getElementsByClassName("Wdate");
	    var len = inputElements.length;
	    if(len == 0)
	    	return;
		for(var i = 0; i < len; i++){
	    	inputElement = inputElements[i];
	    	inputElement.onclick = function(ev){
	    		var mousePos = haux.dom.getMousePosInElement(ev);
	    		var elementRec = haux.dom.getElementRec(this);
	    		if(mousePos.x + 20 < elementRec.width)
	    			return;
	    		
	    		calendarContainer.style.position = "absolute";
	    		calendarContainer.style.left = elementRec.x + "px";
	    		calendarContainer.style.top = elementRec.y  + elementRec.height + "px";
	    		oCal.show();
	    		oCal.srcElement = this;
	    		//因为日历空间调用show方法时，会在document元素注册onclick函数，使得点击其它区域时关闭日历空间。
	    		//如果input的onclick函数继续冒泡至body，会导致日历空间被瞬间关闭，用户看不到任何东西
	    		haux.dom.stopPropagateEvent(ev);
	    	}
	    }
	    //c.设置日期控件被点击后的响应事件函数，以便将日期值回写input.value属性个
	    oCal.on("dateclick", function(){
	    	var selectedDate = this.get("selectedDate");
	    	//var triggerNode = this.get("triggerNode");
	    	//alert(selectedDate);
	    	if(this.srcElement){
		    	this.srcElement.value = selectedDate;
		    	this.srcElement = null;
	    	}
	    	this.hide();
	    });
	    oCal.hide();
	});

}

haux.dom.addEventHandler(window, "load", function(){
	haux.component.date.setInputDates();
});