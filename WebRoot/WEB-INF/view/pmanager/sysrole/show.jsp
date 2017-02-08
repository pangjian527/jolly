<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>角色信息</title>
		<link rel="stylesheet" type="text/css"href="${home }/style/global.css" />
		<link rel="stylesheet" type="text/css" href="${home}/style/popbox.css" />
		<link rel="stylesheet" type="text/css" href="${home}/style/textarea2.css" />
		
		<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
		<script type="text/javascript" src="${home}/script/haux.js"></script>
		<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
		<script type="text/javascript" src="${home}/script/haux.component.dynamicform.js"></script>
		<script type="text/javascript" src="${home}/script/haux.component.gridtree.js"></script>
		<style type="text/css">
			.grid_tree_wrapper{
				position:absolute;
				top:25%;
				bottom:0;
				padding: 10px 20px;
				margin: 20px 40px;
				width:90%;
			}
			.grid_tree_content{
				position:absolute;
				left:15px;
				top:85px;
				bottom:0px;
				right:15px;
				overflow-x:hidden;
				overflow-y:auto;
				height: auto;
			}
			
			div.table div.body table thead{
				display:none;
			}
			col.col_0{
				width:30px;
			}
			col.col_1{
				width:auto;
			}
			
			div.body_wrap div.box{
				width:600px;
				position:relative;
				left:10%;
				margin-left:0;
				margin-top:40px;
				padding-bottom:40px;
			}
			div.body_wrap div.box table{
				width:600px;
				margin:20px 0 0 0
			}
			textarea{
				width:75%;
				height:60px;
			}
			#name, #remark{
				width:450px;
				padding:5px;
			}
		</style>
		<script type="text/javascript">
			haux.dom.addEventHandler(window, "load", function(){
				
				//0.将数组形式的modules转化为Tree结构
				var modules = ${modules};
				
				//1.动态创建表格树
				var gridTree = new haux.component.GridTree(document.getElementById("grid_tree"), 1);
					
				//2.根据该Role已有的module 列表，将已有的勾选
				var treeData = ${modules};
				rowIndex = 1;
				gridTree.addRows(treeData, "childs", function(rowData){
					var checkboxElement = document.createElement('input');
					checkboxElement.type = 'checkbox';
					checkboxElement.value = rowData.id;
					checkboxElement.name = 'moduleRole';

					var docFragment = document.createDocumentFragment();
					var checkboxElement = haux.dom.createElement("input", {type : "checkbox", 
						value:rowData.id, name:'moduleId'});
					docFragment.appendChild(checkboxElement);
					docFragment.appendChild( document.createTextNode( '\r\t'+rowData.name));
					var result = [rowIndex++, docFragment];
					return result;
				});

				var moduleIds = ${selectedIds};
				var checkboxElements = document.getElementsByName("moduleId");
				for(var i = 0; i < checkboxElements.length; i++){
					var checkboxElement = checkboxElements[i];
					checkboxElement.checked = moduleIds.contain(checkboxElement.value);
					//haux.dom.setElementValue(checkboxElement, oldIds);
				}
			});
			
			function saveObject(){
				if(haux.dom.form.validate()){
					//2.保存
					document.forms[0].submit();
				}
			}
		</script>

	</head>
	<body>
		<div class="body_wrap">
		<form action="${home}/pmanager/sysrole/sys_role.do" method="post" name="basic">
			<input type="hidden" name="id" value="${bean.id}"/>
			<input type="hidden" name="op" value="save"/>
			<div class="tool_bar">
				<button type="button" onclick="history.back()" class="return">
					<i></i>
					返回
				</button>
				<button type="button" onclick="saveObject()" class="ok">
					<i></i>
					保存
				</button>
			</div>
			<div class="box">
				<h3>
					角色信息
				</h3>
				<ul class="input two_col">
					<li class="mandatory colspan_2">
						<label>
							角色名称：
						</label>
						<input name="name" type="text" class="text required" value="${bean.name}" id="name"/>
					</li>
					<li class="colspan_2">
						<label>
							备注：
						</label>
						<textarea  name="remark" id="remark">${bean.remark}</textarea>
					</li>
				</ul>
				<div class="clear"></div>
				
			</div>
			
			<div class="box">
				<h3>权限信息</h3>
				<table id="grid_tree" class="grid_tree">
					<col class="col_0"/>
					<col class="col_1"/>
					<thead>
						<tr>
							<th>No</th>
							<th>权限</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
			
		</form>
		</div>
	</body>
</html>
