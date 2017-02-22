<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>订单详情</title>
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${home}/script/jquery.js"></script>	
	<script type="text/javascript" src="${home}/script/mwebmall//haux.mobile.js"></script>
	<style type="text/css">
	
		div.scwrapper{
			position: relative;
		    min-width: 320px;
		    max-width: 640px;
		    margin: 0 auto;
		}
		
		div.user-info-box{
			background:white;
			background-image: url("${home}/image/line.png") ;
    		background-size: 50px 5px;
    		padding: 5px 0;
    		background-position: -10px 0;
    		margin:10px 0;
		}
		
		div.user-info-box ul {
			background:white;
			padding: 10px 0;
		}
		
		div.user-info-box ul li{
			height:30px;
			line-height:30px;
			color:#232326;
			padding-left:15px;
			white-space:nowrap;/* 不换行 */
		    overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */
		    text-overflow:ellipsis
		}
		
		div.cart-list-box{
			margin:10px 0;
		}
		
		div.cart-list-box ul li{
			height:100px;
			background-color:white;
			padding:10px 10px;
			font-size:14px;
			border-bottom: 2px solid #e4e4e4;
		}
		
		div.cart-list-box ul li div.pro-img{
			height:100px;
			width:100px;
			float:left;
		}
		div.cart-list-box ul li div.pro-img img{
			height:100px;
			width:100px;
		}
		
		div.cart-list-box ul li div.pro-info-box{
				float:left;
				width:calc(100% - 120px);
				padding:0 10px;
		}
		div.pro-info-title{
			color: #232326;
		    font-size: 15px;
		    line-height: 20px;
		    height: 60px;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    display: -webkit-box;
		    display: box;
		    -webkit-line-clamp: 2;
		    -webkit-box-orient: vertical;
		    word-break: break-word;		
		}
		div.pro-price{
			height: 45px;
    		line-height: 45px;
		}
		div.pro-price label.price{
			color:#f23030;
			font-size:25px;
		}
		
		
		div.order-price-box{
			margin:10px 0;
			background:white;		
			font-size:15px;
			color:#262629;
			padding:5px 15px;
			margin-bottom: 50px;
		}
		div.order-price-box dl dt{
			float:left;
			width:50%;
			height:30px;
			line-height:30px;
		}
		div.order-price-box dl dd{
			float:left;
			width:50%;
			height:30px;
			line-height:30px;
			text-align:right;
			color:#f23030;
		}
		
		
		div.cart-balance-box{
			height: 50px;
		    background: white;
		    line-height: 50px;
		    color: red;
		    text-align: right;
		    position: fixed;
		    bottom: 0;
		    width: 100%;
		    border-top: 1px solid #e4e4e4;
		    max-width: 640px;
		}
		
		div.cart-balance-box a{
			width: 100px;
		    text-align: center;
		    color: white;
		    background: #f23030;
		    height: 50px;
		    display: block;
    		float: right;
		}
		
		div.cart-balance-box label{
			display:inline-block;
			height:50px;
			font-size:25px;
			margin-right: 10px;
		}
		
		
		header.header{
			  background-color: #f3f3f3;
		}
		header.header h1{
			margin: 0;
			  text-align: center;
			  font-size: 18px;
			  height: 50px;
			  line-height: 50px;
			  font-weight: normal;
		}
		header.header a{
			  position: absolute;
			  right: 20px;
			  display: block;
			  top: 0;
			  line-height: 50px;
			  height: 50px;
			  color: red;
		}
		a.checkbox{
			  float: left;
			  width: 20px;
			  height: 100px;
			  line-height: 100px;	
		}
		div.cart-content{
			  float: left;
  			width: calc(100% - 30px);
		}
		
		a.minus-count{
			   background: url(../image/shopping_cart_spirits_icns2.png) no-repeat 6px -113px;
		  background-size: 50px 200px;
		  display: block;
		  height: 100%;
		  width: 27px;
		  height: 100%;
		  display: inline-block;
		  box-sizing: border-box;
		    border-right: 1px solid #e4e4e4;
		}
		a.add-count{
			  background: url(../image/shopping_cart_spirits_icns2.png) no-repeat 7px -93px;
  			background-size: 50px 200px;
		  display: block;
		  height: 100%;
		  width: 27px;
		  height: 100%;
		  display: inline-block;
		  box-sizing: border-box;
		    border-left: 1px solid #e4e4e4;
		}
		
		div.pro-price{
			  position: relative;
		  height: 24px;
		  line-height: 24px;
		  margin-top: 12px;	
		}
		div.edit-count{
			  position: absolute;
			  top: 0;
			  right: 0;
		    width: 90px;
			  box-sizing: border-box;
			  white-space: nowrap;
			  height: 100%;
			  font-size: 0;
			    border: 1px solid #e4e4e4;
		}
		div.edit-count input{
			    height: 100%;
			  display: inline-block;
			  box-sizing: border-box;
			  width: 34px;
			  /* border: none; */
			  padding: -19px;
			  position: relative;
			  -webkit-appearance: none;
			  border: none;
			  text-align: center;
			  width: 34px;
			  vertical-align: top;
			  font-size: 15px;
			  color: #232326;
		}
		
		div.check-wrapper{
			  width: 30px;
			  float: left;
			  padding: -16px 116px;
			  padding-top: 40px;
		}
		i.cart-checkbox{
			    display: table-cell;
			  width: 20px;
			  height: 20px;
			  margin: 0 auto;
			  background: url(../image/shopping_cart_spirits_icns2.png) no-repeat 0px 1px;
			  background-size: 50px 200px;
			  /* display: table-cell !important; */
		}
		i.cart-checkbox.checked {
		  background-position: -25px 0px;
		}
		span.cart-checkbox-text{
			  color: #232326;
			  display: table-cell;
			  vertical-align: middle;
			  padding-left: 5px;
			  font-size: 16px;
			  line-height: 20px;
			    padding-top: 5px;
		}
		div.cart-price-info{
			    float: left;
			  /* height: 100%; */
			  max-width: 85px;
			  padding-left: 16px;
			  padding-top: -41px;
			  /* max-width: 50px; */
			  /* padding-left: 16px; */
			  padding-top: 15px;
			  display: table-cell !important;
		}
		div.btn-right-block{
			float: right;
		}
	</style>
	
	<script type="text/javascript">
		function checkOrNot(obj){
			if(obj.className=='cart-checkbox'){
				obj.className='cart-checkbox checked';
			}else{
				obj.className='cart-checkbox';
				document.getElementById("cartCheckboxId").className="cart-checkbox";
			}
			_staticCart()
		}
		function selectAllOrNot(obj){
			var ulEle = document.getElementById("cartListId");
			var iEles = ulEle.getElementsByTagName("i");
			for(var i=0;i<iEles.length;i++){
				if(obj.className=='cart-checkbox'){
					iEles[i].className='cart-checkbox checked';;
				}else{
					iEles[i].className='cart-checkbox';;
				}
				
			}
			checkOrNot(obj);
		}
		
		function _staticCart(){
			var iElements = document.getElementById("cartListId").getElementsByTagName("i");
			var priceAmount = 0;
			var productCount = 0;
			for(var i = 0, len = iElements.length; i < len; i++){
				var iElement = iElements[i];
				if(iElement.className != "cart-checkbox checked"){
					continue;
				}
				var count = parseInt(iElement.parentNode.parentNode.getElementsByTagName("input")[0].value) || 0;
				var price = iElement.parentNode.parentNode.getAttribute("price");
				priceAmount += count * price;
				productCount++;
			}
			priceAmount = Math.round(priceAmount * 100) /100;
			document.getElementById("totalPrice").innerHTML = "￥"+priceAmount;
			document.getElementById("allCount").innerHTML = productCount;
			if(productCount > 0  && productCount == iElements.length){
				document.getElementById("cartCheckboxId").className = "cart-checkbox checked";
			}
			else{
				document.getElementById("cartCheckboxId").className = "cart-checkbox";
			}
		}
		function _increaseItemCount(obj,productId){
			
			var inputElement = obj.parentNode.getElementsByTagName("input")[0];
			var count = parseInt(inputElement.value)+1;
			setItemCount(inputElement,productId,count);
		}
		
		function _decreaseItemCount(obj,productId){
			var inputElement = obj.parentNode.getElementsByTagName("input")[0];
			var count = parseInt(inputElement.value)-1;
			if(count <= 0){
				haux.showToast("商品数量不能少于1");
				return;
			}
			setItemCount(inputElement,productId,count);
		}
		
		function setItemCount(inputObj,productId,count){
			//0.
			$.ajax({url: home()+'/mmall/cart.do?op=setItemCount',
				data:{productId:productId, count:count},
				success:function(data){
					var dataJsonObj=JSON.parse(data);
					if(dataJsonObj.error){
						//失败了，可能商品超限额、下架等原因
						//alert(data.error);
						haux.showToast(dataJsonObj.error);
						window.location.reload();
					}
					else{
						inputObj.value=count;
						//2.重新计算价格
						_staticCart();
					}
				}
			});
		}
		function deleteItems(){
			//1.获取删除的对象
			var iElements = document.getElementById("cartListId").getElementsByTagName("i");
			var itemIds = [];
			for(var i = 0, len = iElements.length; i < len; i++){
				var iElement = iElements[i];
				if(iElement.className == "cart-checkbox checked"){
					itemIds.push(iElement.parentNode.parentNode.getAttribute("productId"));
				}
			}
			//2.判断有没有选择至少1份商品
			if(itemIds.length == 0){
				haux.showToast("请选择需要删除的商品");
				return;
			}
			
			//3.判断用户是否登录，这里应该临时去服务器检查一下
			if(!confirm('确定要删除选中项吗？')){
				return;
			}
		
			//2.将本地购物车数据、目标产品都发送到服务器端
			haux.getData({url:home() + '/mmall/cart.do?op=deleteItems',
				data:{productIds:itemIds},
				success:function(data){
					if(data.error){
						//3.失败了，可能商品超限额、下架等原因
						haux.showToast(data.error);
						if(data.reload){//如果服务器强制要求页面刷新，说明本页面内容已严重过时了
							window.location.reload();
						}
					}
					else{
						//a.告知用户
						haux.showToast("删除成功！");
						//b.更新界面，删除目标数据，这里直接利用闭包访问之前的数组即可
						for(var i = iElements.length - 1; i >= 0; i--){
							var iElement = iElements[i];
							if(iElement.className == "cart-checkbox checked"){
								iElement.parentNode.parentNode.parentNode.removeChild(iElement.parentNode.parentNode);
							}
						}
						//统计价格
						_staticCart();
					}
				}
			});
			
		}
	</script>
		
