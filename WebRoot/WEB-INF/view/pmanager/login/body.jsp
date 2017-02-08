<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>工作台</title>
	<link rel="stylesheet" type="text/css" href="${home }/style/global.css" />
	<link rel="stylesheet" type="text/css" href="${home }/style/work_space.css" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript">
	var CONTEXTPATH = '${home}/script/dialog/images/';
	</script>
		
		<script type="text/javascript">
			function view(customerId){
				var width = (screen_width - 830)/2;
				var height = (screen_height - 550)/2;
				window.open('${home}/customer/operate.do?op=view&customerId=' + customerId,
	   						'viewwindow',
	   						'width=830,height=550,scrollbars=yes,resizable=yes,top=' + height + ',left=' + width);
			}
		</script>
	</head>

	<body>
		<div class="reveal" style="margin-left: 10px;">
			${user.name}，当前您还有
			<font size="4"><a>${workData.todayTask.rowCount}</a></font> 条待办任务,
			<font size="4"><a>${workData.noticeResult.rowCount}</a></font> 条未读消息,请及时处理！
		</div>
		
		<!-- 热点客户 -->
		<div class="piece">
			<h3>热点客户</h3>
			<dl>
				<c:forEach items="${workData.hotspotCustomer.rows}" var="customer">
					<dd>
						<span class="abstract"><a href="javascript:view('${customer.ID}');" title="点击打开视图">${customer.NAME}</a></span>
						<span class="date">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${customer.CREATE_DATE }"/>
						</span>
					</dd>
				</c:forEach>
			</dl>
		</div>
		
		<!-- 营销排行 -->
		<div class="piece">
			<h3>营销排行</h3>
			<dl>
				<c:forEach items="${workData.salesRankings.rows}" var="ranking" varStatus="resultNum">
					<dd>
						<span>No${resultNum.index + 1}.</span>
						<span style="color: #B0C4DE;">${ranking.SALESMAN}</span>
						<span>共计${ranking.SALE_COUNT}个合同${ranking.ITEM_COUNT}个产品，销售额</span>
						<span>${ranking.SALES}</span>
					</dd>
				</c:forEach>
			</dl>
		</div>
		
		<!-- 待办任务 -->
		<div class="piece">
			<h3>待办任务<a href="javascript:openDivWindow('${home}/workplan/operate.do?op=new_&type=1','新增任务',600,500,false);">New</a></h3>
			<dl>
				<dt>今天任务</dt>
				<c:forEach items="${workData.todayTask.rows}" var="todayTask" >
					<dd>
						<a href="javascript:openDivWindow('${home}/workplan/operate.do?op=show&id=${todayTask.ID}','查看',600,400,false);">${todayTask.TITLE }</a>
						<span class="abstract">
							<c:if test="${todayTask.STATUS == 1}"><img src="${home}/image/no_complete.gif" title="未完成"/></c:if>
							<c:if test="${todayTask.STATUS == 2}"><img src="${home}/image/complete.gif" title="已经完成"/></c:if>
						</span>
						<span class="date">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${todayTask.ENDDATE }"/>
							<fmt:formatDate pattern="HH:mm" value="${todayTask.ENDTIME }"/>
						</span>
					</dd>
				</c:forEach>
				<dt>后续任务</dt>
				<c:forEach items="${workData.tomorrorTask.rows}" var="tomorrowTask" >
					<dd>
						<a href="javascript:openDivWindow('${home}/workplan/operate.do?op=show&id=${tomorrowTask.ID}','查看',600,400,false);">${tomorrowTask.TITLE }</a>
						<span class="abstract">
							<c:if test="${tomorrowTask.STATUS == 1}"><img src="${home}/image/no_complete.gif" title="未完成"/></c:if>
							<c:if test="${tomorrowTask.STATUS == 2}"><img src="${home}/image/complete.gif" title="已经完成"/></c:if>
						</span>
						<span class="date">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${tomorrowTask.ENDDATE }"/>
							<fmt:formatDate pattern="HH:mm" value="${tomorrowTask.ENDTIME }"/>
						</span>
					</dd>
				</c:forEach>
			</dl>
		</div>
		
		<!-- 日程 -->
		<div class="piece">
			<h3>日程<a href="javascript:openDivWindow('${home}/workplan/operate.do?op=new_&type=2','新增日程',600,400,false);">New</a></h3>
			<dl>
				<dt>今天日程安排</dt>
				<c:forEach items="${workData.todaySchedule.rows}" var="todaySchedule" >
					<dd>
						<a href="javascript:openDivWindow('${home}/workplan/operate.do?op=show&id=${todaySchedule.ID}','查看',600,400,false);">${todaySchedule.TITLE }</a>
						<span>
							<c:if test="${todaySchedule.ALARM_TYPE == 2}"><img src="${home}/image/email.jpg" width="16px" height="16px" title="已设置邮件提醒"/></c:if>
							<c:if test="${todaySchedule.ALARM_TYPE == 3}"><img src="${home}/image/message.gif" title="已设置短信提醒"/></c:if>
						</span>
						<span class="date">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${todaySchedule.STARTDATE }"/>
							<fmt:formatDate pattern="HH:mm" value="${todaySchedule.STARTTIME }"/>
						</span>
					</dd>
				</c:forEach>
				<dt>后续日程</dt>
				<c:forEach items="${workData.tomorrorSchedule.rows}" var="tomorrowSchedule" >
					<dd>
						<a href="javascript:openDivWindow('${home}/workplan/operate.do?op=show&id=${tomorrowSchedule.ID}','查看',600,400,false);">${tomorrowSchedule.TITLE }</a>
						<span>
							<c:if test="${tomorrowSchedule.ALARM_TYPE == 2}"><img src="${home}/image/email.jpg" width="16px" height="16px" title="已设置邮件提醒"/></c:if>
							<c:if test="${tomorrowSchedule.ALARM_TYPE == 3}"><img src="${home}/image/message.gif" align="middle" title="已设置短信提醒"/></c:if>
						</span>
						<span class="date">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${tomorrowSchedule.STARTDATE }"/>
							<fmt:formatDate pattern="HH:mm" value="${tomorrowSchedule.STARTTIME }"/>
						</span>
					</dd>
				</c:forEach>
			</dl>
		</div>

		<!-- 站内消息 -->
		<div class="piece">
			<h3>站内消息<a href="${home }/workbench/showAction.do?op=notice">More</a></h3>
			<dl>
				<c:forEach items="${workData.noticeResult.rows}" var="notice" >
					<dd>
						<a href="javascript:openDivWindow('${home }/office/note/operate.do?op=readonly&noticeId=${notice.ID }','查看公告',600,300,false);">${notice.TITLE }</a>
						<span class="date"><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.BEGIN_TIME }"/></span>
					</dd>
				</c:forEach>
			</dl>
		</div>
		
		<!-- 营销合同预警 -->
		<div class="piece">
			<h3>营销合同到期预警<a href="${home }/workbench/showAction.do?op=salesNotice">More</a></h3>
			<dl>
			<c:forEach items="${workData.salesNotice.rows}" var="renew" >
				<dd>
					<span>
						<a href="javascript:openDivWindow('${home}/salerecord/operate.do?op=show&id=${renew.ID}','合同查看',600,370);">${renew.TITLE}</a>
					</span>
				</dd>
			</c:forEach>
			</dl>
		</div>
	</body>
</html>