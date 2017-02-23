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
			width:80px;
			text-align: right;
		}
		div.user-info-box ul li input[type="text"]{
			height:25px;
			text-indent:5px;
			width:calc(100% - 110px);
			border:0;
			border-bottom:1px solid #e4e4e4;
			-webkit-appearance:none;
			border-radius:0;
		}
		div.user-info-box ul li select{
			height:25px;
			width:calc((100% - 130px)/3);
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
		
		div.user-score-box{
			margin:10px 0;
			background:white;
		}
		
		div.user-score-box ul li{
			height:45px;
			line-height:45px;
			border-bottom:1px solid #f1f1f1;
			margin-left:15px;
			color: #232326;
			font-size:14px;
			position:relative;
		}
		div.user-score-box ul li i.direction{
			position: absolute;
		    background-image: url("${home}/image/direction.png");
		    right: 18px;
   			 top: 15px;
		    background-size: 100% auto;
		    width: 9px;
		    height: 16px;
		}
		
		div.user-score-box ul li span.desc {
			position: absolute;
    		right: 35px;
    		font-size: 14px;
    		color:red;
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
		div.paytype-box{
			margin: 10px 0;
		    background: white;
		    padding: 10px;
		}
		div.paytype-box label{
			display: block;
		    height: 35px;
		    line-height: 35px;
		    border-bottom: 1px solid #f1f1f1;
		    margin-left: 10px;
		    font-size: 14px;
		    color: #232326;
		}
		div.paytype-box span{
			display: inline-block;
		    margin-left: 5px;
		    font-size: 14px;
		    padding: 10px 8px;
		    border: 1px solid #ff8400;
		    margin-top: 10px;
		    border-radius: 10px;
		    color: #ff8400;
		}
		div.paytype-box span.active{
			color:white;
			background:#ff8400;
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
					<input type="text" value="${factory.man }" name=""/>
				</li>
				<li>
					<label>电 &nbsp;&nbsp; 话：</label>
					<input type="text" value="${factory.mobile }" name=""/>
				</li>
				<li>
					<label>区 &nbsp;&nbsp; 域：</label>
					<select>
						<option value="2250">广东省</option>
					</select>
					<select>
						<option value="2251">广州市</option>
					</select>
					<select>
						<option  value="2270">天河区</option>
					</select>
				</li>
				<li>
					<label>街 &nbsp;&nbsp; 道：</label>
					<input type="text" value="${factory.addr }" name=""/>
				</li>
			</ul>
		</div>
		<div class="pro-list-box">
			<ul>
				<c:forEach items="${cartData.items }" var="item">
				<li>
					<div class="pro-img">
						<img src="${home}/img-${item.imageId }.do">	
					</div>
					<div class="pro-info-box">
						<div class="pro-info-title">${item.productName }</div>
						<div class="pro-price">
							<label class="price">￥<fmt:formatNumber value="${item.price }" pattern="#,#00.00#"/></label>&nbsp;&nbsp;x ${item.count }
						</div>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
		<div class="user-score-box">
			<ul>
				<li>
					<label>优惠劵</label>
					<span class="desc">无可用</span>
					<i class="direction"></i>
				</li>
				<li>
					<label>积分 共${score }积分，可低￥${score/10 }元。</label>
					<i></i>
				</li>
			</ul>
		</div>
		<div class="paytype-box">
			<label>付款类型</label>
			<span class="active">在线付款</span>
			<span>货到付款</span>
			<span>预发货后付款</span>
		</div>
		<div class="order-price-box">
			<dl>
				<dt>商品金额</dt>
				<dd>￥ <fmt:formatNumber value="${cartData.allPrice }" pattern="#,#00.00#"/></dd>
				<dt>积分抵扣</dt>
				<dd>-￥0.00</dd>
				<dt>运费</dt>
				<dd>+￥0.00</dd>
			</dl>
			<div style="clear:both;"></div>
		</div>
		<div class="order-submit-box">
			<span>合计：</span>
			<label>￥ <fmt:formatNumber value="${cartData.allPrice }" pattern="#,#00.00#"/></label>
			<a href="">提交订单</a>
		</div>
	</div>
</body>
</html>
