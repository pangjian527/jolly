function initWeiXinConfig(appId,timeStamp,nonceStr,signature){
	wx.config({
	    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	    appId: appId, // 必填，公众号的唯一标识
	    timestamp: timeStamp, // 必填，生成签名的时间戳
	    nonceStr: nonceStr, // 必填，生成签名的随机串
	    signature: signature,//
	    jsApiList: [
	    	"checkJsApi",
	    	"onMenuShareTimeline",
	    	"onMenuShareAppMessage",
	    	"onMenuShareQQ",
	    	"onMenuShareWeibo",
	    	"onMenuShareQZone",
	    	"getLocation",
	    	"chooseWXPay",
	    	"scanQRCode"
	    ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
	});
	wx.error(function(res){
		//alert(res.errMsg);
		//alert(location.href.split('#')[0]);
	});
}

function initWeixinShare(title,content,link,imgUrl){
	wx.ready(function(){
		wx.checkJsApi({
		    jsApiList: ['onMenuShareTimeline',
		    			'onMenuShareAppMessage',
		    			'onMenuShareQQ',
		    			'onMenuShareQZone'], //
		    success: function(res) {
		       if(res.errMsg=='checkJsApi:ok'){
		    	   if(!res.checkResult.onMenuShareTimeline){
		    		   alert("当前微信版本不支持朋友圏分享");
		    	   }
		    	   if(!res.checkResult.onMenuShareAppMessage){
		    		   alert("当前微信版本不支持朋友分享");
		    	   }
		    	   if(!res.checkResult.onMenuShareQQ){
		    		   alert("当前微信版本不支持QQ分享");
		    	   }
		    	   if(!res.checkResult.onMenuShareQZone){
		    		   alert("当前微信版本不支持QQ空间分享");
		    	   }
		       }
		    }
		});
		 // 监听“分享朋友圈”
	   wx.onMenuShareTimeline({
		    title: title, // 分享标题
		    link: link, // 分享链接
		    imgUrl: imgUrl, // 分享图标
		    success: function () {
		        // 用户确认分享后执行的回调函数
		    },
		    cancel: function () {
		        // 用户取消分享后执行的回调函数
		    }
		});
		// 监听“分享给朋友”
	    wx.onMenuShareAppMessage({
	     	title: title, // 分享标题
		    desc: content,//分享内容
		    link: link, // 分享链接
		    imgUrl: imgUrl, // 分享图标
	      trigger: function (res) {
	      },
	      success: function (res) {
	      },
	      cancel: function (res) {
	      },
	      fail: function (res) {
	      }
	    });
	    wx.onMenuShareQQ({
	        title: title, // 分享标题
	        desc: content, // 分享描述
	        link: link, // 分享链接
	        imgUrl: imgUrl, // 分享图标
	        success: function () { 
	           // 用户确认分享后执行的回调函数
	        },
	        cancel: function () { 
	           // 用户取消分享后执行的回调函数
	        }
	    });
	    wx.onMenuShareQZone({
	        title: title, // 分享标题
	        desc: content, // 分享描述
	        link: link, // 分享链接
	        imgUrl: imgUrl, // 分享图标
	        success: function () { 
	           // 用户确认分享后执行的回调函数
	        },
	        cancel: function () { 
	            // 用户取消分享后执行的回调函数
	        }
	    });
	});
}

function getWeixinLocation(callback){
	wx.ready(function(){
		wx.checkJsApi({
		    jsApiList: ['getLocation'], //
		    success: function(res) {
		       if(res.errMsg=='checkJsApi:ok'&&!res.checkResult.getLocation){
		    	   alert("当前微信版本不支持获取位置");
		       }
		    }
		});
		wx.getLocation({
		    type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
		    success: function (res) {
		    	callback(res.longitude,res.latitude);
		    }
		});
	});
}

function scanWeixinQRCode(callback){
	wx.ready(function(){
		wx.checkJsApi({
		    jsApiList: ['scanQRCode'], //
		    success: function(res) {
		       if(res.errMsg=='checkJsApi:ok'&&!res.checkResult.scanQRCode){
		    	   alert("当前微信版本不支持扫一扫功能");
		       }
		    }
		});
		wx.scanQRCode({
		    needResult: 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
		    scanType: ["qrCode","barCode"], // 可以指定扫二维码还是一维码，默认二者都有
		    success: function (res) {
		    	callback(res);
			}
		});
	});
}

function wxPay(timeStamp,nonceStr,packageValue,signType,paySign,successCallback,failCallback){
	wx.ready(function(){
		wx.checkJsApi({
		    jsApiList: ['chooseWXPay'], //
		    success: function(res) {
		       if(res.errMsg=='checkJsApi:ok'&&!res.checkResult.chooseWXPay){
		    	   alert("当前微信版本不支持支付");
		       }
		    }
		});
		wx.chooseWXPay({
		    timestamp: timeStamp, // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
		    nonceStr: nonceStr, // 支付签名随机串，不长于 32 位
		    package: packageValue, // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
		    signType: signType, // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
		    paySign: paySign, // 支付签名
		    success: function (res) {
		    	successCallback();
		    },
		    fail:function (res){
		    	failCallback(res);
		    },
		    cancel:function (){
		    }
		});
	});
}






