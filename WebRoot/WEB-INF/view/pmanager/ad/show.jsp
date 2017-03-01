<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>广告位编辑</title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />

	<link rel="stylesheet" type="text/css"href="${home }/style/global.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/popbox.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/textarea2.css" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	<script type="text/javascript" src="${home}/script/jquery.ajaxfileupload.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.file.js"></script>
	
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
		div.box_title div{
			margin-left:8%;
			margin-right:8%;
		}
		div.box_title div textarea{
			width:100%;
			height:300px;
		}
	</style>
	<script type="text/javascript">
		
		function saveObject(){
			if(haux.dom.form.validate()){
				document.forms[0].submit();;
			}
		}
		
		haux.dom.addEventHandler(window, "load", function(){
			
			//初始化商家图片文件上传附件
			var hiddenElement = document.getElementById("adPhotoId");
			var fileObj = new haux.component.File({display : "big-icon",
				hiddenElement : hiddenElement,
				containerElement : hiddenElement.parentNode,
				fileElement : document.getElementsByName("uploadFile")[0],
				maxCount : 1, 
				fileType : "image", 
				maxFileSize : 1*1024
			});
			
			//初始化营业执照文件上传附件
			var hiddenElement = document.getElementById("contentPhotoId");
			var fileObj = new haux.component.File({display : "big-icon",
				hiddenElement : hiddenElement,
				containerElement : hiddenElement.parentNode,
				fileElement : document.getElementsByName("uploadFile")[0],
				maxCount : 1, 
				fileType : "image", 
				maxFileSize : 1*1024
			});
			
			/* var srcPrefix = "/pmanager/factory/factory.do";
			var queryAjaxUrl = srcPrefix + "?op=queryForSelect";
			var getAjaxUrl = srcPrefix + "?op=get";
			var config = {targetElement : document.getElementsByName("refereeId")[0], 
					queryAjaxUrl : queryAjaxUrl,
					getAjaxUrl : getAjaxUrl,
					textProperty : ["name", "TITLE", "factoryName"], 
					inputPrompt : "请选择"
				};
				
			new haux.component.Select2(config); */
			/* <c:if test="${readonly == true}">
			haux.dom.form.toView();
			</c:if> */
			
		});
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
		<form:form action="${home}/pmanager/ad/ad.do?op=save" modelAttribute="bean" 
			id="form" class="theme" name="basic" method="post">
			<input type="hidden" name="id" id="id" value="${bean.id}"/>
			
			<div class="box">
				<h3>
					基本信息
				</h3>
				<ul class="input two_col">
					<li>
						<label>标题：</label>
						<form:input path="title" cssClass="text required form-input"/>
					</li>
					<li>
						<label>url链接：</label>
						<form:input path="url" cssClass="text required form-input" />
					</li>
					
					<li class="mandatory">
						<label>排序：</label>
						<form:input path="seq" cssClass="text required int form-input" />
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
			<div class="box_title">
				<h3>广告位图片</h3>
				<div>
					<form:input path="adPhotoId" type="hidden"/>
				</div>
			</div>
			<div class="box_title">
				<h3>详情图片</h3>
				<div>
					<form:input path="contentPhotoId"  type="hidden"/>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>
