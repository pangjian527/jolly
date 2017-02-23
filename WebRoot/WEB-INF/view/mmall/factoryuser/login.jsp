<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>密码登录</title>
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	
	<script type="text/javascript" src="${home}/script/jquery.js"></script>	
	<script type="text/javascript" src="${home}/script/mwebmall/haux.mobile.js"></script>

<style type="text/css">
	body{
		background-color:#f3f3f3;
	}
	div.scwrapper{
		position: relative;
	    min-width: 320px;
	    max-width: 640px;
	    margin: 0 auto;
	    background-color: #f3f3f3;
	    padding: 10px 0;
	}
	
	div.factory-user-box{
		background:white;
   		background-size: 50px 5px;
   		padding: 5px 0;
   		background-position: -10px 0;
   		margin: 40px 0;
	}
	
	div.scwrapper ul {
		background:white;
		padding: 10px 0;
	}
	
	div.scwrapper ul li{
		height:40px;
		line-height:40px;
		color:#232326;
	}
	div.scwrapper ul li label{
		display:inline-block;
		width:100px;
		text-align: right;
		letter-spacing: 10px;
	}
	div.scwrapper ul li input[type="text"]{
		height:25px;
		text-indent:5px;
		width:calc(100% - 130px);
		border:0;
		border-bottom:1px solid #e4e4e4;
		-webkit-appearance:none;
		border-radius:0;
	}
	
	a.login{
		  background-color: #f23030;
		  color: white;
		  display: block;
		  padding: 10px 0;
		  margin: 10px 5px;
		  text-align: center;
		  border-radius: 3px;
		  font-size: 18px;
		  font-family: 微软雅黑;
		  clear: both;
		  letter-spacing: 10px;
	}
	div.forward-menu{
		  position: relative;
  		margin-top: 20px;
	}
	div.forward-menu a.register-href {
		 margin-left: 15px;
  		color: #F04E4E;
	}
	div.forward-menu a.sms-login-href {
		  position: absolute;
		  right: 15px;
		  color: #F04E4E;
	}
</style>
<script type="text/javascript">

	function loginSubmit(){
		
		var account=document.getElementsByName("account")[0].value;
		var password=document.getElementsByName("password")[0].value;
		
		if(account==""){
			haux.showToast("账号不能为空！", 1, function(){});
			return ;
		}else if(password==""){
			haux.showToast("密码不能为空！", 1, function(){});
			return null;
		}
		
		document.loginform.submit();
	}
	function toRegister(){
		window.location="${home}/mmall/factoryuser/register.do";
	}
	function toSmsLogin(){
		window.location="${home}/mmall/factoryuser/login.do?op=toLoginSms";
	}
</script>
</head>
<body>
  	<div class="scwrapper">
  		<div class="factory-user-box">
  			<form action="${home}/mmall/factoryuser/login.do" method="post" name="loginform">
  				<input type="hidden" name="op" value="login">
	  			<ul>
	  				<li>
	  					<label>账号：</label>
	  					<input type="text" name="account" id="account"/>
	  				</li>
	  				<li>
	  					<label>密码：</label>
	  					<input type="text" name="password" id="password"/>
	  				</li>
	  			</ul>
  			</form>
  		</div>
  		<a class="login" onclick="loginSubmit();" >登录</a>
  		<div class="forward-menu">
  			<a class="register-href" href="javascript:toRegister()">快速注册>></a>
  			<a class="sms-login-href" href="javascript:toSmsLogin()">短信登录>></a>
  		</div>
  	</div>
</body>
</html>