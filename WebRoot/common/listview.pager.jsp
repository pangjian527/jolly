<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pub.web.ServletUtils" %>
<div class="turn_down">&nbsp;
<c:choose>
  <c:when test="${queryResult.rowCount > 0}">
		<script type="text/javascript">
			<%
			 String listUrl = (String) request.getAttribute("LIST_URL");
			 if(listUrl == null) {
				listUrl = request.getParameter("LIST_URL");
			 }
			  if(listUrl == null) {
			  	listUrl = ServletUtils.getShortRequestUrl();
			  }
		 %>
			var listUrl = '<%=listUrl%>';
			function page(pageNo) {
				pageNo = parseInt(pageNo);
				if (isNaN(pageNo) || pageNo<1) {
					alert('请输入有效的页码');
					return;
				}
				var re = new RegExp('([?&]page=)(-?\\d+)');
				var url = listUrl.replace(re, '$1' + pageNo);
				if (url.indexOf('page=' + pageNo) == -1) {
					url += (url.indexOf('?') > 0 ? '&' : '?') + 'page=' + pageNo;
				}
				gotoUrl(url);
			}
		</script>
		<c:choose>
    <c:when test="${queryResult.hasPrevPage}">
    	<a href="#" onclick="page(1);return false;">首页</a>
		<a href="#" onclick="page('${queryResult.prevPage}');return false;" class="prev">上一页</a>
    </c:when>
    <c:otherwise>
      <strong>首页</strong>
	  <strong>上一页</strong>
    </c:otherwise>
  </c:choose>
  <c:choose>
    <c:when test="${queryResult.hasNextPage}">
    	<a href="#" onclick="page('${queryResult.nextPage}');return false;" class="next">下一页</a>
		<a href="#" onclick="page('${queryResult.pageCount}');return false;">尾页</a>
    </c:when>
    <c:otherwise>
    	<strong>下一页</strong>
	    <strong>尾页</strong>
    </c:otherwise>
  </c:choose>
  <span class="page_skip">
		第&nbsp;<input id="txtPage" type="text" class="page_input" />&nbsp;页&nbsp;
		<input onclick="page(document.getElementById('txtPage').value);" type="button" value="确定" class="btn_go" />
	    <input name="" type="text" class="page_info" value="共${queryResult.rowCount}条记录&nbsp;${queryResult.pageNo}/${queryResult.pageCount}页" />
  </span> 
 </c:when>
<c:otherwise>
  <span class="fred">暂无记录</span>
</c:otherwise>
</c:choose>
</div> 