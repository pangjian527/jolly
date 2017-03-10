<%@ page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>注册跳转</title>
	<link rel="icon" href="${home}/favicon.ico" type="image/x-icon" />
	<link rel="icon" href="${home}/favicon.ico" type="image/x-icon" />
	<script type="text/javascript" src="${home}/script/mwebmall/haux.mobile.js"></script>

<script type="text/javascript">
//通过授权页面获取CODE，获取OPENID
	var redirectUrl="http://"+window.location.host+"${home}/mmall/factoryuser/register.do?op=toRegisterPage&uid=${uid}&pid=${pid}";
	window.location="${oauthUrl}?appid=${appId}&redirect_uri="+urlencode(redirectUrl)
	                  +"&response_type=code&scope=snsapi_base#wechat_redirect";
</script>
</head>
</html>
