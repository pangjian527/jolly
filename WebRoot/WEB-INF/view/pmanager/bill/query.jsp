<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>账单结算</title>
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
		.col1{width: auto;}
		.col2{width: 20%}
		.col3{width: 10%;}
		.col4{width: 15%;}
		.col5{width: 10%;}
		.col6{width: 80px}
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
		
		var provinceId = "${provinceId}";
		var cityId = "${cityId}";
		haux.dom.addEventHandler(window, "load", function(){
			initAreaBox(document.getElementById("province"), 
				document.getElementById("city"), 
				document.getElementById("district"),
				queryCondition.provinceId != "" ? queryCondition.provinceId : null,
				queryCondition.cityId != "" ? queryCondition.cityId : null, null, true);
		});
		//账单审核通过
		function confirmObject(id){
			var url="${home}/pmanager/bill/bill.do?op=confirm&id=" + id;
			haux.component.Dialog.confirm({content : "批准商家的收款请求",
				title : "审批",
				ok:function(){
					window.location=url;
				}
			});	
		}
		
		//拒绝商家的收款请求
		function disableObject(id){
			haux.component.Dialog.prompt({
				content: "撤销商家的结算", 
				title : "撤销结算",
				min:5,
				max:100,
				placeholder:"请说明原因",
				ok:function(text){
					var url="${home}/pmanager/bill/bill.do?op=disable&id=" + id + "&reason=" + text;
					Dialog.open({url : url, 
						title : "操作结果", 
						width : 600, 
						height : 400,
						onClose : function(){
							window.location.reload();
						}
					});
				}
			});
		}
		
		//拒绝商家的收款请求
		function finishObject(id){
			haux.component.Dialog.prompt({
				content: "完成商家收款", 
				title : "完成收款",
				min:20,
				max:100,
				placeholder:"请输入汇款详细信息",
				ok:function(text){
					var url="${home}/pmanager/bill/bill.do?op=finish&id=" + id + "&detail=" + text;
					Dialog.open({url : url, 
						title : "操作结果", 
						width : 600, 
						height : 400,
						onClose : function(){
							window.location.reload();
						}
					});
				}
			});
		}
		
		function showObject(id){
			window.location="${home}/pmanager/bill/bill.do?op=show&id="+id;
		}
	</script>
		
</head>
<body>
<div class="body_wrap">
	<form action="${home}/pmanager/bill/bill.do" method="get" name="common_query" id="basic" class="theme">
		<input type="hidden" name="op" value="query"/>
		<div class="query" >
			<ul class="input three_col">
				<li>
					<label>商家名称：</label>
					<input placeholder="商家名称" type="text" id="factoryName"  name="factoryName"/>
				</li>
				<li>
					<label>所在地：</label>
					
					<select name="provinceId" id="province">

					</select>
					<select name="cityId" id="city">
						
					</select>
				</li>
				<li class="colspan_2">
					<label>状态：</label>
					<span class="radio">
						<input type="radio" class="radio" name="status" checked="checked" value=""/>
						全部
					</span>
					<span class="radio">
						<input type="radio" class="radio" name="status" value="0"/>
						待商家付款
					</span>
					<span class="radio">
						<input type="radio" class="radio"  name="status" value="2"/>
						已完成
					</span>
					<span class="radio">
						<input type="radio" class="radio"  name="status" value="-1"/>
						已撤销
					</span>
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
			<label>账单结算记录</label>
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
				<th>金额</th>
				<th>申请人</th>
				<th>申请时间</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${queryResult.rows}" var="data" varStatus="idx">
				<tr>
					<td>${idx.index+1 }</td>
					<td>${data.factory_name }</td>
					<td>
						商家还款<em> ￥${data.amount }</em>
					</td>
					<td>${data.sys_user_name }</td>
					<td><fmt:formatDate value="${data.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>
						<c:if test="${data.status == 0}">
							待商家付款
						</c:if>
						<c:if test="${data.status == 2}">
							已完成
						</c:if>
						<c:if test="${data.status == -1}">
							已撤销
						</c:if>
					</td>
					<td>
						<a href="javascript:showObject('${data.id}')">查看<a>
						<c:if test="${data.status == 0}">
							<a href="javascript:finishObject('${data.id}')">已收款</a>
							<a href="javascript:disableObject('${data.id}')">撤销</a>
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
