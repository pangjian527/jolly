<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>我的积分</title>
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	<link href="${home}/style/scroller.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${home}/script/jquery.js"></script>	
	<script type="text/javascript" src="${home}/script/iscroll-probe.js"></script>
	<script type="text/javascript" src="${home}/script/mwebmall/scroller.js"></script>
	<style type="text/css">
	
		div.scwrapper{
			min-width: 320px;
		    max-width: 640px;
		    margin: 0 auto;
		}
		
		div.score-list-box ul li{
			  height: 50px;
			  background-color: white;
			  padding: 10px 10px;
			  font-size: 14px;
			  border-bottom: 1px solid #e4e4e4;
		}
		
		div.base-info{
			display: block;
  			color: #262629;
  			float: left;
		}
		div.base-info label{
			 font-size: 18px;
		}
		div.base-info span{
			display: block;
  			color: #999;
		}
		div.score{
			  float: right;
		}
		div.score span{
			  font-size: 25px;
			  color: #f23030;
		}
		
	</style>
	
	<script type="text/javascript">
		var myScroll ,pn  = 1,totalPage = ${totalPage};
		window.onload = function(){
			createScroll("score-list-box",
					function(){
						window.location.reload(true);
					},
					function(){
						//只有总页数大于当前的页数才加载
			        	if(totalPage>pn){
			        		pn++;
			        		loadScoreData();
			        	}
					});
		}
		
		/*  start 下拉分页，异步加载数据 */
		function loadScoreData(){
			var data = new Object();
			data.pn = pn;
			$.ajax({
				type:"post",
				url:"${home}/mmall/home/index.do?op=listScoreAsync",
				data:data,
				success:function(data){
					//创建
					createScoreItem(data);
				}
			});
		}	
		
		function createScoreItem(data){
			var scoreData = JSON.parse(data);
			var scoreList=scoreData.scoreList;
			if(scoreList){
				var ulEle = document.getElementById("score-list-ul");
				var factory = scoreData.factory;
				for(var i=0;i<scoreList.length;i++){
					var scoreRow = scoreList[i];
					var liEle = document.createElement("li");
					
					var baseInfoDiv = document.createElement("div");
					baseInfoDiv.className = "base-info";
					
					var labelEle = document.createElement("label");
					labelEle.className="factory-name";
					labelEle.innerHTML = factory.name;
					
					var timeSpanEl = document.createElement("span");
					timeSpanEl.className = "achieve-time";
					timeSpanEl.innerHTML = formatDate(scoreRow.create_time)+" "+scoreRow.source;
					
					baseInfoDiv.appendChild(labelEle);
					baseInfoDiv.appendChild(timeSpanEl);
					
					var scoreDiv = document.createElement("div");
					scoreDiv.className="score";
					
					var scoreSpan = document.createElement("span");
					scoreSpan.innerHTML=scoreRow.score;
					
					scoreDiv.appendChild(scoreSpan);
					
					liEle.appendChild(baseInfoDiv);
					liEle.appendChild(scoreDiv);
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
	</script>
		
</head>
<body>
	<div class="scwrapper">
		<c:if test="${!empty queryResult.rows }">
			<div class="score-list-box scroller-div" id="score-list-box">
				<div id="scroller">
					<ul id="score-list-ul">
						<c:forEach items="${queryResult.rows }" var="row">
							<li>
								<div class="base-info">
									<label class="factory-name">${factory.name }</label>
									<span class="achieve-time">
									<fmt:formatDate value="${row.create_time}" pattern="yyyy-MM-dd"/>
									${row.source}</span>
								</div>
								<div class="score">
									<span>${row.score}</span>
								</div>
							</li>
							
						
						</c:forEach>
					</ul>
				</div>
			</div>
		</c:if>
		<c:if test="${empty queryResult.rows }">
			<div class="no-data-box">
				<h3>没有找到相关数据</h3>
			</div>
		</c:if>
	</div>
</body>
</html>