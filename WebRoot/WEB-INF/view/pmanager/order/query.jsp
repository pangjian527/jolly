<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>订单信息</title>
	<link rel="stylesheet" type="text/css" href="${home}/style/global.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/popbox.css" />
	
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.date.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.popbox.js"></script>
	<script type="text/javascript" src="${home}/script/manage.query.js"></script>
	<script type="text/javascript" src="${home}/script/manage.area.js"></script>
	<script type="text/javascript" src="${home}/script/calendar/yui-min.js"></script>
	
	<style type="text/css">
		.col0{width: 40px;}
		.col1{width: 150px}
		.col2{width: 200px}
		.col3{width: 200px}
		.col4{width: auto}
		.col5{width: 150px}
		.col6{width: 150px}
		.col7{width: 80px}
		.col8{width: 80px}
		
		table em{
			font-style:normal;
			color:#f40;
			margin-top:5px;
			display:block
		}
		#province, #city, #district{
			width:80px
		}
		td p{
			margin-top:5px;
			color:#666
		}
	</style>
	
	<script type="text/javascript">
		//查询页面必须说明的基础URL，以便manage.query.js生成对应的查看、编辑、删除、视图等页面的跳转地址
		//var baseActionUrl = "${home}/pmanager/order/bookform.do";
		
		
		var queryCondition = ${queryCondition};
		haux.dom.addEventHandler(window, "load", function(){
			initAreaBox(document.getElementById("province"), 
				document.getElementById("city"), 
				document.getElementById("district"),
				queryCondition ? queryCondition.provinceId : null,
				queryCondition ? queryCondition.cityId : null,
				queryCondition ? queryCondition.countyId : null,
				true);
		});
		
		//发起库存询问
		function inventoryInquiry(id){
			window.location.href = baseActionUrl + "?op=inventoryInquiry&id=" + id;
		}
		
		//发货
		function deliverGoods(orderId){
			var url = '${home}/pmanager/order/bookform.do?op=shipped&id='+orderId;
			haux.component.Dialog.open({url : url,
				title : "记录发货信息"
			});
		}
		
		//查看物流
		function viewLogistics(orderId){
			alert('根据物流单号查看物流');
		}
		
	</script>
		
</head>
<body>
<div class="body_wrap">
	<form action="${home}/pmanager/order/bookform.do" method="get" name="common_query" id="basic" class="theme">
		<input type="hidden" name="op" value="query"/>
		<div class="query" >
			<ul class="input three_col">
				<li>
					<label>订单号：</label>
					<input placeholder="订单号" type="text" class="text form-input" name="code"/>
				</li>
				<li>
					<label>状态：</label>
					<span class="radio">
						<input type="radio" class="radio" name="status" checked="checked" value=""/>全部
					</span>
					<span class="radio">
						<input type="radio" class="radio" name="status" value="0"/>待付款
					</span>
					<span class="radio">
						<input type="radio" class="radio"  name="status" value="1"/>待发货
					</span>
					<span class="radio">
						<input type="radio" class="radio"  name="status" value="2"/>待收货
					</span>
					<span class="radio">
						<input type="radio" class="radio"  name="status" value="3"/>已撤销
					</span>
					<span class="radio">
						<input type="radio" class="radio"  name="status" value="4"/>已完成
					</span>
				</li>
				<li class="">
					<label>所在地：</label>
					<select class="province" id="province" name="provinceId">
						<option value="">-省-</option>
					</select>
					<select class="city" id="city" name="cityId">
						<option value>-市-</option>
					</select>
					<select class="区" id="district" name="countyId">
						<option value>-区-</option>
					</select>
				</li>
				<li>
					<label>下单时间：</label>
					<span class="range">
						<input type="text" name="startTime" class="Wdate"/>
						<input type="text" name="endTime" class="Wdate"/>
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
			<label>订单信息记录</label>
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
			<col class="col7" />
			<col class="col8" />
		<thead>
			<tr>
			    <th>No.</th>
				<th>订单号</th>
				<th>下单时间</th>
				<th>联系方式</th>
				<th>商家名称</th>	
				<th>物流状态</th>	
				<th>状态</th>
				<th>付款类型</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${queryResult.rows}" var="data" varStatus="idx">
				<tr>
					<td>${idx.index+1 }</td>
					<td>
						${data.code }
					</td>
					<td>
						<fmt:formatDate value="${data.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
						${data.contact_man }
						<p>${data.contact_tel }</p>
					</td>
					
					<td>
						${data.factoryname }
						<p>${data.areaname}</p>
					</td>
					<td>
						<c:if test='${data.tracking_status == 0}'><label style="color:red">未发货</label></c:if>
						<c:if test='${data.tracking_status == 1}'><label style="color:green">已发货</label></c:if>
						<c:if test='${data.tracking_status == 2}'>已收货</c:if>
						<c:if test='${empty data.tracking_status}'><label style="color:red">未发货</label></c:if>
					</td>
					
					<td>
						<c:if test='${data.status == 0}'>待付款</c:if>
						<c:if test='${data.status == 1}'>待发货</c:if>
						<c:if test='${data.status == 2}'>待收货</c:if>
						<c:if test='${data.status == 3}'>已取消</c:if>
						<c:if test='${data.status == 4}'>已完成</c:if>
					</td>
					
					<td>
						<c:if test='${data.pay_type == 0}'>在线支付</c:if>
						<c:if test='${data.pay_type == 1}'>货到付款</c:if>
						<c:if test='${data.pay_type == 2}'>预发货后付款</c:if>
					</td>
					<td>
						<a href="javascript:void(0)" onclick="viewObject('${data.id }');">查看</a>
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
