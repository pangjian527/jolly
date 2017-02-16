<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>查看财务账单明细</title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<link rel="stylesheet" type="text/css" href="${home}/style/manage.show.css" />
	<link rel="stylesheet" type="text/css"href="${home }/style/global.css" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.tab2.js"></script>
	
	<style type="text/css">	
		.col0{width: 20px}	
		.col1{width: 30%}
		.col2{width: auto}
		.col3{width: 30%}
		label.receivables{
			color: #f37800;
			font-weight: bold;
		}
		label.payment{
			color: #53a000;
			font-weight: bold;
		}
		
		label.balance{
			color: #f37800;
			font-weight: bold;
			font-size:16px;
		}
		
		div.tab ul{
			border: 1px solid #ccc;
			border-bottom: 0;
			height:50px;
			position: relative;
			bottom: -1px;
		}
		div.tab ul li {
			float:left;
			width:130px;
			text-align: center;
			height:50px;
			line-height: 50px;
			background-color:#E7E5E5;
			font-size:16px;
			font-weight:bold;
			font-family: "微软雅黑";
			border-right:1px solid #ccc;
		}
		div.tab ul li.active{
			background-color:white;
		}
		
		.query_result table{
			border-radius: 0;
		}
		
		.query_result table tbody tr td{
			padding:16px 4px;
		}
		
		div.box{
			border-radius:0;
		}
		div.box dl dt{
			height: 35px;
			line-height: 35px;
			padding-left: 10px;
			font-size: 16px;
			font-weight: bold;

		}
		
		div.box dl dd{
			line-height:30px;
			width:30%;
			float:left;
			padding-left:20px;
		}
		div.box dl dd.remark{
			float: none;
			clear: both;
			background: #f7f7f7;
			width: auto;
			padding: 5px;
			margin: 10px 20px;
		}
		td p{
			color: #999;
			margin-top: 5px;
		}
		label em{
			font-family:微软雅黑;
			font-style:normal;
			font-weight:normal;
			font-size:13px
		}
		label.receivables, label.payment{
			color: #53a000;
			font-weight: bold;
			font-size:17px;
		}
		label.payment{
			color: #f37800;
		}
		td dl dt{
			float:left;
			width:50px;
			clear:left;
			color:#ccc;
			padding:2px 5px 2px 10px
		}
		td dl dd{

			padding:2px 0;
			border-bottom:1px dashed #efefef
		}
		td dl dd:last-child{
			border-bottom:0
		}
		div.query_result h4{
			font-size: 16px;
			font-family: 微软雅黑;
			line-height: 40px;
			border: 1px solid #ccc;
			background: #f7f7f7;
			border-bottom: 0;
			text-indent: 10px;
		}
		div.box {
		  margin: 10px 20px;
		}
	</style>
	<script type="text/javascript">
		var baseActionUrl = "${home}/pmanager/bill/bill.do";
		
		//将数据设置成有效
		function confirm(){
			var src = baseActionUrl + "?op=confirm&id=${bean.id}";
			Dialog.confirm({
				content: "批准商家的提款申请，同意商城向商家支付￥${bean.amount}元", 
				title : "批准申请",
				ok:function(){
					Dialog.open({url:src, 
						title:"操作结果", 
						width:600, 
						height:400,
						onClose:function(){
							window.location.reload();
						}
					});
				}
			});
		}
		
		//将数据设置成有效
		function disable(){
			
			Dialog.prompt({
				content: "请输入拒绝的理由", 
				title : "拒绝申请",
				placeholder:"拒绝理由",
				min:10,
				max:100,
				ok:function(text){
					var src = baseActionUrl + "?op=disable&id=${bean.id}&reason=" + text;
					Dialog.open({url:src, 
						title:"操作结果", 
						width:600, 
						height:400,
						onClose:function(){
							window.location.reload();
						}
					});
				}
			});
		}
		//请款异常
		function abnormalPaymentRequest(){
			var src = baseActionUrl + "?op=abnormalPaymentRequest&id=${bean.id}";
			Dialog.confirm({
				content: "商家的提款申请存在异常，请在右侧留言板告诉商家异常原因", 
				title : "请款异常",
				ok:function(){
					Dialog.open({url:src, 
						title:"操作结果", 
						width:600, 
						height:400,
						onClose:function(){
							window.location.reload();
						}
					});
				}
			});
		}
		
		//将数据设置成有效
		function finish(){
			
			Dialog.prompt({
				content: "请输入相关的汇款信息，包括汇款时间、金额、流水等", 
				title : "确认付款",
				placeholder:"付款信息",
				min:10,
				max:100,
				ok:function(text){
					var src = baseActionUrl + "?op=finish&id=${bean.id}&detail=" + text;
					Dialog.open({url:src, 
						title:"操作结果", 
						width:600, 
						height:400,
						onClose:function(){
							window.location.reload();
						}
					});
				}
			});
		}
		
		haux.dom.addEventHandler(window, "load", function(){
			var details = ${configs};
			
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
					rows[i].cells[4].appendChild(dlElement);
				}
			}
			
			haux.component.tab2({element:document.getElementById("tab-box")});
		});
		
	</script>		
	
</head>
<body >
	<div class="body_wrap">
		<div class="tool_bar">
			<button type="button" onclick="history.back()" class="return">
				<i></i>
				返回
			</button>
			<c:if test="${bean.status==0}">
				<button type="button" class="ok" onclick="finish()">
					<i></i>
					已收款
				</button>
				<button type="button" class="cancel" onclick="disable()">
					<i></i>
					撤销
				</button>
			</c:if>
			
		</div>
		<div id="content">
		<div class="box" >
			<dl>
				<dt>账单总览</dt>
				<dd>
					<label>账单金额：</label>
					<label class="balance">${bean.amount }元</label>
				</dd>	
				<dd>
					<label>商家：</label>
					<label>${factory.name}</label>
				</dd>
				<dd>
					<label>申请人：</label>
					<label>${sysUser.name}</label>
				</dd>
				<dd>
					<label>申请时间：</label>
					<label><fmt:formatDate value="${bean.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></label>
				</dd>	
				<c:if test="${not empty bean.remark}">
					<dd class="remark">
						${bean.remark}
					</dd>
				</c:if>
				
			</dl>
			<div class="clear"></div>
		</div>
		<c:if test="${not empty details}">
			<div class="query_result">
				<h4>账单明细</h4>
				<table>
					<col class="col0" />
					<col class="col1" />
					<col class="col2" />
					<col class="col3" />
					<tbody>
						<c:forEach items="${details}" var="row" varStatus="idx">
							<tr>
								<td></td>
								<td>
									<fmt:formatDate value="${row.createTime}" pattern="yyyy-MM-dd"/>
									<p>
										<fmt:formatDate value="${row.createTime}" pattern="HH:mm:ss"/>
									</p>
								</td>
								<td>
									<p>${row.description}</p>
									<p>
										<a href="${home}/pmanager/order/bookform.do?op=view&id=${row.bookId}" target="_blank">
											查看订单
										</a>
									</p>
								</td>
								<td class="amount">
									<c:if test="${row.pricePay > 0}">
										<label class="receivables">
											<em>￥</em>
											${row.pricePay }
										</label>
									</c:if>
									<c:if test="${row.pricePay < 0}">
										<label class="payment">
											<em>￥</em>
											<span>-</span>
											${-row.pricePay}
										</label>
									</c:if>
									<c:if test="${row.pricePay == 0}">
										<label class="payment">
											<em>￥</em>
											0
										</label>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
		</div>
	</div>
</body>
</html>