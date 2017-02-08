<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="page-nav">
	<div>
<c:choose>
  <c:when test="${queryResult.rowCount > 0}">
	<c:choose>
    <c:when test="${queryResult.hasPrevPage}">
		<a href="${pageData.prevPage}" class=" previous">上一页</a>
		<c:if test="${pageData.sstartPage>1}">
    	<a href="${pageData.home}" class="previous">1</a>
    	</c:if>
    </c:when>
  </c:choose>
  <c:choose>
  	<c:when test="${pageData.sstartPage>2}">
  		<span>...</span>
  	</c:when>
  </c:choose>
  <c:forEach items="${pageData.pages}" var="page" varStatus="s">
  	<c:if test="${queryResult.pageNo==page.id}">
  	<a class="current">${page.id}</a>
  	</c:if>
  	<c:if test="${queryResult.pageNo!=page.id}">
  	<a href="${page.text}" >${page.id}</a>
  	</c:if>
  </c:forEach>
  
  <c:choose>
    <c:when test="${queryResult.hasNextPage}">
    	<c:if test="${pageData.sendPage<(queryResult.pageCount-1)}">
		  	<span>...</span>
		</c:if>
    	<c:if test="${pageData.sendPage<queryResult.pageCount}">
		  	<a href="${pageData.endPage}" class="previous">${queryResult.pageCount}</a>
		</c:if>
    	<a href="${pageData.nextPage}"  class="next">下一页</a>
    </c:when>
  </c:choose>
  
  <div class="clear"></div>
 </c:when>
<c:otherwise>
  <span class="fred">暂无记录</span>
</c:otherwise>
</c:choose>
	</div>
</div>