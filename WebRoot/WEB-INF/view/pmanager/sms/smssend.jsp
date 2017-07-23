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
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	
	<style type="text/css">		
			div.sms_warp{
				width:500px;
				margin:auto;
				border:1px solid #e4e4e4;
				padding: 10px;
				margin-top: 50px;
			}
			h1{
				border-bottom: 1px solid #e4e4e4;
			}
			div.template_warp{
				height: 50px;
    			line-height: 50px;
			}
			div.template_warp input{
				width: 300px;
    			height: 30px;
			}
			a{
				display: block;
			    width: 130px;
			    height: 35px;
			    line-height: 35px;
			    text-align: center;
			    text-decoration: initial;
			    margin-left: 64px;
			    background-color: red;
			    color: white;
			    font-weight: bold;
			}
			a:hover{
				COLOR:white;
			}
	</style>
	<script type="text/javascript">
		function saveObject(){
		
			var mobiles = document.getElementById("mobiles").value;
			var templateId = document.getElementById("templateId").value;
		
			if(mobiles=="" ||templateId ==""){
				alert("电话号码和模板ID都不能为空");
				return;
			}
			if(confirm("确定发送短信吗？")){
				$.ajax({
					type:"post",
					url:"${home}/pmanager/sms/sms.do?op=sendSms",
					data:{templateId:templateId,mobiles:mobiles},
					success:function(data){
						if(data.error){
							alert(data.error);
						}else{
							alert("发送成功");
							document.getElementById("mobiles").value= "";
							document.getElementById("templateId").value= "";
						}
					}
				});
			}
		}
	</script>		
	
</head>
<body >
	<div class="body_wrap">
		<div class="sms_warp">
			<h1>短信发送</h1>
			<div class="template_warp">
				<label>模&nbsp;板&nbsp;ID：&nbsp;</label>
				<input name="templateId" placeholder="对应网易的模板ID" id="templateId"/>
			</div>
			<div>
				<label>手机号码：</label>
				<textarea name="mobiles" id="mobiles" rows="10" cols="40" placeholder="多个号码请用英文的',拼接"></textarea>
			</div>
			
			<a href="javascript:saveObject()">发送</a>
		</div>
	</div>
</body>
</html>
