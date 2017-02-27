<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>立即付款</title>
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${home}/script/jquery.js"></script>	
	<script type="text/javascript" src="${home}/script/mwebmall/haux.mobile.js"></script>
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
	//生成LogPayment 记录
	function payNow(){
		var openId='${openId}';
		if(openId){
			haux.getData({url:home()+'/mmall/order/order.do?op=preparePay',
				data:{orderId:'${bookform.id }',openId:'${openId }'},
				success:function(data){
					if(data.error){
						dialogAlert("温馨提示", data.error)
						return;
					}
					wx.chooseWXPay({
					    timestamp: data.timeStamp, // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
					    nonceStr: data.nonceStr, // 支付签名随机串，不长于 32 位
					    package: data.packageValue, // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
					    signType: data.signType, // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
					    paySign: data.paySign, // 支付签名
					    success: function (res) {
					        window.location.href=home()+"/mmall/order/order.do?op=list";
					    },
					    fail:function (res){
					    	dialogAlert("温馨提示", res.errMsg);
					    },
					    cancel:function (){
					    }
					});
				}
			});
		}else{
			dialogAlert("温馨提示", "支付出错，请稍候再试！")
		}
	}
	
	</script>
		
</head>
<body>
	<div class="scwrapper">
		<div class="result-box">
			<label>提交成功</label>
		</div>
		<div class="order-info-box">
			<label>订单号：${bookform.code }</label>
		</div>
		<c:if test="${bookform.status == 0 }">
			<a class="pay" href="javascript:payNow()">立即付款</a>
		</c:if>
		<c:if test="${bookform.status != 0 }">
			<a class="pay" href="${home }/mmall/product/product.do">返回首页</a>
		</c:if>
	</div>
</body>

<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"> </script>
<script type="text/javascript">

wx.config({
    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    appId: '${appId}', // 必填，公众号的唯一标识
    timestamp: '${timeStamp}', // 必填，生成签名的时间戳
    nonceStr: '${nonceStr}', // 必填，生成签名的随机串
    signature: '${signature}',// 必填，签名，见附录1
    jsApiList: [
    	"checkJsApi",
    	"chooseWXPay"
    ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});
wx.error(function(res){
	//alert(res.errMsg);
	//alert(location.href.split('#')[0]);
});
wx.ready(function(){
	wx.checkJsApi({
	    jsApiList: ['chooseWXPay'], // 需要检测的JS接口列表，所有JS接口列表见附录2,
	    success: function(res) {
	       if(res.errMsg=='checkJsApi:ok'&&!res.checkResult.chooseWXPay){
	        	alert("当前微信版本不支持支付");
	       }
	    }
	});
});
</script>
</html>