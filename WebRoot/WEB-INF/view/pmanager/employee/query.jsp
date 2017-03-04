<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>地推人员管理</title>
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${home}/style/global.css" />
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
    <link href="${home}/style/data_list_style.css" rel="stylesheet" type="text/css"/>
	
	<style type="text/css">
        div.m_asset_panel{
            height:150px;
        }
        div.m_asset_panel .asset_item{
            float:left;
            width:33%;
            height:100%;
            position:relative;
        }
        div.m_asset_panel .asset_item b{
            position:absolute;
            left:50%;
            font-size:30px;
            margin-left:-50px;
            top:45px;
        }
        div.m_asset_panel .asset_item label{
            top:85px;
            color:red;
            position:absolute;
            left:50%;
            font-size:30px;
            margin-left:-50px;
        }

        div.e_left_panel{
            width:30%;
            float:left;
        }
        div.e_right_panel{
            width:70%;
            float:left;
        }
        
        div.e_left_panel table tr.active{
        	background:#efefef;
        }
        div.e_left_panel table tr.active td:first-child{
        	border-left:2px solid red;
        }
        div.e_left_panel table tbody tr{
        	cursor:pointer;
        }
        div.e_left_panel table tbody tr:hover{
        	background:#efefef;
        }
        div.e_left_panel table tbody tr:hover td:first-child{
        	border-left:2px solid green;
        }
    </style>
	
	<script type="text/javascript">
		
		function selectObject(sysUserId){
			window.location = "${home}/pmanager/employee/employee.do?sysUserId="+sysUserId;
		}
		
		function copyClip (id,event){
			var url  ="http://"+ window.location.host + "/jolly/mmall/factoryuser/register.do?uid="+id;
			window.open(url, '_blank ' );
		}
		
		
	</script>
		
</head>
<body>
<div style="width:99%;margin:auto;">
	 <div>
        <div class="e_left_panel m_data_panel">
            <table cellpadding="0" cellspacing="0">
                <thead>
                    <tr>
                        <td width="50" align="center">.NO</td>
                        <td>名字</td>
                        <td width="25%">开店总数</td>
                        <td width="25%">操作</td>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${result}" var="data" varStatus="idx">
	                	<tr  class="<c:if test='${sysUserId == data.id }'>active</c:if>">
	                        <td align="center">${idx.index+1}</td>
	                        <td>${data.name}</td>
	                        <td>
	                            ${data.factoryCount}
	                        </td>
	                        <td>
	                        	<a href="javascript:copyClip('${data.id }')">复制链接</a>
	                        	<a href="javascript:void()" onclick="selectObject('${data.id }')">查看</a>
	                        </td>
	                    </tr>
                	</c:forEach>
                </tbody>
            </table>
        </div>
        <div class="e_right_panel">
            <div class="m_data_panel m_asset_panel">
                <div class="m_asset_panel">
                    <div class="asset_item">
                        <b>历史积分</b>
                        <label>￥<fmt:formatNumber value="${allScore}" pattern="#,#00.00#"/></label>
                    </div>
                    <div class="asset_item">
                        <b>上月积分</b>
                        <label>￥<fmt:formatNumber value="${upMonthScore}" pattern="#,#00.00#"/></label>
                    </div>
                    <div class="asset_item">
                        <b>本月积分</b>
                        <label>￥<fmt:formatNumber value="${currentMonthScore}" pattern="#,#00.00#"/></label>
                    </div>
                    <div style="clear:both;"></div>
                </div>
            </div>
            <div class="content t_row_spit_panel">
                <label class="t_row_spit">积分记录</label>
            </div>
            <div class="m_data_panel">
                <table cellpadding="0" cellspacing="0">
                    <thead>
                    <tr>
                        <td width="50">NO.</td>
                        <td >积分</td>
                        <td width="200">积分类型</td>
                        <td width="180">积分时间</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${queryResult.rows}" var="data" varStatus="idx">
	                    <tr >
	                        <td>${idx.index+1 }</td>
	                        <td><fmt:formatNumber value="${data.score}" pattern="#,#00.00#"/></td>
	                        <td>${data.source}</td>
	                        <td><fmt:formatDate value="${data.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="navigate" style="padding:10px 10px;">
				<c:import url="../common/listview.pager.jsp" />
			</div>	
        </div>
    </div>
</body>
</html>
