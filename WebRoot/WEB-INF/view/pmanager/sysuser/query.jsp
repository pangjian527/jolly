<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>系统账号</title>
	<link rel="stylesheet" type="text/css" href="${home}/style/global.css" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.date.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>
	<script type="text/javascript" src="${home}/script/manage.query.js"></script>
	<style type="text/css">
		.col0{width: 40px;}
		.col1{width: 15%;}
		.col2{width: auto;}
		.col3{width: 10%;}
		.col4{width: 8%;}
		.col5{width: 10%;}
		.col6{width: 80px}
		
	</style>
	
	<script type="text/javascript">	
		var queryCondition = ${queryCondition};
	</script>
		
</head>
<body>
<div class="body_wrap">
	<form action="${home}/pmanager/sysuser/sys_user.do" method="get" name="common_query" id="basic" class="theme">
		<input type="hidden" name="op" value="query"/>
		<div class="query" >
			<ul class="input three_col">
				<li>
					<label>用户：</label>
					<input placeholder="账号/姓名/电话" type="text" class="text form-input" name="user"/>
				</li>
				<li>
					<label>部门：</label>
					<input placeholder="部门名称" type="text" class="text form-input" name="orgName"/>
				</li>
				<li>
					<label>账号状态：</label>
					<span class="radio">
						<input type="radio" class="radio" name="status" value="" checked="checked"/>
						全部
					</span>
					<span class="radio">
						<input type="radio" class="radio" name="status" value="1"/>
						有效
					</span>
					<span class="radio">
						<input type="radio" class="radio" name="status" value="0"/>
						停用
					</span>
					<!-- 
						<span class="radio">
						<input type="radio" class="radio" name="status" value="-1"/>
						已删除
					</span>
					 -->
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
			<label>系统账号记录</label>
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
		<thead>
			<tr>
			    <th>No.</th>
			    <th>姓名</th>
				<th>登录账号</th>
				<th>联系电话</th>
				<th>所属部门</th>
				<th>创建时间</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${queryResult.rows}" var="data" varStatus="idx">
				<tr>
					<td>${idx.index+1 }</td>
					<td>${data.name }</td>
					<td>${data.code }</td>
					<td>
						${data.tel_no }
					</td>
					<td>${data.org_name }</td>
					<td><fmt:formatDate value="${data.create_time}" pattern="yyyy-MM-dd"/></td>
					<td>
						<c:if test="${data.status == 0}">
							停用
						</c:if>
						<c:if test="${data.status == 1}">
							有效
						</c:if>
					</td>
					<td>
						<a href="javascript:void(0)" onclick="showObject('${data.id }');">
							查看
						</a>
						<a href="javascript:void(0)" onclick="editObject('${data.id }');">
							修改
						</a>
						<c:if test="${data.status == 0}">
							<a href="javascript:void(0)" onclick="enableObject('${data.id}', '确认', '启用账号${data.name}，允许该用户登录系统');">
								启用
							</a>
						</c:if>
						<c:if test="${data.status == 1}">
							<a href="javascript:void(0)" onclick="disableObject('${data.id}', '确认', '停用账号${data.name}，该用户将无法登录系统');">
								停用
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
