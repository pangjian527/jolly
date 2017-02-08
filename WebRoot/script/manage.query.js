function query(){
	var formNode = this.parentNode.parentNode.parentNode;
	var queryCondition = haux.dom.form.getData(formNode);
	var hiddenInput = document.createElement("input");
	hiddenInput.type = "hidden";
	hiddenInput.name = "queryCondition";
	hiddenInput.value = haux.util.Json.getString(queryCondition);
	formNode.appendChild(hiddenInput);
	formNode.submit();
}

haux.dom.addEventHandler(window, "load", function(){
	haux.dom.form.setData(queryCondition);
});

function getActionPath(){
	return document.forms[0].getAttribute("action");
}

function viewObject(id){
	window.location.href = getActionPath() + "?op=view&id=" + id;
}
function addObject(){
	window.location =  getActionPath() + "?op=add";
}


function showObject(id){
	window.location =  getActionPath() + "?op=show&id=" + id;
}

//重载了showObject，传递参数 
function showObject1(id){
	window.location=getActionPath() + "?op=show&id=" +id + "&&code=" + code;
}

//其他页面访问日志详情 
function showLog(id,tableName){
	window.location="/htw/pmanager/draft/draft.do?op=query2&id=" + id + "&&tableName=" + tableName;
}
//其他页面查看日志具体属性信息
function showLogData(id){
	window.location="/htw/pmanager/draft/draft.do?op=show&id=" + id + "&&code=" + code;

}




function editObject(id){
	window.location =  getActionPath() + "?op=edit&id=" + id;
}

//将数据设置成有效
function enableObject(id, title, describe){
	var src = getActionPath() + "?op=enable&id=" + id;
	Dialog.confirm({
		content: describe, 
		title : title,
		ok:function(){
			Dialog.open({url:src, 
				title:"操作结果", 
				width:600, 
				height:400,
				onClose:function(){
					window.location.reload();
				}
			});
		}
	});
}
//将数据设置成无效（彻底不能再恢复了）
function disableObject(id, title, describe){
	var src = getActionPath() + "?op=disable&id=" + id;
	Dialog.confirm({
		content: describe, 
		title : title,
		ok:function(){
			Dialog.open({url:src, 
				title:"操作结果", 
				width:600, 
				height:400,
				onClose:function(){
					window.location.reload();
				}
			});
		}
	});
}

//将处于草稿、失效的数据，提交审核请求
function submitObject(id, title, describe){
	var src = getActionPath() + "?op=submit&id=" + id;
	Dialog.confirm({
		content: describe, 
		title : title,
		ok:function(){
			Dialog.open({url:src, 
				title:"操作结果", 
				width:600, 
				height:400,
				onClose:function(){
					window.location.reload();
				}
			});
		}
	});
}

//将待审核的数据请求，转换成有效状态
function confirmObject(id, title, describe){
	var src = getActionPath() + "?op=confirm&id=" + id;
	Dialog.confirm({
		content: describe, 
		title : title,
		ok:function(){
			Dialog.open({url:src, 
				title:"操作结果", 
				width:600, 
				height:400,
				onClose:function(){
					window.location.reload();
				}
			});
		}
	});
}

//将待审核的数据请求驳回，由允许修改后重新提交
function rejectObject(id, title, describe){
	var src = getActionPath() + "?op=reject&id=" + id;
	Dialog.confirm({
		content: describe, 
		title : title,
		ok:function(){
			Dialog.open({url:src, 
				title:"操作结果", 
				width:600, 
				height:400,
				onClose:function(){
					window.location.reload();
				}
			});
		}
	});
}

//将待审核的数据请求驳回，由允许修改后重新提交
function withdrawObject(id, title, describe){
	var src = getActionPath() + "?op=withdraw&id=" + id;
	Dialog.confirm({
		content: describe, 
		title : title,
		ok:function(){
			Dialog.open({url:src, 
				title:"操作结果", 
				width:600, 
				height:400,
				onClose:function(){
					window.location.reload();
				}
			});
		}
	});
}

//将数据删除
function deleteObject(id, title, confirmText){
	var src = getActionPath() + "?op=delete&id=" + id;
	Dialog.confirm({
		content: confirmText, 
		title : title,
		ok:function(){
			Dialog.open({url:src, 
				title:title, 
				width:600, 
				height:400,
				onClose:function(){
					window.location.reload();
				}
			});
		}
	});	
}

function showOptions(opts, url, targetNode){
			
	var documentFrame=document.createDocumentFragment();
	
	var divElement=document.createElement("div");
	divElement.className="options";
	var dlElement=document.createElement("dl");
	
	for(var i=0;i<opts.length;i++){
		var ddElement=document.createElement("dd");
		
		var aElement=document.createElement("a");
		aElement.innerHTML=opts[i].text;
		aElement.href="###";
		
		ddElement.onclick=function(id){
			return function(){
				window.location=url+"&productTypeId="+id;
			}
		}(opts[i].id)
		
		ddElement.appendChild(aElement);
		dlElement.appendChild(ddElement);
	}
	divElement.appendChild(dlElement);
	divElement.addClearElement();
	
	documentFrame.appendChild(divElement);

	showPopboxInRelativePos(documentFrame, targetNode, [6, 11], "pop_menu", 0, 0, "click_other");
}