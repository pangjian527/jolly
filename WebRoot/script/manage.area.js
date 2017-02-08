function initAreaBox(provinceSelect, citySelect, districtSelect, 
		provinceId, cityId, districtId, allowNull){
	var srcPrefix = home() + "/pmanager/factory/factory.do?op=getAreas&parentId=";
	//alert(srcPrefix)
	//设置
	provinceSelect.onchange = function(){	
		$.ajax({url : srcPrefix + this.value,
			type:"post",
			dataType: "json",
			error: function(){
				alert("load city list error");
			}, 
			success:function(areas){
				citySelect.innerHTML = "";
				if(allowNull){
					areas.splice(0, 0, {id:"", text:"请选择市"});
				}
				if(cityId){
					haux.dom.createOptions(citySelect, areas, "id", "text", cityId);
					initCity = null;
				}
				else{
					haux.dom.createOptions(citySelect, areas, "id", "text");
				}
				citySelect.onchange();
			}
		});	
	}
	
	citySelect.onchange = function(){	
		$.ajax({url : srcPrefix + this.value,
			type:"post",
			dataType: "json",
			error: function(){
				alert("load county list error");
			}, 
			success:function(areas){
				districtSelect.innerHTML = "";
				if(allowNull){
					areas.splice(0, 0, {id:"", text:"请选择区/县"});
				}
				
				if(districtId){
					haux.dom.createOptions(districtSelect, areas, "id", "text", districtId);
					districtId = null;
				}
				else{
					haux.dom.createOptions(districtSelect, areas, "id", "text");	
				}
			}
		});	
	}
	
	//1.加载省级列表
	$.ajax({url : srcPrefix + "100",
		type:"post",
		dataType: "json",
		error: function(){
			alert("load province error");
		}, 
		success:function(areas){
			provinceSelect.innerHTML = "";
			if(allowNull){
				areas.splice(0, 0, {id:"", text:"请选择省"});
			}
			haux.dom.createOptions(provinceSelect, areas, "id", "text", provinceId);
			provinceSelect.onchange();
		}
	});	
}