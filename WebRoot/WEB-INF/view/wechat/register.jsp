<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<title>倬利商家注册</title>

<link rel="stylesheet" type="text/css" href="${home}/style/mwebmall/haux.global.css" />
<link rel="stylesheet" type="text/css" href="${home}/style/mwebmall/haux.head.css" />
<link rel="stylesheet" type="text/css" href="${home}/style/mwebmall/haux.factory.css" />

<script type="text/javascript" src="${home}/script/jquery.js"></script>	
<script type="text/javascript" src="${home}/script/mwebmall/haux.mobile.js"></script>

<style type="text/css">
	dl{
		margin: 70px 0 0;
		font-size: 14px;
		background: white;
		padding: 0 15px;
		border-top: 1px solid #ddd;
		border-bottom: 1px solid #ddd;
	}
	dt{
		width:80px;
		float:left;
		clear:both;
		height:46px;
		line-height:46px;
		color:red;
	}
	dd{
		height:46px;
		line-height:46px;
		border-top:1px solid #efefef;
		position:relative
	}
	dd.old-pwd{
		border-top:0
	}
	
	dd input{
		border:0;
		width:140px;
	}
	dd button{
		padding: 6px 8px;
		font-family: 微软雅黑;
		border-radius: 4px;
		border: 1px solid #ccc;
		background: #f7f7f7;
		color: #666;
		position: absolute;
		left: 220px;
		top: 5px
	}
	dd button.disabled{
		opacity:0.5;
	}
	a.submit{
		display: block;
		background: #f70;
		color: white;
		padding: 10px 0;
		margin: 20px 2px;
		text-align: center;
		border-radius: 3px;
		font-size: 16px;
		font-family: 微软雅黑;
		letter-spacing: 2px;
	}
	.submit{
		display: block;
		background: #f40;
		color: white;
		padding: 10px 0;
		margin: 10px 2px;
		text-align: center;
		border-radius: 3px;
		font-size: 14px;
		font-family: 微软雅黑;
		letter-spacing: 2px;
		clear: both;
	}
	fieldset, img {
		border: none;
		position: absolute;
		top: 7px;
	}
</style>
<script type="text/javascript">

	//发送短信验证码
	function sendVerifycode(){
		var mobileInput = document.getElementById("mobile");
		if(! /^1\d{10}$/.test(mobileInput.value)){ 
			haux.showToast("请输入正确的手机号码！",2);
			return ;
		}
		
		var imgcodeInput = document.getElementById("imgcode");
		if(imgcodeInput.value.length == 0){
			haux.showToast("请输入图形验证");
			return;
		}
		cutdown(60);
		
		haux.getData({
			url:home()+'/mwebmall/register.do?op=sendRegistVerifycode',
			data:{mobile:mobileInput.value,imgcode:imgcodeInput.value},
			showProgress:false,
			success:function(data){
				if(data.error){
					haux.showToast( data.error);
				}else{
					//将“发送验证码”按钮禁止，并启动倒计时，120秒之后允许重新获取，
					haux.showToast("验证码已发送至" + mobileInput.value);
				}
			}
		});
	}
	function cutdown(seconds){
		var buttonElement = document.getElementById("verifyCode").parentNode.getElementsByTagName("button")[0];
		buttonElement.className = "disabled";
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
				buttonElement.className = "";
			}
		
		}, 1000);
		
	}
	function registSubmit(){
		//1.检查用户输入有效性
		var inputElements = document.getElementsByTagName("input");
		var mobileInput = inputElements[0];
		if(! /^1[3|4|5|6|7|8|9][0-9]\d{4,8}$/.test(mobileInput.value)){ 
			haux.showToast("请输入正确的手机号码");
	        return false; 
	    };
	    
	    var imgcodeInput = document.getElementById("imgcode");
		if(imgcodeInput.value==""){
			haux.showToast("请输入图形验证");
			return;
		}
	    
		var verifyInput = inputElements[2];
		if(! /\d{6}/.test(verifyInput.value)){
			haux.showToast("请输入6位手机验证码");
			return;
		}
		
		var passwordInput = inputElements[3];
		if(passwordInput.value.length == 0){
			haux.showToast("请输入新密码");
			return;
		}
		if(passwordInput.value != inputElements[4].value){
			haux.showToast("两次输入的密码不相同");
			return;
		}

		//2.提交
		var postData = {op:"regist", 
			mobile:mobileInput.value,
			verifycode:verifyInput.value, 
			password:passwordInput.value};
			
		haux.getData({url:home() + '/mwebmall/regist.do',
			data:postData,
			success:function(data){
				if(data.error){
					haux.showToast(data.error);
				}
				else{
					haux.showToast("注册成功，欢迎您来到好胎屋商城", 1, function(){
						window.location=home()+"/mwebmall/index.html";
					});
				}
			}
		});
	}
	function reloadVerifyimage(){
		var imgElement = document.getElementById("verify-image").getElementsByTagName("img")[0];
		imgElement.src = "${home}/file/verifyimage.do?" + Math.random();
	}
	
</script>
</head>
<body>
   <div class="wrap">
   		<!-- 页面头部 -->
   		<div class="head">
   			<div class="left" onclick="back()">
   				<i class="back-btn"></i>
   				<label>电池供应平台</label>
   			</div>
   		</div>
   		<!-- 主体内容 -->
   		<div class="content">
   			<div class="content">
	   			<dl>
	   				<dt>手机号码</dt>
	   				<dd>
	   					<input type="text" placeholder="请输入您的手机号码" id="mobile">
	   				</dd>
	   				<dt>图形验证码</dt>
	   				<dd>
	   					<input name="imgcode" id="imgcode" type="text" class="required" placeholder="请输入图片验证">
						<img onclick="reloadVerifyimage()" src='${home}/file/verifyimage.do'/>
	   				</dd>
	   				<dt>短信验证码</dt>
	   				<dd>
	   					<input type="text" placeholder="请输入6位短信验证码" id="verifyCode">
	   					<button type="button" onclick="sendVerifycode()">获取验证码</button>
	   				</dd>
	   				<dt>密       码</dt>
	   				<dd>
	   					<input type="password" placeholder="请输入登录密码">
	   				</dd>
	   				<dt>重复密码</dt>
	   				<dd>
	   					<input type="password" placeholder="请再次输入密码">
	   				</dd>
	   			</dl>
	   		</div>
	   		<div class="content">
	   			<dl>
	   				<dt>商家名称</dt>
	   				<dd>
	   					<input type="text" placeholder="请输入您的手机号码" id="mobile">
	   				</dd>
	   				<dt>商家区域</dt>
	   				<dd>
	   					<select name="provinceId" class="required" id="provinceId">
						</select>
						<select name="cityId" class="required" id="cityId">
						</select>
						<select name="countyId" class="required" id="countyId">
						</select>
	   				</dd>
	   				<dt>详细地址</dt>
	   				<dd>
	   					<input type="text" placeholder="请输入您的手机号码" id="mobile">
	   				</dd>
	   			</dl>
	   		</div>
	   		<a class="submit" onclick="registSubmit();mwebZhuce();" id="sjzhuce">提交</a>
   		</div>
		<c:import url="/mwebmall/common/footer.html" />
   </div>
</body>
</html>
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F443117b2b31f6f8d77f5532e363bb9f5' type='text/javascript'%3E%3C/script%3E"));
</script>