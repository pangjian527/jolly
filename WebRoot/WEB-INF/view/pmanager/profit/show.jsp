<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>新增配置</title>
		<link rel="stylesheet" type="text/css"href="${home }/style/global.css" />
		<link rel="stylesheet" type="text/css" href="${home}/style/popbox.css" />
		<link rel="stylesheet" type="text/css" href="${home}/style/textarea2.css" />
		
		<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
		<script type="text/javascript" src="${home}/script/haux.js"></script>
		<style type="text/css">
			div.box {
			    border: 1px solid #ccc;
			    margin-top: 65px;
			    width: 500px;
			    margin: auto;
			    margin-top: 50px;
     		}
     		
     		div.box ul li {
     			height:45px;
     			line-height:45px;
     		}
     		div.box ul li label{
    			width: 200px;
			    display: inline-block;
			    text-align: right;
			    font-size: 16px;
			    color: #b80505;
     		}
     		div.box ul li input{
     			height:30px;
     			text-indent:10px;
     		}
		</style>
		<script type="text/javascript">
			function saveObject(){
				var pushDirectOpenFactory = $("#pushDirectOpenFactory").val();
				var pushIndirectOpenFactory = $("#pushIndirectOpenFactory").val();
				var pushOrder = $("#pushOrder").val();
				var factoryOrder = $("#factoryOrder").val();
				var str = /^[0-9]+\.?[0-9]*$/;
				if(!str.test(pushDirectOpenFactory)){
					alert("地推直接开店提成");
					return ;
				}else if (!str.test(pushIndirectOpenFactory)){
					alert("地推间接开店提成")
					return ;
				}else if (!str.test(pushOrder)){
					alert("地推订单提成")
					return ;
				}else if (!str.test(factoryOrder)){
					alert("上级善加订单提成")
					return ;
				}
				
				document.forms[0].submit();
			}
		</script>

	</head>
	<body>
		<div class="body_wrap">
		<form action="${home}/pmanager/profit/profit_config.do" method="post" name="basic">
			<input type="hidden" name="op" value="save"/>
			<div class="tool_bar">
				<button type="button" onclick="history.back()" class="return">
					<i></i>
					返回
				</button>
				<button type="button" onclick="saveObject()" class="ok">
					<i></i>
					保存
				</button>
			</div>
			<div class="box">
				<h3>
					提成配置
				</h3>
				<ul >
					<li >
						<label>
							地推直接开店提成：
						</label>
						<input name="pushDirectOpenFactory" type="text" class="text required" value="0"  id="pushDirectOpenFactory"/>
						<span>(单位：元)</span>
					</li>
					<li >
						<label>
							地推间接开店提成：
						</label>
						<input name="pushIndirectOpenFactory" type="text" class="text required"  value="0" id="pushIndirectOpenFactory"/>
						<span>(单位：元)</span>
					</li>
					<li >
						<label>
							地推订单提成：
						</label>
						<input name="pushOrder" type="text" class="text required"  value="0" id="pushOrder"/>
						<span>(单位：%)</span>
					</li>
					<li >
						<label>
							上级商家订单提成：
						</label>
						<input name="factoryOrder" type="text" class="text required"  value="0"  id="factoryOrder"/>
						<span>(单位：%)</span>
					</li>
				</ul>
				<div class="clear"></div>
			</div>
		</form>
		</div>
	</body>
</html>
