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
	
		div.scwrapper{
			position: relative;
		    min-width: 320px;
		    max-width: 640px;
		    margin: 0 auto;
		    background-color: #f3f3f3;
		}
		div.order-menu-box{
			background:white;
			height:35px;
			width:100%;
		}
		div.order-menu-box  dl{
			margin:0 0.5%;
		}
		div.order-menu-box  dl dd{
			height:35px;
			width:33%;
			float:left;
			text-align: center;
			line-height:35px;
			color:#9a9a9a;
		}
		
		div.order-menu-box  dl dd label{
			text-align: center;
			color:#9a9a9a;
			padding:7px 10px;			
		}
		
		div.order-menu-box  dl dd label.active{
			border-bottom:2px solid red;
			color:red;
		}
		
		div.order-list-box{
			margin: 10px 0;
		}
		
		div.order-list-box{
			background: white;
		}
		div.order-status-box{
			height: 45px;
		    line-height: 45px;
		    border-bottom: 1px solid #e4e4e4;
		    font-size: 14px;
		    color: #232326;
		}
		
		div.order-list-box ul li{
			border-bottom: 10px solid #f3f3f3;
			padding-left:10px;
			position: relative;
		}
		 div.order-list-box ul li div.pro-img{
			height:80px;
			width:80px;
			float:left;
		}
		
		div.order-list-box ul li div.pro-img img{
			height:80px;
			width:80px;
		}
		
		div.order-list-box ul li div.pro-info-box{
				float:left;
				width:calc(100% - 120px);
				padding:0 10px;
		}
		
		div.pro-info-title{
			color: #232326;
		    font-size: 15px;
		    line-height: 20px;
		    height: 40px;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    display: -webkit-box;
		    display: box;
		    -webkit-line-clamp: 2;
		    -webkit-box-orient: vertical;
		    word-break: break-word;		
		    font-size: 14px;
		}
		div.pro-price{
			height: 45px;
    		line-height: 45px;
		}
		div.pro-price label.price{
			color:#f23030;
			font-size:25px;
		}
		
		div.order-pro-box{
			padding:10px 0;
			border-bottom: 1px dashed #e4e4e4;
		}
		
		div.order-price-box{
			height: 35px;
		    line-height: 35px;
		    text-align: right;
		    padding-right: 15px;
		    color:red;
		}
		
		label.order-time{
			position:absolute;
			right:35px;
			color:gray;
		}
		
		div.order-list-box ul li i.direction{
			position: absolute;
		    background-image: url("${home}/image/direction.png");
		    right: 18px;
   			 top: 13px;
		    background-size: 100% auto;
		    width: 9px;
		    height: 16px;
		}
		
		i.order-status-image{
			position: absolute;
		    background-image: url("${home}/image/finish.png");
		    right: 18px;
		    top: 8px;
		    background-size: 100%;
		    width: 70px;
		    height: 70px;
		}
		a.order-pay{
			padding: 5px 15px;
		    background: red;
		    color: white;
		    border-radius: 5px;
		    margin-left: 10px;
		}
		
	</style>
	
	<script type="text/javascript">
		
	</script>
		
</head>
<body>
	<div class="scwrapper">
		<div class="order-menu-box">
			<dl>
				<dd>
					<label class="active">全部订单</label>
				</dd>
				<dd>
					<label>已完成</label>
				</dd>
				<dd>
					<label >未完成</label>
				</dd>
			</dl>
			<div style="clear:both;"></div>
		</div>
		<div class="order-list-box">
			<ul>
				<li>
					<div class="order-status-box">
						<label>已完成</label>
						<label class="order-time">2017-01-10 10:30:28</label>
						<i class="direction"></i>
					</div>
					<div class="order-pro-box">
						<div class="pro-img">
							<img src="${home}/image/23456.jpg"/>
						</div>
						<div class="pro-info-box">
							<div class="pro-info-title">苹果原装手机内置电池iPhone4/4s/5/5s/6/7iPhone6s/6plus电池 苹果6专用电池</div>
							<div class="pro-price">
								<label class="price">￥188.88</label>&nbsp;&nbsp;x 10
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div class="order-pro-box">
						<div class="pro-img">
							<img src="${home}/image/23456.jpg"/>
						</div>
						<div class="pro-info-box">
							<div class="pro-info-title">苹果原装手机内置电池iPhone4/4s/5/5s/6/7iPhone6s/6plus电池 苹果6专用电池</div>
							<div class="pro-price">
								<label class="price">￥188.88</label>&nbsp;&nbsp;x 10
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div class="order-price-box">
						实际付款：￥198.00
					</div>
					<i class="order-status-image"></i>
				</li>
				
				
				<li>
					<div class="order-status-box">
						<label>代付款</label>
						<label class="order-time">2017-01-10 10:30:28</label>
						<i class="direction"></i>
					</div>
					<div class="order-pro-box">
						<div class="pro-img">
							<img src="${home}/image/23456.jpg"/>
						</div>
						<div class="pro-info-box">
							<div class="pro-info-title">苹果原装手机内置电池iPhone4/4s/5/5s/6/7iPhone6s/6plus电池 苹果6专用电池</div>
							<div class="pro-price">
								<label class="price">￥188.88</label>&nbsp;&nbsp;x 10
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div class="order-pro-box">
						<div class="pro-img">
							<img src="${home}/image/23456.jpg"/>
						</div>
						<div class="pro-info-box">
							<div class="pro-info-title">苹果原装手机内置电池iPhone4/4s/5/5s/6/7iPhone6s/6plus电池 苹果6专用电池</div>
							<div class="pro-price">
								<label class="price">￥188.88</label>&nbsp;&nbsp;x 10
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div class="order-price-box">
						实际付款：￥198.00
						<a class="order-pay" href="">付款</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
