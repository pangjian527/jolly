<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>邮费管理</title>
	<link rel="stylesheet" type="text/css" href="${home}/style/global.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/popbox.css" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	<script type="text/javascript" src="${home}/script/manage.query.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>
	<script type="text/javascript" src="${home}/script/manage.area.js"></script>
	
	<style type="text/css">
		.col0{width: 40px;}
		.col1{width: 20%;}
		.col2{width: 20%}
		.col3{width: 20%;}
		.col4{width: 20%;}
		.col5{width: 10%;}
		.amount-pay-in {
			color: #53a000;
			font-weight: 700;
		}
		.amount-pay-out {
			color: #f37800;
			font-weight: 700;
		}
		
		label.payment{
			color: #f37800;
			font-weight: bold;
		}
		label.receivables{
			color: #53a000;
			font-weight: bold;
		}
		td em{
			font-style:normal;
			font-family:微软雅黑;
			color:#f40
		}
		#province, #city, #district{
			width:80px
		}
	</style>
	
	<script type="text/javascript">
		var queryCondition = ${queryCondition};
		
	</script>
		
</head>
<body>
<div class="body_wrap">
	<form action="${home}/pmanager/expressfee/express_fee.do" method="get" name="common_query" id="basic" class="theme">
		<input type="hidden" name="op" value="query"/>
		<div class="query" >
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
			<label>邮费信息记录</label>
			<span>共有${queryResult.rowCount}条数据</span>
			
		</h1>
		<table>
			<col class="col0" />
			<col class="col1" />
			<col class="col2" />
			<col class="col3" />
			<col class="col4" />
			<col class="col5" />
		<thead>
			<tr>
			    <th>No.</th>
				<th>类型</th>
				<th>免邮费总额</th>
				<th>创建时间</th>
				<th>更新时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${queryResult.rows}" var="data" varStatus="idx">
				<tr>
					<td>${idx.index+1 }</td>
					<td>满额包邮</td>
					<td>${data.amount_for_free }</td>
					<td><fmt:formatDate value="${data.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${data.update_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>
						<a href="javascript:showObject('${data.id}')">查看<a>
						<a href="javascript:void(0)" onclick="editObject('${data.id}');">修改</a>
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
