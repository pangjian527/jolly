<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="format-detection" content="telephone=no" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>防伪码查询</title>
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	
	<style type="text/css">
	
		body{
			background-color: #f3f3f3;
		}	
		div.scwrapper{
			position: relative;
		    min-width: 320px;
		    max-width: 640px;
		    margin: 0 auto;
		    background-color: #f3f3f3;
		}
		
		div.tip-box{
			margin:10px 0;
			background:white;
			position: relative;
			height:50px;
			padding:20px 0;
		}
		div.tip-box i.icon{
			position: absolute;
			left:10px;
			top:20px;
			background-image: url("${home}/image/notice.png");		
			height: 25px;
		    width: 25px;
		    background-position: 10px;
		}
		div.tip-box label{
			position: absolute;
			left:40px;
			font-size:16px;
			line-height: 22px;
			right:15px;
			color:gray;
		}
		
		div.secutiry-box{
			background:white;
			text-align: center;
			padding-top: 30px;
		}
		
		div.secutiry-box input{
			width: 90%;
		    border: 0;
		    border-bottom: 1px dashed #e4e4e4;
		    height: 60px;
		    font-size:22px;
		    text-indent: 10px;
		    letter-spacing: 2px;
		    border-radius:0;
		    font-weight: bold;
		}
		
		div.secutiry-box a{
			display: inline-block;
		    height: 35px;
		    line-height: 35px;
		    width: 120px;
		    text-align: center;
		    margin: 20px 0;
		    background: #e4393c;
		    border-radius:5px;
		    margin-left: 10px;
		    font-family: "Microsoft YaHei";
		    font-size: 14px;
		    color: #fff;
		    border: 1px solid #e4393c;
		}
		div.secutiry-box a.scan{
			color: #e4393c;
		    background: white;
		}
		
	</style>
	
	<script type="text/javascript">
		
		function secutiryValid(){
			var securityCode = document.getElementById("securityCode").value;
			window.location.href = "${home}/mmall/home/index.do?op=securityDetail&securityCode="+securityCode;
		}
		function scanCode(){
			wx.scanQRCode({
			    needResult: 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
			    scanType: ["qrCode","barCode"], // 可以指定扫二维码还是一维码，默认二者都有
			    success: function (res) {
			    if(res){ // 扫码返回的结果
				    document.getElementById("securityCode").value=res.resultStr;
			    }else{
			    	dialogAlert("温馨提示", "扫描失败，请稍候再试");
			    }
			}
			});
		}
		
	</script>
		
</head>
<body>
	<div class="scwrapper">
			<div class="tip-box">
				<i class="icon"></i>
				<label>注：根据防伪码查询后电池不可退，请确认使用再查询。</label>
				<div style="clear:both;"></div>
			</div>
			<div class="secutiry-box">
				<input type="text" id="securityCode" placeholder="请扫描防伪码" />
				<a class="scan" href="javascript:secutiryValid()">查询</a>
				<a  href="javascript:scanCode()">扫码</a>
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
    	"scanQRCode"
    ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});
wx.error(function(res){
	//alert(res.errMsg);
	//alert(location.href.split('#')[0]);
});

wx.ready(function(){
	wx.checkJsApi({
	    jsApiList: ['scanQRCode'], //
	    success: function(res) {
	       if(res.errMsg=='checkJsApi:ok'&&!res.checkResult.scanQRCode){
	        	alert("当前微信版本不支持扫一扫功能");
	       }
	    }
	});
});
</script>
</html>