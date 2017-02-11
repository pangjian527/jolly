<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>添加商品</title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${home}/style/style.css" />
	<style type="text/css">
		div.t_w{
            margin-top:100px;
        }

        div.stock_result_panel{
            width:600px;
            margin:auto;
            border:1px solid #ccc;
            text-align:center;
            padding:10px 0
        }

        div.stock_scan_panel{
            width:600px;
            margin:auto;
            margin-top:20px;
            height:50px;
        }
	</style>
	<script type="text/javascript">
		function saveObject(){
		
			var securityCode = document.getElementById("securityCode").value;
			var productId = document.getElementById("productId").value;
			
			if(securityCode.length < 10){
				alert("防伪码错误，请重新输入");
				return ;
			}
		
			$.ajax({
				type:"post",
				url:"${home}/pmanager/product/product.do?op=inStock",
				data:{securityCode:securityCode,productId:productId},
				success:function(data){
					if(data.error){
						document.getElementById("code_desc").innerHTML=securityCode;
						document.getElementById("code_result").innerHTML= "入库失败";
						alert("失败");
					}else{
						document.getElementById("code_desc").innerHTML=securityCode;
						document.getElementById("code_result").innerHTML= "入库成功";
					}
				}
			});
		}
	</script>		
	
</head>
<body>
	<div class="t_w">
	    <div class="stock_result_panel">
	        <label id="code_desc" style="font-size:50px;font-weight:bold;"></label>
	        <span id="code_result" style="color:green;font-size:50px;">请扫描防伪码</span>
	    </div>
	    <div class="stock_scan_panel">
	    	<input type="hidden" name="productId" id="productId" value="${productId}"/>
	        <input placeholder="请输入或扫描防伪码" name="securityCode" id="securityCode" style="height:50px;width:470px;text-indent:10px;font-size:18px;"/>
	        <button onclick="saveObject()" style="vertical-align: top;height:55px;width:120px;font-size:18px;border:1px solid red;background:red;color:white;">入库</button>
	    </div>
	</div>
</body>
</html>
