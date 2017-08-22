<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>品牌管理</title>
	<link rel="stylesheet" type="text/css" href="${home}/style/global.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/popbox.css" />
	
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.date.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.popbox.js"></script>
	<script type="text/javascript" src="${home}/script/manage.query.js"></script>
	
	<style type="text/css">
		.col0{width: 40px;}
		.col1{width: 30%;}
		.col2{width: auto;}
		.col3{width: 15%;}
		.col4{width: 15%;}
		/* .col5{width: 80px} */
		
	</style>
	
	<script type="text/javascript">
	
		var baseActionUrl = "${home}/pmanager/product/brand.do";
		var queryCondition = ${queryCondition};
		
		
		
	</script>
		
</head>
<body>
<div class="body_wrap">
	<form action="${home}/pmanager/productbrand/product_brand.do" method="get" name="common_query" id="basic" class="theme">
		<input type="hidden" name="op" value="query"/>
		<div class="query" >
			<ul class="input three_col">
				<li>
					<label>名称：</label>
					<input placeholder="品牌名" type="text" id="name" class="text form-input" name="name"/>
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
			<label>品牌记录</label>
			<span>共有${queryResult.rowCount}条数据</span>
			<s>
				<button type="button" class="add" onclick="addObject(this)">
					<i></i>
					新增
				</button>
			</s>
		</h1>
		<table>
			<col class="col0" />
			<col class="col1" />
			<col class="col2" />
			<col class="col3" />
			<col class="col4" />
			<%-- <col class="col5" /> --%>
		<thead>
			<tr>
			    <th>No.</th>
			    <th>名称</th>
				<th>备注</th>
				<!-- <th>状态</th> -->
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${queryResult.rows}" var="data" varStatus="idx">
				<tr>
					<td>${idx.index+1 }</td>
					<td>${data.name }</td>
					<td>${data.remark }</td>
					<%-- <td>
						<c:if test='${data.status =="0"}'>无效</c:if>
						<c:if test='${data.status =="1"}'>有效</c:if>
					</td> --%>
					<td><fmt:formatDate value="${data.create_time}" pattern="yyyy-MM-dd"/></td>
					<td>
						<a href="javascript:void(0)" onclick="editObject('${data.id }');">编辑</a>&nbsp;
						<a href="javascript:void(0)" 
								onclick="deleteObject('${data.ID}', '确认', '删除品牌${data.name}');">删除</a>
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
