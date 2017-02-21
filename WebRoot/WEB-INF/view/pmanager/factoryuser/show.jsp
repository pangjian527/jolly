<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>店主账号</title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />

	<link rel="stylesheet" type="text/css"href="${home }/style/global.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/popbox.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/textarea2.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/select2.css" /> 
	
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dynamicform.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.popbox.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.textarea2.js"></script>
	<script type="text/javascript" src="${home}/script/select2.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.select2.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.select2.js"></script>

	<style type="text/css">		
		ul.two_col li.colspan_2 input[type='text'] {
			width: 50%;
		}
		p6 {
		color: red;
		}
	</style>
	<script type="text/javascript">
		
		haux.dom.addEventHandler(window, "load", function(){
			
			//$("#select-factory").select2();
			var srcPrefix = "/pmanager/factory/factory.do";
			var queryAjaxUrl = srcPrefix + "?op=queryForSelect";
			var getAjaxUrl = srcPrefix + "?op=get";
			var config = {targetElement : document.getElementsByName("factoryId")[0], 
					queryAjaxUrl : queryAjaxUrl,
					getAjaxUrl : getAjaxUrl,
					textProperty : ["name", "TITLE", "factoryName"], 
					inputPrompt : "请选择"
				};
				
			new haux.component.Select2(config);
			/* //3.创建动态表单
			var dynForm = new DynamicForm(jsonObj,"dynamicData");
			document.getElementById("dynamic").appendChild(dynForm.createElement());
			dynForm.finalize(); */
			
			<c:if test='${readonly == true}'>
			haux.dom.form.toView();
			</c:if>

		});
		
		
		function saveObject(){
			if(haux.dom.form.validate()){
				
				//扩展1.判断账号, 手机项是否有提示错误  有就不提交
				if(document.getElementById("accountMessage").innerHTML!=""){
					alert("请正确填写账号");
					return ;
				}
				if(document.getElementById("mobileMessage").innerHTML!=""){
					alert("请正确填写手机号码");
					return ;
				}
				
				//2.提交
				document.basic.submit();
			}
		}
		
		//校验账号模块
		function checkAccount() {
			//1.根据ID获取所输入的文本值
			var account = document.getElementById("account").value;
			//2.对当前账户进行校验 校验不通过返回  
			if(account.length<1){
				document.getElementById("accountMessage").innerHTML="账号长度不能为空";
				return;
			}
			//3.获取id
			var id = document.getElementById("id").value;
			//4.使用ajax异步提交 若action返回 账号已存在 获取文本框后面的元素 添加textNode 为"当前数据已存在"
			var postData = {account:account, id:id, op:"checkAccount"};
			$.ajax({
				type:"post",
				url:"${home}/pmanager/factoryuser/factory_user.do",
				data:postData,
				success:function(data){
					if(data.error){
						document.getElementById("accountMessage").innerHTML="当前账号已被注册";
					}else{
						document.getElementById("accountMessage").innerHTML="";
					}
				}
			});
		}
		//校验手机号码模块
		function checkMobile() {
			//1.根据ID获取所输入的文本值
			var mobile = document.getElementById("mobile").value;
			//2.对当前手机进行校验 校验不通过返回 
			if(!/^[13|15|18]{2}[0-9]{9}$/g.test(mobile)){
				document.getElementById("mobileMessage").innerHTML="当前手机号码输入有误 ,请重新输入";
				return;
			}
			//3.获取id
			var id = document.getElementById("id").value;
			//4.使用ajax异步提交 若action返回手机号码已存在 获取文本框后面的元素 添加textNode 为"当前数据已存在"
			var postData = {mobile:mobile, id:id, op:"checkMobile"};
			$.ajax({
				type:"post",
				url:"${home}/pmanager/factoryuser/factory_user.do",
				data:postData,
				success:function(data){
					if(data.error){
						document.getElementById("mobileMessage").innerHTML="当前手机号码已被注册";
					}else{
						document.getElementById("mobileMessage").innerHTML="";
					}
				}
			});
		}
		
	</script>		
	
</head>
<body >
	<div class="body_wrap">
		<form:form action="${home}/pmanager/factoryuser/factory_user.do" modelAttribute="bean" 
			id="form" class="theme" name="basic" method="post">
			<input type="hidden" name="id" value="${bean.id}" id="id" />
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
				<ul class="input two_col">
					<li class="mandatory colspan_2">
						<label>商家：</label>
						
						<form:input path="factoryId" cssClass="required text" style="width:250px;"/>
					</li>
					
					
					<li class="mandatory colspan_2">
						<label>账号：</label>
						<form:input path="account" onblur="checkAccount();" id="account" cssClass="text required form-input" disabled="true"/>
						<p6 id="accountMessage" ></p6>
					</li>
					<li class="mandatory colspan_2">
						<label>密码：</label>
						<form:input path="pwd" cssClass="text required form-input"/>
					</li>
					<li class="mandatory colspan_2">
						<label>手机号码：</label>
						<form:input path="mobile" id="mobile" onblur="checkMobile()" cssClass="text required form-input" disabled="true"/>
						<p6 id="mobileMessage" ></p6>
					</li>
					
					<li class="colspan_2">
						<label>简介：</label>
						<form:textarea path="remark" rows="5" cols="20"/>
					</li>
					
				</ul>
				<div class="clear"></div>
			</div>
			
		</form:form>
	</div>
</body>
</html>