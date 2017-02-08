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
	body{
		  margin: 0;
	}
	div.wrap{
		background-image:url("${home}/img-${activityData.body.id}.do");
		  background-size: 100% 100%;
		  background-repeat: no-repeat;
		  height: 910px;
		  position:relative;
	}
	div.content{
		background-image:url("${home}/img-${activityData.content.id}.do");
		  background-size: 100% 100%;
	  /* text-align: center; */
	  height: 780px;
	  text-align: center;
	}
	div.logo_wrap{
		text-align: center;
  		height: 40px;
  		padding-top:5px;
	}
	div.head i.rule{
		  position: absolute;
	  left: 10px;
	  top: 5px;
	  height: 30px;
	  width:70px;
	}
	div.head i.rule img{
		width:100%	
	}
	img.logo{
		  height: 35px;
	}
	
	div.title img{
		  width: 80%;
  		max-height: 130px;
	}
	
	div.play_wrap{
		background-image:url("${home}/img-${activityData.playWrap.id}.do");
		width:200px;
		height:200px;
		background-size:100% 100%;
		margin:auto;
		position:relative;
	}
	div.play_wrap div.play_icon{
		background-image:url("${home}/img-${activityData.playMobile.id}.do");
		  width: 200px;
		  height: 200px;
		  background-size: 56% 85%;
		  background-repeat: no-repeat;
		  background-position: 55px 18px;
		  margin: auto;
	}
	div.play_wrap div.play_icon img{
		  width: 20px;
		  top: 83px;
		  position: relative;
	}
	div.play_wrap i.box_tip{
		    width: 48px;
		  position: absolute;
		  left: 190px;
		  top: 100px;
	}
	div.play_wrap i.box_tip img{
		  width: 100%;
	}
	div.play_wrap i.prize_box{
		    position: absolute;
		  left: 154px;
		  top: 141px;
		  width: 50px;
	}
	div.play_wrap i.prize_box img{
		  width: 100%;
	}
	div.play_wrap img.start_play{
		  width: 150px;
 		 margin-top: 10px;
	}
	div.play_wrap label.play_count{
		  color: red;
		  font-weight: bold;
		  display: block;
		  height: 30px;
		  line-height: 30px;
	}
	div.play_wrap img.share{
		width: 150px;
	}
	div.footer{
		    /* height: 60px; */
		  /* margin-top: 20px; */
		  width: 100%;
		  text-align: center;
		  /* padding-top: 17px; */
		  position:absolute;
		  bottom: 10px;
	}
	div.footer img{
		height:38px;
	}
	div.footer label{
		  font-size: 13px;
		  color:white;
	}
</style>

<script type="text/javascript">
	function showRule(activityId){
		window.location="${home}/home/main.html?op=showRule&activityId=${activityData.activity.id }"
	}
	
	var playCountLabel="${activityData.activity.playCountLabel }";
	window.onload=function (){
		
		document.getElementById("play_count").innerHTML=playCountLabel.replace("@","${userSurplusPlayCount }");
		
		var clientHeight=document.body.clientHeight-10;
		if(clientHeight>=460){
			document.getElementById("wrap").style.height=(clientHeight+15)+"px";
			document.getElementById("content").style.height=(clientHeight-90)+"px";
		}else{
			document.getElementById("wrap").style.height=(clientHeight+160)+"px";
			document.getElementById("content").style.height=460+"px";
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
	
	function startPlay(){
		//开始晃动手机
	  	setInterval("playAnimation()",300);
		
		if(window.DeviceMotionEvent) {
	     	window.addEventListener('devicemotion',deviceMotionHandler, false);
		}
	}
	
	function startShake(){
		//暂时移除此时间
		$.ajax({url:home()+'/home/main.html?op=startShake',
		    data:{activityId:'${activityData.activity.id }',playUserId:'${playUser.id }',publicId:1},
			success:function(data){
		    	if(data.code=="fail"){
		    		document.getElementById("dialog_content").innerHTML=data.msg;
		    		document.getElementById("dialog_wrap").style.display="block";
		    	}else if(data.code=="no"){
					document.getElementById("dialog_wrap").style.display="block";
					document.getElementById("dialog_content").innerHTML="继续努力额。";
				}else{
					document.getElementById("wait").style.display="none";
					document.getElementById("result").style.display="";
					document.getElementById("result").innerHTML=data.text;
					
					document.getElementById("dialog_wrap").style.display="block";
					document.getElementById("dialog_content").innerHTML="恭喜你摇出了("+data.text+"),继续努力额";
				}
		    	document.getElementById("play_count").innerHTML=playCountLabel.replace("@",data.playCount);
		    	//从新绑定事件 
		    	window.addEventListener('devicemotion',deviceMotionHandler, false);
			}
		});
	}
	

	var SHAKE_THRESHOLD = 2000;
	var last_update = 0;
	var x, y, z, last_x, last_y, last_z,isRequest=true;
	function deviceMotionHandler(eventData) {
	
	  var acceleration =eventData.accelerationIncludingGravity;
	  var curTime = new Date().getTime();
	 
	  if ((curTime - last_update)> 100) {
	 
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
	
	function showPrize(activityId,playUserId){
		window.location=home()+"/home/main.html?op=showPrize&activityId="+activityId+"&playUserId="+playUserId;
	}
	
	function confirmPrize(){
		isRequest=true;
		
		document.getElementById('dialog_wrap').style.display='none';
	}
	
</script>

</head>
<body>
	<div class="wrap">
		<div class="head">
			<i class="rule"> <img alt="" src="${home}/img-${activityData.rule.id }.do"></i>
			<div class="logo_wrap">
				
				<img class="logo" alt="" src="${home}/img-${activityData.logo.id }.do">
			</div>
		</div>
		<div class="content">
			<div class="title">
				<img alt="" src="${home}/img-${activityData.title.id }.do">
			</div>
			<div class="play_wrap">
				<div class="play_icon">
					<img alt="" src="${home}/img-${activityData.text.id}.do">
				</div>
				<i class="box_tip">
					<img alt="" src="${home}/img-${activityData.tipBox.id}.do">
				</i>
				<i class="prize_box">
					<img alt="" src="${home}/img-${activityData.box.id}.do">
				</i>
				<img class="start_play" alt="" src="${home}/img-${activityData.startPlay.id}.do">
				<label class="play_count">游戏次数</label>
				<img class="share" alt="" src="${home}/img-${activityData.share.id}.do">
			</div>
		</div>
		<div class="footer">
			<img class="share" alt="" src="${home}/img-${activityData.share.id}.do">
			<div>
				<label>${activityData.activity.hotline1Label}：${activityData.activity.merchantHotline }</label>
				<label>${activityData.activity.hotline2Label}：${activityData.activity.saleHotline }</label>
			</div>
		</div>
	</div>
</body>
</html>
