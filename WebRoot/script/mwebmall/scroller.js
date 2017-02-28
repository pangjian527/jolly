function createScroll(scrollDivId,scrollUpPullCallBack,scrollDownPullCallBack) {
	myScroll = new IScroll('#'+scrollDivId, { 
		mouseWheel: false ,
		click: true ,
		probeType: 2
	});
	
	myScroll.on("scroll",function(){
		if(this.y > 40){//下拉刷新操作  
            scrollUpPullCallBack();
        }else if(this.y < (this.maxScrollY - 14)){//上拉加载更多
        	scrollDownPullCallBack();
        	myScroll.refresh();
        }  
	});
};

/*  end 下拉分页，异步加载数据 */

document.addEventListener('touchmove', function (e) { e.preventDefault(); }, isPassive() ? {
	capture: false,
	passive: false
} : false);

function isPassive() {
    var supportsPassiveOption = false;
    try {
        addEventListener("test", null, Object.defineProperty({}, 'passive', {
            get: function () {
                supportsPassiveOption = true;
            }
        }));
    } catch(e) {}
    return supportsPassiveOption;
}