</head>
<body>
	<div class="scwrapper">
		<header class="header">
			<h1>购物车</h1>
			<a href="javascript:deleteItems()">删除</a>
		</header>
		
		<div class="cart-list-box">
			<ul id="cartListId">
				<c:forEach items="${cartData.items }" var="cartItem">
					<li price="${cartItem.price }" productId="${cartItem.productId }">
						<div class="check-wrapper">
							<i class="cart-checkbox" onclick ="checkOrNot(this)">
							</i>	
						</div>
						<div class="cart-content">
							<div class="pro-img">
								<img src="${home}/image/23456.jpg"/>
							</div>
							<div class="pro-info-box">
								<div class="pro-info-title">${cartItem.productName }</div>
								<div class="pro-price">
									<label class="price">￥${cartItem.price }</label>
									<div class="edit-count">
										<a class="minus-count" onclick="_decreaseItemCount(this,'${cartItem.productId }')">
										</a>
										<input type="text" value="${cartItem.count }" onblur="setItemCount(this,'${cartItem.productId }',this.value)">
										<a class="add-count" onclick="_increaseItemCount(this,'${cartItem.productId }')">
										</a>
									</div>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<div class="cart-balance-box">
			<div class="cart-price-info">
				<i class="cart-checkbox" onclick="selectAllOrNot(this)" id="cartCheckboxId"></i>
				<span class="cart-checkbox-text" id="checkIcon-1">全选</span>
			</div>
			<div class="btn-right-block">
				<span>合计：</span>
				<label id="totalPrice">￥0</label>
				<a href="">去结算(<span id="allCount"></span>)</a>
			</div>
		</div>
	</div>
</body>
</html>