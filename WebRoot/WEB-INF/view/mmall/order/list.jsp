<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>我的订单</title>
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${home}/script/iscroll-probe.js"></script>
	
	
	<style type="text/css">
		body{
			background-color: #f3f3f3;
		}
		div.no-data-box{
			text-align: center;
		    margin-top: 50px;
		    color: #ADADAD;
		}
		div.scwrapper{
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
			display:block;		
		}
		
		div.order-menu-box  dl dd label.active{
			border-bottom:2px solid red;
			color:red;
		}
		
		div.order-list-box{
			position: absolute;
		    z-index: 1;
		    top: 45px;
		    bottom: 0px;
		    left: 0;
		    width: 100%;
		    background: #f3f3f3;
		    overflow: hidden
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
		
		#scroller {
		    position: absolute;
		    z-index: 1;
		    -webkit-tap-highlight-color: rgba(0,0,0,0);
		    width: 100%;
		    background: white;
		    overflow: hidden;
	    }
		
	</style>
	
	<script type="text/javascript">
		var myScroll;

		function loaded () {
			myScroll = new IScroll('#order-list-box', { 
				mouseWheel: false ,
				click: true ,
				probeType: 2
			});
			
			myScroll.on("scroll",function(){
				alert(1212);
			});
			
		}
		
		
		document.addEventListener('touchmove', function (e) { e.preventDefault(); }, isPassive() ? {
			capture: false,
			passive: false
		} : false);
		
		
		function isPassive() {
		    var supportsPassiveOption = false;
		    try {
		        addEventListener("test", null, Object.defineProperty({}, 'passive', {
		            get: function () {
		                supportsPassiveOption = true;
		            }
		        }));
		    } catch(e) {}
		    return supportsPassiveOption;
		}
		  	
	</script>
		
