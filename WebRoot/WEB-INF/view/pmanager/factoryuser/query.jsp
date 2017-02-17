<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>店主账号</title>
	<link rel="stylesheet" type="text/css" href="${home}/style/global.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/popbox.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/select2.css" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.date.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.popbox.js"></script>
	<script type="text/javascript" src="${home}/script/manage.query.js"></script>
	<script type="text/javascript" src="${home}/script/manage.area.js"></script>
	<script type="text/javascript" src="${home}/script/select2.js"></script>
	<style type="text/css">
		.col0{width: 40px;}
		.col1{width: 250px;}
		.col2{width: 200px}
		.col3{width: 200px}
		.col4{width: 100px}
		.col5{width: 100px}
		.col6{width: 100px}
		div.body_wrap div.query ul li.colspan_2 div{
			display: inline-block;
		}
		div.body_wrap div.query ul li.colspan_2 div select{
			width:100px;
		}
		#province, #city, #district{
			width:80px
		}
		#addr{
			width:180px
		}
	</style>
	
	<script type="text/javascript">
	
		var queryCondition = ${queryCondition};
		//var baseActionUrl = "${home}/pmanager/factory/employee.do";
	
		window.onload=function(){
			$("#select-factory").select2();
		}
		
	</script>
		
</head>
<body>
<div class="body_wrap">
	<form action="${home}/pmanager/factoryuser/factory_user.do" method="get" name="common_query" id="basic" class="theme">
		<input type="hidden" name="op" value="query"/>
		<div class="query" >
			<ul class="input three_col">
				<li>
					<label>账号：</label>
					<input placeholder="账号" type="text" id="account" class="text form-input" name="account"/>
				</li>
				<li>
					<label>手机号码：</label>
					<input placeholder="手机号码" type="text" id="mobile" class="text form-input" name="mobile"/>
				</li>
			</ul>
			<div class="operate" >
				<button id="search" onclick="query.call(this)" class="search">
					<i></i>
					查询
				</button>
			</div>
		</div>
	</form>
	<div class="query_result">
		<h1>
			<b></b>
			<label>商家账号记录</label>
			<span>共有${queryResult.rowCount}条数据</span>
		</h1>
		<table>
			<col class="col0" />
			<col class="col1" />
			<col class="col2" />
			<col class="col3" />
			<col class="col4" />
			<col class="col5" />
			<col class="col6" />
		<thead>
			<tr>
			    <th>No.</th>
				<th>商家名称</th>
				<th>账号</th>
				<th>手机号码</th>
				<th>备注</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${queryResult.rows}" var="data" varStatus="idx">
				<tr>
					<td>${idx.index+1 }</td>
					<td>${data.factoryname }</td>
					<td>${data.account }</td>
					<td>${data.mobile }</td>
					<td>${data.remark }</td>
					<td>
						<c:if test='${data.status == 0}'>无效</c:if>
						<c:if test='${data.status == 1}'>有效</c:if>
					</td>
					<td>
						<a href="javascript:void(0)" onclick="editObject('${data.id }');">编辑</a>&nbsp;
						<a href="javascript:void(0)" 
								onclick="deleteObject('${data.id}', '确认', '删除商家${data.factoryname}');">删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="navigate">
		<c:import url="../common/listview.pager.jsp" />
	</div>	
	</div>
</div>
</body>
</html>
