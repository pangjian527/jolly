
haux.component.Select2 = function(config){
	this._targetElement = config.targetElement;
	this._queryAjaxUrl = config.queryAjaxUrl;
	this._getAjaxUrl = config.getAjaxUrl;
	this._inputPrompt = config.inputPrompt;//输入提示文本
	this._textProperty = config.textProperty;
	this._entity = null;
	this._html=config.html;//2014-4-18 pj add 用于在select后面加上自定义HTML。比如说追加一个按钮
	var _select2Obj = this;//为回调函数闭包引用
	this._data=config.data?config.data:{};
	
	$(this._targetElement).select2({
		placeholder: this._inputPrompt,
		minimumInputLength: 1,
		html:this._html,
        ajax:{
           url:home()+ this._queryAjaxUrl,
           dataType: 'json',
           type:'POST',
           data: function (term, pn) {
				_select2Obj._data.search=""+term+"";
				var condition= haux.util.Json.getString(_select2Obj._data);
				return {condition: condition, pn : pn}
			},
           results: function (data, page) {return {results : data.results, more : (page * 10) < data.total}}
		},
        initSelection:function(element, callback) {
            var id = $(element).val();
            if (id && _select2Obj._getAjaxUrl) {

            	var ajaxUrl = home() + _select2Obj._getAjaxUrl;
            	ajaxUrl += ajaxUrl.indexOf("?") >= 0 ? '&id=' + id : '?id=' + id

                $.ajax(ajaxUrl, {dataType: "json"})
                	.done(function(data){ 
                			callback(data); 
                		}
                	);
            }
        },
        formatResult: function(data){return _select2Obj._movieFormatResult(data)},
        formatSelection:function(data){return _select2Obj._movieFormatSelection(data)},
        dropdownCssClass: "bigdrop", 
        escapeMarkup: function (m) { return m; } 
    });
} 
/*
 * 
 * 版本说明：2013-8-13 pj add
 * 
 * 功能说明：设置选择后获取对象那些属性显示出来
 * 
 * 算法说明：根据Select2配置的_files属性信息，如果_files是一个数组， 则判断_files所有字段是否在entity对象中
 * 			  如果存在，则通过"/"拼接返回所有属性信息
 */
haux.component.Select2.prototype._movieFormatSelection = function(entity) {
	if(!entity)
		return null;
	
	this._entity = entity;
	switch(haux.util.getType(this._textProperty)){
		case "array":
			var texts = [];
			for(var i = 0; i < this._textProperty.length; i++){
				texts.push(entity[this._textProperty[i].toUpperCase()]||entity[this._textProperty[i].toLocaleLowerCase()]);
			}
			return texts.join(", ");
		case "string":
			return entity[this._textProperty.toUpperCase()]||entity[this._textProperty[i].toLocaleLowerCase()];
	}
    return null;
}


/*
 * 版本信息：2013-08-13 pj add 
 * 
 * 功能说明：设置通过ajax搜索到的结果集如何显示
 * 
 * 算法说明：1. 判断this._resultField字段的数据类型
 * 			 2. 如果是数组，则通过遍历_resultField所有字段存在entity对象的属性信息封装成html返回
 * 			 3. 如果是字符串，则直接获取entity对象的this._resultField封装成html返回
 */
haux.component.Select2.prototype._movieFormatResult=function (entity) {
	var markup = "<table class='movie-result'><tr>";
	switch(haux.util.getType(this._textProperty)){
		case "array":
			//var len=this._resultField.length;
			for(var i = 0; i < this._textProperty.length; i++){
				var proName = this._textProperty[i];
				var text = "";
				if(entity.hasOwnProperty(proName)){
					text = entity[proName];
				}
				else if(entity.hasOwnProperty(proName.toUpperCase())){
					text = entity[proName.toUpperCase()];
				}
				else if(entity.hasOwnProperty(proName.toLowerCase())){
					text = entity[proName.toUpperCase()];
				}
				markup += "<td class='movie-image'>" + text + "</td>";
			}
			break;
		case "string":
			markup += "<td class='movie-image'><div class='movie-synopsis'>" + entity[this._textProperty] + "</div></td>";;
	}
    markup += "</tr></table>"
	return markup;
}

 /*
  * 版本信息：2014-01-25 pj add
  * 
  * 功能说明：用于设置select的值
  * 
  */ 
haux.component.Select2.prototype.setValue=function(value){
	document.getElementById(this._targetElement.id).value=value;
	//这里好像是彻底重建select2控件，有没有更轻量级的方法？
	$("#"+this._targetElement.id).select2("val", value);
}

 /*
  * 版本信息：2014-01-25 pj add
  * 
  * 功能说明：用于获取当前select选中的value值
  * 
  */ 
haux.component.Select2.prototype.getValue = function(){
	return this._targetElement.value;
}
haux.component.Select2.prototype.close=function (){
	$("#"+this._targetElement.id).select2("close");
}

 /*
  * 版本信息：2014-01-25 pj add
  * 
  * 功能说明：用于获取当前select选中的text值
  * 
  */ 
haux.component.Select2.prototype.getText = function(){
    return this._movieFormatResult(this._entity);
}

haux.dom.addEventHandler(window, "load", function(){
	haux.dom.addCssFile(home() + "/style/select2.css");
});

