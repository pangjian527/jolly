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
	<link href="${home}/style/m_dialog.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${home}/script/jquery.js"></script>	
	<script type="text/javascript" src="${home}/script/mwebmall/haux.mobile.js"></script>
	<script type="text/javascript" src="${home}/script/m_dialog.js"></script>
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
		haux.getData({url:home()+'/mmall/order/order.do?op=preparePay',
			data:{orderId:'${bookform.id }'},
			success:function(data){
				if(data.error){
					dialogAlert("温馨提示", data.error)
					return;
				}
				wxPay(data.timeStamp,data.nonceStr,data.packageValue,data.signType,data.paySign,
						function(){
					 		window.location.href=home()+"/mmall/order/order.do?op=list";
						},function(res){
							dialogAlert("温馨提示", res.errMsg);
						});
			}
		});
	}
	
	</script>
	<jsp:include page="../initWeixin.jsp"/>		
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

</html>