function initAreaBox(provinceSelect, citySelect, districtSelect, 
		provinceId, cityId, districtId, allowNull){
	var srcPrefix = home() + "/mmall/area/area.do?op=getAreas&parentId=";
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
					createOptions(citySelect, areas, "id", "text", cityId);
					initCity = null;
				}
				else{
					createOptions(citySelect, areas, "id", "text");
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
					createOptions(districtSelect, areas, "id", "text", districtId);
					districtId = null;
				}
				else{
					createOptions(districtSelect, areas, "id", "text");	
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
			createOptions(provinceSelect, areas, "id", "text", provinceId);
			provinceSelect.onchange();
		}
	});	
}

function createOptions(selectElement, optionArray, valueName, textName, selectedValue){
	if(typeof optionArray == "string"){
		try{
			optionArray = eval("(" + optionArray + ")");
		}
		catch(e){
			optionArray = [];
		}
	}
		
	for(var i = 0; i < optionArray.length; i++){
		var optionObj = optionArray[i];
		var optionValue;
		var optionText;
		if(typeof optionObj == "string" || typeof optionObj == "number"){
			optionText = optionObj;
			optionValue = optionObj;
		}
		else{
			optionValue = optionObj[valueName];
			optionText = optionObj[textName];
		}
		var optionElement = document.createElement("option");
		optionElement.value = optionValue;
		optionElement.innerHTML = optionText;
		if(optionValue == selectedValue)
			optionElement.selected = "selected";
		
		selectElement.appendChild(optionElement);
	}
}