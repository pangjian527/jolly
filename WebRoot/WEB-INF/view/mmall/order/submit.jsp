<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>订单确认</title>
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	
	<style type="text/css">
	
		div.scwrapper{
			position: relative;
		    min-width: 320px;
		    max-width: 640px;
		    margin: 0 auto;
		    background-color: #f3f3f3;
		    padding: 10px 0;
		}
		
		div.user-info-box{
			background:white;
			background-image: url("${home}/image/line.png") ;
    		background-size: 50px 5px;
    		padding: 5px 0;
    		background-position: -10px 0;
		}
		
		div.user-info-box ul {
			background:white;
			padding: 10px 0;
		}
		
		div.user-info-box ul li{
			height:40px;
			line-height:40px;
			color:#232326;
		}
		div.user-info-box ul li label{
			display:inline-block;
			width:100px;
			text-align: right;
		}
		div.user-info-box ul li input[type="text"]{
			height:25px;
			text-indent:5px;
			width:calc(100% - 130px);
			border:0;
			border-bottom:1px solid #e4e4e4;
			-webkit-appearance:none;
			border-radius:0;
		}
		div.user-info-box ul li select{
			height:25px;
			width:calc((100% - 150px)/3);
			border:1px solid #e4e4e4;
			-webkit-appearance:none;
			border-radius:0;
			background:white;
		}
		
		div.pro-list-box{
			margin:10px 0;
		}
		
		div.pro-list-box ul li{
			height:100px;
			background-color:white;
			padding:10px 10px;
			font-size:14px;
			border-bottom: 2px dashed #e4e4e4;
		}
		
		div.pro-list-box ul li div.pro-img{
			height:100px;
			width:100px;
			float:left;
		}
		div.pro-list-box ul li div.pro-img img{
			height:100px;
			width:100px;
		}
		
		div.pro-list-box ul li div.pro-info-box{
				float:left;
				width:calc(100% - 150px);
				padding:0 10px;
		}
		div.pro-info-title{
			color: #232326;
		    font-size: 15px;
		    line-height: 20px;
		    height: 70px;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    display: -webkit-box;
		    display: box;
		    -webkit-line-clamp: 2;
		    -webkit-box-orient: vertical;
		    word-break: break-word;		
		}
		div.pro-price{
			height: 35px;
    		line-height: 35px;
		}
		div.pro-price label.price{
			color:#f23030;
			font-size:25px;
		}
		
	</style>
	
	<script type="text/javascript">
		
	</script>
		
</head>
<body>
	<div class="scwrapper">
		<div class="user-info-box">
			<ul>
				<li>
					<label>收货人：</label>
					<input type="text" name=""/>
				</li>
				<li>
					<label>电 &nbsp;&nbsp; 话：</label>
					<input type="text" name=""/>
				</li>
				<li>
					<label>区 &nbsp;&nbsp; 域：</label>
					<select>
						<option>广东省</option>
					</select>
					<select>
						<option>广州市</option>
					</select>
					<select>
						<option>天河区</option>
					</select>
				</li>
				<li>
					<label>街 &nbsp;&nbsp; 道：</label>
					<input type="text" name=""/>
				</li>
			</ul>
		</div>
		<div class="pro-list-box">
			<ul>
				<li>
					<div class="pro-img">
						<img src="${home}/image/23456.jpg"/>
					</div>
					<div class="pro-info-box">
						<div class="pro-info-title">苹果原装手机内置电池iPhone4/4s/5/5s/6/7iPhone6s/6plus电池 苹果6专用电池</div>
						<div class="pro-price">
							<label class="price">￥188.88</label>&nbsp;&nbsp;x 10
						</div>
					</div>
				</li>
				<li>
					<div class="pro-img">
						<img src="${home}/image/23456.jpg"/>
					</div>
					<div class="pro-info-box">
						<div class="pro-info-title">苹果原装手机内置电池iPhone4/4s/5/5s/6/7iPhone6s/6plus电池 苹果6专用电池</div>
						<div class="pro-price">
							<label class="price">￥188.88</label>&nbsp;&nbsp;x 10
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
