<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>短信登录</title>
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	<link href="${home}/style/m_dialog.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${home}/script/jquery.js"></script>	
	<script type="text/javascript" src="${home}/script/mwebmall/haux.mobile.js"></script>
	<script type="text/javascript" src="${home}/script/m_dialog.js"></script>

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
   		padding: 5px 10px;
   		margin: 80px 0px 25px 0px;
	}
	
	div.scwrapper ul {
		background:white;
		padding: 10px 0;
	}
	
	div.scwrapper ul li{
		height:40px;
		line-height:40px;
		color:#232326;
		position: relative;
		border-bottom: 1px solid #e4e4e4;
		padding:8px 0;
	}
	div.scwrapper ul li label{
		display:inline-block;
		width:100px;
		text-align: right;
		color: #6c6c6c;
	}
	
	img.valid{
		position: absolute;
    	right: 10px;
    	top:15px;
	}
	div.scwrapper ul li input[type="text"]{
		height:25px;
		text-indent:5px;
		width:calc(100% - 130px);
		border:0;
		-webkit-appearance:none;
		border-radius:0;
		font-size: 16px;
	}
	div.scwrapper ul li select{
		height:25px;
		width:calc((100% - 150px)/3);
		border:1px solid #e4e4e4;
		-webkit-appearance:none;
		border-radius:0;
		background:white;
	}
	
	input#imgcposition: relative;ode,input#verifyCode{
		width: calc(100% - 220px);
	}
	a.register{
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
	button.verify-code-btn{
		background-color: white;
	    height: 40px;
	    line-height: 40px;
	    border: 0;
	    font-size: 16px;
	    position: absolute;
	    right: 10px;
	    top: 10px;
	    color: #f40;
	}
	button.active{
		background-color: #fff;
		 color: #e4e4e4;
		 font-size:14px;
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

	//发送短信验证码
	function sendVerifycode(){
		var mobileInput = document.getElementById("mobile");
		if(! /^1\d{10}$/.test(mobileInput.value)){ 
			dialogAlert("温馨提示","请输入正确的手机号码！");
			return ;
		}
		
		var imgcodeInput = document.getElementById("imgcode");
		if(imgcodeInput.value.length == 0){
			dialogAlert("温馨提示","请输入图形验证");
			return;
		}
		
		haux.getData({
			url:home()+'/mmall/factoryuser/login.do?op=sendLoginVerifycode',
			data:{mobile:mobileInput.value,imgcode:imgcodeInput.value},
			showProgress:false,
			success:function(data){
				if(data.error){
					dialogAlert("温馨提示", data.error);
				}else{
					//将“发送验证码”按钮禁止，并启动倒计时，120秒之后允许重新获取，
					dialogAlert("温馨提示","验证码已发送至" + mobileInput.value);
					reloadVerifyimage();
					cutdown(60);
				}
			}
		});
	}
	function cutdown(seconds){
		var buttonElement = document.getElementById("verifyCode").parentNode.getElementsByTagName("button")[0];
		buttonElement.className = "verify-code-btn active";
		buttonElement.disabled = true;
		buttonElement.innerHTML = "重新获取(" + seconds + "秒)";
		//启动渐变动画
		setTimeout(function(){
			seconds--;
			if(seconds > 0){
				buttonElement.innerHTML = "重新获取(" + seconds + ")";
				setTimeout(arguments.callee, 1000);
			}
			else{
				buttonElement.innerHTML = "重新获取";
				buttonElement.disabled = false;
				buttonElement.className = "verify-code-btn";
			}
		
		}, 1000);
		
	}
	function loginSubmit(){
		//1.检查用户输入有效性
		var inputElements = document.getElementsByTagName("input");
		var mobileInput = inputElements[0];
		if(! /^1[3|4|5|6|7|8|9][0-9]\d{4,8}$/.test(mobileInput.value)){ 
			dialogAlert("温馨提示","请输入正确的手机号码");
	        return false; 
	    };
	    
	    var imgcodeInput = document.getElementById("imgcode");
		if(imgcodeInput.value==""){
			dialogAlert("温馨提示","请输入图形验证");
			return;
		}
	    
		var verifyInput = inputElements[2];
		if(! /\d{6}/.test(verifyInput.value)){
			dialogAlert("温馨提示","请输入6位手机验证码");
			return;
		}
		
		//2.提交
			
		haux.getData({
			url:home() + '/mmall/factoryuser/login.do',
			data:{op:"loginSms", 
				mobile:mobileInput.value,
				verifycode:verifyInput.value},
			showProgress:false,
			success:function(data){
				if(data.error){
					dialogAlert("温馨提示", data.error);
				}else{
					window.location=home()+"/mmall/product/product.do";
				}
			}
		});
	}
	function reloadVerifyimage(obj){
		document.getElementById("validImg").src = "${home}/file/verifyimage.do?" + Math.random();
	}
	function getSelectValue(selectId){
		var  myselect=document.getElementById(selectId);

		var index=myselect.selectedIndex ;             // selectedIndex代表的是你所选中项的index

		return myselect.options[index].value;
	}
	function checkBtnActive(obj){
		if(obj.value){
			document.getElementById("verify-code-btn").className="verify-code-btn active";
			document.getElementById("verify-code-btn").disabled="";
		}else{
			document.getElementById("verify-code-btn").className="verify-code-btn";
			document.getElementById("verify-code-btn").disabled="disabled";
		}
	}
	
	function toRegister(){
		window.location="${home}/mmall/factoryuser/register.do";
	}
	function toPwdLogin(){
		window.location="${home}/mmall/factoryuser/login.do";
	}
</script>
<jsp:include page="../initWeixin.jsp"/>
</head>
<body>
  	<div class="scwrapper">
  		<div class="factory-user-box">
  			<ul>
  				<li>
  					<label>手&nbsp;机&nbsp;号&nbsp;码：</label>
  					<input type="text" placeholder="请输入手机号码" name="mobile" id="mobile"/>
  				</li>
  				<li>
  					<label>图形验证码：</label>
  					<input type="text"  placeholder="图形验证码" name="imgcode" id="imgcode" />
  					<img class="valid" id="validImg"  onclick="reloadVerifyimage(this)" src='${home}/file/verifyimage.do'/>
  				</li>
  				<li>
  					<label>短信验证码：</label>
  					<input type="text"  placeholder="短信验证码"name="verifyCode" id="verifyCode" />
  					<button type="button" onclick="sendVerifycode()" class="verify-code-btn" id="verify-code-btn">获取验证码</button>
  				</li>
  			</ul>
  		</div>
  		<a class="login" onclick="loginSubmit();" >登录</a>
  		<div class="forward-menu">
  			<a class="register-href" href="javascript:toRegister()">快速注册>></a>
  			<a class="sms-login-href" href="javascript:toPwdLogin()">密码登录>></a>
  		</div>
  	</div>
</body>
</html>
