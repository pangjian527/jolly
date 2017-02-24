<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>商家认证</title>
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	
	<script type="text/javascript" src="${home}/script/jquery.js"></script>	
	<script type="text/javascript" src="${home}/script/mwebmall/haux.mobile.js"></script>

<style type="text/css">
	div.scwrapper{
		position: relative;
	    min-width: 320px;
	    max-width: 640px;
	    margin: 0 auto;
	    background-color: #f3f3f3;
	    padding: 10px 0;
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
	
	div.factory-base-box,div.license-box,div.factory-img-box{
		background:white;
   		background-size: 50px 5px;
   		padding: 5px 0;
   		background-position: -10px 0;
	}
	div.license-box{
		margin:20px 0;
	}
	
	div.license-box ul li.licensename-row{
	  	height: 100px;
	}
	li.licensename-row label{
		display: block;
		float: left;
		height: 100%;
		line-height: 100px;
	}
	li.licensename-row div.licensename-img{
		  float: left;
		  width: calc(100% - 100px);
		  height: 100%;
	}
	li.licensename-row img{
		  height: 95%;
		  margin: 5px 20px;
		  display: block;
		  float: left;
	}
	div.factory-img-box label{
		  display: block;
		  border-bottom: 1px solid #e4e4e4;
		  width: 100%;
		  height: 40px;
		  line-height: 40px;
		  padding-left: 20px;
	}
	div.factory-img{
  		padding: 20px 20px;
	}
	
	div.factory-img img{
		  height: 100px;
  		margin: 5px 20px;
	}
	div.add-file{
		  height: 100px;
		  display: inline-block;
		  width: 100px;
		  border: 2px dashed #e4e4e4;
		  padding: 0px;
		  text-align: center;
		  line-height: 100px;
		  position: absolute;
		  /* margin-top: 29px; */
		  margin: 1 20px;
		  margin-left: 23px;
		  margin-top: 5px;
	}
	div.add-file a{
		  font-size: 60px;
		  font-family: arial;
		  color: #999;
		  font-weight: bold;
	}
	div.add-file input{
		    opacity: 0;
		  position: absolute;
		  left: 0;
		  height: 100px;
		  width: 100px;
	}
	
	a.submit-btn{
		  background-color: #f23030;
		  color: white;
		  display: block;
		  padding: 10px 0;
		  margin: 20px 5px;
		  text-align: center;
		  border-radius: 3px;
		  font-size: 18px;
		  font-family: 微软雅黑;
		  clear: both;
	    	letter-spacing: 10px;
	}
</style>
<script type="text/javascript">
	function submitFactory(){
		var name=document.getElementById("name").value;
		var man=document.getElementById("man").value;
		var addr=document.getElementById("addr").value;
		var licenseName=document.getElementById("licenseName").value;
		var gps=document.getElementById("gps").value;
		if(name==""){
			haux.showToast("商家名称不能为空！", 1, function(){});
			return ;
		}
		if(man==""){
			haux.showToast("联系人不能为空！", 1, function(){});
			return;
		}
		if(addr==""){
			haux.showToast("详细地址不能为空！", 1, function(){});
			return;
		}
		if(licenseName==""){
			haux.showToast("营业执照名不能为空！", 1, function(){});
			return;
		}
		
		if(gps){
			var gpsArr = gps.split(',');
			if(gpsArr.length!=2||isNaN(gpsArr[0])||isNaN(gpsArr[1])){
				haux.showToast("gps位置格式不正确！", 1, function(){});
				return
			}
			document.getElementById("gpsX").value=gpsArr[0];
			document.getElementById("gpsY").value=gpsArr[1];
		}
		
		document.detailInfoForm.submit();
	}
	
</script>
</head>
<body>
  	<div class="scwrapper">
  		<form action="${home}/mmall/factory/factory.do" method="post" name="detailInfoForm">
  			<input type="hidden" name="op" value="saveDetailInfo">
	  		<div class="factory-base-box">
	  			<ul>
	  				<li>
	  					<label>商家名称：</label>
	  					<input type="text" name="name" id="name" value="${factory.name }"/>
	  				</li>
	  				<li>
	  					<label>联系人：</label>
	  					<input type="text" name="man" id="man" value="${factory.man }"/>
	  				</li>
	  				<li>
	  					<label>联系电话：</label>
	  					<input type="text" name="mobile" id="mobile" value="${factory.mobile }" readonly="readonly"/>
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
	  					<input type="text" name="addr" id="addr" value="${factory.addr }"/>
	  				</li>
	  				
	  				<li>
	  					<label>GPS位置：</label>
	  					<input type="text" name="gps" id="gps" value="${factory.gpsX },${factory.gpsY }"/>
	  					<input type="hidden" name="gpsX" id="gpsX" value="${factory.gpsX }"/>
	  					<input type="hidden" name="gpsY" id="gpsY" value="${factory.gpsY }"/>
	  				</li>
	  			</ul>
	  		</div>
	  		<div class="license-box">
	  			<ul>
	  				
	  				<li>
	  					<label>营业执照名：</label>
	  					<input type="text" name="licenseName" id="licenseName" value="${factory.licenseName }"/>
	  				</li>
	  				<li class="licensename-row">
	  					<input type="hidden" name="licenseFileIds" id="licenseFileIds" value="${factory.licenseFileIds }"/>
	  					<label>执照图片：</label>
	  					<div class="licensename-img">
	  						<c:forEach items="${licenseImgIds }" var="imgId">
			  					<img alt="" src="${home}/img-${imgId}_100x100.do"/>
			  				</c:forEach>
			  				<c:if test="${fn:length(list)<2 }">
			  					<div class="add-file" id="add-file">
				  					<a>+</a>
				  					<input type="file">
				  				</div>
			  				</c:if>
			  				
	  					</div>
	  				</li>
	  			</ul>
	  		</div>
	  		<div class="factory-img-box">
	  			<input type="hidden" name="photoIds" id="photoIds" value="${factory.photoIds }"/>
	  			<label>商家图片（至少三张）：</label>
	  			<div class="factory-img">
	  				<c:forEach items="${factoryImgIds }" var="imgId">
	  					<img alt="" src="${home}/img-${imgId}_100x100.do"/>
	  					<img alt="" src="${home}/img-${imgId}_100x100.do"/>
	  					<img alt="" src="${home}/img-${imgId}_100x100.do"/>
	  					<img alt="" src="${home}/img-${imgId}_100x100.do"/>
	  					<img alt="" src="${home}/img-${imgId}_100x100.do"/>
	  				</c:forEach>
	  				<div class="add-file" id="add-file">
	  					<a>+</a>
	  					<input type="file">
	  				</div>
				</div>
	  		</div>
  		</form>
  		<a class="submit-btn" onclick="submitFactory();" id="submitFctory">提交申请</a>
  	</div>
</body>
</html>
