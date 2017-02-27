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
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	
	<style type="text/css">
	
		div.scwrapper{
			position: relative;
		    min-width: 320px;
		    max-width: 640px;
		    margin: 0 auto;
		    background-color: #f3f3f3;
		}
		
		div.product-wrapper{
			margin-top:10px;
		}
		
		div.product-wrapper ul li{
			height:150px;
			background-color:white;
			padding:10px 10px;
			font-size:14px;
			border-bottom: 2px dashed #e4e4e4;
		}
		
		div.product-wrapper ul li div.pro-img img{
			height:130px;
			width:130px;
			float:left;
		}
		
		div.product-wrapper ul li div.pro-info-box{
				float:left;
				width:calc(100% - 150px);
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
			//height: 35px;
    		//line-height: 35px;
		}
		div.pro-price label.price{
			color:red;
			font-size:22px;
		}
		div.pro-price label.price_mart{
			font-size:16px;
			text-decoration:line-through;
		}
		div.pro-sale{
			height:30px;
			line-height:30px;
		}
	</style>
	
	<script type="text/javascript">
		
	</script>
		
</head>
<body>
	<div class="scwrapper">
		<div class="slider-wrapper">
			<ul>
				<li>
					<img width="100%" src="${home}/image/234.jpg"/>
				</li>
			</ul>
		</div>
		<div class="product-wrapper">
			<ul>
				<c:forEach items="${lists }" var="product">
						<li>
							<a href="${home }/mmall/product/product.do?op=viewDetail&productId=${product.id}">
								<div class="pro-img">
									<img src="${home}/img-${product.firstPhotoId}.do">	
								</div>
								<div class="pro-info-box">
									<div class="pro-info-title">${product.name }</div>
									<div class="pro-price">
										<c:if test="${islogin == false}">
										<b>批发价:</b><label class="price">？？</label>
										</c:if>
										<c:if test="${islogin == true}">
										<b>批发价:</b><label class="price">￥${product.price }</label>&nbsp;&nbsp;
										</c:if>
										</br>
										市场价:<label class="price_mart">￥${product.priceMart }</label>
									</div>
									<div class="pro-sale">
										销量：${product.salesScount }件
									</div>
								</div>
							</a>
						</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>

<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"> </script>
<script type="text/javascript">
wx.config({
    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    appId: '${appId}', // 必填，公众号的唯一标识
    timestamp: '${timeStamp}', // 必填，生成签名的时间戳
    nonceStr: '${nonceStr}', // 必填，生成签名的随机串
    signature: '${signature}',//
    jsApiList: [
    	"checkJsApi",
    	"onMenuShareTimeline",
    	"onMenuShareAppMessage",
    	"onMenuShareQQ",
    	"onMenuShareWeibo",
    	"onMenuShareQZone","getLocation"
    ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});
wx.error(function(res){
	//alert(res.errMsg);
	//alert(location.href.split('#')[0]);
});
var imUrl=window.location.href;

wx.ready(function(){
	wx.checkJsApi({
	    jsApiList: ['onMenuShareTimeline',
	    			'onMenuShareAppMessage',
	    			'onMenuShareQQ',
	    			'onMenuShareWeibo',
	    			'onMenuShareQZone'], //
	    success: function(res) {
	       if(res.errMsg=='checkJsApi:ok'&&!res.checkResult.onMenuShareTimeline){
	        	alert("当前微信版本不支持分享");
	       }
	    }
	});
	 // 监听“分享朋友圈”
	   wx.onMenuShareTimeline({
		    title: '倬利商城', // 分享标题
		    link: imUrl, // 分享链接
		    imgUrl: '${home}/image/234.jpg', // 分享图标
		    success: function () {
		        // 用户确认分享后执行的回调函数
		    },
		    cancel: function () {
		        // 用户取消分享后执行的回调函数
		    }
		});
		// 监听“分享给朋友”
	    wx.onMenuShareAppMessage({
	     	title: '倬利商城', // 分享标题
		    desc: '分享内容',//分享内容
		    link: imUrl, // 分享链接
		    imgUrl: '${home}/image/234.jpg', // 分享图标
	      trigger: function (res) {
	      },
	      success: function (res) {
	      },
	      cancel: function (res) {
	      },
	      fail: function (res) {
	      }
	    });
});
</script>
</html>
