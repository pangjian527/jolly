<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>商品列表</title>
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
	</div>
</body>

</html>
