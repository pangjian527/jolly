<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<meta name="format-detection" content="telephone=no" />
	<title>个人中心</title>
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	
	<style type="text/css">
	
		body{
			background:#f3f3f3;
		}
		div.scwrapper{
			position: relative;
		    min-width: 320px;
		    max-width: 640px;
		    margin: 0 auto;
		    background-color: #f3f3f3;
		}
		
		div.head-box{
			height:160px;
			background-image: url("${home}/image/h_bg.png");
			width:100%;
			position: relative;
		}
		
		div.head-box img{
			height: 80px;
		    position: absolute;
		    top: 50%;
		    margin-top: -60px;
		    left: 30px;
		    border-radius: 40px;
		}
		
		
		div.head-box div.factory-info{
			position: absolute;
		    left: 115px;
		    color: white;
		    top: 50%;
		    margin-top: -40px;
		    right:0;
		}
		div.head-box div.factory-info label{
			display: block;
		    height: 25px;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		    width: 100%;
		}
		
		div.head-box ul{
			position: absolute;
			bottom: 0;
			left:0;
			right:0;
			background:  rgba(0,0,0,0.2);
		}
		div.head-box ul li{
			float:left;
			width:33.3%;
			text-align: center;
			color:white;
			height:40px;
			line-height:40px;
			font-size:14px;
		}
		li div.split-line{
			border-right: 1px solid red;
		}
		
		
		div.nav-menu-box {
			margin:15px 0;
			background-color:white;
		}
		div.nav-menu-box ul{
			padding-left:15px;
		}
		div.nav-menu-box ul li{
			height:45px;
			line-height:45px;
			border-bottom: 1px solid #e3e5e9;
			color:#232326;
			font-size:14px;
			position: relative;
			padding-left: 30px;
		}
		div.nav-menu-box ul li:last-child{
			border-bottom:0;
		}
		
		a.logout{
			display: block;
		    width: 80%;
		    margin: auto;
		    text-align: center;
		    height: 40px;
		    line-height: 40px;
		    background: red;
		    color: white;
		    border-radius: 25px;
		    margin-top: 10px;
		    margin-bottom: 10px;
		}
		
		ul li i.direction{
			position: absolute;
		    background-image: url("${home}/image/direction.png");
		    right: 18px;
   			 top: 15px;
		    background-size: 100% auto;
		    width: 9px;
		    height: 16px;
		}
		
		div.nav-menu-box ul li label.desc{
			position: absolute;
			color:gray;
			font-size:12px;
			right:35px;
		}
		
		div.nav-menu-box ul li i.icon{
			 position: absolute;
		     height: 18px;
		     width: 18px;
		     background-size: 100% 100%;
		     top: 12px;
		     left:0;
		}
		div.nav-menu-box ul li i.icon_order{
			background-image: url("${home}/image/icon_order.png");
		}
		div.nav-menu-box ul li i.icon_score{
			background-image: url("${home}/image/icon_score.png");
		}
		div.nav-menu-box ul li i.icon_tuijian{
			background-image: url("${home}/image/icon_tuijian.jpg");
		}
		
		div.nav-menu-box ul li i.icon_code{
			background-image: url("${home}/image/icon_code.png");
		}
		div.nav-menu-box ul li i.icon_install_order{
			background-image: url("${home}/image/icon_yu_order.png");
		}
		div.nav-menu-box ul li i.icon_factory{
			background-image: url("${home}/image/icon_factory.png");
		}
	</style>
	
	<script type="text/javascript">
		
	</script>
		
</head>
<body>
	<div class="scwrapper">
			<div class="head-box">
					<img src="${home}/image/newDefaul.png" />
					<div class="factory-info">
						<label>广州市海珠区电脑城龙哥手机售后维修店</label>
						<label>18922378741</label>
					</div>
					<ul>
						<li>
							<div class="split-line">订单(1000)</div>
						</li>
						<li>
							<div class="split-line">推荐(100)</div>
						</li>
						<li>
							<div>积分(5000)</div>
						</li>
					</ul>
			</div>
			
			<div class="nav-menu-box">
				<ul>
					<li>
						<i class="icon icon_order"></i>
						<label>我的订单</label>
						<i class="direction"></i>
					</li>
					<li>
						<i class="icon icon_score"></i>
						<label>我的积分</label>
						<i class="direction"></i>
					</li>
					<li>
						<i class="icon icon_tuijian"></i>
						<label>我的推荐</label>
						<i class="direction"></i>
					</li>
				</ul>
			</div>
			
			<div class="nav-menu-box">
				<ul>
					<li>
						<i class="icon icon_factory"></i>
						<label>店铺信息</label>
						<i class="direction"></i>
						<label class="desc">认证后可以接安装订单哦</label>
					</li>
					<li>
						<i class="icon icon_code"></i>
						<label>安装验证码</label>
						<i class="direction"></i>
						<label class="desc">敬请期待</label>
					</li>
					<li>
						<i class="icon icon_install_order"></i>
						<label>安装订单</label>
						<i class="direction"></i>
						<label class="desc">敬请期待</label>
					</li>
				</ul>
			</div>
			<a href="" class="logout">退出系统</a>
	</div>
</body>
</html>
