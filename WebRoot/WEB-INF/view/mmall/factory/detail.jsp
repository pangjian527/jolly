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
	<link href="${home}/style/m_dialog.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/mwebmall/haux.mobile.js"></script>
	<script type="text/javascript" src="${home}/script/m_dialog.js"></script>
	<script type="text/javascript" src="${home}/script/mwebmall/manage.area.js"></script>
	<script type="text/javascript" src="${home}/script/jquery.ajaxfileupload.js"></script>

<style type="text/css">
	body{
		background-color: #f3f3f3;
	}
	div.scwrapper{
		position: relative;
	    min-width: 320px;
	    max-width: 640px;
	    margin: 0 auto;
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
	  line-height: 20px;
	}
	div.license-box ul li.licensename-row label{
		margin-top:20px;
		display: block;
		float: left;
		height: 100%;
		word-break: break-all;
	}
	div.license-box ul li.licensename-row label p{
		  color: red;
		  font-size: 12px;
		  text-align: left;
		    margin: auto 5px;
	}
	li.licensename-row div.licensename-img{
		  float: left;
		  width: calc(100% - 100px);
		  height: 100%;
	}
	
	div.factory-img-box label{
		  display: block;
		  border-bottom: 1px solid #e4e4e4;
		  height: 40px;
		  line-height: 40px;
		  padding-left: 20px;
		    color: #232326;
	}
	div.factory-img{
  		  padding: 20px 20px;
 		 min-height: 110px;
	}
	
		div.add-file {
		  display: inline-block;
		  padding: 5px;
		  text-align: center;
		  line-height: 100px;
		  position: relative;
		  /* margin-top: 29px; */
		  margin: 1 20px;
		  /* margin-left: 23px; */
		  /* margin-top: 5px; */
		}
	div.add-file a{
		  font-size: 60px;
		  font-family: arial;
		  color: #999;
		  font-weight: bold;
		    width: 90px;
		  height: 90px;
		  display: block;
		  line-height: 90px;
	    	border: 2px dashed #e4e4e4;
	}
	div.add-file input{
		  opacity: 0;
		  position: absolute;
		  left: 5px;
		  height: 90px;
		  width: 90px;
		  top: 5px;
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
	div.img-show{
		  position: relative;
		  float: left;
		  padding: 5px;
	}
	div.img-show img{
		    float: left;
		  width: 90px;
		  height: 90px;
	}
	div.img-show a{
		   position: absolute;
		  right: 5px;
		  color: #C8B4B4;
		  font-size: 20px;
		  height: 25px;
		  width: 25px;
		  top: 5px;
		  line-height: 25px;
		  /* padding: 0px; */
		  text-align: center;
	}
	div.add-file a.uploading{
		font-size: 12px;
	}
	div.agreement-box{
		margin-top:10px;
	  	font-size: 13px;
	}
	div.agreement-box a{
		color:red;
	}
</style>
<script type="text/javascript">
	function initBody(){
		initAreaBox(document.getElementById("provinceId"), document.getElementById("cityId"), 
				document.getElementById("countyId"), "${factory.provinceId}", "${factory.cityId}", "${factory.countyId}");
		
		getWeixinLocation(getBaiduPosition);
	}
	function submitFactory(){
		var name=document.getElementById("name").value;
		var man=document.getElementById("man").value;
		var addr=document.getElementById("addr").value;
		var licenseName=document.getElementById("licenseName").value;
		var moneyAccount=document.getElementById("moneyAccount").value;
		var gps=document.getElementById("gps").value;
		if(name==""){
			dialogAlert("温馨提示","商家名称不能为空！");
			return ;
		}
		if(man==""){
			dialogAlert("温馨提示","联系人不能为空！");
			return;
		}
		if(moneyAccount==""){
			dialogAlert("温馨提示","收款账号不能为空！");
			return;
		}
		if(addr==""){
			dialogAlert("温馨提示","详细地址不能为空！");
			return;
		}
		if(licenseName==""){
			dialogAlert("温馨提示","营业执照名不能为空！");
			return;
		}
		
		if(gps){
			var gpsArr = gps.split(',');
			if(gpsArr.length!=2||isNaN(gpsArr[0])||isNaN(gpsArr[1])){
				dialogAlert("温馨提示","gps位置格式不正确！");
				return
			}
			document.getElementById("gpsX").value=gpsArr[0];
			document.getElementById("gpsY").value=gpsArr[1];
		}
		document.getElementById("licenseFileIds").value = getPhotoIds("licensename-img-id");
		
		var photoIdsValue=getPhotoIds("factory-img-id");
		if(photoIdsValue.split(',').length<3){
			dialogAlert("温馨提示","商家图片至少上传三张！");
			return;
		}
		document.getElementById("photoIds").value = photoIdsValue;
		
		if(!document.getElementById("agreement").checked){
			dialogAlert("温馨提示","请先阅读并勾选同意合作协议");
			return;
		}
		
		document.detailInfoForm.submit();
	}
	
	function getPhotoIds(typeId){
		var photoIds="";
		var imgObj=document.getElementById(typeId);
		var imgEls = imgObj.getElementsByTagName("img");
		if(imgEls&&imgEls.length>0){
			for(var i=0;i<imgEls.length;i++){
				if(i==imgEls.length-1){
					photoIds=photoIds+imgEls[i].getAttribute("imgId");
				}else{
					photoIds=photoIds+imgEls[i].getAttribute("imgId")+",";
				}
				
			}
		}
		return photoIds;
	}
	
	function startUpload(fileId){
		var fileEl=document.getElementById(fileId);
		var fileSize = fileEl.files[0].size;
        if(fileSize>4*1024*1024){   
     		dialogAlert("温馨提示","图片大小不能大于4M");
     		return;
     	} 
        
    	 var fileEl=document.getElementById(fileId);
	     var file=fileEl.files[0];
    	 var divFileEle = fileEl.parentNode;
	     divFileEle.removeChild(fileEl);//防止重复点击
	     
	     var fileAEle = divFileEle.getElementsByTagName("a")[0];
         fileAEle.className="uploading";
         fileAEle.innerHTML="上传中...";
	     
	     var imgData = dealImage(file,function(imgData){
	    	 var formData = new FormData();
	    	 formData.append("imgData", imgData);
	    	 formData.append("fileName", file.name);
	    	 $.ajax({url: home()+'/common/file/upload.do?op=uploadImg',
	    		 data: formData,
	 				method: 'post',
	 			    processData: false,
	 			    contentType: false,
	 	       dataType : "json", 
	 	       success: function (data){
	 	    	   //重新生成file input
	 	    	  	divFileEle.innerHTML = divFileEle.innerHTML+"<input type='file' accept='image/*' name='fileUpload' capture='camera'  onchange='startUpload(this.id)' id='"+fileId+"'>";
	 	    	  	var fileAEle = divFileEle.getElementsByTagName("a")[0];
	 	    	  	fileAEle.innerHTML="+";
	 	    	  	fileAEle.className="";
		        	insertImgEle(fileId,data.id);
		         },
		         error: function (data, status, e){
		         	dialogAlert("温馨提示","上传图片出错");
		        	//重新生成file input
		        	divFileEle.innerHTML = divFileEle.innerHTML+"<input type='file' accept='image/*' name='fileUpload' capture='camera'  onchange='startUpload(this.id)' id='"+fileId+"'>";
		        	var fileAEle = divFileEle.getElementsByTagName("a")[0];
		        	fileAEle.innerHTML="+";
		         	fileAEle.className="";
		         }
	 		});
	     });
	}
	
	function insertImgEle(fileId,imgId){
		var divEl=document.createElement("div");
		divEl.className="img-show"; 
		
		var imgEle = document.createElement("img");
		imgEle.src="${home}/img-"+imgId+"_100x100.do";
		imgEle.setAttribute("imgId",imgId);
		
		var aEl=document.createElement("a");
		aEl.innerHTML="x";
		aEl.onclick=function(){
			deleteImg(this,fileId);
		}
		divEl.appendChild(imgEle);
		divEl.appendChild(aEl);
		
		
		var fileEl=document.getElementById(fileId);
		var targetParentNode = fileEl.parentNode.parentNode;
		targetParentNode.insertBefore(divEl,fileEl.parentNode);
		var imgEls=targetParentNode.getElementsByTagName("img");
		if(fileId=='fileId-1'&&imgEls&&imgEls.length>=2){
			targetParentNode.removeChild(fileEl.parentNode);
		}
		
	}
	
	function deleteImg(obj,fileId){
		var imgObj = obj.previousElementSibling;
		var imgId=imgObj.getAttribute("imgId");
		var targetParentNode=obj.parentNode.parentNode;
		targetParentNode.removeChild(obj.parentNode);
		var imgEls=targetParentNode.getElementsByTagName("img");
		if(fileId == 'fileId-1'&&imgEls&&imgEls.length==1){
			var divEl=document.createElement("div");
			divEl.id="add-file"; 
			divEl.className="add-file"; 
			
			var aEl=document.createElement("a");
			aEl.innerHTML="+";
			
			
			/* 
			此处也不明白为什么用JS方法绑定有时会失效
			var fileEl = document.createElement("input");
			fileEl.type="file";
			fileEl.accept = "image/*";
			fileEl.name = "fileUpload";
			fileEl.id="fileId-1";
			fileEl.setAttribute("capture","camera");
			fileEl.onchange = function(){
				startUpload(this.id);
			}
			 */
			
			divEl.appendChild(aEl);
			//divEl.appendChild(fileEl);
			divEl.innerHTML = divEl.innerHTML+"<input type='file' accept='image/*' name='fileUpload' capture='camera'  onchange='startUpload(this.id)' id='fileId-1'>";
			targetParentNode.appendChild(divEl);
		}
	}
	
	function getBaiduPosition(lng,lat) {
        var url ="http://api.map.baidu.com/geoconv/v1/?coords="+lng+","+lat+"&from=1&to=5&ak=2f0t0ylElcF05UYfrDgY8tGR55cAXtP6";
        $.ajax({
            url: url,
            type: 'GET',
            contentType: "application/json",
            dataType: 'jsonp',//这里要用jsonp的方式不然会报错
            success: function(data) {
            	if(data.status==0){
            		document.getElementById("gps").value=data.result[0].x+","+data.result[0].y;
            	}else{
            		dialogAlert("温馨提示","获取gps出错，请稍后再试");
            	}
            },
            error:function(){
            	dialogAlert("温馨提示","获取gps出错，请稍后再试");
			}
        });
    }
	
	/**
	 * 图片压缩，默认同比例压缩
	 */
	function dealImage(file,callback){
		var fileReader = new FileReader();  
	    fileReader.onload = function(event) {  
		    var result = event.target.result; //返回的dataURL   
		    var image = new Image();  
		   
		    //若图片大小大于0.5M，压缩后再上传，否则直接上传  
		    if(file.size>0.5*1024*1024){     
		    	image.onload = function() { //创建一个image对象，给canvas绘制使用  
		            var canvas = document.createElement('canvas');     
		            canvas.width = this.width;  
		            canvas.height = this.height; //计算等比缩小后图片宽高   
		            var ctx = canvas.getContext('2d');  
		            ctx.drawImage(this, 0, 0, canvas.width, canvas.height);  
		            result = canvas.toDataURL(file.type, 0.6); //重新生成图片    
				    callback(base64ToBlob(result,file.type));
		        }  
	    	 	image.src = result;  
	        }else{
	        	callback(base64ToBlob(result,file.type));
	        }
	    	
	    }  
	    fileReader.readAsDataURL(file);  
	}
	 
	 function base64ToBlob(basestr,fileType) {
		 var text = window.atob(basestr.split(",")[1]);
		  var buffer = new ArrayBuffer(text.length);
		  var ubuffer = new Uint8Array(buffer);
		  for (var i = 0; i < text.length; i++) {
		    ubuffer[i] = text.charCodeAt(i);
		  }
		  var Builder = window.WebKitBlobBuilder || window.MozBlobBuilder;
		  var blob;
		  if (Builder) {
		    var builder = new Builder();
		    builder.append(ubuffer);
		    blob = builder.getBlob(type);
		  } else {
		    blob = new window.Blob([ubuffer], {type: fileType});
		  }

         return blob;
     }
	
	
</script>
<jsp:include page="../initWeixin.jsp"/>	
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
	  					<label>收款账号：</label>
	  					<input type="text" name="moneyAccount" id="moneyAccount" value="${factory.moneyAccount }" />
	  				</li>
	  				<li>
	  					<label>商家区域：</label>
	  					<select name="provinceId" id="provinceId">
	  					</select>
	  					<select name="cityId" id="cityId">
	  					</select>
	  					<select name="countyId" id ="countyId">
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
	  					<label>执照图片：
	  						<p>注:无营业执照，可上传身份证正反面</p>
	  					</label>
	  					<div class="licensename-img" id="licensename-img-id">
	  						<c:forEach items="${licenseImgIds }" var="imgId">
	  							<div class="img-show">
		  							<img   src="${home}/img-${imgId}_100x100.do" imgId="${imgId}"/>
				  					<a href="javascript:;" onclick="deleteImg(this,'fileId-1')">x</a>
	  							</div>
			  				</c:forEach>
			  				<c:if test="${fn:length(licenseImgIds)<2 }">
			  					<div class="add-file" id="add-file">
				  					<a>+</a>
				  					<input type="file" accept="image/*" name="fileUpload" capture="camera"  onchange="startUpload(this.id)" id="fileId-1">
				  				</div>
			  				</c:if>
			  				
	  					</div>
	  				</li>
	  			</ul>
	  		</div>
	  		<div class="factory-img-box">
	  			<input type="hidden" name="photoIds" id="photoIds" value="${factory.photoIds }"/>
	  			<label>商家图片（至少三张）：</label>
	  			<div class="factory-img" id="factory-img-id">
	  				<c:forEach items="${factoryImgIds }" var="imgId">
	  					<div class="img-show">
  							<img   src="${home}/img-${imgId}_100x100.do" imgId="${imgId}"/>
		  					<a href="javascript:;" onclick="deleteImg(this,'fileId-2')">x</a>
  						</div>
	  				</c:forEach>
	  				<div class="add-file" id="add-file">
	  					<a>+</a>
	  					<input type="file" accept="image/*" name="fileUpload"  capture="camera"  onchange="startUpload(this.id)" id="fileId-2">
	  				</div>
				</div>
	  		</div>
  		</form>
  		<div class="agreement-box">
  			<input type="checkbox" name="agreement" id="agreement" <c:if test="${factory.agreeProtocol==1 }">checked</c:if>>已阅读并同意<a href="${home }/common/protocol.htm">《倬利商家合作协议》</a>
  		</div>
  		<a class="submit-btn" onclick="submitFactory();" id="submitFctory">提交申请</a>
  	</div>
</body>
</html>
