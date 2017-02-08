<%@ page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户管理个人信息</title>
		<link rel="stylesheet" type="text/css"href="${home }/style/global.css" />
		
		<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
		<script type="text/javascript" src="${home}/script/haux.js"></script>
		<script type="text/javascript" src="${home}/script/haux.component.dynamicform.js"></script>

		<script type="text/javascript">

			//展示个人资料模块
			function showInfoPanel(){
				document.getElementById("show-info").style.display = "none";
				document.getElementById("change-info").style.display = "block";
				document.getElementById("change-password").style.display = "none";
				return;
			}
			
			//保存个人资料模块
			function cheakInfo() {
				//1.获取 昵称和手机项的 值
				var name = new String(document.getElementById("name").value);
				var telNo = document.getElementById("telNo").value;
				//2.校验 昵称 ,
				if(name.length<2){
					alert("用户名长度小于2位")
					return;
				}
				//3.校验手机号码
				if(!/^[13|15|18]{2}[0-9]{9}$/g.test(telNo)){
					alert("手机号码输入有误");
					return;
				}
				//4.定义变量 赋予要提交的数据  并异步提交
				var postData = {name:name, telNo:telNo, op:"changeInfo"};
				$.ajax({
					type:"post",
					url:"${home}/pmanager/sysuser/sys_user.do",
					data:postData,
					success:function(data){
						alert("保存成功");
						location.reload();
					}
				});
			}
			
			
			//操作账户信息模块
			function showPasswordPanel(){
				document.getElementById("show-info").style.display = "none";
				document.getElementById("change-info").style.display = "none";
				document.getElementById("change-password").style.display = "block";
				return;
				
			}
			
			//保存账户信息模块
			function cheakPassword() {
				//1.获取数据值
				var oldpassword = document.getElementById("oldpassword").value;
				var newpassword = document.getElementById("newpassword").value;
				var newpass = document.getElementById("newpass").value;
				//2.检验旧密码是否为空
				if(oldpassword==""){
					alert("旧密码不能为空");
					return;
				}
				//3.校验 新密码 
				if(newpassword.length<10||newpassword.length>20){
					alert("新密码程度必须为10--20位");
					return;
				}
				//4.检测两次新密码是否一致
				if(newpassword===newpass){
					
				}else{
					alert("新密码输入不一致");
					return;
				}
				//5.使用Ajax 确认旧密码是否正确  符合就保存
				var postData = {oldpassword:oldpassword, newpassword:newpassword, op:"changePassword"};
				$.ajax({
					type:"post",
					url:"${home}/pmanager/sysuser/sys_user.do",
					data:postData,
					success:function(data){
						if(data.error){
							alert("旧密码输入有误, 请重新修改");
						}else{
							alert("保存成功");
							location.reload();
						}
					}
				});
			}
		</script>
		
		<style type="text/css">
			#change-info, #change-password{
				display:none;
			}
			div.query label.error {
				background-color: #FFFFCC;
				color:red;
				margin-left: 10px;
				width: auto;
				display: inherit;
			}
			
			
			div.body_wrap div.box{
				width:600px;
				position:relative;
				
				margin-left:0;
				margin-top:40px;
				left:10%;
				padding-bottom:30px
			}
			div.body_wrap div.box h3{
				margin-bottom:30px;
			}
			div.body_wrap div.box ul li{
				clear:both;
				margin-left:100px
			}
			div.body_wrap div.box ul li label{
				margin-right:1em
			}
			div.box li a{
				color:#39c;
				margin-left:0.5em
			}
			div.box h3.title a{
				position:absolute;
				right:1px;
				color:#39c;
				font-size:12px;
				font-weight:normal
			}
			div.body_wrap div.box p{
				padding:30px 0 0 180px
			}
			
		</style>
	</head>
	<body>
		<div class="body_wrap">
			<form action="#" method="post" id="frmMain">
				<input type="hidden" name="doChange" value="1" />
				<input type="hidden" name="id" value="${bean.id }" />
				<div class="box" id="show-info">
					<h3 class="title">
						个人资料
						<a id="alter1" onclick="javascript:showInfoPanel()">修改信息</a>
					</h3>
					<ul class="input two_col" id="ul1">
						<li>
							<label>姓名：</label>
							<samp>${bean.name}</samp>
						</li>
						<li>
						<label>手机：</label>
							<samp>${bean.telNo}</samp>
						</li>
						<li>
							<label>帐号：</label>
							${bean.code}
						</li>
						<li>
							<label>密码：</label>
							<samp>******</samp>
							<a onclick="javascript:showPasswordPanel()">修改密码</a>
						</li>
					</ul>
					<div class="clear"></div>
				</div>
				
				<div class="box" id="change-info">
					<h3 class="title">
						修改个人资料
					</h3>
					<ul class="input two_col">
						<li>
							<label>姓名：</label>
							<input id="name" name="name" value="${bean.name}"/>
						</li>
						<li>
						<label>手机：</label>
							<input id="telNo" name="telNo" value="${bean.telNo}"/>
						</li>
					</ul>
					<p class="clear">
						<button type="button" class="fire ok" onclick="cheakInfo()">
							<i></i>
							确定
						</button>
						<button class="cancel">
							<i></i>
							取消
						</button>
					</p>
					
					<div class="clear"></div>
				</div>
				
				<div class="box" id="change-password">
					<h3 class="title">
						修改密码
					</h3>
					<ul class="input two_col">
						<li>
							<label>旧密码：</label>
							<input type="password" id="oldpassword" name="oldpassword"/>
						</li>
						<li>
							<label>新密码：</label>
							<input type="password" id="newpassword" name="newpassword"/>
						</li>
						<li>
							<label>再次确认：</label>
							<input type="password" id="newpass" name="newpass"/>
						</li>
					</ul>
					<p class="clear">
						<button type="button" class="fire ok" onclick="cheakPassword();">
							<i></i>
							确定
						</button>
						<button class="cancel">
							<i></i>
							取消
						</button>
					</p>
					
					<div class="clear"></div>
				</div>
			</form>
	</div>
	</body>
</html>
