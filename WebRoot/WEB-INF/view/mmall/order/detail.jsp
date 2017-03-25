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
	<link rel="icon" href="${home}/favicon.ico" type="image/x-icon" />
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${home}/script/mwebmall/haux.mobile.js"></script>
	<style type="text/css">
		body{
			background: #f3f3f3;
		}
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
		    text-overflow:ellipsis;
		    font-size: 14px;
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
		function payNow(bookformId){
			//通过授权页面获取CODE，获取OPENID
			var redirectUrl="http://"+window.location.host+"${home}/mmall/order/order.do?op=pay&bookformId="+bookformId;
			if(is_weixn()){
				window.location="${oauthUrl}?appid=${appId}&redirect_uri="+urlencode(redirectUrl)
                +"&response_type=code&scope=snsapi_base#wechat_redirect";
			}else{
				window.location=redirectUrl;
			}
			
		}
	</script>
	<jsp:include page="../initWeixin.jsp"/>	
</head>
<body>
	<div class="scwrapper">
		<div class="user-info-box">
			<ul>
				<li>
					<label>收&nbsp;&nbsp;货&nbsp;人：${orderData.man }</label>
				</li>
				<li>
					<label>电 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 话：${orderData.mobile }</label>
				</li>
				<li>
					<label>地 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 址：${orderData.addr }</label>
				</li>
				<li>
					<label>付款类型：${orderData.payTypeLabel }</label>
				</li>
				<li>
					<label>状 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 态：${orderData.statusLabel }</label>
				</li>
				<c:if test="${orderData.status ==2 || orderData.status ==4}">
					<li>
						<label>物流类型：${orderData.deliveryFactory }</label>
					</li>
					<li>
						<label>物流单号：${orderData.trackingNumber }</label>
					</li>
				</c:if>
				
			</ul>
		</div>
		
		<div class="pro-list-box">
			<ul>
				<c:forEach items="${orderData.details }" var="detail">
				<li>
					<div class="pro-img">
						<img src="${home}/img-${detail.firstPhotos}.do">	
					</div>
					<div class="pro-info-box">
						<div class="pro-info-title">${detail.productName }</div>
						<div class="pro-price">
							<label class="price">￥ <fmt:formatNumber value="${detail.price }" pattern="#,#00.00#"/></label>
							&nbsp;&nbsp;x ${detail.count }
						</div>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
		
		<div class="order-price-box">
			<dl>
				<dt>商品金额</dt>
				<dd>￥<fmt:formatNumber value="${orderData.sales }" pattern="#,#00.00#"/></dd>
				<dt>积分抵扣</dt>
				<dd>-￥0.00</dd>
				<dt>运费</dt>
				<dd>+￥0.00</dd>
				<div style="clear:both;"></div>
			</dl>
		</div>
		<div class="order-submit-box">
			<span>合计：</span>
			<label>￥<fmt:formatNumber value="${orderData.sales }" pattern="#,#00.00#"/></label>
			<c:if test="${orderData.status == 0 }">
				<a href="javascript:payNow('${orderData.bookId }')">立即付款</a>
			</c:if>
		</div>
	</div>
</body>
</html>