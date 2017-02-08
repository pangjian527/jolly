<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">

	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	
<title>摇一摇 -首页</title>

<style type="text/css">
	html{
		height:100%;
	}
	body{
		margin:0;
		padding:0;
		height:100%;
	}
	div.wrap{
		width:100%;
		height:100%;
		background-image: url("${home}/img-${activityData.body.id }.do") ;
		background-size:100% 100%;
		background-repeat: no-repeat;
	}
	div.head{
		height: 50px;
		left: 0;
		right: 0;
		top: 0;
		text-align: center;
		position:fixed;
		z-index:20;
		background-image: url("${home}/img-${activityData.body.id }.do") ;
		background-size:100% 100%;
		background-repeat: no-repeat;
	}
	div.head i.rule{
		width: 70px;
  		height: 30px;
		position: absolute;
		left:10px;
		top:5px;
	}
	div.head i.rule img{
		width: 100%;
  		height: 100%;
	}
	div.head div.logo_wrap{
		height:40px;
	}
	div.head img.logo{
		height:100%;
		height: 84%;
  		margin-top: 5px;
	}
	div.wrap div.content{
		position: relative;
		text-align: center;
		background-image: url("${home}/img-${activityData.content.id }.do") ;
		background-size:100% 100%;
		background-repeat: no-repeat;
	}
	div.content div.title{
		min-height:100px;
		max-height: 130px;
	}
	div.content div.title img{
		width:80%;
		max-height: 130px;
	}
	div.content div.play_wrap{
		width:200px;
		height:200px;
		border-radius:100px;
		margin: auto;
		position: relative;
		background-image: url("${home}/img-${activityData.playWrap.id }.do");
		background-size:100% 100%;
	}
	div.content div.play_wrap div.play_icon{
		width:200px;
		height:200px;
		border-radius:100px;
		background-image: url("${home}/img-${activityData.playMobile.id }.do");
		background-size: 55% 80%;
		background-repeat: no-repeat;
		background-position: 55px 28px;
		position: relative;
		
	}
	div.content div.play_wrap div.animation{
		-webkit-transform:rotate(10deg);
	}
	div.content div.play_wrap div.play_icon img{
		width: 20px;
		position: absolute;
		top: 90px;
		left: 90px;
	}
	
	div.content div.play_wrap i.prize{
		position: absolute;
		width:50px;
		height: 50px;
		right:-45px;
		bottom:55px;
		display:block;
		border-radius:30px;
	}
	div.content div.play_wrap i.prize_box{
		position: absolute;
		width:50px;
		height: 50px;
		right:-11px;
		bottom:10px;
		display:block;
	}
	div.content img.start{
		margin-top: 10px;
  		width: 150px
	}
	div.content label.play_count{
		display: block;
		height: 40px;
		color: red;
		font-weight: bold;
		line-height: 40px;
		position: absolute;
		width: 100%;
		bottom: 30px;
	}
	div.content i.share{
		height: 35px;
		display: block;
		background-size: 150px;
		margin: auto;
		background-repeat: no-repeat;
		position: absolute;
		bottom: 5px;
		width: 100%;
	}
	div.content i.share img{
		height:100%;
	}
	div.footer{
		height: 50px;
		text-align:center;
	}
	div.footer img{
		width:150px;
		margin-top:5px;
	}
	div.footer label{
		line-height:25px;
		font-size:12px;
		color:white;
	}
	label#result{
		color: red;
		font-weight: bold;
		position: absolute;
		left: 82px;
		top: 90px;
		font-size: 30px;
	}
	
	div.dialog_wrap{
		position: absolute;
		left:10%;
		right:10%;
		height:110px;
		top:40%;
		background-color:white;
		border-radius:5px;
	}
	div.dialog_wrap div.dialog_content{
		padding:10px;
		height:50px;
		line-height: 25px;
	}
	div.dialog_wrap a{
		text-decoration: none;
		color: #79CDCD;
		font-weight:bold;
		
	}
	div.dialog_wrap div.operate{
		text-decoration: none;
		text-align: center;
		height: 40px;
		line-height: 40px;
		color: black;
		border-top: 1px solid #ccc;
	}
	
	
	div.code_wrap{
		position:fixed;
		left:10%;
		right:10%;
		top:15%;
		background-color:white;
		border:1px solid gray;
	}
	div.code_wrap div.two_code{
		padding:10px;
		border:1px solid #ccc;
		margin:10px;
		text-align: center;
	}
	div.code_wrap div.two_code h3{
		margin:0;
		padding:0;
		height:45px;
		text-align: center;
		font-size:16px;
	}
	div.code_wrap div.two_code label{
		display:block;
		font-size:14px;
		line-height:20px;
	}
	div.code_wrap div.two_code img{
		width:130px;
		height:130px;
	}
	
	div.code_wrap div.two_code a{
		text-decoration: none;
		color:blue;
		display: block;
		background-color: #efefef;
		width:100px;
		height:30px;
		line-height:30px;
		margin:auto;
	}
	
	div.activity_wrap{
		position:fixed;
		left:0;
		right:0;
		top:0;
		bottom: 0;
		background-color:gray;
		background:rgba(0,0,0,0.4);
	}
	
	div.activity_wrap div.activity_status{
		height:100px;
		width:200px;
		background-color: white;
		border-radius:10px;
		line-height:100px;
		margin:auto;
		text-align: center;
		margin-top:250px;
	}
	
	div.share_wrap{
		position:fixed;
		left:0;
		right:0;
		top:0;
		bottom: 0;
		background-color:gray;
		background:rgba(0,0,0,0.4);
		z-index:100;
		display: none;
	}
	div.share_wrap img{
		width:100%;
		max-height: 100%;
	}
	div.attention_wrap{
		position:fixed;
		left:0;
		right:0;
		top:0;
		bottom: 0;
		background-color:gray;
		background:rgba(0,0,0,0.4);
		z-index:100;
	}
	a {
		text-decoration: none;
		color:white;
	}
	div.share_result{
		position: absolute;
		left:10%;
		right:10%;
		top: 30%;
		background-color: white;
		height: 100px;
		border-radius: 15px;
		padding: 10px;
	}
	div.share_result_wrap{
		position: fixed;
		background-color: gray;
		top:0;
		left:0;
		right:0;
		bottom:0;
		background:rgba(0,0,0,0.4);
		display: none;
	}
	div.share_result_wrap p{
		text-align: center;
		font-size: 22px;
		padding: 0;
		margin: 0;
		height: 70px;
		line-height: 35px;
	}
	/**div.share_result_wrap a{
		height: 35px;
		display: block;
		color: rgb(59, 59, 95);
		width: 80px;
		line-height: 35px;
		text-align: center;
		float: right
	}*/
	div.prize_text_wrap{
		position: fixed;
	  left: 0;
	  right: 0;
	  top: 0;
	  bottom: 0;
	  background: rgba(0,0,0,0.4);
	  z-index: 100;
	  display:none;
	}
	
	div.share_result_wrap div.operate{
		text-decoration: none;
		text-align: center;
		height: 40px;
		line-height: 40px;
		color: black;
		border-top: 1px solid #ccc;
	}
