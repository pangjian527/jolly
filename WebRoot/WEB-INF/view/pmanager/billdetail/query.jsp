<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>账单明细</title>
	<link rel="stylesheet" type="text/css" href="${home}/style/global.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/popbox.css" />
	
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.date.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.popbox.js"></script>
	<script type="text/javascript" src="${home}/script/calendar/yui-min.js"></script>
	<script type="text/javascript" src="${home}/script/manage.query.js"></script>
	
	
	<style type="text/css">
		.col0{width: 40px;}
		.col1{width: 20%}
		.col2{width: 200px}
		.col3{width: 200px}
		.col4{width: auto;}
		.col5{width: 150px}
		.col6{width: 150px}

		
		label.receivables{
			color: #53a000;
			font-weight: bold;
		}
		label.payment{
			color: #f37800;
			font-weight: bold;
		}
		td p{
			color:#999;
			margin-top:5px
		}
		div.query_result table tbody tr td {
			white-space:normal;
			line-height:20px
		}
		.amount, #amount{
			text-align:right
		}
		td button{
			background:#f40;
			text-indent:-10000px;
			border:0;
			border-radius:3px;
			height:14px;
			width:14px;
			position:relative;
		}
		td button i {
			position: absolute;
			top: 5px;
			left: 3px;
			border: 4px solid transparent;
			border-top-color: white;
		}
		td dl dt{
			float:left;
			width:50px;
			clear:left;
			color:#ccc;
			padding:2px 5px 2px 10px
		}
		td dl dd{
			float:left;
			width:270px;
			padding:2px 0;
			border-bottom:1px dashed #efefef
		}
		td dl dd:last-child{
			border-bottom:0
		}
		
	</style>
	
	<script type="text/javascript">
		
		//var baseActionUrl = "${home}/pmanager/billdetail/query.do?op=query";
		var queryCondition = ${queryCondition};
		
		haux.dom.addEventHandler(window, "load", function(){
			var details = [];
			<c:forEach items="${queryResult.rows}" var="data">
			details.push(${data.detailJson});
			</c:forEach>
			
			var rows = document.getElementsByTagName("table")[0].tBodies[0].rows;
			for(var i = 0; i < details.length; i++){
				var detail = details[i];
				if(detail != null){
					var dlElement = document.createElement("dl");
					for(var p in detail){
						var dtElement = haux.dom.createElement("dt", {innerHTML:p});
						dlElement.appendChild(dtElement);
						var ddElement = haux.dom.createElement("dd", {innerHTML:detail[p]});
						dlElement.appendChild(ddElement);
						
					}
					rows[i].cells[6].appendChild(dlElement);
				}
			}
		});
	</script>
</head>
<body>
<div class="body_wrap">
	<form action="${home}/pmanager/billdetail/bill_detail.do" method="get" name="common_query" id="basic" class="theme">
		<input type="hidden" name="op" value="query"/>
		<div class="query" >
			<ul class="input three_col">
				<li>
					<label>商家名称：</label>
					<input placeholder="商家名称" type="text" id="factoryName"  name="factoryName"/>
				</li>

				<li>
					<label>状态：</label>
					<span class="radio">
						<input type="radio" class="radio" name="status" checked="checked" value=""/>全部
					</span>
					<span class="radio">
						<input type="radio" class="radio" name="status" value="0"/>未结算
					</span>
					<span class="radio">
						<input type="radio" class="radio"  name="status" value="1"/>已结算
					</span>
					<span class="radio">
						<input type="radio" class="radio"  name="status" value="2"/>结算中
					</span>
				</li>
				<li>
					<label>账单时间：</label>
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
			<label>账单明细记录</label>
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
				<th>时间</th>
				<th>来自</th>
				<th>交易说明</th>
				<th>状态</th>
				<th id="amount">金额</th>
				
				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${queryResult.rows}" var="data" varStatus="idx">
				<tr  alt="${data.remark }" >
					<td>${idx.index+1 }</td>
					<td>${data.factory_name }</td>
					<td>
						<fmt:formatDate value="${data.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
						<a href="${home}/pmanager/order/bookform.do?op=view&id=${data.book_id}" target="_blank">
							查看订单
						</a>
					</td>
					<td>
						${data.description}
					</td>
					<td>
						<c:if test='${data.status == 0}'>未结算</c:if>
						<c:if test='${data.status == 1}'>已结算</c:if><!-- 审核通过 -->
						<c:if test='${data.status == 2}'>结算中</c:if>
					</td>
					<td class="amount">
						<c:if test="${data.price_pay > 0}">
							<label class="receivables">${data.price_pay }</label>
						</c:if>
						<c:if test="${data.price_pay<=0}">
							<label class="payment">${data.price_pay }</label>
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
