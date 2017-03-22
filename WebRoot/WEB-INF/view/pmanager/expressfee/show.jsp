<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>商家信息</title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />

	<link rel="stylesheet" type="text/css"href="${home }/style/global.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/popbox.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/textarea2.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/manage.show.css" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.date.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dynamicform.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.popbox.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.textarea2.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.tab2.js"></script>
	<script type="text/javascript" src="${home}/script/jquery.ajaxfileupload.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.file.js"></script>
	<script type="text/javascript" src="${home}/script/manage.area.js"></script>
	<script type="text/javascript" src="${home}/kinder/kindeditor.js"></script>
	<script type="text/javascript" src="${home}/script/select2.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.select2.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.select2.js"></script>
	<style type="text/css">		
		ul.two_col li.detail_address select{
			width: 70px;
			margin-left:0
		}
		ul.two_col li.colspan_2 input[type='text'] {
		  width: 25%;
		}
		div.body_wrap div.box ul li select{
			
		}
		div.body_wrap div.box ul li textarea{
			width:83%;
		}
		ul.two_col li.colspan_2 div{
			margin-left:8%;
			margin-right:8%;
		}
		ul.two_col li.colspan_2 div input{
			width:30%;
		}
		
		div.box_title div{
			margin-left:8%;
			margin-right:8%;
		}
		div.box_title div textarea{
			width:100%;
			height:300px;
		}
		
		div.content ul{
			padding-left: 20px;
			padding-top: 10px;
		}
		div.content ul li {
			float: left;
			width: 200px;
			height: 30px;
			line-height: 30px;
		}
		div.content ul li input{
			vertical-align: middle;
		}
		#brands span{
			display:inline-block;
			margin:10px 20px 0 0;
			width:8em;
			overflow:hidden;
			white-space:nowrap;
			text-overflow:eclipse
		}
		#brands span input{
			position:relative;
			bottom:-3px
		}
		
	</style>
	<script type="text/javascript">
		function saveObject(){
			if(haux.dom.form.validate()){
				document.basic.submit();
			}
		}
		
	</script>		
	
</head>
<body >
	<div class="body_wrap">
		<form:form action="${home}/pmanager/expressfee/express_fee.do" modelAttribute="bean" 
			id="form" class="theme" name="basic" method="post">
			<input type="hidden" name="id" value="${bean.id}"/>
			<input type="hidden" name="op" value="save"/>
			<div class="tool_bar">
				<button type="button" onclick="history.back()" class="return">
					<i></i>
					返回
				</button>
				<c:if test="${readonly != true}">
				<button type="button" onclick="saveObject()" class="ok">
					<i></i>
					保存
				</button>
				</c:if>
				
			</div>
			<div id="content">
			<div class="box" style="position: relative;">
				<h3>
					基本信息
				</h3>
				<ul class="input two_col">
					<li class="mandatory">
						<label>
							邮费：
						</label>
						<form:input path="fee" cssClass="text form-input real required" min="0"/>
					</li>
					<li class="mandatory">
						<label>
							免邮费总额：
						</label>
						<form:input path="amountForFree" cssClass="text form-input real required" min="0"/>
					</li>
				</ul>
				<div class="clear"></div>
			</div>
			
			</div>
		</form:form>
		
	</div>
</body>
</html>
