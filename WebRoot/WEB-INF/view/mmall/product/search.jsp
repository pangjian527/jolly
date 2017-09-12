<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>倬利网官方商城</title>
	<link rel="icon" href="${home}/favicon.ico" type="image/x-icon" />
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${home}/script/mwebmall/haux.mobile.js"></script>
	<style type="text/css">
	
		div.scwrapper{
		    min-width: 320px;
		    max-width: 640px;
		    margin: 0 auto;
		    background-color: #f3f3f3;
		    margin-bottom:30px;
		}
		
		div.search{
			height: 40px;
			width: 100%;
		    z-index: 100;
		    position:relative;
		    
		}
		div.search i.search-icon{
			background-image:url("${home}/image/search.png");
		    position: absolute;
		    z-index: 101;
		    width: 20px;
		    height: 20px;
		    top: 11px;
    		left: 17px;
		    background-size: 100%;
		}
		div.search input{
			border: 1px solid #e4e4e4;
		    height: 30px;
		    margin: 3px;
		    border-radius: 15px;
		    text-indent: 38px;
		    width: 98%;
		}
		div.search a{
			position: absolute;
		    right: 10px;
		    top: 7px;
		    font-size: 14px;
		    background-color: red;
		    color: white;
		    border-radius: 10px;
		    height: 26px;
		    display: block;
		    width: 40px;
		    line-height: 26px;
		    text-align: center;
		}
		
		
		div.footer{
			position: fixed;
			bottom:0;
			left:0;
			right:0;
			height:50px;
			border-top: 1px solid #e4e4e4;
    		box-shadow: 0px 0px 20px #888888;
		}
		div.footer ul li{
			float: left;
		    width: 25%;
		    text-align: center;
		    background: white;
		    height:50px;
		}
		div.footer ul li a {
			display: block;
		    height: 100%;
		    width: 100%;
		}
		div.footer ul li i{
			display:block;
			width:30px;
			height:30px;
			margin:auto;
			background-position-y: 3px;
		}
		div.footer ul li label{
			font-size: 12px;
		    height: 20px;
		    display: block;
		    line-height: 20px;
		}
		div.footer ul li i.home{
			background-image: url("${home}/image/nav_home.png");
		    background-size: 30px 30px;
		    background-repeat: no-repeat;
		}
		div.footer ul li i.cart{
			background-image: url("${home}/image/nav_cart.png");
		    background-size: 30px 30px;
		    background-repeat: no-repeat;
		}
		
		div.footer ul li i.kefu{
			background-image: url("${home}/image/nav_kefu.png");
		    background-size: 32px 30px;
		    background-repeat: no-repeat;
		    background-position-y: 1px;
		}
		
		div.footer ul li i.me{
			background-image: url("${home}/image/nav_me.png");
		    background-size: 29px 29px;
		    background-repeat: no-repeat;
		}
	</style>
	
	<script type="text/javascript">
	
	function search(){
		document.forms[0].submit();
	}
	</script>
	<jsp:include page="../initWeixin.jsp"/>	
</head>
<body>
	<div class="scwrapper">
		<div class="search">
			<form action="${home}/mmall/product/product.do?op=executeSearch" method="post">
				<i class="search-icon"></i>
				<input id="name" name="name" type="text" placeholder="请输入关键字搜索"/>
				<a href="javascript:search()">搜索</a>
			</form>
		</div>
		<div class="footer">
			<ul>
				<li >
					<a href="${home }/mmall/product/product.do">
						<i class="home"></i>
						<label>首页</label>
					</a>
				</li>
				<li >
					<a href="${home }/mmall/cart.do">
						<i class="cart"></i>
						<label>购物车</label>
					</a>
				</li>
				<li >
					<a href="tel://400-861-3360">
						<i class="kefu"></i>
						<label>客服</label>
					</a>
				</li>
				<li >
					<a href="${home }/mmall/home/index.do">
						<i class="me"></i>
						<label>我的</label>
					</a>
				</li>
			</ul>
		</div>
	</div>
</body>

</html>
