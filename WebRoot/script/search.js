$(function() {
	//$('#frmSearch').submit(function(){});	
	//$('#cb,#cs').change(function(){loadSearch();});
	searchSelect();
	$('#cb2').change(function() {
		var url = _home+'/product/functions.json?fn=selectBrand&bId='+$(this).val();	
		fillCombo($('#cs2'), url, null, '请选择车系', function() {
			$("#s2").trigger("change")
		});
	});
	$("#cs2").change(function(){
		$('#frmSearch').submit();
	});
	$('#search2di').change(function(){
		$('#frmSearch2').submit();
	});
});

function searchSelect(){
	$('#frmSearch1').submit(function(){
		if($('#cb').val()==''){
			alert('请选择汽车品牌');
			$('#cb').focus();
			return false;
		}
		return true;
	});
	//$('#frmSearch2').submit(function(){
	//	if($('#tr').val()==''){
	//		alert('请选择胎面宽');
	//		$('#tr').focus();
	//		return false;
	//	}
	//	return true;
	//});
	$('#cb').change(function() {
		var url = _home+'/product/functions.json?fn=selectBrand&bId='+$(this).val();	
		fillCombo($('#cs'), url, null, '请选择车系', function() {
			$("#cs").trigger("change")
		});
	});
	$('#cs').change(function() {
		var url = _home+'/product/functions.json?fn=selectCarSerie&sId='+$(this).val();	
		fillCombo($('#em'), url, null, '请选择排量', function() {
		});
	});
	//规格的联动
	$('#tr').change(function() {
		var url = _home+'/product/functions.json?fn=selectgeige&tread='+$(this).val();	
		fillCombo($('#fr'), url, null, '扁平比', function() {
			$("#fr").trigger("change")
		});
	});
	//$('#fr').change(function() {
	//	var url = _home+'/product/functions.json?fn=selectgeige&flatRate='+$(this).val();	
	//	fillCombo($('#di'), url, null, '扁平比', function() {
	//		$("#di").trigger("change")
	//	});
	//});
	$('#tr3,#fr3,#di3').change(function() {
		$('#frmSearch3').submit();
	});	
}

//加载search面板
function loadSearch(){
	var frm = $('#frmSearch')[0];
    var data = $(frm).serializeArray();
    $('#search_div').load(frm.action+"?isSearch=0&"+Math.random(), data,function(){
    	$('#cb,#cs').change(function(){loadSearch();});
    }); 
}

function search(id,value){
	if(id=='em'){
		$('#cy,#cst').val('');
	}
	if(id=='cy'){
		$('#cst').val('');
	}
	//$('#emission,#carYear,#carStyle').val('');
	$('#'+id).val(value);
	loadSearch();
}
function search2(id,value){
	if(id=='em'){
		$('#cy,#cst').val('');
	}
	if(id=='cy'){
		$('#cst').val('');
	}
	//$('#emission,#carYear,#carStyle').val('');
	$('#'+id).val(value);
	$('#frmSearch').submit();
}
function selguige(tr,fr,di){	
	$('#tr').val(tr);
	$('#fr').val(fr);
	$('#di').val(di);
	$('#frmSearch').submit();
}

function guige(name,value){
	$('#'+name).val(value);
	if(name=='tr'){
		$('#fr').val('');
		//$('#di').val('');
	}else if(name=='fr'){
		//$('#di').val('');
	}
	$('#frmSearch3').submit();
	return false;
}

function care(name,value){
	if(name=='ptid'){
		$('#kw').val('');
	}
	$('#'+name).val(value);
	$('#frmSearch').submit();
	return false;
}