</style>

<script type="text/javascript">
	
	var playCountLabel="${activityData.activity.playCountLabel }";
	window.onload=function (){
		
		document.getElementById("play_count").innerHTML=playCountLabel.replace("@","${userSurplusPlayCount }");
		
		var clientHeight=document.body.clientHeight;
		if(clientHeight>=515){
			document.getElementById("wrap").style.height=(clientHeight)+"px";
			document.getElementById("content").style.height=(clientHeight-100)+"px";
		}else{
			document.getElementById("wrap").style.height=(clientHeight+160)+"px";
			document.getElementById("content").style.height=520+"px";
		}
	}
	
	var direction=true;
	function playAnimation(){
		var playElement=document.getElementById("play_icon");
		if(direction){
			direction=false;
			playElement.className="play_icon animation";
		}else{
			direction=true;
			playElement.className="play_icon";
		}
	}
	
	var interTimer;
	function startPlay(){
		//开始晃动手机
	  	interTimer=setInterval("playAnimation()",300);
		document.getElementById("startbuttom").style.display="none";
		if(window.DeviceMotionEvent) {
	     	window.addEventListener('devicemotion',deviceMotionHandler, false);
		}
	}
	
	function startShake(){
		//暂时移除此时间
		$.ajax({url:home()+'/home/main.html?op=startShake',
		    data:{activityId:'${activityData.activity.id }',playUserId:'${playUser.id }',publicId:'${activityData.activity.publicId }'},
			success:function(data){
		    	if(data.code=="fail"){
		    		document.getElementById("dialog_content").innerHTML=data.msg;
		    		document.getElementById("prize_text_wrap").style.display="block";
		    	}else if(data.code=="no"){
					document.getElementById("prize_text_wrap").style.display="block";
					document.getElementById("dialog_content").innerHTML="继续努力哦。";
				}else{
					document.getElementById("wait").style.display="none";
					document.getElementById("result").style.display="";
					document.getElementById("result").innerHTML=data.text;
					
					document.getElementById("prize_text_wrap").style.display="block";
					document.getElementById("dialog_content").innerHTML="恭喜你摇出了("+data.text+"),继续努力额";
				}
		    	
		    	clearInterval(interTimer);
				document.getElementById("startbuttom").style.display="";
		    	
				if(data.playCount>=0)
		    		document.getElementById("play_count").innerHTML=playCountLabel.replace("@",data.playCount);
		    	//从新绑定事件 
		    	window.addEventListener('devicemotion',deviceMotionHandler, false);
			}
		});
	}

	var SHAKE_THRESHOLD = 3500;
	var last_update = 0;
	var x, y, z, last_x, last_y, last_z,isRequest=true;
	function deviceMotionHandler(eventData) {
	
	  var acceleration =eventData.accelerationIncludingGravity;
	  var curTime = new Date().getTime();
	 
	  if ((curTime - last_update)> 80) {
	 
	      var diffTime = curTime -last_update;
	      last_update = curTime;
	 
	      x = acceleration.x;
	      y = acceleration.y;
	      z = acceleration.z;
	 
	      var speed = Math.abs(x +y + z - last_x - last_y - last_z) / diffTime * 10000;
	     
	      if (speed > SHAKE_THRESHOLD&&isRequest) {
	    	  isRequest=false;
	    	  
	    	  window.removeEventListener("devicemotion",deviceMotionHandler,false);
	    	  
	          startShake();
	      }
	      last_x = x;
	      last_y = y;
	      last_z = z;
	    }
	}
	
	function confirmPrize(){
		isRequest=true;
		document.getElementById('prize_text_wrap').style.display='none';
		window.location.reload(true);
	}
	
	
	function shareAttention(){
		document.getElementById("share_wrap").style.display="block";
	}