</head>
<body onload="loaded()">
	<div class="scwrapper">
		<div class="order-menu-box">
			<dl>
				<dd>
					<a href="${home }/mmall/order/order.do?op=list">
						<label <c:if test="${status ==null }">class="active"</c:if> >全部订单</label>
					</a>
				</dd>
				<dd>
					<a href="${home }/mmall/order/order.do?op=list&status=complete">
						<label <c:if test='${status eq "complete" }'>class="active"</c:if> >已完成</label>
					</a>
				</dd>
				<dd>
					<a href="${home }/mmall/order/order.do?op=list&status=uncomplete">
						<label <c:if test='${status eq "uncomplete" }'>class="active"</c:if> >未完成</label>
					</a>
				</dd>
			</dl>
			<div style="clear:both;"></div>
		</div>
		<c:if test="${!empty pair.first }">
		<div class="order-list-box" id="order-list-box">
			<div id="scroller">
			<ul>
				<c:forEach items="${pair.first }" var="data">
					<li>
						<a href="${home }/mmall/order/order.do?op=detail&bookId=${data.bookId}">
						<div class="order-status-box">
							<label>${data.statusLabel }</label>
							<label class="order-time">
								<fmt:formatDate value="${data.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</label>
							<i class="direction"></i>
						</div>
						<c:forEach items="${data.details }" var="detail">
						<div class="order-pro-box">
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
							<div style="clear:both;"></div>
						</div>
						</c:forEach>
						<div class="order-price-box">
							实际付款：￥<fmt:formatNumber value="${data.sales }" pattern="#,#00.00#"/>
							<c:if test="${data.status == 0 }">
								<a class="order-pay" href="">付款</a>
							</c:if>
						</div>
						<c:if test="${data.status == 4 }">
							<i class="order-status-image"></i>
						</c:if>
						</a>
					</li>
				</c:forEach>
				
				
				
				
				
				<c:forEach items="${pair.first }" var="data">
					<li>
						<a href="${home }/mmall/order/order.do?op=detail&bookId=${data.bookId}">
						<div class="order-status-box">
							<label>${data.statusLabel }</label>
							<label class="order-time">
								<fmt:formatDate value="${data.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</label>
							<i class="direction"></i>
						</div>
						<c:forEach items="${data.details }" var="detail">
						<div class="order-pro-box">
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
							<div style="clear:both;"></div>
						</div>
						</c:forEach>
						<div class="order-price-box">
							实际付款：￥<fmt:formatNumber value="${data.sales }" pattern="#,#00.00#"/>
							<c:if test="${data.status == 0 }">
								<a class="order-pay" href="">付款</a>
							</c:if>
						</div>
						<c:if test="${data.status == 4 }">
							<i class="order-status-image"></i>
						</c:if>
						</a>
					</li>
				</c:forEach>
				<c:forEach items="${pair.first }" var="data">
					<li>
						<a href="${home }/mmall/order/order.do?op=detail&bookId=${data.bookId}">
						<div class="order-status-box">
							<label>${data.statusLabel }</label>
							<label class="order-time">
								<fmt:formatDate value="${data.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</label>
							<i class="direction"></i>
						</div>
						<c:forEach items="${data.details }" var="detail">
						<div class="order-pro-box">
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
							<div style="clear:both;"></div>
						</div>
						</c:forEach>
						<div class="order-price-box">
							实际付款：￥<fmt:formatNumber value="${data.sales }" pattern="#,#00.00#"/>
							<c:if test="${data.status == 0 }">
								<a class="order-pay" href="">付款</a>
							</c:if>
						</div>
						<c:if test="${data.status == 4 }">
							<i class="order-status-image"></i>
						</c:if>
						</a>
					</li>
				</c:forEach>
				<c:forEach items="${pair.first }" var="data">
					<li>
						<a href="${home }/mmall/order/order.do?op=detail&bookId=${data.bookId}">
						<div class="order-status-box">
							<label>${data.statusLabel }</label>
							<label class="order-time">
								<fmt:formatDate value="${data.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</label>
							<i class="direction"></i>
						</div>
						<c:forEach items="${data.details }" var="detail">
						<div class="order-pro-box">
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
							<div style="clear:both;"></div>
						</div>
						</c:forEach>
						<div class="order-price-box">
							实际付款：￥<fmt:formatNumber value="${data.sales }" pattern="#,#00.00#"/>
							<c:if test="${data.status == 0 }">
								<a class="order-pay" href="">付款</a>
							</c:if>
						</div>
						<c:if test="${data.status == 4 }">
							<i class="order-status-image"></i>
						</c:if>
						</a>
					</li>
				</c:forEach>
				<c:forEach items="${pair.first }" var="data">
					<li>
						<a href="${home }/mmall/order/order.do?op=detail&bookId=${data.bookId}">
						<div class="order-status-box">
							<label>${data.statusLabel }</label>
							<label class="order-time">
								<fmt:formatDate value="${data.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</label>
							<i class="direction"></i>
						</div>
						<c:forEach items="${data.details }" var="detail">
						<div class="order-pro-box">
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
							<div style="clear:both;"></div>
						</div>
						</c:forEach>
						<div class="order-price-box">
							实际付款：￥<fmt:formatNumber value="${data.sales }" pattern="#,#00.00#"/>
							<c:if test="${data.status == 0 }">
								<a class="order-pay" href="">付款</a>
							</c:if>
						</div>
						<c:if test="${data.status == 4 }">
							<i class="order-status-image"></i>
						</c:if>
						</a>
					</li>
				</c:forEach>
				<c:forEach items="${pair.first }" var="data">
					<li>
						<a href="${home }/mmall/order/order.do?op=detail&bookId=${data.bookId}">
						<div class="order-status-box">
							<label>${data.statusLabel }</label>
							<label class="order-time">
								<fmt:formatDate value="${data.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</label>
							<i class="direction"></i>
						</div>
						<c:forEach items="${data.details }" var="detail">
						<div class="order-pro-box">
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
							<div style="clear:both;"></div>
						</div>
						</c:forEach>
						<div class="order-price-box">
							实际付款：￥<fmt:formatNumber value="${data.sales }" pattern="#,#00.00#"/>
							<c:if test="${data.status == 0 }">
								<a class="order-pay" href="">付款</a>
							</c:if>
						</div>
						<c:if test="${data.status == 4 }">
							<i class="order-status-image"></i>
						</c:if>
						</a>
					</li>
				</c:forEach>
			</ul>
			</div>
		</div>
		</c:if>
		<c:if test="${empty pair.first }">
			<div class="no-data-box">
				<h3>没有找到相关数据</h3>
			</div>
		</c:if>
	</div>
</body>
</html>
