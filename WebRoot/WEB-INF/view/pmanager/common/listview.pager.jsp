<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<c:if test="${queryResult.rowCount > 0}">
	<div id="page_navigate_wrap">
	</div>
	<script>
		var pageNoRegexp = /pn=\d+/;
		function getNavigateUrl(pageIndex){
			if(isNaN(pageIndex))
				return null;
			var navigateUrl = location.origin + location.pathname;
			if(location.search){
				if(pageNoRegexp.test(location.search))
					navigateUrl += location.search.replace(pageNoRegexp, "pn=" + pageIndex);
				else
					navigateUrl += location.search + "&pn=" + pageIndex;
			}
			else{
				navigateUrl += "?pn=" + pageIndex;
			}
			return navigateUrl;
		}
		var rowCount = ${queryResult.rowCount};
		var pageCount = ${queryResult.pageCount};
		var pageNo = ${queryResult.pageNo};
		var pnParam = "${pnParam}" || "pn";
		var divElement = document.getElementById("page_navigate_wrap");
		
		divElement.addLink = function(text, pageNo, className){
			var aNode = document.createElement("a");
			aNode.innerHTML = text;
			aNode.className = className;
			aNode.href = getNavigateUrl(pageNo);
			this.appendChild(aNode)
		}

		//2.根据3个参数，确定可显示的直接按钮(6个+省略号)
		
		//显示 前4页+当前页(假按钮)+后4页+省略号
		var startPage = Math.max(pageNo - 4, 1);
		var endPage = Math.min(pageNo + 4, pageCount);
		if(pageNo > 1){
			divElement.addLink("上一页", pageNo - 1, "previous");
		}
		if(startPage > 1){
			divElement.addLink(1, 1);
		}
		if(startPage > 2){
			var spanNode = document.createElement("span");
			spanNode.innerHTML = "...";
			divElement.appendChild(spanNode);
		}
		for(var i = startPage; i <= endPage; i++){
			if(pageNo == i){
				divElement.addLink(i, null, "current");
			}
			else{
				divElement.addLink(i, i);
			}		
		}
	
		//3.如果不是最后一页，则需要显示“下一页”按钮
		if(endPage < pageCount - 2){
			var spanNode = document.createElement("span");
			spanNode.innerHTML = "...";
			divElement.appendChild(spanNode);
		}
		if(endPage < pageCount - 1){
			divElement.addLink(pageCount, pageCount);
		}
		if(pageNo != pageCount){
			divElement.addLink("下一页", pageNo + 1, "next");
		}
		
		//4.创建直接输页数的导航
		var spanNode = document.createElement("span");
		spanNode.appendChild(document.createTextNode("共" + pageCount + "页" + rowCount + "条数据"));
		divElement.appendChild(spanNode);
		
		spanNode = document.createElement("span");
		spanNode.style.color = "black";
		spanNode.appendChild(document.createTextNode(" 到第"));
		var inputNode = document.createElement("input");
		inputNode.id = "navigate_page_no";
		spanNode.appendChild(inputNode);
		spanNode.appendChild(document.createTextNode(" 页"));
		divElement.appendChild(spanNode);
		
		var aNode = document.createElement("a");
		aNode.id = "goto";
		aNode.onclick = function(){
			this.blur();
			var pageNo = document.getElementById("navigate_page_no").value;
			var targetUrl = getNavigateUrl(pageNo);
			if(targetUrl)
				aNode.href = targetUrl;
			else
				aNode.href = "#"; 
		}
		aNode.innerHTML = "确定";
		divElement.appendChild(aNode);
		
		
	</script>
</c:if>
<c:if test="${queryResult.rowCount == 0}">
	<div class="tb-combobar">
		<div class="item-not-img">
			
		</div>
		<div class="item-not-found">
			抱歉，没有找到相关的数据！
		</div>
	</div>
</c:if>

