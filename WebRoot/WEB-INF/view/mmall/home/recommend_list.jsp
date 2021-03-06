<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>我的推荐</title>
	<link rel="icon" href="${home}/favicon.ico" type="image/x-icon" />
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	<link href="${home}/style/scroller.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${home}/script/jquery.js"></script>	
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=2f0t0ylElcF05UYfrDgY8tGR55cAXtP6"></script>
	<script type="text/javascript" src="${home}/script/mwebmall/haux.mobile.js"></script>
	<script type="text/javascript" src="${home}/script/iscroll-probe.js"></script>
	<script type="text/javascript" src="${home}/script/mwebmall/scroller.js"></script>
	<style type="text/css">
	
		div.scwrapper{
		    min-width: 320px;
		    max-width: 640px;
		    margin:0  auto;
		}
		
		div.scwrapper ul li span{
			right: 10px;
  			position: absolute;
		}
		div.recommend-menu-box{
			height: 50px;
			background-color: #f3f3f3;
		}
		div.recommend-menu-box ul li {
		  width: 50%;
		  float: left;
		  text-align: center;
		  line-height: 45px;
		}	
		div.recommend-menu-box ul li label.active{
			  border-bottom: 2px solid #E73C3C;
			  padding: 15px 10px;
			  color: #E73C3C;
		}
		
		div.recommend-list-box{
			  top:50px;
		}
		
		div.recommend-list-box ul li{
			  height: 50px;
			  padding: 10px 10px;
			  font-size: 16px;
			  border-bottom: 1px solid #e4e4e4;
			  line-height: 50px;
			  position: relative;
		}
		
		#contentDiv-1{
			position: absolute;
			top: 50px;
			bottom: 0px;
			left:0;
			right:0;
		}  
		
	</style>
	
	<script type="text/javascript">
	
	var map ;
	var markerArrStr = '${factoryJsonArray}';
	var gpsX= '${factory.gpsX}', gpsY= '${factory.gpsY}',factoryName='${factory.name}';
	
	 var myScroll ,pn  = 1,totalPage = ${totalPage};
	function initBody(){
		initBaiduMapBody();
		createScroll("contentDiv-2",
				function(){
					window.location="${home}/mmall/home/index.do?op=recommendList&indexNum=2";
				},
				function(){
					//只有总页数大于当前的页数才加载
		        	if(totalPage>pn){
		        		pn++;
		        		loadRecommendData();
	        	}}
		);
		if('${indexNum}'){
			showContentDiv('${indexNum}');
		}else{
			showContentDiv(1);
		}
	}
	
	/*  start 下拉分页，异步加载数据 */
	function loadRecommendData(){
		var data = new Object();
		data.pn = pn;
		$.ajax({
			type:"post",
			url:"${home}/mmall/home/index.do?op=listRecommendAsync",
			data:data,
			success:function(data){
				//创建
				createRecommendItem(data);
			}
		});
	}	
	
	function createRecommendItem(data){
		var recommendData = JSON.parse(data);
		var recommendList=recommendData.recommendList;
		if(recommendList){
			var ulEle = document.getElementById("recommend-list-ul");
			for(var i=0;i<recommendList.length;i++){
				var recommendRow = recommendList[i];
				var liEle = document.createElement("li");
				
				var labelEle = document.createElement("label");
				labelEle.className="factory-name";
				labelEle.innerHTML = recommendRow.name;
				
				var timeSpanEl = document.createElement("span");
				timeSpanEl.innerHTML = formatDate(recommendRow.create_time);
				
				liEle.appendChild(labelEle);
				liEle.appendChild(timeSpanEl);
				ulEle.appendChild(liEle);
			}
		}
	}
	
	function formatDate (targetDate) {  
		var date = new Date(targetDate.time);
	    var y = date.getFullYear();  
	    var m = date.getMonth() + 1;  
	    m = m < 10 ? '0' + m : m;  
	    var d = date.getDate();  
	    d = d < 10 ? ('0' + d) : d;  
	    return y + '-' + m + '-' + d;  
	}
	
	function initBaiduMapBody() {
		//1. 获取
		map = new BMap.Map("contentDiv-1");     
	    // 创建地图实例  
		var point = new BMap.Point(gpsX, gpsY);  			  // 创建点坐标  
		map.centerAndZoom(point, 16);                 // 初始化地图，设置中心点坐标和地图级别  
		map.enableScrollWheelZoom(true); //启用滚轮放大缩小
		var marker=createMarker(point,factoryName);
		map.addOverlay(marker); 
		//marker.dispose();//释放内存
		
		//平移，缩放控件
		map.addControl(new BMap.NavigationControl());
		//比例尺控件
		map.addControl(new BMap.ScaleControl());
		//缩略图
		map.addControl(new BMap.OverviewMapControl());
		//地图类型
		map.addControl(new BMap.MapTypeControl());
		//地图类型
		map.addControl(new BMap.GeolocationControl());
		
         var markerArr = new Array();
         if(markerArrStr){
        	 markerArr = JSON.parse(markerArrStr);
         }
         for (var i = 0; i < markerArr.length; i++) {
             var p0 = markerArr[i].gpsX; //
             var p1 = markerArr[i].gpsY; //按照原数组的point格式将地图点坐标的经纬度分别提出来
             var point = new window.BMap.Point(p0, p1); 
             map.addOverlay(createMarker(point,markerArr[i].name));
         }
         
        /*  var geolocation = new BMap.Geolocation();
 		geolocation.getCurrentPosition(function(r){
 			if(this.getStatus() == BMAP_STATUS_SUCCESS){
 			var mk = new BMap.Marker(r.point);
 			map.addOverlay(mk);
 			map.panTo(r.point);
 			alert('您的位置：'+r.point.lng+','+r.point.lat);
 			}
 			else {
 			alert('failed'+this.getStatus());
 			}        
 		},{enableHighAccuracy: true}) */
		
	};
	
	function createMarker(point,titleRemark){
		var marker = new window.BMap.Marker(point); //按照地图点坐标生成标记
        marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
        var label = new window.BMap.Label(titleRemark, { offset: new window.BMap.Size(20, -10) });
        marker.setLabel(label);
		return marker;
	}
	
	
	function showContentDiv(indexNum){
		var obj = document.getElementById("menu-"+indexNum)
		var ulEle = obj.parentNode;
		var labelEles=ulEle.getElementsByTagName("label");
		for(var i=0;i<labelEles.length;i++){
			if(obj.children[0]==labelEles[i]){
				obj.children[0].className="active";
			}else{
				labelEles[i].className="";
				
			}
		}
		for(var i=1;i<=2;i++){
			if(i==indexNum){
				document.getElementById("contentDiv-"+indexNum).style.display = "";
			}else{
				document.getElementById("contentDiv-"+i).style.display = "none";
			}
		}
		
	}
	</script>
	<jsp:include page="../initWeixin.jsp"/>
</head>
<body>
	<div class="scwrapper">
		<div class="recommend-menu-box">
			<ul>
				<li id="menu-1" onclick="showContentDiv(1)">
					<label class="active">地图显示</label>
				</li>
				<li id="menu-2" onclick="showContentDiv(2)">
					<label>列表显示</label>
				</li>
			</ul>
		</div>
		<div class="show-map-box" id="contentDiv-1">
		</div>
		<div class="recommend-list-box scroller-div" id="contentDiv-2">
			<c:if test="${!empty queryResult.rows }">
				<div id="scroller">
					<ul id="recommend-list-ul">
						<c:forEach items="${queryResult.rows }" var="row">
							<li>
								<label class="factory-name">${row.name }</label>
								<span><fmt:formatDate value="${row.create_time}" pattern="yyyy-MM-dd"/></span>
							</li>
						
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<c:if test="${empty queryResult.rows }">
				<div class="no-data-box">
					<h3>没有找到相关数据</h3>
				</div>
			</c:if>
		</div>
		
	</div>
</body>
</html>