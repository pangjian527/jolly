$(function() {
	areaSelect(1);
	areaSelect(2);
	areaSelect(3);
	contactLink();
	//loadShop();
});	

//常用联系人切换
function contactLink(){
	$('input:radio[name="caddr"]').each(function(){
		$(this).click(function(){
			if($('#customerAddrId').val() != $(this).val()){
				$('#customerAddrId').val($(this).val());
				if($(this).val()!='-1'){
					$('#contactMan').val($(this).attr('man'));
					$('#contactTel').val($(this).attr('tel'));
					$('#contactAddr').val($(this).attr('addr'));
					areaUpLink(1,$(this).attr('provinceId'),$(this).attr('cityId'),$(this).attr('areaId'));
				}
			}
		});
	});
}

//区域联动
function areaSelect(index){
	$('#province'+index).change(function() {
		var url = _home+'/common/area_functions.json?pid='+$(this).val();	
		fillCombo($("#city"+index), url, null, '--请选择--', function() {
			$("#city"+index).trigger("change")
		});
	});
	$('#city'+index).change(function() {
		if($(this).val()!=''){
			var url = _home+'/common/area_functions.json?pid='+$(this).val();	
			fillCombo($("#district"+index), url, null, '--请选择--', function() {
			});
		}
	});
	//$('#province'+index).trigger("change");
}

function areaUpLink(index,provinceId,cityId,areaId){
	//alert('index='+index+" p="+provinceId+" c="+cityId+' a='+areaId);
	var url = _home+'/common/area_functions.json?pid='+cityId;	
	fillCombo($("#district"+index), url, null, '--请选择--', function() {
		$("#district"+index).val(areaId);
	});
	url = _home+'/common/area_functions.json?pid='+provinceId;	
	fillCombo($("#city"+index), url, null, '--请选择--', function() {
		$("#city"+index).val(cityId);
	});
	url = _home+'/common/area_functions.json?pid=100';	
	fillCombo($("#province"+index), url, null, '--请选择--', function() {
		$("#province"+index).val(provinceId);
	});
}



/* 基于List<IdText>的json数据填充下拉框
 * 参数：
 *   combo: select对象
 *   nullItem: 空项的显示值  
 */
function fillCombo(combo, url, data, nullItem,completeCallback) {
    $.getJSON(url, data, function(idTexts) {
        combo = $(combo)[0];
        var baseIndex = 0;
        if (nullItem) {
            combo.options[baseIndex++] = new Option(nullItem, '');
        }
        combo.options.length = baseIndex;
        $.each(idTexts, function(index, item) {
            combo.options[index + baseIndex] = new Option(item.text, item.id);
        });
        if(completeCallback) {
            completeCallback();
        }
    });
}