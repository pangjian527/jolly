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
	<title>防伪码详情</title>
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
		div.sec-info-box {
			color: #232326;
   			font-size: 14px;
   			background: white;
   			margin: 10px 0;
   			padding: 10px 0;
		}
		div.sec-info-box dl dt{
			 width: 80px;
		    float: left;
		    clear: both;
		    text-align: right;
		    margin: 3px 0;
		}
		div.sec-info-box dl dd{
			width:calc(100%  - 90px);
			float:left;
			margin:3px 0;
		}
		h2.title{
			margin:0;
			padding:0;
			border-bottom:1px solid #e4e4e4;
			margin-left:10px;
		}
		
		div.sec-status-box{
			font-size: 14px;
   			background: white;
   			margin: 10px 0;
   			padding: 10px 0;
   			color: #232326;
		}
		
		div.sec-status-line-box {
			border-left:1px solid #d9d9d9;        
			margin: 20px 15px;
        }
        
        div.sec-status-line-box  ul li{
        	padding: 5px 15px;
        	position: relative;
        }
        
         div.sec-status-line-box  ul li i{
        	position: absolute;
		    border: 1px solid red;
		    height: 5px;
		    width: 5px;
		    top: 10px;
		    left: -4px;
		    background: red;
		    border-radius: 10px;
		    box-shadow: 0px 0px 17px red;
        }
        label.no_use{
        	color: green;
    		font-weight: bold;
        }
        
        label.use{
        	color: green;
    		font-weight: bold;
        }
		
	</style>
	
	<script type="text/javascript">
		
	</script>
		
</head>
<body>
	<div class="scwrapper">
		<c:if test="${!empty product }">
			<div class="sec-info-box">
					<h2 class="title">商品信息</h2>
					<dl>
						<dt>商品名称：</dt>
						<dd>${product.name }</dd>
						<dt>电池容量：</dt>
						<dd>${product.capacity }</dd>
						<dt>电池型号：</dt>
						<dd>${product.model }</dd>
						<dt>适用品牌：</dt>
						<dd>${product.applyBrand }</dd>
						<dt>适用机型：</dt>
						<dd>${product.applyPhoneType }</dd>
						<dt>使用次数：</dt>
						<dd>
							<c:if test="${countUsageQuery <=0 }"><label class="no_use">首次查询，未使用</label></c:if> 
							<c:if test="${countUsageQuery >0 }"><label class="use">警告该电池已经使用</label></c:if> 
						</dd>
					</dl>
					<div style="clear:both;"></div>
			</div>
			<div class="sec-status-box">
					<h2 class="title">商品状态</h2>
					<div class="sec-status-line-box">
						<ul>
							<c:forEach items="${listResult }" var="item" >
	             			<li>
	             				<i></i>
	             				<label>${item.second }</label>
	             			</li>
	             			</c:forEach>
	             			<li>
	             				<i></i>
	             				<label>生产</label>
	             			</li>
						</ul>
					</div>
			</div>
		</c:if>
		<c:if test="${empty product }">
			<div class="no-data-box">
				<h3>没有找到相关数据</h3>
			</div>
		</c:if>
	</div>
</body>
</html>