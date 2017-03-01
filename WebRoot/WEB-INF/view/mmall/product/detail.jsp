<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>商品详情</title>
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="${home}/style/swipe.css">
	<link href="${home}/style/m_dialog.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${home}/script/jquery.js"></script>	
	<script type="text/javascript" src="${home}/script/mwebmall/haux.mobile.js"></script>
	<script type="text/javascript" src="${home}/script/mwebmall/swipe.min.js"></script>
	<script type="text/javascript" src="${home}/script/m_dialog.js"></script>
	<style type="text/css">
		body{
			  background-color: #f3f3f3;
		}
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
  			color:red;
		}
		div.base-info-wrapper{
			margin: 10px 0;
		  	background-color: #fff;
		  	padding: 10px 15px;
		}
		div.extra-info-wrapper{
			margin: 10px 0;
		  	background-color: #fff;
		  	padding: 10px 15px;
	  	  	font-size: 15px;
	  	  	margin-bottom: 50px;
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
  			position:relative;
  			font-size: 14px;
    		line-height: 75px;
		}
		a.cart i.cart_png{
			display: block;
		    background-image: url("/jolly/image/cart_sprits_all.png");
		    height: 25px;
		    width: 27px;
		    background-position: 0px -26px;
		    background-size: 124px;
		    position: absolute;
		    left: 50%;
		    margin-left: -15px;
		    top: 6px;
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
	function initBody(){
		_imagefalsh();
	}
	//设置图片滚动
	function _imagefalsh(){
	   var bullets = document.getElementById('position').getElementsByTagName('li');
	   var banner = Swipe(document.getElementById('mySwipe'), {
	   	auto: 2000,
	   	continuous: true,
	   	disableScroll:false,
	   	callback: function(pos) {
	   		var i = bullets.length;
	   		while (i--) {
	   		  bullets[i].className = ' ';
	   		}
	   		bullets[pos].className = 'cur';
	   	}
	   });
	}
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
		function toCart(){
			window.location="${home}/mmall/cart.do";
		}
		function addToCart(productId){
			$.ajax({url: home()+'/mmall/cart.do?op=setItemCount',
				data:{productId:productId,addCount:1},
				success:function(data){
					var dataJsonObj=JSON.parse(data);
					if(dataJsonObj.error){
						//失败了，可能商品超限额、下架等原因
						dialogAlert("温馨提示",dataJsonObj.error);
					}else{
						dialogAlert("温馨提示","加入购物车成功");
					}
				}
			});
		}
		function buyNow(productId){
			$.ajax({url: home()+'/mmall/cart.do?op=setItemCount',
				data:{productId:productId,addCount:1},
				success:function(data){
					var dataJsonObj=JSON.parse(data);
					if(dataJsonObj.error){
						//失败了，可能商品超限额、下架等原因
						dialogAlert("温馨提示",dataJsonObj.error);
					}else{
						toCart();
					}
				}
			});
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
				<%-- <ul>
					<li>
						<img width="100%" src="${home}/img-${product.photoIds }_400X300.do"/>
					</li>
				</ul> --%>
				<div class="addWrap">
	   					<div class="swipe" id="mySwipe">
							<div class="swipe-wrap">
								<c:forEach items="${productPhotoIds}" var="field"  >
									<div>
			   							<img id="factory-img" src="${home}/img-${field }_400X300.do">
			   						</div>
			   					</c:forEach>
							</div>
						</div>
						<ul id="position">
							<c:forEach items="${productPhotoIds}" var="field" varStatus="num">
								<li class="<c:if test="${num.index==0 }">cur</c:if>"></li>
							</c:forEach>
						</ul>
	   				</div>
			</div>
			<div class="base-info-wrapper">
				<div class="product-name">${product.name }</div>
				<div class="price-info">
					<span class="discount-price">¥<fmt:formatNumber value="${product.price }" pattern="#,#00.00#"/></span>
					<label>原价：</label><i style="text-decoration: line-through;">¥<fmt:formatNumber value="${product.priceMart }" pattern="#,#00.00#"/></i>
				</div>
				<div class="express-remark">包退、包换</div>
			</div>
			<div class="extra-info-wrapper">
				<ul>
					<c:if test="${area!=null }">
						<li>
							<label>送至：${area.fullName }</label>
						</li>
					</c:if>
					<c:if test="${expressFee!=null }">
						<li>
							<label>运费：满${expressFee.amountForFree }免运费</label>
						</li>
					</c:if>
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
			<c:forEach items="${contentPhotoIds }" var="contentPhotoId">
				<img width="100%" src="${home}/img-${contentPhotoId }_400X300.do"/>
			</c:forEach>
		</div>
		<div class="bottom-menu">
			<a class="cart" href="javascript:toCart()">
				<i class="cart_png"></i>
				购物车
			</a>
			<a class="add-cart" href="javascript:addToCart('${product.id }')">加入购物车</a>
			<a class="buy-now" href="javascript:buyNow('${product.id }')">立即购买</a>
		</div>
	</div>

</body>