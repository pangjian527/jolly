<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>前台商品列表</title>
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	<style type="text/css">
		div.scwrapper {
		  position: relative;
		  min-width: 320px;
		  max-width: 640px;
		  margin: 0 auto;
		}
		div.product-menu-box{
			height: 50px;
			background-color: #f3f3f3;
		}
		div.product-menu-box ul li {
		  width: 33%;
		  float: left;
		  text-align: center;
		  line-height: 45px;
		}	
		div.product-menu-box ul li label.active{
			border-bottom: 2px solid #9a9a9a;
  			padding: 17px 10px;
		}
		div.base-info-wrapper{
			margin: 10px 0;
		  	background-color: #f3f3f3;
		  	padding: 10px 15px;
		}
		div.extra-info-wrapper{
			margin: 10px 0;
		  	background-color: #f3f3f3;
		  	padding: 10px 15px;
	  	  	font-size: 15px;
		}
		div.extra-info-wrapper ul li{
			height:30px;
			line-height:30px;
		}
		div.bottom-menu{
			bottom: 0;
		  	line-height: 50px;
		  	height: 50px;
		  	position: fixed;
		  	width: 100%;
		  	border-top: 1px solid #e4e4e4;
		  	  max-width: 640px;
		}
		div.bottom-menu a{
			height: 50px;
		  	display: block;
		  	float: left;
		  	text-align: center;
		}
		a.cart{
			width: 33%;
  			background-color: white;
		}
		a.add-cart{
			width: 34%;
  			background-color: #ffb03f;
  			color: white;
		}
		a.buy-now{
			width: 33%;
  			background-color: #f23030;
  			color: white;
		}
		div.product-name{
			font-size: 18px;
		}
		div.price-info{
			height: 50px;
			line-height:50px;
		}
		span.discount-price{
			color: red;
  			font-size: 30px;
 			margin-right: 15px;
		}
		div.express-remark{
			  font-size: 14px;
			  color:red;
		}
		
		div.product-properties-wrapper{
			  padding: 15px;
		}
		table.properties-table td{
  			padding: 5px;
		}
		table.properties-table td.tdTitle{
			width: 80px;
		}
		
	</style>
	<script type="text/javascript">
		function showContentDiv(obj,contentDivIndex){
			var ulEle = obj.parentNode;
			var labelEles=ulEle.getElementsByTagName("label");
			for(var i=0;i<labelEles.length;i++){
				if(obj.children[0]==labelEles[i]){
					obj.children[0].className="active";
				}else{
					labelEles[i].className="";
					
				}
			}
			for(var i=1;i<4;i++){
				if(i==contentDivIndex){
					document.getElementById("contentDiv-"+contentDivIndex).style.display = "";
				}else{
					document.getElementById("contentDiv-"+i).style.display = "none";
				}
			}
			
		}
	</script>
</head>
<body>
	<div class="scwrapper">
		<div class="product-menu-box">
			<ul>
				<li onclick="showContentDiv(this,1)">
					<label class="active">商品</label>
				</li>
				<li onclick="showContentDiv(this,2)">
					<label>产品属性</label>
				</li>
				<li onclick="showContentDiv(this,3)">
					<label>详情</label>
				</li>
			</ul>
		</div>
		<div class="product-info-wrapper" id="contentDiv-1">
			<div class="slider-wrapper">
				<ul>
					<li>
						<img width="100%" src="${home}/image/p123.jpg"/>
					</li>
				</ul>
			</div>
			<div class="base-info-wrapper">
				<div class="product-name">${product.name }</div>
				<div class="price-info">
					<span class="discount-price">¥${product.price }</span>
					<label>原价：</label><span>¥${product.priceMart }</span>
				</div>
				<div class="express-remark">包退、包换、包邮</div>
			</div>
			<div class="extra-info-wrapper">
				<ul>
					<li>
						<label>送至：广东省 广州市 天河区</label>
					</li>
					<li>
						<label>运费：满299免运费</label>
					</li>
					<li>
						<label>提示：支持退换</label>
					</li>
				</ul>
			</div>
		</div>
		<div class="product-properties-wrapper" id="contentDiv-2" style="display:none">
			<table cellpadding="0" cellspacing="1" width="100%" border="1"
				class="properties-table">
				<tbody>
					<tr>
						<td class="tdTitle">电池型号</td>
						<td>${product.model }</td>
					</tr>
					<tr>
						<td class="tdTitle">电池属性</td>
						<td>${product.coreType }</td>
					</tr>
					<tr>
						<td class="tdTitle">容量</td>
						<td>${product.capacity }</td>
					</tr>
					<tr>
						<td class="tdTitle">适用品牌</td>
						<td>${product.applyBrand }</td>
					</tr>
					<tr>
						<td class="tdTitle">适用机型</td>
						<td>${product.applyPhoneType }</td>
					</tr>
					<tr>
						<td class="tdTitle">执行标准</td>
						<td>${product.executeNormal }</td>
					</tr>
					<tr>
						<td class="tdTitle">标准电压</td>
						<td>${product.normalVoltage}</td>
					</tr>
					<tr>
						<td class="tdTitle">充电电压</td>
						<td>${product.chargeVoltage}</td>
					</tr>
					<tr>
						<td class="tdTitle">是否环保</td>
						<td>${product.environment}</td>
					</tr>
					<tr>
						<td class="tdTitle">快充功能</td>
						<td>${product.quickCharge}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="product-content-wrapper" id="contentDiv-3" style="display:none">
			<img width="100%" src="${home}/image/content-example.jpg"/>
		</div>
		<div class="bottom-menu">
			<a class="cart">购物车</a>
			<a class="add-cart">加入购物车</a>
			<a class="buy-now">立即购买</a>
		</div>
	</div>

</body>