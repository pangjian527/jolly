<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>商品信息管理</title>
	<link rel="stylesheet" type="text/css" href="${home}/style/global.css" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.date.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.popbox.js"></script>
		<script type="text/javascript" src="${home}/script/manage.query.js"></script>
	
	<style type="text/css">
		.col0{width: 40px;}
		.col1{width:auto;}
		.col2{width: 100px;}
		.col3{width: 100px}
		.col4{width: 200px}
		.col5{width: 100px}
		.col6{width: 100px}
		.col7{width: 100px}
		.col8{width: 50px}
		.col9{width: 50px}
		.col10{width: 100px}
	</style>
	
	<script type="text/javascript">
		var queryCondition = ${queryCondition};	
	
		function effective(productId){
			if(confirm("确定下架吗？")){
				$.ajax({
					type:"post",
					url:"${home}/pmanager/product/product.do?op=effective",
					data:{productId:productId},
					success:function(data){
						if(data.error){
							alert("失败");
						}else{
							alert("上架成功！");
							window.location.reload();
						}
					}
				});
			}
		}
		
		function distable(productId){
		
			if(confirm("确定下架吗？")){
				$.ajax({
					type:"post",
					url:"${home}/pmanager/product/product.do?op=distable",
					data:{productId:productId},
					success:function(data){
						if(data.error){
							alert("失败");
						}else{
							alert("上架成功！");
							window.location.reload();
						}
					}
				});
			}
		}
		
		function showOptions(){
			var opts=[{"id":"mobile_battery","text":"手机电池","code":null},
			          {"id":"mobile_screen","text":"屏幕总成","code":null},
			          {"id":"other","text":"其他","code":null}];
			var documentFrame=document.createDocumentFragment();
			
			var divElement=document.createElement("div");
			divElement.className="options";
			var dlElement=document.createElement("dl");
			
			for(var i=0;i<opts.length;i++){
				var ddElement=document.createElement("dd");
				
				var aElement=document.createElement("a");
				aElement.innerHTML=opts[i].text;
				aElement.href="###";
				
				ddElement.onclick=function(id){
					return function(){
						window.location=getActionPath() + "?op=add&product_category="+id;
					}
				}(opts[i].id)
				
				ddElement.appendChild(aElement);
				dlElement.appendChild(ddElement);
			}
			divElement.appendChild(dlElement);
			divElement.addClearElement();
			
			documentFrame.appendChild(divElement);

			showPopboxInRelativePos(documentFrame, document.getElementById("add_product"), [6, 11], "pop_menu", 0, 0, "click_other");
		}
		
	</script>
		
</head>
<body>
<div class="body_wrap">
	<form action="${home}/pmanager/product/product.do" method="get" name="common_query" id="basic" class="theme">
		<input type="hidden" name="op" value="query"/>
		<div class="query" >
			<ul class="input three_col">
				<li>
					<label>商品名称：</label>
					<input placeholder="商品名称" type="text" class="text form-input" name="name"/>
				</li>
				<li>
					<label>商品品类：</label>
					<span class="span">
						<input type="radio" class="radio" name="category" value="" checked="checked"/>
						不限
					</span>
					<span class="span">
						<input type="radio" class="radio" name="category" value="MOBILE_BATTERY"/>
						手机电池
					</span>
					<span class="span">
						<input type="radio" class="radio" name="category" value="MOBILE_SCREEN"/>
						屏幕总成
					</span>
					<span class="span">
						<input type="radio" class="radio" name="category" value="OTHER"/>
						其他
					</span>
				</li>
				<li>
					<label>商品品牌：</label>
					<select name="brandId">
						<option value="">全部</option>
						<c:forEach items="${brandList }" var="brand">
							<option value="${brand.id }">${brand.name }</option>
						</c:forEach>
					</select>
				</li>
			</ul>
			<div class="operate" >
				<button id="search" onclick="query.call(this)" class="search">
					<i></i>
					查询
				</button>
			</div>
		</div>
	</form>
	<div class="query_result">
		<h1>
			<b></b>
			<label>商品信息记录</label>
			<span>共有${queryResult.rowCount}条数据</span>
			<s>
				<button type="button" class="add" id="add_product" onclick="showOptions()">
					<i></i>
					新增
				</button>
			</s>
		</h1>
		<table>
			<col class="col0" />
			<col class="col1" />
			<col class="col2" />
			<col class="col3" />
			<col class="col4" />
			<col class="col5" />
			<col class="col6" />
			<col class="col7" />
			<col class="col8" />
			<col class="col9" />
			<col class="col10" />
		<thead>
			<tr>
			    <th>No.</th>
			    <th>名称</th>
				<th>批发价格</th>
				<th>市场价</th>
				<th>容量</th>
				<th>实际销量</th>
				<th>虚拟销量</th>
				<th>适用品牌</th>
				<th>状态</th>
				<th>库存</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${queryResult.rows}" var="data" varStatus="idx">
				<tr>
					<td>${idx.index+1 }</td>
					<td>${data.name }</td>
					<td>${data.price }</td>
					<td>${data.price_mart }</td>
					<td>${data.capacity }</td>
					<td>${data.sale_count }</td>
					<td>${data.virtual_count }</td>
					<td>${data.apply_brand }</td>
					<td>
						<c:if test="${data.status == 0}">
							已删除
						</c:if>
						<c:if test="${data.status == 1}">
							已上架
						</c:if>
						<c:if test="${data.status == 2}">
							待上架
						</c:if>
						<c:if test="${data.status == 3}">
							已下架
						</c:if>
					</td>
					<td>${data.stock_count }</td>
					<td>
						<c:if test="${data.status == 1}">
							<a href="javascript:void(0)" onclick="distable('${data.id }');">
								下架
							</a>
						</c:if>
						<c:if test="${data.status != 1}">
							<a href="javascript:void(0)" onclick="effective('${data.id }');">
								上架
							</a>
						</c:if>
						<a href="${home}/pmanager/product/product.do?op=inStockExecute&productId=${data.id }">
							入库
						</a>
						<a href="javascript:void(0)" onclick="editObject('${data.id }');">
							修改
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="navigate">
		<c:import url="../common/listview.pager.jsp" />
	</div>	
	</div>
</div>
</body>
</html>
