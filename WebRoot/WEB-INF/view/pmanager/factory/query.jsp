<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<%@ taglib prefix="hh" uri="permission"%>  
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>门店管理</title>
	<link rel="stylesheet" type="text/css" href="${home}/style/global.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/popbox.css" />
	
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.date.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.popbox.js"></script>
	<script type="text/javascript" src="${home}/script/manage.area.js"></script>
	<script type="text/javascript" src="${home}/script/manage.query.js"></script>
	<style type="text/css">
		.col0{width: 40px;}
		.col1{width: 12%;}
		.col2{width: 140px}
		.col3{width: 250px}
		.col4{width: 130px}
		.col5{width: 100px}
		.col6{width: 200px}
		.col7{width: 100px}
		.col8{width: auto}

		div.body_wrap div.query ul li.colspan_2 div{
			display: inline-block;
		}
		div.body_wrap div.query ul li.colspan_2 div select{
			width:100px;
		}
		#province, #city, #district{
			width:80px
		}
		#addr{
			width:180px
		}
		td p{
			color:#999;
			margin-top:8px
		}
		dl dd a {
		    display: inline-block;
		    width: 100%;
		    height: 100%;
		    padding-left: 10px;
		    font-size: 14px;
		    font-family: "微软雅黑";
		}
	</style> 
	
	<script type="text/javascript">
		var queryCondition = ${queryCondition};
		var baseActionUrl = "${home}/pmanager/factory/factory.do";
		
		
		function uploadLocation(){
			window.location.href = '${home}/pmanager/factory/factory.do?op=uploadLocation';
		}
		
		//打开百度地图，手工打点定位
		function locateObject(id){
			window.location.href = '${home}/pmanager/factory/factory.do?op=locateGps&id=' + id;
		}
		
		//复制
		function cloneObject(id){
			var src = baseActionUrl + "?op=clone&id=" + id;
			window.location = src;
		}
		
		//申请结算
		function submitBill(factoryId){
			var url = '${home}/pmanager/billdetail/bill_detail.do?op=checkout&factoryId='+factoryId;
			haux.component.Dialog.confirm({content :"您正在发起商家账单结算",
				title : "结算申请",
				ok:function(){
					Dialog.open({url : url, 
						title : "操作结果", 
						width : 600, 
						height : 400,
						onClose : function(){
							window.location.reload();
						}
					});
				}
			});
		}
		
	</script>
		
</head>
<body>
<div class="body_wrap">
	<form action="${home}/pmanager/factory/factory.do" method="get" name="common_query" id="basic" class="theme">
		<input type="hidden" name="op" value="query"/>
		<div class="query" >
			<ul class="input three_col">
				<li>
					<label>商家名称：</label>
					<input placeholder="商家名称" type="text" id="name" class="text form-input" name="name" value=""/>
				</li>
				<li>
					<label>电话：</label>
					<input placeholder="电话号码" type="text" id="mobile" class="text form-input" name="mobile" value=""/>
				</li>
				<li>
					<label>状态：</label>
					<span class="span">
						<input type="radio" class="radio" name="status" value="" checked="checked"/>
						不限
					</span>
					<span class="span">
						<input type="radio" class="radio" name="status" value="1"/>
						已上架
					</span>
					<span class="span">
						<input type="radio" class="radio" name="status" value="2"/>
						待审核
					</span>
					<span class="span">
						<input type="radio" class="radio" name="status" value="3"/>
						草稿
					</span>
					<span class="span">
						<input type="radio" class="radio" name="status" value="4"/>
						被下架
					</span>
					<span class="span">
						<input type="radio" class="radio" name="status" value="0"/>
						已删除
					</span>
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
			<label>门店记录</label>
			<span>共有${queryResult.rowCount}条数据</span>
			<s>
				<button type="button" class="add" id="add_factory" onclick="addObject(this)">
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
		<thead>
			<tr>
			    <th>No.</th>
				<th>商家名称</th>
				<th>联系方式</th>
				<th>商家地址</th>
				<th>推荐商家</th>
				<th>推荐职员</th>
				<th>状态</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${queryResult.rows}" var="data" varStatus="idx">
				<tr>
					<td>${idx.index+1 }</td>
					<td>${data.name }</td>
					<td>
						${data.man }
						<p>${data.mobile }</p>
					</td>
					<td>
						${data.addr }
						<p>${data.areaname }</p>
					</td>
					<td>${data.referee_name }</td>
					<td>${data.sys_user_name }</td>
					<td>
						<!-- 
						<c:if test='${data.status == 0}'>未上架</c:if>
						<c:if test='${data.status == 1}'>已上架</c:if>
						<c:if test='${data.status == -1}'>已删除</c:if>
						 -->
						<c:if test='${data.status == 0}'>
							无效
							<p>已删除, 不可恢复</p>
						</c:if>
						<c:if test='${data.status == 1}'>
							有效
							<p>门店正常营业中</p>
						</c:if>
						<c:if test='${data.status == 2}'>
							待审核
							<p>请尽快完成审核,以便门店正常开业</p>
						</c:if>
						<c:if test="${data.status == 3 }">
							草稿
							<p>商家尚未提交审核, 无需处理</p>
						</c:if>
						<c:if test="${data.status == 4 }">
							下架
							<p>已被人为下架</p>
						</c:if>
					</td>
					<td><fmt:formatDate value="${data.create_time}" pattern="yyyy-MM-dd"/></td>
					<td>
						<a href="javascript:void(0)" onclick="showObject('${data.id}');">查看</a>
						
						<c:if test='${data.status != 2}'>
						<a href="javascript:void(0)" onclick="editObject('${data.id}');">修改</a>
						</c:if>
						<c:if test="${data.status != 0 }">
						<a href="javascript:void(0)" onclick="locateObject('${data.id}');">定位</a>
						</c:if>
						<c:if test="${data.status == 2 }">
							<a href="javascript:void(0)" onclick="confirmObject('${data.id}', '审核通过', '批准门店  ${data.name}上架开业');">批准</a>
							<a href="javascript:void(0)" onclick="rejectObject('${data.id}', '审核不通过', '驳回门店  ${data.name}的上架请求');">驳回</a>
						</c:if>
						<c:if test='${data.status == 3}'>
							<a href="javascript:void(0)" onclick="submitObject('${data.id}', '上架', '批准门店上架，${data.name}能够开始在商城销售服务');">
								申请上架
							</a>
						</c:if>
						<c:if test='${data.status == 4}'><!-- 已下架的商品 ,允许重新 申请上架 -->
							<a href="javascript:void(0)" onclick="submitObject('${data.id}', '上架', '申请门店上架，${data.name}申请在商城进行销售服务');">
								申请上架
							</a>
						</c:if>
						<c:if test='${data.status == 1}'>
							<a href="javascript:void(0)" onclick="disableObject('${data.id}', '上架', '门店下架，停止${data.name}在好胎屋商城的销售权利');">
								直接下架
							</a>
						</c:if>
						<c:if test='${data.status == 2}'>
							<hh:permission m='business'>
								
							</hh:permission>
						</c:if>
						<c:if test='${data.status != 0}'>
							<a href="javascript:void(0)" 
								onclick="deleteObject('${data.id}', '删除门店', '删除门店${data.name}，数据删除后将不可恢复！');">删除</a>
						</c:if>
						<a href="${home}/pmanager/factory/factory.do?op=factoryScore&id=${data.id}">积分</a>
						<a href="javascript:submitBill('${data.id}')">账单结算</a>
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
