<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="funcs" uri="app://pub.functions" %>
<% pageContext.setAttribute("newLineChar", "\r\n"); %>
<html>
<head>
	<title>操作结果</title>
	<link rel="stylesheet" type="text/css" href="${home}/style/global.css"/>
	<script type="text/javascript" src="${home}/script/jquery.js"></script>
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/site.js"></script>
	<style type="text/css">
		body{
			background:#f7f7f7
		}
		#content{
			width: 50%;
			position: absolute;
			position:relative;
			margin:100px auto 0;
			background:white;
			border:1px solid #ccc;
			box-shadow:0 0 10px #ccc
		}
		body.pop-dialog{
			background:white;
		}
		body.pop-dialog #content{
			margin:20px auto;
			width:80%;
			border-color:white;
			box-shadow:none
		}
		#content s{
			position: absolute;
			width: 34px;
			height: 34px;
			left: 15px;
			top: 14px;
			background: url(../image/p_msg_bg4.png) 0 -77px no-repeat;
		}
		#content h4{
			margin:20px 30px 10px 60px;
			font:16px 微软雅黑
		}
		#content div.operate{
			margin:15px 30px 10px 60px;
			text-align:left
		}
		.center-box{
			box-shadow:0 0 10px #efefef;
			border:1px solid #ccc;
		}
	</style>
	<script>
	haux.dom.addEventHandler(window, "load", function(){
		if(GLOBAL.windowPos != "iframe-pop"){
			//in dialog small window	
			document.getElementById("close").style.display = "none";
		}
		else{
			//in normal large window
			document.body.className = "pop-dialog";
			document.getElementById("ok").style.display = "none";
		}
	});
	function get(){
		
	}
		
	</script>
</head>
<body>
	<div id="content">
		<s></s>
		<h4>${funcs:textToHtml(message)}</h4>
		<p></p>
		<div class="operate">
			<c:if test="${not empty nextUrl}">
			<c:set var="url" value="${fn:startsWith(nextUrl, 'http:')? '': home}${nextUrl}"/>
			<button type="button" id="ok" class="ok" onclick="returnUrl('${url}');">
				<i></i>
				确定
			</button>
			</c:if>
			<button type="button" id="close" class="cancel" onclick="closeActiveDialog()">
				<i></i>
				关闭
			</button>
			
		</div>
	</div>
</body>
</html>