</script>

</head>
<body>
	<div class="wrap" id="wrap">
		<div class="head">
			<i class="rule" id="onMenuShareAppMessage" onclick="showRule()">
				<img src="${home}/img-${activityData.rule.id }.do"/>
			</i>
			<div class="logo_wrap">
				<img class="logo" src="${home}/img-${activityData.logo.id }.do"/>
			</div>
		</div>
		<div style="height:50px;"></div>
		<div class="content" id="content">
			<div class="title">
				<img alt="" src="${home}/img-${activityData.title.id }.do">
			</div>
			<div class="play_wrap">
				<!-- 在这里设定一个圈的背景图片 -->
				<div class="play_icon" id="play_icon">
					<!-- 这里设置晃动手机的图片 -->
					<img id="wait" src="${home}/img-${activityData.text.id }.do"/>
					<label id="result" style="display:none"></label>
				</div>
				<i class="prize">
					<img src="${home}/img-${activityData.tipBox.id }.do" style="width:100%;"/>
				</i>
				<i class="prize_box" onclick="showPrize('${activityData.activity.id }','${playUser.id }')">
					<img src="${home}/img-${activityData.box.id }.do" style="width:100%;"/>
				</i>
			</div>
			<c:if test="${isExpired== false && isFinished==false}">
			<div style="width:100%;height:40px;">
				<img class="start" id="startbuttom" onclick="startPlay()" src="${home}/img-${activityData.startPlay.id }.do"/>
			</div>
			</c:if>
			<label class="play_count" id="play_count"></label>
			<i class="share" onclick="shareAttention()">
				<img src="${home}/img-${activityData.share.id }.do"/>
			</i>
		</div>
		<div class="footer">
			<a href="${activityData.activity.spreadUrl }">
				<img src="${home}/img-${activityData.url.id }.do"/>
			</a>
			<div>
				<label>${activityData.activity.hotline1Label}：<a href="tel:${activityData.activity.merchantHotline }">${activityData.activity.merchantHotline }</a></label>
				<label>${activityData.activity.hotline2Label}：<a href="tel:${activityData.activity.saleHotline }">${activityData.activity.saleHotline }</a></label>
			</div>
		</div>
	</div>
	<div class="prize_text_wrap" id="prize_text_wrap">
		<div class="dialog_wrap" id="dialog_wrap">
			<div class="dialog_content" id="dialog_content">恭喜你摇出了“凯”字，继续努力额</div>
			<div class="operate">
				<a href="javascript:confirmPrize()">确定</a>
			</div>
		</div>
	</div>
	<c:if test="${attention==1&&activityData.activity.status!=0 }">
		<div class="attention_wrap">
			<div class="code_wrap">
				<div class="two_code">
					<h3>亲，您还没有关注公众号哦，需关注后才能玩哦</h3>
					<img src="${home}/img-${activityData.publicBarCode.id }.do" />
					<label>
						长按图片[识别二维码]即可关注<br/>
						如果识别不了二维码，请点击立即关注
					</label>
					<a href="${activityData.activity.attentionUrl }">立即关注</a>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${activityData.activity.status==0 || isFinished==true}">
		<div class="activity_wrap">
			<div class="activity_status">
				活动已经结束
			</div>
		</div>
	</c:if>
	<c:if test="${isExpired== true }">
		<div class="activity_wrap">
			<div class="activity_status">
				活动尚未开始
			</div>
		</div>
	</c:if>
	<div class="share_wrap" id="share_wrap" onclick="this.style.display='none'">
		<img src="${home}/image/share_tip.png"/>
	</div>
	<div class="share_result_wrap" id="share_result_wrap">
		<div class="dialog_wrap">
			<div class="dialog_content" id="shareResult">分享成功</div>
			<div class="operate">
				<a href="javascript:void()" onclick="document.getElementById('share_result_wrap').style.display='none'">确定</a>
			</div>
		</div>
	</div>
	
