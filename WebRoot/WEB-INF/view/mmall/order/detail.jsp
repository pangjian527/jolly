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
	
	<style type="text/css">
	
		div.scwrapper{
			position: relative;
		    min-width: 320px;
		    max-width: 640px;
		    margin: 0 auto;
		    background-color: #f3f3f3;
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
		
		
		div.order-submit-box{
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
		
		div.order-submit-box a{
			width: 100px;
		    text-align: center;
		    color: white;
		    background: #f23030;
		    height: 50px;
		    display: block;
    		float: right;
		}
		
		div.order-submit-box label{
			display:inline-block;
			height:50px;
			font-size:25px;
			margin-right: 10px;
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
					<label>收货人：隔壁老王</label>
				</li>
				<li>
					<label>电 &nbsp;&nbsp; 话：18922368587</label>
				</li>
				<li>
					<label>地 &nbsp;&nbsp; 址：广东省广州市海珠区昌岗东路527号</label>
				</li>
				<li>
					<label>状 &nbsp;&nbsp; 态：已完成</label>
				</li>
				<li>
					<label>物 &nbsp;&nbsp; 流：已发货</label>
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
		
		<div class="order-price-box">
			<dl>
				<dt>商品金额</dt>
				<dd>￥799.00</dd>
				<dt>积分抵扣</dt>
				<dd>-￥0.00</dd>
				<dt>运费</dt>
				<dd>+￥15.00</dd>
			</dl>
			<div style="clear:both;"></div>
		</div>
		<div class="order-submit-box">
			<span>合计：</span>
			<label>￥399.00</label>
			<a href="">提交订单</a>
		</div>
	</div>
</body>
</html>