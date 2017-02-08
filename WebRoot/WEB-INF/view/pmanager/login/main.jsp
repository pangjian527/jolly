<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>倬利</title>
		
	<link rel="icon" href="${home}/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="${home}/favicon.ico" type="image/x-icon" />
	<link rel="bookmark" href="${home}/favicon.ico" type="image/x-icon" />
	
	<link rel="stylesheet" type="text/css" href="${home}/style/global.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/main.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/dialog.css" />
	<script type="text/javascript" src="${home}/script/haux.js"></script>	
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/createmenu.js"></script>
	<script type="text/javascript" src="${home}/script/jquery.ui.effect.js"></script>
	<script type="text/javascript" src="${home}/script/jquery.ui.effect-clip.js"></script>
	
	<script>
		
		
		customizeBody = function(){
			//0.检测浏览器
			if(!GLOBAL.isChrome){
				alert("您使用的浏览器存在兼容性问题\n请使用Google浏览器访问倬利数据管理平台");
			}
			var menus = ${menus};
			//2.根据menu json对象，动态创建1/2/3级菜单。
			//alert( haux.util.Json.getString(menuObjs));
			createMenu(menus);
			
			//3.模拟用户点击第一个一级菜单后，再点击左侧第一个子菜单的行为，使得main.jsp页面初始化时，显示第一个菜单被选中并展示
			var selectedPrimeMenu = document.getElementById("main_menu").getElementsByTagName("a")[0];
			selectedPrimeMenu.onclick();
			
			
		}
		
		
		function logout(){
			if( window.confirm("确定退出系统?")){
				window.location.href = '${home}/pmanager/login/login.do?op=loginout';
			}
			
		}
		
		function switchScreen(){
			var id = this.parentNode.id;
			var headContent = document.getElementById("head");
			var submenuContent = document.getElementById("sub_menu");
			var mainContent = document.getElementById("main_content");
			if(id == "full_screen"){
				document.body.className = "full_screen";
			}
			else if(id == "wide_screen"){
				document.body.className = "wide_screen";
			}
			else if(id == "high_screen"){
				document.body.className = "high_screen";
			}
			else if(id == "normal_screen"){
				document.body.className = "";
			}
		} 
		
	</script>
	<style type="text/css">
		html{
			overflow: hidden;
		}
		#head {
			height: 50px;
			position: relative;
			background: url(../../image/logo_r2_c2.jpg) no-repeat white 80px 4px;
			border-bottom: 4px solid #B4B4B4;
			background-size: 8%;
		}
	</style>
</head>
<body>
	<div id="top_bar">
		<div id="welcome">
			 欢迎登陆<span>倬利</span>系统，<b>${userName}</b>
		</div>
		<div id="quick_menu">
			<a href="#">
				站内消息
			</a>
			<a href="#">
				使用帮助
			</a>
			<a href="#" onclick="javascript:logout();" id="cancel">
				安全退出
			</a>
		</div>
	</div>
	<div id="head">
		
		<div id="main_menu">

		</div>
		<div id="introduce">
			 数据管理平台
		</div>
	</div>
	<div class="content-wrap">
		<div id="screen_operate">
			<ul>
				<li id="full_screen">
					<button type="button" title="全屏" onclick="switchScreen.call(this)" >全屏</button>
				</li>
				<li id="wide_screen">
					<button type="button" title="加宽" onclick="switchScreen.call(this)" >加宽</button>
				</li>
				<li id="high_screen">
					<button type="button" title="加高" onclick="switchScreen.call(this)">加高</button>
				</li>
				<li id="normal_screen">
					<button type="button" title="恢复" onclick="switchScreen.call(this)"> 恢复</button>
				</li>
			</ul>
			<div class="clear"></div>
		</div>
		<div id="sub_menu">
			
		</div>
		<div id="main_content">
			<iframe id="frame_content" name="frame_body" frameborder="no" border="0" marginwidth="0" marginheight="0" ></iframe>
		</div>
	</div>
	<script>
		customizeBody();
	</script>
</body>
</html>

