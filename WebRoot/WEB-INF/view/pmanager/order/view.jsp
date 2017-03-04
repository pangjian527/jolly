<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<%@ taglib prefix="funcs" uri="app://pub.functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>总店查看订单详情</title>
	<meta http-equiv="pragma" content="no-cache" /> 
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />

	<link rel="stylesheet" type="text/css"href="${home }/style/global.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/manage.show.css" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/haux.js"></script>	
	<script type="text/javascript" src="${home}/script/haux.component.tab2.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>	
	<style type="text/css">		
		.order-box{
			margin:10px 0;
			border:1px solid #ccc;
			position:relative
		}
		.order-box h3{
			background: #f7f7f7;
			line-height: 40px;
			border-bottom: 1px solid #efefef;
			font-weight: normal;
			height:40px;
		}
		.order-box h3 span{
			margin:0 40px 0 15px;
			font-family:宋体
		}
		.order-box dl{
			width:25%;
			border-right:1px solid #ccc;
			float:left;
		}
		.order-box dl dt{
			float: left;
			clear: both;
			width: 80px;
			line-height: 30px;
			color: #999;
			margin-left:15px;
		}
		.order-box dl dt.prime{
			float: none;
			width: auto;
			background: #f70;
			color: white;
			margin-left: 0;
			font-size: 15px;
			font-family: 微软雅黑;
			padding-left: 15px;
			line-height: 40px;
			height: 40px;
		}
		.order-box dl dd{
			line-height:30px;
			padding:0 0 0 90px;
			margin:0 10px
		}
		.shop-name, .invoice{
			border-top:1px solid #efefef
		}
		.shop-name a{
			color:#37c
		}
		
		.order-box div.prime{
			float:left;
			width:74%;
			border-left:1px solid #ccc;
			position:relative;
			left:-1px;
			overflow:hidden;
			padding-bottom:10px;
		}
		.order-box div p{
			margin:10px 0
		}
		.order-box div p span{
			color:#999;
			margin:0 0 0 20px
		}
		.order-box div h4{
			position: relative;
			line-height: 32px;
			padding-left: 45px;
			font: 18px normal;
			font-family:微软雅黑;
			margin:40px 0 30px 40px;
		}
		.order-box div p.describe{
			margin: 10px 0 0 85px;
			color: #666;
			font-size: 15px;
		}
		
		.order-box div h4 i{
			position: absolute;
			display: block;
			width: 32px;
			height: 32px;
			left: 0;
			top: -4px;
			background: url(../../image/p_msg_bg4.png) -1px -177px;
		} 
		.order-box div p.logistics{
			margin:15px 0 10px 50px;
		}
		.order-box div p.install{
			margin: 30px 10px 10px 50px;
			border-top: 1px solid #efefef;
			padding-top: 20px;
		}
		.order-box div p.install a{
			color: #2652A5;
			margin: 0 5px;
		}
		.order-box div p.install button{
			padding: 8px 12px;
			background: #ff8400;
			border: 0;
			color: white;
			border-radius: 4px;
			font-family: 微软雅黑;
			font-size: 14px;
			letter-spacing: 1px;
		}
		table{
			width: 100%;
			margin: 15px 0;
			border-collapse: collapse;
			border-spacing: 0;
		}
		table th{
			padding: 10px 0;
			background: #efefef;
			font-family: 微软雅黑;
			font-weight: normal;
			font-size: 14px;
			letter-spacing: 2px;
			text-align:left;
			text-indent:0.5em;
			border:1px solid #ccc
		}
		.col-0{width:70px;}
		.col-1{width:auto}
		.col-2{width:150px}
		.col-3{width:150px;}
		.col-4{width:auto}
		.col-5{width:150px}
		.col-6{width:150px}
		table td{
			vertical-align: middle;
			padding: 5px;
			font-family: 微软雅黑;
			border: 1px solid #ccc;
		}
		table td.product-img{
			border-right:0;
			
		}
		table td.product-name{
			border-left:0;
			
		}
		table td img{
			width:80px;
			height:80px;
		}
		
		td p{
			color:#666;
			margin-top:10px;
		}
		td li{
			margin:10px 0 0;
			border-bottom:1px solid #ccc;
			padding-bottom:10px
		}
		td li:last-child{
			border-bottom:0
		}
		td li{
			color:#999
		}
		td li.used span{
			color: #666;
			text-decoration:line-through;
			margin-right:5px
		}
		td li.available span{
			color: #f40;
			margin-right:5px
		}
		.product-list{
			position:relative;
			padding-bottom:30px;
			margin-bottom:60px
		}
		.summary{
			position:absolute;
			right:0px;
			font-size:14px;
		}
		.summary em{
			color:#f40;
			font-family:arial
		}
		.summary i{
			margin:0 0.5em
		}
		.nav-crumbs{
			margin:15px 0
		}
		
		.nav-crumbs a:hover{
			text-decoration:underline;
			color:#f40
		}
		.nav-crumbs a.last{
			background:none;
			
		}
		#shadow-box{
			position:fixed;
			left:0;
			top:0;
			bottom:0;
			right:0;
			background:#333;
			opacity:0.3;
			z-index:10;
			display:none
		}
		#delivery-box{
			display:none;
			background: white;
			border: 1px solid #ccc;
			width: 500px;
			position: fixed;
			left: 50%;
			margin-left: -250px;
			z-index: 11;
			top: 50%;
			margin-top: -100px;
			height: 200px;
			box-sizing: border-box;
			padding:40px;
		}
		#delivery-box h3{
			font-family: 微软雅黑;
			font-size: 16px;
			letter-spacing: 1px;
			margin: 0 0 10px;
		}
		#delivery-box select{
			width:100px;
		}
		#delivery-box input{
			height: 24px;
			text-indent: 5px;
			width: 295px;
			margin-left: 10px;
		}
		#delivery-box div{
			position: absolute;
			right: 40px;
			bottom: 30px;
		}
		#delivery-box a{
			width: 16px;
			height: 16px;
			position: absolute;
			right: 5px;
			top: 5px;
			text-indent: -10000px;
			background: url(../../image/p_msg_bg1.png);
		}
	</style>
	<script type="text/javascript">
		var baseActionUrl = "${home}/pmanager/order/bookform.do";
		
		//将待审核的数据请求，转换成有效状态
		function confirmObject(){
			var src = baseActionUrl + "?op=confirm&id=${data.bookform.id}";
			Dialog.confirm({
				content: "请确保与商家进行电话沟通后，再确认订单有效", 
				title : "确认订单",
				width:400, 
				height:100,
				ok : function(){
					
					Dialog.open({url : src, 
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
		//将待确认、有效的数据，转变为无效
		function disableObject(id){
			var src = baseActionUrl + "?op=disable&id=${data.bookform.id}";
			Dialog.prompt({
				content: "您正在取消订单", 
				title : "取消订单",
				placeholder:"请输入取消订单的原因",
				min:10,
				max:100,
				ok:function(text){
					src = src + "&reason=" + text; 
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
		
		//使用Dialog组件，打开新窗口，以便客服选择物流公司和
		function openDeliveryBox(){
			document.getElementById("shadow-box").style.display = "block";
			document.getElementById("delivery-box").style.display = "block";
		}
		
		function closeDeliveryBox(){
			document.getElementById("shadow-box").style.display = "none";
			document.getElementById("delivery-box").style.display = "none";
		}
		
		function saveDelivery(){
			//0.获取&验证物流公司
			var divElement = document.getElementById("delivery-box");
			var selectElement = divElement.getElementsByTagName("select")[0];
			var deliveryFactory = selectElement.value;
			if(!deliveryFactory){
				alert("请选择物流公司");
				selectElement.focus();
				return;
			}
			
			//1.获取&验证运单号
			var inputElement = divElement.getElementsByTagName("input")[0];
			var trackingNumber = inputElement.value;
			if(!trackingNumber){
				alert("请输入物流运单号");
				inputElement.focus();
				return;
			}
			
			//2.关闭
			closeActiveDialog();
			
			//3.ajax发起更新订单物流信息请求
			var postData = {id:"${data.bookform.id}", op:"deliver",
				deliveryFactory:deliveryFactory, trackingNumber:trackingNumber};
			$.ajax({url : "${home}/pmanager/order/bookform.do",
				type:"post",
				dataType: "json",
				data:postData,
				success:function(result){
					if(result.error){
						alert("发货失败，" + result.error);
						
					}
					else{
						alert("发货成功");
					}
					window.location.reload();
				}
			});
		}
		
		function sendSms(){
			var btnElement = this;
			Dialog.confirm({
				content: "再次发送验证码至手机号码" + ${data.bookform.contactTel}, 
				title : "发送验证码",
				width:600,
				ok:function(text){
					$.ajax({url : "${home}/pmanager/order/bookform.do?op=sendSms&id=${data.bookform.id}",
						type:"get",
						dataType: "json",
						success:function(result){
							if(result.error){
								alert("短信发送失败：\n" + result.error);
							}
							else{
								alert("验证码已发送，请注意查收");
								identify();
							}
						},
						error:function(){
							alert("网络异常，请稍后再试");
						}
					});
					
					btnElement.disabled = true;
					btnElement.style.opacity = 0.5;
					setTimeout(function(){
						btnElement.disabled = false;
						btnElement.style.opacity = null;
					}, 1000 * 60 * 5);
				}
			});
		}
		
		
		haux.dom.addEventHandler(window, "load", function(){
			haux.component.tab2({element:document.getElementById("tab-box")});
		});
		
		
		function printBookForm(id){
			window.location = "${home}/pmanager/order/bookform.do?op=printBookForm&id="+id;
		}
		
		function updatePrice(){
		
			
			if(confirm("是否确认修改成淘宝订单，并且确认价格？")){
				var taobaoPriceInputs = window.top.document.getElementsByName("taobaoPrice");
			
				var items = [];
				
				for(var i=0;i<taobaoPriceInputs.length;i++){
				 
					var realReg = /^(-?\d+)(\.\d{1,2})?$/;
					if(!realReg.test(taobaoPriceInputs[i].value)){
						alert("淘宝价格请输入数字,最多有两位小数");
						return ;
					}
						var item = {};
						//item.bookDetalId  = taobaoPriceInputs[i].id;
						item.price  = taobaoPriceInputs[i].value;
						item.verifyCodes=taobaoPriceInputs[i].getAttribute("verifyCodes");
						items.push(item);
						
				}
				var itemStr =  haux.util.Json.getString(items) ;
				
				var url  ="${home}/pmanager/order/bookform.do?op=resetSaleSource&bookformId=${data.bookform.id }&jsonObjects="+itemStr;
				
				$.ajax({url : url,
					type:"post",
					dataType: "json",
					success:function(result){
						if(result.error){
							alert(result.error);
						}
						else{
							alert("修改成功");
							closeActiveDialog();
							window.location.href = "${home}/pmanager/order/bookform.do?op=view&id=" + '${data.bookform.id }';
						}
					},
					error:function(){
						alert("网络异常，请稍后再试");
					}
				});
			}
		}
		 
		function taobaoObject(){
			var content = document.createElement("div") ;
			
			var tableDiv = document.createElement("div") 
			tableDiv.style.cssText = 'height:360px;overflow:auto;padding: 0 10px;';
			
			var table = document.createElement("table") ;
			
			var thead = document.createElement("thead") ;
			var theadTr = document.createElement("tr") ;
			var th1 = document.createElement("th") ;
			th1.innerHTML = '商品';
			var th2 = document.createElement("th") ;
			th2.innerHTML = '商城价格';
			th2.style.cssText="width:80px;";
			var th3 = document.createElement("th") ;
			th3.innerHTML = '淘宝价格';
		 	th3.style.cssText="width:80px;";
		 		theadTr.appendChild(th1);
		 		theadTr.appendChild(th2);
		 		theadTr.appendChild(th3);
		 		
				thead.appendChild(theadTr);
				table.appendChild(thead);
			 
			
			<c:forEach items="${data.bookformProductDatas}" var="item">
				var tr = document.createElement("tr") ;
				var imageTd = document.createElement("td") ;
				
				var  urlTd = document.createElement("td") ;
				var  a = document.createElement("a") ;
				a.innerHTML = '${item.productName}';
				
				var  priceTd = document.createElement("td") ;
				priceTd.innerHTML = '￥${item.price}';
				
				var  taobaoTd = document.createElement("td") ;
				var input1 = document.createElement('input');
      			input1.setAttribute('type', 'text');
      			input1.setAttribute('id', '${item.id}');
      			input1.setAttribute('value', '${item.price}');
     			input1.setAttribute('name', 'taobaoPrice');
     			input1.style.cssText='height: 30px;text-align:center;';
				  
				urlTd.appendChild(a);
				taobaoTd.appendChild(input1);
				
				 
				tr.appendChild(urlTd);
				tr.appendChild(priceTd);
				tr.appendChild(taobaoTd);
				
				table.appendChild(tr);
							 
			</c:forEach>
			tableDiv.appendChild(table);	
			content.appendChild(tableDiv);		
			
			
			var footElement = document.createElement("div");
			footElement.className = "foot operate";
			
			var buttonElement = haux.dom.createElement("button", {type:"button"});
			buttonElement.innerHTML = "<i></i> 确定";
			buttonElement.className = "ok fire";
			buttonElement.onclick =  updatePrice ;
			footElement.appendChild(buttonElement);
			
			var buttonElement = haux.dom.createElement("button", {type:"button"});
			buttonElement.innerHTML = "<i></i> 取消";
			buttonElement.className = "cancel";
			buttonElement.onclick = function(){
				 closeActiveDialog(GLOBAL.topWindow.activeDialog._cancelCallbackFunc);
			}
			footElement.appendChild(buttonElement);
			content.appendChild(footElement);	
		
			
			Dialog.open({content:content, 
					title:"淘宝订单",
					width:800,
					height:420
				});
		}
		
		//动态插入style
		function addCSS(cssText) {
		    var style = document.createElement('style'),
		    //创建一个style元素
		    head = document.head || document.getElementsByTagName('head')[0]; //获取head元素
		    headParent = window.parent.document.head || window.parent.document.getElementsByTagName('head')[0]; //获取父页面head元素
		    style.type = 'text/css'; //这里必须显示设置style元素的type属性为text/css，否则在ie中不起作用
		    if (style.styleSheet) { //IE
		        var func = function() {
		            try { //防止IE中stylesheet数量超过限制而发生错误
		                style.styleSheet.cssText = cssText;
		            } catch(e) {
		
		}
		        }
		        //如果当前styleSheet还不能用，则放到异步中则行
		        if (style.styleSheet.disabled) {
		            setTimeout(func, 10);
		        } else {
		            func();
		        }
		    } else { //w3c
		        //w3c浏览器中只要创建文本节点插入到style元素中就行了
		        var textNode = document.createTextNode(cssText);
		        style.appendChild(textNode);
		    }
		    headParent.appendChild(style); //把创建的style元素插入到父页面head中    
		}
		
		function outStock(){
			window.location="${home}/pmanager/product/product.do?op=outStockExecute&bookId=${data.bookform.id }"
		}
		
		//使用
		addCSS("table{width:100%;margin:15px 0;border-collapse:collapse;border-spacing:0}table th{padding:10px 0;background:#efefef;font-family:微软雅黑;font-weight:400;font-size:14px;letter-spacing:2px;text-align:center;text-indent:.5em;border:1px solid #ccc}.col-0{width:70px}.col-1{width:auto}.col-2,.col-3{width:60px}.col-4{width:240px}.col-5{width:120px}.col-6{width:80px}table td{vertical-align:middle;padding:5px;font-family:微软雅黑;border:1px solid #ccc}table td.product-img{border-right:0}table td.product-name{border-left:0}table td img{width:80px;height:80px}td p{color:#666;margin-top:10px}td li{margin:10px 0 0;border-bottom:1px solid #ccc;padding-bottom:10px}td li:last-child{border-bottom:0}td li{color:#999}td li.used span{color:#666;text-decoration:line-through;margin-right:5px}td li.available span{color:#f40;margin-right:5px}.product-list{text-align:center;margin:0 10px}");
	</script>		
	
</head>
<body >
	<div class="tool_bar">
		<button type="button" onclick="history.back()" class="return">
			<i></i>
			返回
		</button>
		
		<c:if test="${data.bookform.status == 0 ||data.bookform.status == 1}">
			<button type="button" class="cancel" onclick="disableObject()">
				<i></i>
				取消
			</button>
		</c:if>
	</div>
		<div class="body_wrap">
			<div class="order-box">
				<dl>
					<c:if test="${not empty data.factory}">
					<dt>商家名称</dt>
					<dd class="shop-name">
						${data.factory.name}
					</dd>
					
					<dt>联系方式</dt>
					<dd>${data.factory.man}，${data.factory.mobile}</dd>
					</c:if>
					<dt>商家地址</dt>
					<dd class="shop-address">${data.factoryAddr}</dd>
					
					<dt>商家留言</dt>
					<dd>
						<c:if test="${not empty data.bookform.remark}">
							${data.bookform.remark}
						</c:if>
						<c:if test="${empty data.bookform.remark}">
							<span>无</span>
						</c:if>
					</dd>
					
					
					<c:if test="${data.bookform.payType == 0}">
						<dt>付款方式</dt>
						<dd>在线支付</dd>
						<dt>支付结果</dt>
						<c:if test="${data.requireFinishPayment == true}">
							<dd>尚未完成支付</dd>
						</c:if>
						<c:if test="${data.requireFinishPayment == false}">
							<dd>
								<fmt:formatDate value="${data.logPayment.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								完成支付
							</dd>
						</c:if>
					</c:if>
					<c:if test="${data.bookform.payType == 1}">
						<dt>付款方式</dt>
						<dd>货到付款</dd>
					</c:if>
					<c:if test="${data.bookform.payType == 2}">
						<dt>付款方式</dt>
						<dd>预发货后付款</dd>
					</c:if>
	
				</dl>
				<div class="prime">
					<p>
						<span>订单编号</span>
						${data.bookform.code}
						<span>下单时间</span>
						<fmt:formatDate value="${data.bookform.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
						<span>订单金额</span>
						￥${data.bookform.sales}
					</p>
					<c:if test="${data.bookform.status == 0}">
						<h4>
							<i></i>
							订单状态：待付款
						</h4>
						
					</c:if>
					
					<c:if test="${data.bookform.status == 1}">
						<h4>
							<i></i>
							订单状态：待发货
						</h4>
						<p class="describe">
							<c:if test="${!data.allOutStock}">
								<button type="button" class="ok" onclick="outStock()">
									<i></i>
									出库
								</button>
								
							</c:if>
							<c:if test="${data.bookform.trackingStatus == 0 &&data.allOutStock}">
								商城尚未向商家发货，请及时完成以下工作
								<br/>
								<button type="button" class="ok" onclick="openDeliveryBox()">
									<i></i>
									发货
								</button>
								
							</c:if>
							<c:if test="${data.bookform.trackingStatus == 1}">
								商城已于<fmt:formatDate value="${data.bookform.deliveryTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								发货(${data.bookform.deliveryFactory}， ${data.bookform.trackingNumber})
							</c:if>
							<c:if test="${data.bookform.trackingStatus == 2}">
								商品已被商家接收(${data.bookform.deliveryFactory}， ${data.bookform.trackingNumber})
							</c:if>
						</p>
						<p class="describe">
								<c:if test="${data.bookform.payType == 0}">
									商家已在线支付费用
								</c:if>
								<c:if test="${data.bookform.payType == 1}">
									商家未支付费用
								</c:if>
							</p>
					</c:if>
					<c:if test="${data.bookform.status == 2}">
						<h4>
							<i></i>
							订单状态：待收货
						</h4>
						<p class="describe">等待商家确认收货</p>
					</c:if>
					<c:if test="${data.bookform.status == 3}">
						<h4>
							<i></i>
							订单状态：已完成
						</h4>
						<p class="describe">订单项目全部使用完毕，订单结束</p>
					</c:if>
					
					<c:if test="${data.bookform.status == 3}">
						<h4>
							<i></i>
							订单状态：已取消
						</h4>
						<p class="describe">
							<fmt:formatDate value="${data.bookform.cancelTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							撤销订单，原因为：
							${data.bookform.cancelReason}
						</p>
					</c:if>
				</div>
				<div class="clear"></div>
			</div>
				
			<div class="product-list">
				<table>
					<col class="col-0">
					<col class="col-1">
					<col class="col-2">
					<col class="col-3">
					<col class="col-4">
					<col class="col-5">
					<col class="col-6">
					<thead>
						<tr>
							<th colspan="2">商品</th>
							
							<th>单价</th>
							<th>数量</th>
							<th>已出库商品</th>
							<th>已出库数量</th>
							<th>小计</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${data.bookformProductDatas}" var="item">
						<tr>
							<td class="product-img">
								<img src="${home}/img-${item.imageId}_100X100.do">	
							</td>
							<td class="product-name">
								${item.productName}
							</td>
							<td>
								￥${item.price}
							</td>
							<td>
								${item.count}
							</td>
							<td>
								${item.securityCodes}
							</td>
							<td>
								${fn:length(item.outStockItemList)}
							</td>
							<td>
								￥${item.price*item.count}
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<span class="summary">	
					<em class="count">${data.itemCount}</em>
					件商品
					<i></i>
					总金额
					<em>
						￥${data.bookform.sales}
					</em>
					<i></i>
					应付总额
					<em class="pay-count">
						￥${data.bookform.sales}
					</em>
				</span>
			</div>
			
			<div id="shadow-box">
				
			</div>
			<div id="delivery-box">
				<h3>填写发货信息</h3>
				<select>
					<option></option>
					<option>顺丰快递</option>
					<option>韵达快递</option>
					<option>天天快递</option>
					<option>EMS快递</option>
					<option>中国邮政</option>
					<option>德邦物流</option>
					<option>其它</option>
				</select>
				<input type="text" placeholder="输入快递单号"/>
				<div>
					<button type="button" class="fire ok" onclick="saveDelivery()">
						<i></i>
						确定
					</button>
					<button type="button" class="cancel" onclick="closeDeliveryBox()">
						<i></i>
						取消
					</button>
				</div>
				<a href="javscript:void(0)" onclick="closeDeliveryBox()">
					关闭
				</a>
			</div>
		</div>
</body>
</html>