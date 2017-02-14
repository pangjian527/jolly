<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>防伪码查询</title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${home}/style/data_list_style.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/style.css" />
	
	<style type="text/css">
		 div.m_data_panel table tbody td{
            padding:5px 0;
        }

        div.security_code{
            height:80px;
            line-height:80px;
        }

        div.security_code input{
            height: 50px;
            width: 500px;
            font-size: 18px;
            text-indent: 10px;

        }
        div.security_code button{
            width: 90px;
            height: 55px;
            border: 0;
            background: red;
            font-size: 18px;
            color: white;
            font-weight: bold;
        }
	</style>
	<script type="text/javascript">
		function queryObject(){
			var securityCode = document.getElementById('securityCode').value;
			window.location.href = "${home}/pmanager/product/product.do?op=securityInfo&securityCode="+securityCode;			
		}
	</script>		
	
</head>
<body>
	<div class="m_data_panel" style="width:600px;margin:auto;">
        <div class="security_code">
            <input value="${securityCode}" id="securityCode" name="securityCode" placeholder="请输入防伪码"/>
            <button  onclick="queryObject()">查询</button>
        </div>
        <c:if test="${product != null}">
	        <table cellpadding="0" cellspacing="0">
	            <thead>
	                <tr>
	                    <td width="100">属性</td>
	                    <td>信息</td>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>商品名称</td>
	                    <td>${product.name }</td>
	                </tr>
	                <tr>
	                    <td>电池型号</td>
	                    <td>${product.model }</td>
	                </tr>
	                <tr>
	                    <td>适用品牌</td>
	                    <td>${product.applyBrand }</td>
	                </tr>
	                <tr>
	                    <td>适用机型</td>
	                    <td>${product.applyPhoneType }</td>
	                </tr>
	                <tr>
	                    <td>入库时间</td>
	                    <td>2017-01-10 10:00:33</td>
	                </tr>
	                <tr>
	                    <td>出库时间</td>
	                    <td>2017-01-10 10:00:33</td>
	                </tr>
	                <tr>
	                    <td>所属商家</td>
	                    <td>xxxxxx维修店</td>
	                </tr>
	                <tr>
	                    <td>订单号</td>
	                    <td>2016010213652</td>
	                </tr>
	                <tr>
	                    <td>查询次数</td>
	                    <td>0</td>
	                </tr>
	            </tbody>
	        </table>
        </c:if>
    </div>
</body>
</html>
