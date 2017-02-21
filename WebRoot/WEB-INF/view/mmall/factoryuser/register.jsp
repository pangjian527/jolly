<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>倬利商家注册</title>
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
	
	div.factory-user-box,div.factory-box{
		background:white;
   		background-size: 50px 5px;
   		padding: 5px 0;
   		background-position: -10px 0;
	}
	div.factory-box{
		margin:20px 0;
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
	}
	div.factory-user-box ul li  label{
		  color: rgb(236, 75, 75);
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
	div.scwrapper ul li select{
		height:25px;
		width:calc((100% - 150px)/3);
		border:1px solid #e4e4e4;
		-webkit-appearance:none;
		border-radius:0;
		background:white;
	}
	
	div.pro-list-box{
		margin:10px 0;
	}
	
	div.pro-list-box ul li{
		height:100px;
		background-color:white;
		padding:10px 10px;
		font-size:14px;
		border-bottom: 2px dashed #e4e4e4;
	}
	
	div.pro-list-box ul li div.pro-img{
		height:100px;
		width:100px;
		float:left;
	}
	div.pro-list-box ul li div.pro-img img{
		height:100px;
		width:100px;
	}
	
	div.pro-list-box ul li div.pro-info-box{
			float:left;
			width:calc(100% - 150px);
			padding:0 10px;
	}
	div.pro-info-title{
		color: #232326;
	    font-size: 15px;
	    line-height: 20px;
	    height: 70px;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    display: -webkit-box;
	    display: box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	    word-break: break-word;		
	}
	div.pro-price{
		height: 35px;
   		line-height: 35px;
	}
	div.pro-price label.price{
		color:#f23030;
		font-size:25px;
	}
	input#imgcode,input#verifyCode{
		width: calc(100% - 210px);
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
			url:home()+'/mmall/register.do?op=sendRegistVerifycode',
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

		var factoryName = document.getElementById("factoryName").value;
		var addr = document.getElementById("addr").value;
		var provinceId = getSelectValue("provinceId");
		var cityId = getSelectValue("cityId");
		var countyId = getSelectValue("countyId");
		
		//2.提交
		var postData = {op:"register", 
			mobile:mobileInput.value,
			verifycode:verifyInput.value, 
			password:passwordInput.value,
			factoryName:factoryName,
			addr:addr};
			
		haux.getData({url:home() + '/mmall/factoryuser/register.do',
			data:postData,
			success:function(data){
				if(data.error){
					haux.showToast(data.error);
				}
				else{
					haux.showToast("注册成功，欢迎您来到倬利商城", 1, function(){
						window.location=home()+"/factoryuser/index.html";
					});
				}
			}
		});
	}
	function reloadVerifyimage(){
		var imgElement = document.getElementById("verify-image").getElementsByTagName("img")[0];
		imgElement.src = "${home}/file/verifyimage.do?" + Math.random();
	}
	function getSelectValue(selectId){
		var  myselect=document.getElementById(selectId);

		var index=myselect.selectedIndex ;             // selectedIndex代表的是你所选中项的index

		return myselect.options[index].value;
	}
	
</script>
</head>
<body>
  	<div class="scwrapper">
  		<div class="factory-user-box">
  			<ul>
  				<li>
  					<label>手机号码：</label>
  					<input type="text" name="mobile" id="mobile"/>
  				</li>
  				<li>
  					<label>图形验证码：</label>
  					<input type="text" name="imgcode" id="imgcode"/>
  					<img onclick="reloadVerifyimage()" src='${home}/file/verifyimage.do'/>
  				</li>
  				<li>
  					<label>短信验证码：</label>
  					<input type="text" name="verifyCode" id="verifyCode"/>
  					<button type="button" onclick="sendVerifycode()">获取验证码</button>
  				</li>
  				<li>
  					<label>密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
  					<input type="text" name="password" id="password"/>
  				</li>
  				<li>
  					<label>重复密码：</label>
  					<input type="text" name="repeat_password" id="repeat_password"/>
  				</li>
  			</ul>
  		</div>
  		<div class="factory-box">
  			<ul>
  				<li>
  					<label>商家名称：</label>
  					<input type="text" name="factoryName" id="factoryName"/>
  				</li>
  				<li>
  					<label>商家区域：</label>
  					<select name="provinceId" id="provinceId">
  						<option value="2250">广东省</option>
  					</select>
  					<select name="cityId" id="cityId">
  						<option value="2251">广州市</option>
  					</select>
  					<select name="countyId" id ="countyId">
  						<option value="2257">海珠区</option>
  					</select>
  				</li>
  				<li>
  					<label>详细地址：</label>
  					<input type="text" name="addr" id="addr"/>
  				</li>
  			</ul>
  		</div>
  		<a class="register" onclick="registSubmit();" id="sjzhuce">注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册</a>
  	</div>
</body>
</html>
