<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>部门信息</title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />

	<link rel="stylesheet" type="text/css"href="${home }/style/global.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/popbox.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/textarea2.css" />
	
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.formextend.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.elementextend.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dynamicform.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.popbox.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.textarea2.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.gridtree.js"></script>
	
	<style type="text/css">
		
	</style>
	<script type="text/javascript">
		haux.dom.addEventHandler(window, "load", function(){
			
			//1.动态创建表格树
			gridTree = new haux.component.GridTree(document.getElementById("grid_tree"), 1);
				
			//2.显示内容;临时数据待创建表
			var organizations = ${datas};
			
			//3.create tree items
			rowIndex = 1;
			gridTree.addRows(organizations, "childs", function(rowData){
				var result = [rowIndex++, rowData.name];
				
				//生成操作按钮
				var docFragment = document.createDocumentFragment();
				var aElement = haux.dom.createElement("a", {innerHTML:"修改"});
				docFragment.appendChild(aElement);
				aElement.onclick = function(){
					alert("正在开发中，请联系系统管理员修改部门信息");
				}
				
				var aElement = haux.dom.createElement("a", {innerHTML:"删除"});
				docFragment.appendChild(aElement);
				aElement.onclick = function(){
					alert("正在开发中，请联系系统管理员修改部门信息");
				}
				
				var aElement = haux.dom.createElement("a", {innerHTML:"新增同级"});
				docFragment.appendChild(aElement);
				aElement.onclick = function(){
					alert("正在开发中，请联系系统管理员修改部门信息");
				}
				
				var aElement = haux.dom.createElement("a", {innerHTML:"新增下级"});
				docFragment.appendChild(aElement);
				aElement.onclick = function(){
					alert("正在开发中，请联系系统管理员修改部门信息");
				}
				
				result.push(docFragment);
				return result;
			});
			
			
		});
		
	</script>		
	<style type="text/css">
			.grid_tree_wrapper{
				position:absolute;
				top:20px;
				bottom:0;
				left:15px;
				right:15px;
				padding:0 15px;
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
			#search_box{
				width: 400px;
				margin:10px 0;
				border: 1px solid #ccc;
				position:relative;
				
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
			col.col_2{
				width:200px;
			}
			.grid_tree{
				margin-top:15px;
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
	</style>
</head>
<body>
	<div class="body_wrap">
		<form action="#" class="theme" name="basic" method="post">
		</form>
		<div class="box ">
				<h3>部门信息</h3>
				
				<table id="grid_tree" class="grid_tree">
					<col class="col_0"/>
					<col class="col_1"/>
					<col class="col_2"/>
					<thead>
						<tr>
							<th></th>
							<th>部门名称</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>		
			</div>
	</div>
</body>
</html>
