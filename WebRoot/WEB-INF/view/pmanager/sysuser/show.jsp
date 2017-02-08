<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>商城管理用户</title>
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
	
		haux.dom.addEventHandler(window, "load", function(){
			<c:if test="${not empty userRoles}">
			var roleIds = [];
			<c:forEach items="${userRoles}" var="role">
			roleIds.push("${role.id}");
			</c:forEach>
			var checkboxElements = document.getElementsByName("roleId");
			for(var i = 0, len = checkboxElements.length; i < len; i++){
				var checkboxElement = checkboxElements[i];
				checkboxElement.checked = roleIds.contain(checkboxElement.value);
			}
			</c:if>
		});
		
		function saveObject(){
			if(haux.dom.form.validate()){
				document.forms[0].submit();;
			}
		}
		
		
		//电话校验模块
		function checkTelNo() {
			//1.根据ID获取所输入的文本值
			var telNo = document.getElementById("telNo").value;
			//2.对当前手机进行校验 校验不通过返回  
			if(!/^[13|15|18]{2}[0-9]{9}$/g.test(telNo)){
				document.getElementById("telNoMessage").innerHTML="当前手机号码输入有误 ";
				return;
			}
			//3.获取本表单id 值
			var id = document.getElementById("id").value;
			//4.使用ajax异步提交 若action返回手机号码已存在 获取文本框后面的元素 添加textNode 为"当前数据已存在"
			var postData = {telNo:telNo,id:id, op:"checkTelNo"};
			$.ajax({
				type:"post",
				url:"${home}/pmanager/sysuser/sys_user.do",
				data:postData,
				success:function(data){
					if(data.error){
						document.getElementById("telNoMessage").innerHTML="当前手机号码已被注册";
					}else{
						document.getElementById("telNoMessage").innerHTML="";
					}
				}
			});
		}
		
		//账号校验模块
		function checkCode() {
			//1.根据ID获取所输入的文本值
			var code = document.getElementById("code").value;
			//2.对当前账户 进行校验 校验不通过返回 
			if(code.length<1){
				document.getElementById("codeMessage").innerHTML="账号不能为空";
				return;
			}
			//3.获取本表单id 值
			var id = document.getElementById("id").value;
			//4.使用ajax异步提交 若action返回账号已存在 获取文本框后面的元素 添加textNode 为"当前数据已存在"
			var postData = {code:code,id:id, op:"checkCode"};
			$.ajax({
				type:"post",
				url:"${home}/pmanager/sysuser/sys_user.do",
				data:postData,
				success:function(data){
					if(data.error){
						document.getElementById("codeMessage").innerHTML="当前账号已被注册";
					}else{
						document.getElementById("codeMessage").innerHTML="";
					}
				}
			});
		}
		
		function checkName(){
			var n=$("#name").val();//alert(n.length);
			if(n.length<1){
				document.getElementById("nameMessage").innerHTML="名称不能为空";
				$("#name").focus();
				return;
			}
			   
			var str = $("#name").val();
			var cArr = str.match(/[^\x00-\xff]/ig); 
			var len=str.length + (cArr == null ? 0 : cArr.length); 
			//alert(len);
			if(len>20){
				alert("红包名称长度只能包含10中文个字符或20个英文/数字");
				$("#name").focus();
				return;
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
		
		<c:if test='${readonly != true}'>				
		<button type="button" onclick="saveObject()" class="ok">
			<i></i>
			保存
		</button>
		</c:if>
	</div>
	<div class="body_wrap">
		<form:form action="${home}/pmanager/sysuser/sys_user.do?op=save" modelAttribute="bean" 
			id="form" class="theme" name="basic" method="post">
			<input type="hidden" name="id" id="id" value="${bean.id}"/>
			
			<div class="box">
				<h3>
					基本信息
				</h3>
				<ul class="input two_col">
					<li class="mandatory">
						<label>姓名：</label>
						<form:input path="name" cssClass="text required form-input" onblur="checkName()"/>
						<p6 id="nameMessage"></p6>
					</li>
					<li class="mandatory">
						<label>电话：</label>
						<form:input path="telNo" cssClass="text required form-input" id="telNo" onblur="checkTelNo()"/>
						<p6 id="telNoMessage"></p6>
					</li>
					<li class="mandatory">
						<label>账号：</label>
						<form:input path="code" cssClass="text required form-input" id="code" onblur="checkCode()"/>
						<p6 id="codeMessage"></p6>
					</li>
					
					<li class="mandatory">
						<label>密码：</label>
						<input type="password" cssClass="text required form-input" name="password" class="required" value="${bean.password}"/>
					</li>
					
					<li>
						<label>所属部门：</label>
						<form:select path="organizationId">
							<form:option value="">-请选择部门-</form:option>
							<c:forEach items="${organizations}" var="organization">
								<form:option value="${organization.id}">
									${organization.text}
								</form:option>
							</c:forEach>
						</form:select>
					</li>
					
					<li class="mandatory">
						<label>是否启用：</label>
						<span class="radio">
							<input type="radio" name="status" value="1" class="radio" 
								<c:if test='${bean.status == 1}'>checked="checked"</c:if> checked="checked"/>启用
							
						</span>
						<span class="radio">
							<input type="radio" name="status" value="0" class="radio" 
								<c:if test='${bean.status == 0}'>checked="checked"</c:if>/>不启用
							
						</span>
						<!-- 
							<span class="radio">
							<input type="radio" name="status" value="-1" class="radio" 
								<c:if test='${bean.status == -1}'>checked="checked"</c:if>/>已删除
							
						</span>
						 -->
					</li>
				</ul>
				<div class="clear"></div>
			</div>
			
			<dl class="roles">
				<dt>操作权限</dt>
				<c:forEach items="${roles}" var="role">
					<dd>
						
						<input type="checkbox" class="checkbox" name="roleId" value="${role.id}"/>
						${role.name}
					</dd>	
				</c:forEach>
			</dl>
			
		</form:form>
	</div>
</body>
</html>