</body>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"> </script>
<script type="text/javascript">
	
	var queryString=window.location;
	var split=queryString.toString().split("#?");
	var obj={};
	if(split.length>0){
		var split2 = split[1].split("&");
		for (var i = 0; i < split2.length; i++) {
			var split3 = split2[i].split("=");
			
			obj[split3[0]]=split3[1];
		}
	}
	//alert(JSON.stringify(obj));
	//alert(obj.timestamp+"--"+obj.noncestr+"--"+obj.signature);
	wx.config({
	      debug: false,
	      appId: '${publicNumber.appId }',
	      timestamp: obj.timestamp,
	      nonceStr: obj.noncestr,
	      signature: obj.signature,
	      jsApiList: [
	        'checkJsApi',
	        'onMenuShareTimeline',
	        'onMenuShareAppMessage',
	        'onMenuShareQQ',
	        'onMenuShareWeibo'
	      ]
	  });
  var imUrl="http://"+window.location.host+"/${home}/img-${activityData.shareImg.id }.do";
  ////////////////////////////
  wx.ready(function () {
	  // 2.1 监听“分享给朋友”，按钮点击、自定义分享内容及分享结果接口
	  //document.getElementById('onMenuShareAppMessage').onclick = function () {
	    wx.onMenuShareAppMessage({
	      title: '${shareConfig.title }',
	      desc: '${shareConfig.remark }',
	      link: '${shareConfig.url }',
	      imgUrl: imUrl,
	      trigger: function (res) {
	        //alert('用户点击发送给朋友');
	      },
	      success: function (res) {
	    	  //shareFriend();
	       // alert('已分享111');
	      },
	      cancel: function (res) {
	        //alert('已取消');
	      },
	      fail: function (res) {
	        //alert(JSON.stringify(res));
	      }
	    });
	    //alert('已注册获取“发送给朋友”状态事件');
	  //};
	  
	  wx.onMenuShareTimeline({
	      title: '${shareConfig.title }',
	      link: '${shareConfig.url }',
	      imgUrl: imUrl,
	      trigger: function (res) {
	        //alert('用户点击分享到朋友圈');
	      },
	      success: function (res) {
	         shareFriend();
	      },
	      cancel: function (res) {
	        //alert('已取消');
	      },
	      fail: function (res) {
	        //alert(JSON.stringify(res));
	      }
	    });
  })
  
  function shareFriend(){
	  $.ajax({url:home()+'/home/main.html?op=shareConfig',
	    data:{activityId:'${activityData.activity.id }',playUserId:'${playUser.id }',publicId:'${activityData.activity.publicId }'},
		success:function(data){
	    	if(data.code=="success"){
	    		document.getElementById("play_count").innerHTML=playCountLabel.replace("@",data.userSurplusPlayCount);
	    		var str="分享成功，今天还有"+data.userSurplusPlayCount+"次机会！";
		    	document.getElementById("shareResult").innerHTML=str;
	    		document.getElementById("share_result_wrap").style.display="block";
	    	}else{
	    		alert("分享失败");
	    	}
		}
	});
  }
  
  function showRule(){
	window.location="${home}/home/main.html?op=showRule&activityId=${activityData.activity.id }&playUserId=${playUser.id}&channel=${channel}";
  }
 function showPrize(activityId,playUserId){
	window.location=home()+"/home/main.html?op=showPrize&activityId="+activityId+"&playUserId="+playUserId+"&channel=${channel}";
  }
  wx.error(function (res) {
  	//alert(res.errMsg);
});
</script>
</html>
