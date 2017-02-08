<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="page-nav">
	<div>
<c:choose>
  <c:when test="${queryResult.rowCount > 0}">
		<script type="text/javascript">
			function ${pageData.jsFunName}(pageNo) {
				pageNo = parseInt(pageNo);
				if (isNaN(pageNo) || pageNo<1) {
					alert('请输入有效的页码');
					return;
				}
				var url = '${pageData.homeUrl}';
				if(pageNo>${queryResult.pageCount}){
					pageNo = ${queryResult.pageCount};
				}
				url += '&page='+pageNo;	
				loadPage('${pageData.jsFunName}',url);				
			}
		</script>
	<c:choose>
    <c:when test="${queryResult.hasPrevPage}">
    	<a href="${pageData.home}" class="previous">首页</a>
		<a href="${pageData.prevPage}" class="prev previous">上一页</a>
    </c:when>
    <c:otherwise>
    	<a class="current previous">首页</a>
    	<a class="current previous">上一页</a>
    </c:otherwise>
  </c:choose>
  <c:choose>
    <c:when test="${queryResult.hasNextPage}">
    	<span>...</span>
    	<a href="${pageData.nextPage}"  class="next">下一页</a>
		<a href="${pageData.endPage}" class="previous">尾页</a>
    </c:when>
    <c:otherwise>
    	<a class="current previous">下一页</a>
    	<a class="current previous">尾页</a>
    </c:otherwise>
  </c:choose>
  <span>共${queryResult.rowCount}条记录&nbsp;${queryResult.pageNo}/${queryResult.pageCount}页</span>
  <span style="color: black;"> 
	到第<input id="${pageData.jsFunName}_txtPage"> 页
  </span>
  <a id="goto" href="javascript:void(0);" onclick="${pageData.jsFunName}(document.getElementById('${pageData.jsFunName}_txtPage').value);" >确定</a>
  <div class="clear"></div>
 </c:when>
<c:otherwise>
  <span class="fred">暂无记录</span>
</c:otherwise>
</c:choose>
	</div>
</div>