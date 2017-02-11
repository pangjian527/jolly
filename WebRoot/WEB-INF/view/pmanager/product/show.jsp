<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>添加商品</title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />

	<link rel="stylesheet" type="text/css"href="${home }/style/global.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/popbox.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/textarea2.css" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	
	<style type="text/css">
		ul.three_col li.detail_address select{
			width: 70px;
			margin-left:0
		}
		ul.three_col li.detail_address input{
			width:57%;
		}
		
		div.body_wrap div.box ul li select{
			
		}
		div.body_wrap div.box ul li textarea{
			width:83%;
		}
		p6 {
			color:red
		}
		.roles{
			border:1px solid #ccc
		}
		.roles dt{
			background: none;
			border: 0;
			height: auto;
			line-height: normal;
			text-indent: 10px;
			margin: 10px 0 5px 0;
			color: #005CAA;
			font-size: 14px;
			font-family: 微软雅黑,arial;
		}
		.roles dd{
		  display: inline-block;
		  margin: 0 0 5px 10px;
		  width: 100px;
		  overflow: hidden;
		  text-overflow: ellipsis;
		  white-space: nowrap;
		}
	</style>
	<script type="text/javascript">
		function saveObject(){
			if(haux.dom.form.validate()){
				document.forms[0].submit();;
			}
		}
	</script>		
	
</head>
<body>
	<div class="tool_bar">
		<button type="button" onclick="history.back()" class="return">
			<i></i>
			返回
		</button>
		<button type="button" onclick="saveObject()" class="ok">
			<i></i>
			保存
		</button>
	</div>
	<div class="body_wrap">
		<form:form action="${home}/pmanager/product/product.do?op=save" modelAttribute="bean" 
			id="form" class="theme" name="basic" method="post">
			<input type="hidden" name="id" id="id" value="${bean.id}"/>
			<div class="box">
				<h3>
					基本信息
				</h3>
				<ul class="input two_col">
					<li class="mandatory">
						<label>商品名称：</label>
						<form:input path="name" cssClass="text required form-input"/>
						<p6 id="nameMessage"></p6>
					</li>
					<li class="mandatory">
						<label>虚拟销量：</label>
						<form:input path="virtualCount" cssClass="text required form-input" class="required" />
					</li>
					<li class="mandatory">
						<label>批发价：</label>
						<form:input path="price" cssClass="text required form-input" id="price"/>
					</li>
					<li class="mandatory">
						<label>市场价格：</label>
						<form:input path="priceMart" cssClass="text required form-input"/>
					</li>
					<li class="mandatory">
						<label>电池型号：</label>
						<form:input path="model" cssClass="text required form-input" class="required" />
					</li>
					<li class="mandatory">
						<label>电池属性：</label>
						<form:input path="coreType" cssClass="text required form-input" class="required" />
					</li>
					
					<li class="mandatory">
						<label>容量：</label>
						<form:input path="capacity" cssClass="text required form-input" class="required" />
					</li>
					<li class="mandatory">
						<label>适用品牌：</label>
						<form:input path="applyBrand" cssClass="text required form-input" class="required" />
					</li>
					<li class="mandatory">
						<label>适用机型：</label>
						<form:input path="applyPhoneType" cssClass="text required form-input" class="required" />
					</li>
					
					<li class="mandatory">
						<label>执行标准：</label>
						<form:input path="executeNormal" cssClass="text required form-input" class="required" />
					</li>
					<li class="mandatory">
						<label>标准电压：</label>
						<form:input path="normalVoltage" cssClass="text required form-input" class="required" />
					</li>
					
					<li class="mandatory">
						<label>充电电压：</label>
						<form:input path="chargeVoltage" cssClass="text required form-input" class="required" />
					</li>
					<li class="mandatory">
						<label>是否环保：</label>
						<form:input path="environment" cssClass="text required form-input" class="required" />
					</li>
					
					
					<li class="mandatory">
						<label>快充功能：</label>
						<form:input path="quickCharge" cssClass="text required form-input" class="required" />
					</li>
				</ul>
				<div class="clear"></div>
			</div>
			
		</form:form>
	</div>
</body>
</html>
