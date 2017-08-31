<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>汽配品牌</title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />

	<link rel="stylesheet" type="text/css"href="${home }/style/global.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/popbox.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/textarea2.css" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.date.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dynamicform.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.popbox.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.textarea2.js"></script>
	<script type="text/javascript" src="${home}/script/jquery.ajaxfileupload.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.file.js"></script>
	
	<script type="text/javascript" src="${home}/ueditor/ueditor.config.js"></script>  
	<script type="text/javascript" src="${home}/ueditor/ueditor.all.js"></script> 
	<script type="text/javascript" src="${home}/ueditor/lang/zh-cn/zh-cn.js"></script> 
	<style type="text/css">
		div.body_wrap div.box ul li{
			clear:both;
			width:80%;
		}
		div.logo-photo{
			display: inline-block;
			background: none;
			position: relative;
			left: -10px;
			top: -5px;
		}
		ul li div.productBrand{
			margin-left:203px;
		}
		ul.three_col li input,ul.three_col li textarea{
			width:610px;
		}
		ul.three_col li input.seq{
			width:450px;
		}
	</style>
	<script type="text/javascript">
		haux.dom.addEventHandler(window, "load", function(){
			var hiddenElement = document.getElementById("attachments");
			var fileObj = new haux.component.File({display : "big-icon",
				hiddenElement : hiddenElement,
				containerElement : hiddenElement.parentNode,
				fileElement : document.getElementsByName("uploadFile")[0],
				maxCount : 1, 
				fileType : "image", 
				maxFileSize : 5*1024
			});
		});
		function saveObject(){
			if(haux.dom.form.validate()){
				document.basic.submit();
			}
		}
	</script>		
	
</head>
<body >
	<div class="body_wrap">
		<form:form action="${home}/pmanager/productbrand/product_brand.do" modelAttribute="bean" 
			id="form" class="theme" name="basic" method="post">
			<input type="hidden" name="id" value="${bean.id }" />
			<input type="hidden" name="op" value="save" />
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
			<div class="box" style="position: relative;">
				<h3>
					基本信息
				</h3>
				<ul class="input three_col">
					<li class="mandatory">
						<label>名称：</label>
						
						<form:input path="name" cssClass="text required "/>
					</li>
					
					<li class="mandatory">
						<label>品类：</label>
						<select name="category">
							<option <c:if test="${'MOBILE_BATTERY' == bean.category }">selected</c:if> value="MOBILE_BATTERY">手机电池</option>
							<option <c:if test="${'MOBILE_SCREEN' == bean.category }">selected</c:if> value="MOBILE_SCREEN">屏幕总成</option>
							<option <c:if test="${'OTHER' == bean.category }">selected</c:if> value="OTHER">其他</option>
						</select>
					</li>
					
					<li class="mandatory">
						<label>备注：</label>
						<form:textarea path="remark" cols="20" rows="5"></form:textarea>
					</li>
					
					<li class="">
						<label>排序：</label>
						<form:input path="seq"  cssClass="text seq"/>
						(数字越小，越靠前排)
					</li>
					<li>
						<div class=" productBrand">
							<h3>品牌介绍</h3>
						</div>
					</li>
					<li class="mandatory">
						<label>logo：</label>
						<div class="logo-photo">
							<input type="hidden" name="attachmentIds" id="attachments" value="${attachmentIds}"/>
						</div>
					</li>
				</ul>
				<div class="clear"></div>
			</div>
		</form:form>
	</div>
</body>
</html>
