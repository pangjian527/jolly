<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>防伪码查询</title>
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	
	<style type="text/css">
	
		body{
			background-color: #f3f3f3;
		}	
		div.scwrapper{
			position: relative;
		    min-width: 320px;
		    max-width: 640px;
		    margin: 0 auto;
		    background-color: #f3f3f3;
		}
		
		div.tip-box{
			margin:10px 0;
			background:white;
			position: relative;
			height:50px;
			padding:20px 0;
		}
		div.tip-box i.icon{
			position: absolute;
			left:10px;
			top:20px;
			background-image: url("${home}/image/notice.png");		
			height: 25px;
		    width: 25px;
		    background-position: 10px;
		}
		div.tip-box label{
			position: absolute;
			left:40px;
			font-size:16px;
			line-height: 22px;
			right:15px;
			color:gray;
		}
		
		div.secutiry-box{
			background:white;
			text-align: center;
			padding-top: 30px;
		}
		
		div.secutiry-box input{
			width: 90%;
		    border: 0;
		    border-bottom: 1px dashed #e4e4e4;
		    height: 60px;
		    font-size:22px;
		    text-indent: 10px;
		    letter-spacing: 2px;
		    border-radius:0;
		    font-weight: bold;
		}
		
		div.secutiry-box a{
			display: inline-block;
		    height: 35px;
		    line-height: 35px;
		    width: 120px;
		    text-align: center;
		    margin: 20px 0;
		    background: #e4393c;
		    border-radius:5px;
		    margin-left: 10px;
		    font-family: "Microsoft YaHei";
		    font-size: 14px;
		    color: #fff;
		    border: 1px solid #e4393c;
		}
		div.secutiry-box a.scan{
			color: #e4393c;
		    background: white;
		}
		
	</style>
	
	<script type="text/javascript">
		
		function secutiryValid(){
			var securityCode = document.getElementById("securityCode").value;
			window.location.href = "${home}/mmall/home/index.do?op=securityDetail&securityCode="+securityCode;
		}
	</script>
		
</head>
<body>
	<div class="scwrapper">
			<div class="tip-box">
				<i class="icon"></i>
				<label>注：根据防伪码查询后电池不可退，请确认使用再查询。</label>
				<div style="clear:both;"></div>
			</div>
			<div class="secutiry-box">
				<input type="text" id="securityCode" placeholder="请扫描防伪码" />
				<a class="scan" href="javascript:secutiryValid()">查询</a>
				<a  href="">扫码</a>
			</div>
	</div>
</body>
</html>