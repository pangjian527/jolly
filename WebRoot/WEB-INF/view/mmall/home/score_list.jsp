<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>我的积分</title>
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${home}/script/jquery.js"></script>	
	<script type="text/javascript" src="${home}/script/mwebmall//haux.mobile.js"></script>
	<style type="text/css">
	
		div.scwrapper{
			position: relative;
		    min-width: 320px;
		    max-width: 640px;
		    margin:10px 0;
		}
		
		
		div.scwrapper ul li{
			  height: 50px;
			  background-color: white;
			  padding: 10px 10px;
			  font-size: 14px;
			  border-bottom: 1px solid #e4e4e4;
		}
		
		div.base-info{
			display: block;
  			color: #262629;
  			float: left;
		}
		div.base-info label{
			 font-size: 18px;
		}
		div.base-info span{
			display: block;
  			color: #999;
		}
		div.score{
			  float: right;
		}
		div.score span{
			  font-size: 25px;
			  color: #f23030;
		}
	</style>
	
	<script type="text/javascript">
	</script>
		
</head>
<body>
	<div class="scwrapper">
		<c:if test="${!empty queryResult.rows }">
			<ul>
				<c:forEach items="${queryResult.rows }" var="row">
					<li>
						<div class="base-info">
							<label class="factory-name">${factory.name }</label>
							<span class="achieve-time">
							<fmt:formatDate value="${row.create_time}" pattern="yyyy-MM-dd"/>
							${row.source}</span>
						</div>
						<div class="score">
							<span>${row.score}</span>
						</div>
					</li>
					
				
				</c:forEach>
			</ul>
		</c:if>
		<c:if test="${empty queryResult.rows }">
			<div class="no-data-box">
				<h3>没有找到相关数据</h3>
			</div>
		</c:if>
	</div>
</body>
</html>