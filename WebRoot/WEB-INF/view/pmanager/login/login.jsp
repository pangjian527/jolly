<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>倬利电子商务管理后台</title>
		<link rel="icon" href="${home}/image/ZLlogo2.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="${home}/favicon.ico" type="image/x-icon" />
		<link rel="bookmark" href="${home}/favicon.ico" type="image/x-icon" />

		<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>

		<link rel="stylesheet" type="text/css" href="${home}/style/global.css" />
		<link rel="stylesheet" type="text/css" href="${home}/style/login.css" />
		<style type="text/css">
			#head {
	
			}
		</style>
		
		<script type="text/javascript">
			function initBody(){
				if(window != window.top){
					window.top.location = window.location;
					return;
				}
				
				if(document.cookie){
					var cookies = document.cookie.split("; ");
					for(var i = 0; i < cookies.length; i++){
						var cookieNameValue = cookies[i].split("=");
						var cookieName = decodeURIComponent(cookieNameValue[0]);
						var cookieValue = decodeURIComponent(cookieNameValue[1]);
						if(cookieName == "user_code"){
							document.getElementsByName("code")[0].value = cookieValue;
						}
						if(cookieName == "user_pwd_md5"){
							document.getElementsByName("password")[0].value = cookieValue;
						}
						if(cookieName == "remember_me" && cookieValue == 1){
							document.getElementById("chkRememberMe").checked = true;
						}
					}
				}
				var errorInfo = "${errorInfo}";
				if(errorInfo){
					_showAlert(errorInfo);
				}
				
				document.body.onkeyup = function(ev){
					ev = ev || window.event;
					var pressedKeyCode = ev.which || ev.keyCode;
					var srcElement = ev.target || ev.srcElement;
					if(pressedKeyCode == 13 && srcElement.tagName == "INPUT")
						applyLogin();
				}
			}
			function applyLogin(){
				//this.blur();
				var accountInputNode = document.getElementsByName("code")[0];
				var account = accountInputNode.value;
				
				var passwordInputNode = document.getElementsByName("password")[0];
				var password = passwordInputNode.value;
				
				if(account == "" && password == "")
					_showAlert("请输入您的帐户和密码");
				else if(account == "")
					_showAlert("请输入您的帐户");
				else if(password == "")
					_showAlert("请输入您的密码");
				else
					document.frm_login.submit();
			}
			
			function _showAlert(str){
				var pNode = document.getElementById("errorInfo");
				pNode.innerHTML = str;
				pNode.style.display = "block";
			}

		</script>
	</head>
	<body onload="initBody()">
		<form action="${home}/pmanager/login/login.do" class="theme" name="frm_login" method="post">
			<input type="hidden" name="enter" value="1" />
			<div id="head">
				<div id="suggest">
					<ul>
						<li>请选用或谷歌Chrome浏览器，或微软Internet Explore 8.0及更高版本</li>
						<li>显示器分辨率应不低于1024×768，否则部分页面内容将无法正常显示</li>
					</ul>
				</div>
			</div>
			<div id="content">
				<div id="login">
					<h3>登陆倬利系统</h3>
					<p id="errorInfo" />
					<ul>
						<li>
							<label>账户名：</label>
							<input type="text" name="code" id="txtCode" placeholder="注册账号" value="" /><!-- ${cookCode} -->
						</li>
						<li>
							<label>密码：</label>
							<input type="password" name="password" id="txtPassword" value="" /><!-- ${cookPwd} -->
						</li>
					</ul>
					<div class="clear">
						<input type="checkbox" name="rememberMe" id="chkRememberMe" value="1" class="checkbox" />
						保存用户名和密码
					</div>
					<button type="button" onclick="applyLogin()">登录</button>
				</div>
			</div>
			<div id="foot">
				<span>倬利后台管理系统
				</span>
			</div>
		</form>
	</body>
</html>
