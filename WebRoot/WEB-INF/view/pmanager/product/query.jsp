<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>门店服务/商品类型管理</title>
	<link rel="stylesheet" type="text/css" href="${home}/style/global.css" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.date.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>
	<script type="text/javascript" src="${home}/script/manage.query.js"></script>
	<style type="text/css">
		.col0{width: 40px;}
		.col1{width:200px}
		.col2{width: auto;}
		.col3{width: 80px}
		
	</style>
	
	<script type="text/javascript">
		var queryCondition = ${queryCondition};
		
		
	</script>
		
</head>
<body>
<div class="body_wrap">
	<form action="${home}/pmanager/product/product.do" method="get" name="common_query" id="basic" class="theme">
		<input type="hidden" name="op" value="query"/>
		<div class="query" >
			<ul class="input three_col">
				<li>
					<label>商品名称：</label>
					<input placeholder="商品名称" type="text" class="text form-input" name="name"/>
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
			<label>商品信息</label>
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
			<col class="col5" />
			<col class="col6" />
			<col class="col7" />
			<col class="col8" />
		<thead>
			<tr>
			    <th>No.</th>
			    <th>名称</th>
				<th>批发价格</th>
				<th>市场价</th>
				<th>电池型号</th>
				<th>容量</th>
				<th>虚拟销量</th>
				<th>适用品牌</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${queryResult.rows}" var="data" varStatus="idx">
				<tr>
					<td>${idx.index+1 }</td>
					<td>${data.name }</td>
					<td>${data.price }</td>
					<td>${data.price_mart }</td>
					<td>${data.model }</td>
					<td>${data.capacity }</td>
					<td>${data.virtual_count }</td>
					<td>${data.apply_brand }</td>
					<td>
						<a href="javascript:void(0)" onclick="editObject('${data.id }');">
							上架
						</a>
						<a href="javascript:void(0)" onclick="editObject('${data.id }');">
							下架
						</a>
						<a href="${home}/pmanager/product/product.do?op=inStockExecute&productId=${data.id }">
							入库
						</a>
						<a href="javascript:void(0)" onclick="editObject('${data.id }');">
							修改
						</a>
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
