<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>商家地图打点</title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />

	<link rel="stylesheet" type="text/css"href="${home }/style/global.css" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=92b6dd786e4fd39c19911324efeaa18b"></script>
	<style type="text/css">		
		.gis-box{
			border:1px solid #ccc;
			position:absolute;
			left:0;
			right:0;
			bottom:0;
			top:155px
		}
		.search_box{display: block;left: 15px;position: absolute;top: 170px;z-index: 200;}
    	.search_box .icon{background: url('${home}/image/select2.png') no-repeat -40px -20px;display: block;position: absolute;width:22px;height:22px;top:5px;left:4px;}
    	.input-plain{border: 1px solid #c9c9c9;border-radius: 2px;
    		box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.1);padding-left: 30px;width: 285px;
    		color: #333;height: 23px;line-height: 17px;margin: 5px 0;}
    	.btn-default{ background-color: #ff7e28;font-weight: bold;min-width: 54px;border: 1px solid #ff7617;
    		border-radius: 2px;box-sizing: border-box;color: #fff;cursor: pointer;height: 27px;}
	</style>
	<script type="text/javascript">
		function saveObject(){
			//0.验证
			var gpsX = document.getElementsByName("gpsX")[0].value;
			var gpsY = document.getElementsByName("gpsY")[0].value;
			//1.
			var src = home() + "/pmanager/factory/factory.do?op=saveGps&id=${bean.id}&gpsX=" + gpsX + "&gpsY=" + gpsY;
			Dialog.confirm({
				content: "确认提交商家GPS坐标", 
				title : "提交商家坐标",
				ok:function(){
					window.location = src;
				}
			});
		}
		var map = null;		
		var myGeo = new BMap.Geocoder();// 创建地址解析器实例
		var zoom = 13;
		
		haux.dom.addEventHandler(window, "load", function(){
			baiduMap();
			alertInput();
		});
		
		function baiduMap(){
			map = new BMap.Map("allmap");
			var point;
			<c:if test="${not empty bean.gpsX && not empty bean.gpsY}">
			point = new BMap.Point(${bean.gpsX},${bean.gpsY});
			map.centerAndZoom(point, zoom);
			
			var marker = new BMap.Marker(point);  // 创建标注
			map.addOverlay(marker);               // 将标注添加到地图中
			marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画	
			marker.enableDragging(); //marker可拖拽
			marker.addEventListener("dragend", function() {
			    point = marker.getPosition(); // 重新获取点坐标
			    $('#gpsX').val(point.lng);
				$('#gpsY').val(point.lat);
			});
			</c:if>
			<c:if test="${empty bean.gpsX || empty bean.gpsY}">
			map.centerAndZoom("${city.name}",zoom);
			</c:if>
			
			map.enableScrollWheelZoom();
			map.addEventListener("zoomend", function(){   
				zoom = this.getZoom();
			});
		}
		
		function theLocation(){
			var city = document.getElementById("location_text").value;
			if(city != ""){
				map.clearOverlays();
				// 将地址解析结果显示在地图上,并调整地图视野
				myGeo.getPoint(city, function(point){
					if (point) {
						map.centerAndZoom(point, zoom);
						var marker = new BMap.Marker(point);  // 创建标注
						map.addOverlay(marker);               // 将标注添加到地图中
						marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画	
						marker.enableDragging(); //marker可拖拽
						//alert('text='+'gpsX='+point.lng+' gpsY='+point.lat);
						$('#gpsX').val(point.lng);
						$('#gpsY').val(point.lat);
						marker.addEventListener("click", function(e){
							point = marker.getPosition();//重新获取marker的位置
						    $('#gpsX').val(point.lng);
							$('#gpsY').val(point.lat);
					    })
					    //停止拖拽地图时触发。 
						marker.addEventListener("dragend", function() {
						    point = marker.getPosition(); // 重新获取点坐标
						    $('#gpsX').val(point.lng);
							$('#gpsY').val(point.lat);
						});
					}
				});
			}
		}
		//输入提示
		function alertInput(){
			var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
				{"input" : "location_text"
				,"location" : map
			});
			ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
				var str = "";
				var _value = e.fromitem.value;
				var value = "";
				if (e.fromitem.index > -1) {
					value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
				}    
				str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
				value = "";
				if (e.toitem.index > -1) {
					_value = e.toitem.value;
					value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
				}    
				str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
				$("#searchResultPanel").html(str);
			});
			var myValue;
			ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
				var _value = e.item.value;
				myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
				$("#searchResultPanel").html("onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue);
				theLocation();
			});
		}
		
		function addPoint(){
			map.addEventListener("click",function(e){
				map.clearOverlays();//清除地图原来节点
				point = new BMap.Point(e.point.lng,e.point.lat);
				map.panTo(point,2000);
				
				//map.centerAndZoom(point,zoom); 
				var marker = new BMap.Marker(point);  // 创建标注
				map.addOverlay(marker);               // 将标注添加到地图中
				marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画	
				marker.enableDragging(); //marker可拖拽
				$('#gpsX').val(point.lng);
				$('#gpsY').val(point.lat);
				
				marker.addEventListener("click", function(e){
					point = marker.getPosition();//重新获取marker的位置
			    });
				//停止拖拽地图时触发。 
				marker.addEventListener("dragend", function() {
				    point = marker.getPosition(); // 重新获取点坐标
				    $('#gpsX').val(point.lng);
					$('#gpsY').val(point.lat);
				});
				//map.setDefaultCursor("cursor");
			});
			map.setDefaultCursor("crosshair");
		}
	</script>		
</head>
<body style="height: 100%;">
	<div class="body_wrap" style="height: 100%;">
		<form:form action="${home}/pmanager/factory/factory.do?op=save" modelAttribute="bean" 
			id="form" class="theme" name="basic" method="post">
			<c:if test='${readonly == false}'>
				<input type="hidden" name="id" value="${factory.id}"/>
			</c:if>
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
			<div class="box" style="position: relative;">
				<h3>
					${bean.name}
					
				</h3>
				<p style="padding-left: 10px;">${fullAddress}</p>
				<ul class="input two_col">
					<li class="mandatory">
						<label>
							GPS-X：
						</label>
						<input id="gpsX" type="input" name="gpsX" cssClass="text required form-input" value="${bean.gpsX}" />
					</li>
					<li class="mandatory">
						<label>
							GPS-Y：
						</label>
						<input id="gpsY" type="input" name="gpsY" cssClass="text required form-input" value="${bean.gpsY}" />
					</li>
				</ul>
				<div class="clear"></div>
			</div>
			<div id="search" class="search_box">
				<span class="icon"></span>
		         <input type="text" placeholder="请输入你的大概位置找附近店铺" class="input-plain" id="location_text">
		         <input type="button" class="btn-default" value="搜索" onclick="theLocation();">&nbsp;
		         <input type="button" class="btn-default" value="描点" onclick="addPoint();">
		      	 <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
		    </div>
			<div class="gis-box" id="allmap">
				百度地图操作DIV
			</div>
		</form:form>
	</div>
</body>
</html>
