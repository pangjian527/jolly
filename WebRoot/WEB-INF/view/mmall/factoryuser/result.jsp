<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>商家注册</title>
	<link rel="icon" href="${home}/favicon.ico" type="image/x-icon" />
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	<link href="${home}/style/m_dialog.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${home}/script/jquery.js"></script>	
	<script type="text/javascript" src="${home}/script/mwebmall/haux.mobile.js"></script>
	<script type="text/javascript" src="${home}/script/m_dialog.js"></script>
	<script type="text/javascript" src="${home}/script/mwebmall/manage.area.js"></script>

<style type="text/css">
	body{
		background-color:#f3f3f3;
	}
	div.scwrapper{
		position: relative;
	    min-width: 320px;
	    max-width: 640px;
	    margin: 0 auto;
	    background-color: #f3f3f3;
	    padding: 10px 0;
	}
	
	a.result{
		display: block;
	    width: 90%;
	    text-align: center;
	    background: #1AAD19;
	    margin: auto;
	    color: white;
	    padding: 10px 0px;
	    border-radius: 3px;
	    margin-top: 10px;
	}
	div.code-box{
		width: 90%;
	    margin: auto;
	    margin-top: 50px;
	}
	div.code-box img{
		width: 100%;
    	margin: auto;
	}
	p{
		font-size: 12px;
    	color: #ff7200;
    	text-align: center;
	}
	
</style>
<script type="text/javascript">

</script>
<jsp:include page="../initWeixin.jsp"/>
</head>
<body>
  	<div class="scwrapper">
  		<div class="code-box">
  			<img src="${home}/image/wx_jolly.jpg"/>
  			<p>您还未关注公众号，长按二维码关注公众号</p>
  		</div>
  		
  		<a class="result" href="${home }/mmall/product/product.do">返回首页</a>
  	</div>
</body>
</html>
