<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>购物车</title>
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${home}/script/jquery.js"></script>	
	<style type="text/css">
	
		div.scwrapper{
			position: relative;
		    min-width: 320px;
		    max-width: 640px;
		    margin: 0 auto;
		}
		div.result-box{
			margin-top: 100px;
		    color: black;
		    text-align: center;
		    font-size: 25px;
		}
		div.order-info-box{
			font-size: 14px;
		    text-align: center;
		    padding: 5px 10px;
		}
		a.pay{
			display: block;
		    width: 90%;
		    text-align: center;
		    background: #1AAD19;
		    margin: auto;
		    color: white;
		    padding: 10px 0px;
		    border-radius: 3px;
		}
		
	</style>
	
	<script type="text/javascript">
		
	</script>
		
</head>
<body>
	<div class="scwrapper">
		<div class="result-box">
			<label>提交成功</label>
		</div>
		<div class="order-info-box">
			<label>订单号：236898564812</label>
		</div>		
		<a class="pay" href="">立即付款</a>
	</div>
</body>
</html>