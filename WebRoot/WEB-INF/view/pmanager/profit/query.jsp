<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>商城提成管理</title>
	<link rel="stylesheet" type="text/css" href="${home}/style/global.css" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/manage.query.js"></script>
	
	<style type="text/css">
		.col0{width: 40px;}
		.col1{width:auto}
		.col2{width: auto;}
		.col3{width: auto}
		.col4{width: auto}
		.col5{width: 150px}
		.col6{width: 150px}
		.col7{width: 100px}
		.col8{width: 100px}
	</style>
	
	<script type="text/javascript">
	
		
		function enable(id){
			if(confirm("确定激活此配置吗？")){
				$.ajax({
					type:"post",
					url:"${home}/pmanager/profit/profit_config.do?op=enable",
					data:{id:id},
					success:function(data){
						if(data.error){
							alert("失败");
						}else{
							alert("激活成功！");
							window.location.reload();
						}
					}
				});
			}
		}
		function disable(id){
			if(confirm("确定禁用此配置吗？")){
				$.ajax({
					type:"post",
					url:"${home}/pmanager/profit/profit_config.do?op=disable",
					data:{id:id},
					success:function(data){
						if(data.error){
							alert("失败");
						}else{
							alert("禁用成功！");
							window.location.reload();
						}
					}
				});
			}
		}
		
	</script>
		
</head>
<body>
<div class="body_wrap" >
	<form action="${home}/pmanager/profit/profit_config.do" method="get" name="common_query" id="basic" class="theme">
		<input type="hidden" name="op" value="query"/>
		</div>
	</form>
	<div class="query_result" style="margin:10px;margin-top:20px;">
		<h1>
			<b></b>
			<label>商城提成配置</label>
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
			    <th>地推直接开店提成</th>
				<th>地推间接开店提成</th>
				<th>地推订单提成</th>
				<th>上级商家订单提成</th>
				<th>创建时间</th>
				<th>修改时间</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${queryResult.rows}" var="data" varStatus="idx">
				<tr>
					<td>${idx.index+1 }</td>
					<td>${data.push_direct_open_factory }</td>
					<td>${data.push_indirect_open_factory }</td>
					<td>${data.push_order } %</td>
					<td>${data.factory_order } %</td>
					<td><fmt:formatDate value="${data.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${data.update_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>
						<c:if test="${data.status eq 'EFFECTIVE'}">
							已激活
						</c:if>
						<c:if test="${data.status eq 'INVALID'}">
							未激活
						</c:if>
					</td>
					<td>
						<c:if test="${data.status eq 'INVALID'}">
							<a href="javascript:void(0)" onclick="enable('${data.id }');">
								激活
							</a>
						</c:if>
						<c:if test="${data.status eq 'EFFECTIVE'}">
								<a href="javascript:void(0)" onclick="disable('${data.id }');">
									禁用
								</a>
						</c:if>
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
