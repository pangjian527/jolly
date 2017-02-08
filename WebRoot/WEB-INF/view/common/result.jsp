<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="funcs" uri="app://pub.functions" %>
<% pageContext.setAttribute("newLineChar", "\r\n"); %>
<html>
<head>
	<title>操作结果</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<link rel="stylesheet" type="text/css" href="${home}/style/site.css"/>
	<script type="text/javascript" src="${home}/script/jquery.js"></script>
	<script type="text/javascript" src="${home}/script/site.js"></script>
	<style type="text/css">
		#message {
		<c:if test="${isError}"> background-color: #ffccff;
		</c:if> margin: auto; /*background-color: yellow;*/
		<c:if test="${fn:length(message) > 256}"> font-family: monospace;
			font-size: 9pt;
		</c:if> word-break: break-word; /*height: 1%;*/
		}
		div.op {
			text-align: center;
		}

		#message p {
			margin: 0;
		}
	</style>
</head>
<body>
<table border="0" align="center" height="60%">
	<tr>
		<td valign="bottom">			
			<c:if test="${not empty message}">
				<div id="message">
						${funcs:textToHtml(message)}
				</div>
			</c:if>
		</td>
	<tr>
		<td height="50%" valign="top" style="padding-top:0.6em;" align="center">
			<c:if test="${isError}">
				<input type="button" value="重试" onclick="history.back()"/>
			</c:if>
			<c:if test="${not empty nextUrl}">
				<c:set var="url" value="${fn:startsWith(nextUrl, 'http:')? '': home}${nextUrl}"/>
				<input type="submit" value="确定" onclick="returnUrl('${url}');"/>
			</c:if>
		</td>
	</tr>
</table>
</body>
</html>
