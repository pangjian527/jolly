<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>我的订单</title>
	<link rel="icon" href="${home}/favicon.ico" type="image/x-icon" />
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	<link href="${home}/style/m_dialog.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${home}/script/iscroll-probe.js"></script>
	<script type="text/javascript" src="${home}/script/mwebmall/haux.mobile.js"></script>
	<script type="text/javascript" src="${home}/script/m_dialog.js"></script>
	
	
	<style type="text/css">
		body{
			background-color: #f3f3f3;
		}
		div.no-data-box{
			text-align: center;
		    margin-top: 50px;
		    color: #ADADAD;
		}
		div.scwrapper{
		    min-width: 320px;
		    max-width: 640px;
		    margin: 0 auto;
		    background-color: #f3f3f3;
		}
		div.order-menu-box{
			background:white;
			height:35px;
			width:100%;
		}
		div.order-menu-box  dl{
			margin:0 0.5%;
		}
		div.order-menu-box  dl dd{
			height:35px;
			width:33%;
			float:left;
			text-align: center;
			line-height:35px;
			color:#9a9a9a;
		}
		
		div.order-menu-box  dl dd label{
			text-align: center;
			color:#9a9a9a;
			display:block;		
		}
		
		div.order-menu-box  dl dd label.active{
			border-bottom:2px solid red;
			color:red;
		}
		
		div.order-list-box{
			position: absolute;
		    z-index: 1;
		    top: 45px;
		    bottom: 0px;
		    left: 0;
		    width: 100%;
		    background: #f3f3f3;
		    overflow: hidden
		}
		div.order-status-box{
			height: 45px;
		    line-height: 45px;
		    border-bottom: 1px solid #e4e4e4;
		    font-size: 14px;
		    color: #232326;
		}
		
		div.order-list-box ul li{
			border-bottom: 10px solid #f3f3f3;
			padding-left:10px;
			position: relative;
		}
		 div.order-list-box ul li div.pro-img{
			height:80px;
			width:80px;
			float:left;
		}
		
		div.order-list-box ul li div.pro-img img{
			height:80px;
			width:80px;
		}
		
		div.order-list-box ul li div.pro-info-box{
				float:left;
				width:calc(100% - 120px);
				padding:0 10px;
		}
		
		div.pro-info-title{
			color: #232326;
		    font-size: 15px;
		    line-height: 20px;
		    height: 40px;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    display: -webkit-box;
		    display: box;
		    -webkit-line-clamp: 2;
		    -webkit-box-orient: vertical;
		    word-break: break-word;		
		    font-size: 14px;
		}
		div.pro-price{
			height: 45px;
    		line-height: 45px;
		}
		div.pro-price label.price{
			color:#f23030;
			font-size:25px;
		}
		
		div.order-pro-box{
			padding:10px 0;
			border-bottom: 1px dashed #e4e4e4;
		}
		
		div.order-price-box{
			height: 35px;
		    line-height: 35px;
		    text-align: right;
		    padding-right: 15px;
		    color:red;
		}
		
		label.order-time{
			position:absolute;
			right:35px;
			color:gray;
		}
		
		div.order-list-box ul li i.direction{
			position: absolute;
		    background-image: url("${home}/image/direction.png");
		    right: 18px;
   			 top: 13px;
		    background-size: 100% auto;
		    width: 9px;
		    height: 16px;
		}
		
		i.order-status-image{
			position: absolute;
		    background-image: url("${home}/image/finish.png");
		    right: 18px;
		    top: 8px;
		    background-size: 100%;
		    width: 70px;
		    height: 70px;
		}
		a.order-pay{
			padding: 5px 15px;
		    background: red;
		    color: white;
		    border-radius: 5px;
		    margin-left: 10px;
		}
		
		#scroller {
		    position: absolute;
		    z-index: 1;
		    -webkit-tap-highlight-color: rgba(0,0,0,0);
		    width: 100%;
		    background: white;
		    overflow: hidden;
	    }
		
	</style>
	
	<script type="text/javascript">
		var myScroll , status = "${status}",pn  = 1,totalPage = ${pair.second};

		function loaded () {
			myScroll = new IScroll('#order-list-box', { 
				mouseWheel: false ,
				click: true ,
				probeType: 2
			});
			
			myScroll.on("scroll",function(){
				if(this.y > 40){//下拉刷新操作  
                    window.location.reload(true);
                }else if(this.y < (this.maxScrollY - 14)){//上拉加载更多
                	//只有总页数大于当前的页数才加载
                	if(totalPage>pn){
                		pn++;
                		loadOrderData();
                	}
                }  
			});
		}
		
		/*  start 下拉分页，异步加载数据 */
		function loadOrderData(){
			var data = new Object();
			data.status  = status;
			data.pn = pn;
			$.ajax({
				type:"post",
				url:"${home}/mmall/order/order.do?op=listAsync",
				data:data,
				success:function(data){
					//创建
					createOrderItem(data.first);
				}
			});
		}
		
		function createOrderItem(items){
			
			for(var i=0 ;i<items.length;i++){
				var item = items[i];
				var liElement = document.createElement("li");
				
				var aElement = document.createElement("a");
				aElement.href = "${home}/mmall/order/order.do?op=detail&bookId="+item.bookId;
				
				//订单状态
				var orderStatusDivElement = document.createElement("div");
				orderStatusDivElement.className = "order-status-box";
				
				var orderStatusLabelElement = document.createElement("label");
				orderStatusLabelElement.innerHTML = item.statusLabel;
				
				var orderTimeLabelElement = document.createElement("label");
				orderTimeLabelElement.innerHTML = item.createTime;
				orderTimeLabelElement.className = "order-time";
				
				var orderDirectionElement = document.createElement("i");
				orderDirectionElement.className = "direction";
				
				orderStatusDivElement.appendChild(orderStatusLabelElement);
				orderStatusDivElement.appendChild(orderTimeLabelElement);
				orderStatusDivElement.appendChild(orderDirectionElement);
				
				aElement.appendChild(orderStatusDivElement);
				//创建商品列表
				for(var k =0 ;k<item.details.length;k++){
					var proDivElement = createOrderProductItem(item.details[k]);
					aElement.appendChild(proDivElement);
				}
				//创建金额和付款按钮
				var orderPriceBoxElement = document.createElement("div");
				orderPriceBoxElement.className = "order-price-box";
				
				var totalPriceLabelElement = document.createElement("label");
				totalPriceLabelElement.innerHTML = "实际付款：￥ "+item.sales ;
				
				orderPriceBoxElement.appendChild(totalPriceLabelElement);
				if(item.status ==0){
					var payAElement = document.createElement("a");
					payAElement.className = "order-pay";
					payAElement.innerHTML = "付款 " ;
					payAElement.onclick=function(){
						pay(item.bookId);
					};
					orderPriceBoxElement.appendChild(payAElement);
				}
				
				aElement.appendChild(orderPriceBoxElement);
				if(item.status == 4){
					var statusIElement = document.createElement("i");
					statusIElement.className = "order-status-image" ;
					aElement.appendChild(payAElement);
				}
				liElement.appendChild(aElement);
				
				document.getElementById("orderlist").appendChild(liElement);
			}
			
			myScroll.refresh();
		}
		
		//创建商品子项
		function createOrderProductItem(detail){
			
			var orderProDivElement = document.createElement("div");
			orderProDivElement.className="order-pro-box";
			
			//商品图片
			var imgDivElement = document.createElement("div");
			imgDivElement.className="pro-img";
			var imgElement = document.createElement("img");
			imgElement.src="${home}/img-"+detail.firstPhotos+".do";
			
			//商品名称
			var proInfoDivElement = document.createElement("div");
			proInfoDivElement.className = "pro-info-box";
			var proNameElement = document.createElement("div");
			proNameElement.className = "pro-info-title";
			proNameElement.innerHTML = detail.productName;
			
			proInfoDivElement.appendChild(proNameElement);
			
			//商品价格
			var proPriceDivElement = document.createElement("div");
			proPriceDivElement.className = "pro-price";
			
			var proPriceLabelElement = document.createElement("label");
			proPriceLabelElement.className = "price";
			proPriceLabelElement.innerHTML ="￥"+ detail.price + "&nbsp;&nbsp; x"+detail.count; 
			
			proPriceDivElement.appendChild(proPriceLabelElement);
			proInfoDivElement.appendChild(proPriceDivElement);
			
			var clearDivElement = document.createElement("div");
			clearDivElement.style = "clear:both;";
			
			imgDivElement.appendChild(imgElement);
			orderProDivElement.appendChild(imgDivElement);
			orderProDivElement.appendChild(proInfoDivElement);
			orderProDivElement.appendChild(clearDivElement);
			
			return orderProDivElement;
		}
		
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
		  	
		function pay(bookformId){
			window.location=window.location="${home}/mmall/order/order.do?op=pay&bookformId="+bookformId;
		}
		
		function finishOrder(bookformId){
			
			dialogConfirm("确认收货","请确认收到货之后才进行操作，否则货钱两空哦！",function(){},function(){
				$.ajax({url: home()+'/mmall/order/order.do?op=finishOrder',
					data:{bookformId:bookformId},
					success:function(data){
						if(data.error){
							dialogAlert("温馨提示",data.error);
						}
						else{
							dialogAlert("温馨提示","确认成功！",function(){
								window.location.reload(true);
							});
						}
					}
				});
			});
		}
	</script>
	<jsp:include page="../initWeixin.jsp"/>	
