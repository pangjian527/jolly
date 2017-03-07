<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"> </script>
	<script type="text/javascript" src="${home}/script/mwebmall/weixin.js"></script>
	<script type="text/javascript">
		initWeiXinConfig('${appId}','${timeStamp}','${nonceStr}','${signature}');
		initWeixinShare('${title}','${content}','${link}','${imgUrl}');
	</script>
</head>