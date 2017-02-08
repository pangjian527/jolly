<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	function saveBoard(){
		/*var table_name = $(document.getElementsByName("table_name")).val();
		console.log("table_name="+table_name)
		var reference_id = $(document.getElementsByName("reference_id")).val();
		console.log("reference_id="+reference_id);
		var content = $(document.getElementsByName("content")).val();
		var postData = {"tableName":table_name, "referenceId":reference_id, "content":content, op:"save"};
		*/
		//1.为什么要用上面这种sx的写法，居然还要生成一个hidden元素来，脱裤子放屁吗？
		//2.如果表单页面也有一个Input叫做content的，冲突起来怎么办？
		//3.不用检查留言长度吗？空值怎么办？超长了怎么办？
		var content = document.getElementById("board-box").getElementsByTagName("textarea")[0].value;
		if(content.length == 0 || content.length > 100){
			alert("留言字数应当在1-100之间");
			return;
		}
		var postData = {"tableName":"${tableName}", "referenceId":"${referenceId}", op:"submit",
				"content":content};
		
		$.ajax({url : "${home}/pmanager/common/board.do",
			type:"post",
			dataType: "json",
			data:postData,
			error: function(){
				alert("网络异常，请稍后再试");
			}, 
			success:function(data){
				//我强调过的，data一律要判断是否出错
				/*
				if(data){
					alert("留言成功");
				}
				alert("留言成功");*/
				if(data.error){
					alert(data.error);
				}
				else{
					alert("您的留言已被记录");
					document.getElementById("board-box").getElementsByTagName("textarea")[0].value = "";
					//留言成功后，要利用jquery的局部刷新方法，重新刷新留言板的内容，具体使用方法请教邓广森
					var htmlobj = $.ajax({url:"${home}/pmanager/common/board.do?tableName=${tableName}&referenceId=${referenceId}",async:false});
					//$("#myDiv").html(htmlobj.responseText);
					alert(htmlobj.responseText);
					
					$("#board-box").parent().html(htmlobj.responseText);
				}
			}
		});
	}
</script>
<style type="text/css">
	#board-box ul li p .ptoright{
			border: 1px solid #549DFB;
			padding: 5px;
			border-radius: 4px;
			margin: 10px 0 5px 40px;
			background: #549DFB;
			color: white;
			position:relative;
	}
	#board-box ul li p i .itoright{
			border:6px solid transparent;
			border-right-color:#549DFB;
			position:absolute;
			right:8px;
			top:-7px;
	
	}
	#board-box ul li .litoright{
			margin: 5px 0px 15px 100px;
	}
</style>
<!--  
<form action="${home}/pmanager/common/board.do?op=save" id="frmBoard">
--> 
	<input type="hidden" name="table_name" value="product"/>
	<input type="hidden" name="reference_id" value="${bean.id }"/> 
	<div id="board-box">
		<div class="operate">
			<textarea name="content" placeholder="请输入你的留言，字数不少于10个"></textarea>
			<button onclick="saveBoard()" class="sea">发送</button>
		</div>
		
		<ul>
			<c:forEach items="${rows}" var="data" varStatus="idx">
			<c:if test="${data.IS_SELF == true}">
			<li class="is-self">
				<h4>
					<span>
						<fmt:formatDate value="${data.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</span>
					我
				</h4>	
				<p>
					<i></i>
					${data.CONTENT}
				</p>
			</li>
			</c:if>
			<c:if test="${data.IS_SELF != true}">
			<li>
				<h4>
					${data.USER_NAME}
					<span>
						<fmt:formatDate value="${data.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</span>
				</h4>	
				<p>
					<i></i>
					${data.CONTENT}
				</p>
			</li>
			</c:if>
			
			</c:forEach>
		</ul>
	</div>
<!--  	
</form>
--> 
