<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>门店信息</title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />

	<link rel="stylesheet" type="text/css"href="${home }/style/global.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/popbox.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/textarea2.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/manage.show.css" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.date.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dynamicform.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.popbox.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.textarea2.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.tab2.js"></script>
	<script type="text/javascript" src="${home}/script/jquery.ajaxfileupload.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.file.js"></script>
	<script type="text/javascript" src="${home}/script/manage.area.js"></script>
	<script type="text/javascript" src="${home}/kinder/kindeditor.js"></script>
	<script type="text/javascript" src="${home}/script/select2.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.select2.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.select2.js"></script>
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
		ul.three_col li.colspan_3 div{
			margin-left:8%;
			margin-right:8%;
		}
		ul.three_col li.colspan_3 div input{
			width:30%;
		}
		
		div.box_title div{
			margin-left:8%;
			margin-right:8%;
		}
		div.box_title div textarea{
			width:100%;
			height:300px;
		}
		
		div.content ul{
			padding-left: 20px;
			padding-top: 10px;
		}
		div.content ul li {
			float: left;
			width: 200px;
			height: 30px;
			line-height: 30px;
		}
		div.content ul li input{
			vertical-align: middle;
		}
		#brands span{
			display:inline-block;
			margin:10px 20px 0 0;
			width:8em;
			overflow:hidden;
			white-space:nowrap;
			text-overflow:eclipse
		}
		#brands span input{
			position:relative;
			bottom:-3px
		}
		
	</style>
	<script type="text/javascript">
		function saveObject(){
			if(haux.dom.form.validate()){
				document.basic.submit();
			}
		}
		
		haux.dom.addEventHandler(window, "load", function(){
			
			//0.初始化文件上传附件
			var hiddenElement = document.getElementById("photoIds");
			var fileObj = new haux.component.File({display : "big-icon",
				hiddenElement : hiddenElement,
				containerElement : hiddenElement.parentNode,
				fileElement : document.getElementsByName("uploadFile")[0],
				maxCount : 5, 
				fileType : "image", 
				maxFileSize : 1*1024
			});
			
			initAreaBox(document.getElementById("province"), document.getElementById("city"), 
				document.getElementById("district"), "${bean.provinceId}", "${bean.cityId}", "${bean.countyId}");
			
			var srcPrefix = "/pmanager/factory/factory.do";
			var queryAjaxUrl = srcPrefix + "?op=queryForSelect";
			var getAjaxUrl = srcPrefix + "?op=get";
			var config = {targetElement : document.getElementsByName("refereeId")[0], 
					queryAjaxUrl : queryAjaxUrl,
					getAjaxUrl : getAjaxUrl,
					textProperty : ["name", "TITLE", "factoryName"], 
					inputPrompt : "请选择"
				};
				
			new haux.component.Select2(config);
			/* <c:if test="${readonly == true}">
			haux.dom.form.toView();
			</c:if> */
			
		});
	</script>		
	
</head>
<body >
	<div class="body_wrap">
		<form:form action="${home}/pmanager/factory/factory.do" modelAttribute="bean" 
			id="form" class="theme" name="basic" method="post">
			<input type="hidden" name="id" value="${bean.id}"/>
			<input type="hidden" name="op" value="save"/>
			<div class="tool_bar">
				<button type="button" onclick="history.back()" class="return">
					<i></i>
					返回
				</button>
				<c:if test="${readonly != true}">
				<button type="button" onclick="saveObject()" class="ok">
					<i></i>
					保存
				</button>
				</c:if>
				
			</div>
			<div id="content">
			<div class="box" style="position: relative;">
				<h3>
					基本信息
				</h3>
				<ul class="input three_col">
					<li class="mandatory">
						<label>
							商家名称：
						</label>
						<form:input path="name" cssClass="text required form-input"/>
					</li>
					<li class="mandatory">
						<label>
							商家联系人：
						</label>
						<form:input path="man" cssClass="text required form-input"/>
					</li>
					<li class="mandatory">
						<label>
							移动电话：
						</label>
						<form:input path="mobile" cssClass="text required form-input"/>
					</li>

					<li class="mandatory">
						<label>
							营业执照店名：
						</label>
						<form:input  path="licenseName" cssClass="text required form-input"/>
					</li>
					<li class="mandatory">
						<label>推荐商家：</label>
						
						<form:input path="refereeId" cssClass="required text" style="width:250px;"/>
					</li>
					<li class="mandatory">
						<label>地推人员：</label>
						
						<form:input path="sysUserId" cssClass="required text" style="width:250px;"/>
					</li>
					<li class="colspan_3 mandatory detail_address">
						<label>
							商家地址：
						</label>
						<select name="provinceId" class="required" id="province">
						</select>
						<select name="cityId" class="required" id="city">
						</select>
						<select name="countyId" class="required" id="district">
						</select>
						<form:input path="addr" cssClass="text required form-input"/>
					</li>
					
				
				</ul>
				<div class="clear"></div>
			</div>
			
			<div class="box_title">
				<h3>图片</h3>
				<div>
					<form:input path="photoIds" id="photoIds" type="hidden"/>
				</div>
			</div>
			</div>
		</form:form>
		
	</div>
</body>
</html>