</head>
<body onload="loaded()">
	<div class="scwrapper">
		<div class="order-menu-box">
			<dl>
				<dd>
					<a href="${home }/mmall/order/order.do?op=list">
						<label <c:if test="${status ==null }">class="active"</c:if> >全部订单</label>
					</a>
				</dd>
				<dd>
					<a href="${home }/mmall/order/order.do?op=list&status=complete">
						<label <c:if test='${status eq "complete" }'>class="active"</c:if> >已完成</label>
					</a>
				</dd>
				<dd>
					<a href="${home }/mmall/order/order.do?op=list&status=uncomplete">
						<label <c:if test='${status eq "uncomplete" }'>class="active"</c:if> >未完成</label>
					</a>
				</dd>
			</dl>
			<div style="clear:both;"></div>
		</div>
		<c:if test="${!empty pair.first }">
		<div class="order-list-box" id="order-list-box">
			<div id="scroller">
			<ul id="orderlist">
				<c:forEach items="${pair.first }" var="data">
					<li>
						<a href="${home }/mmall/order/order.do?op=detail&bookId=${data.bookId}">
						<div class="order-status-box">
							<label>${data.statusLabel }</label>
							<label class="order-time">
								<fmt:formatDate value="${data.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</label>
							<i class="direction"></i>
						</div>
						<c:forEach items="${data.details }" var="detail">
						<div class="order-pro-box">
							<div class="pro-img">
								<img src="${home}/img-${detail.firstPhotos}.do">	
							</div>
							<div class="pro-info-box">
								<div class="pro-info-title">${detail.productName }</div>
								<div class="pro-price">
									<label class="price">￥<fmt:formatNumber value="${detail.price }" pattern="#,#00.00#"/></label>
									&nbsp;&nbsp;x ${detail.count }
								</div>
							</div>
							<div style="clear:both;"></div>
						</div>
						</c:forEach>
						<div class="order-price-box">
							实际付款：￥<fmt:formatNumber value="${data.sales }" pattern="#,#00.00#"/>
							<c:if test="${data.status == 0 }">
								<a class="order-pay" href="javascript:pay('${data.bookId }');">付款</a>
							</c:if>
							<c:if test="${data.status == 2 && data.trackingStatus == 1}">
								<a class="order-pay" href="javascript:finishOrder('${data.bookId }');">确认收货</a>
							</c:if>
						</div>
						<c:if test="${data.status == 4 }">
							<i class="order-status-image"></i>
						</c:if>
						</a>
					</li>
				</c:forEach>
			</ul>
			</div>
		</div>
		</c:if>
		<c:if test="${empty pair.first }">
			<div class="no-data-box">
				<h3>没有找到相关数据</h3>
			</div>
		</c:if>
	</div>
</body>
</html>
