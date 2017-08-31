<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>商品列表</title>
	<link rel="icon" href="${home}/favicon.ico" type="image/x-icon" />
	<link href="${home}/style/style.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="${home}/style/swipe.css">
	<link href="${home}/style/scroller.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${home}/script/jquery.js"></script>	
	<script type="text/javascript" src="${home}/script/mwebmall/haux.mobile.js"></script>
	<script type="text/javascript" src="${home}/script/mwebmall/swipe.min.js"></script>
	<script type="text/javascript" src="${home}/script/iscroll-probe.js"></script>
	<script type="text/javascript" src="${home}/script/mwebmall/scroller.js"></script>
	<style type="text/css">
	
		div.scwrapper{
		    min-width: 320px;
		    max-width: 640px;
		    margin: 0 auto;
		    background-color: #f3f3f3;
		    margin-bottom:30px;
		}
		div.no-data-box{
			text-align: center;
		    color: #ADADAD;
		    padding-top: 100px;
    		background-color: white;
    		margin-top:0;
		}
		div.no-data-box h3{
			margin:0;
		}
		
		div.product-wrapper{
			top:76px;
		}
		
		div.product-wrapper ul li{
			height:150px;
			background-color:white;
			padding:10px 10px;
			font-size:14px;
			border-bottom: 2px dashed #e4e4e4;
		}
		
		div.product-wrapper ul li div.pro-img img{
			height:130px;
			width:130px;
			float:left;
		}
		
		div.product-wrapper ul li div.pro-info-box{
				float:left;
				width:calc(100% - 150px);
				padding:0 10px;
		}
		
		div.pro-info-title{
			color: #232326;
		    font-size: 15px;
		    line-height: 20px;
		    height: 60px;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    display: -webkit-box;
		    display: box;
		    -webkit-line-clamp: 2;
		    -webkit-box-orient: vertical;
		    word-break: break-word;		
		}
		div.pro-price{
			//height: 35px;
    		//line-height: 35px;
		}
		div.pro-price label.price{
			color:red;
			font-size:22px;
		}
		div.pro-price label.price_mart{
			font-size:16px;
			text-decoration:line-through;
		}
		div.pro-sale{
			height:30px;
			line-height:30px;
		}
		
		div.footer{
			position: fixed;
			bottom:0;
			left:0;
			right:0;
			height:50px;
			border-top: 1px solid #e4e4e4;
    		box-shadow: 0px 0px 20px #888888;
		}
		div.footer ul li{
			float: left;
		    width: 25%;
		    text-align: center;
		    background: white;
		    height:50px;
		}
		div.footer ul li a {
			display: block;
		    height: 100%;
		    width: 100%;
		}
		div.footer ul li i{
			display:block;
			width:30px;
			height:30px;
			margin:auto;
			background-position-y: 3px;
		}
		div.footer ul li label{
			font-size: 12px;
		    height: 20px;
		    display: block;
		    line-height: 20px;
		}
		div.footer ul li i.home{
			background-image: url("${home}/image/nav_home_on.png");
		    background-size: 30px 30px;
		    background-repeat: no-repeat;
		}
		div.footer ul li i.cart{
			background-image: url("${home}/image/nav_cart.png");
		    background-size: 30px 30px;
		    background-repeat: no-repeat;
		}
		
		div.footer ul li i.kefu{
			background-image: url("${home}/image/nav_kefu.png");
		    background-size: 32px 30px;
		    background-repeat: no-repeat;
		    background-position-y: 1px;
		}
		
		div.footer ul li i.me{
			background-image: url("${home}/image/nav_me.png");
		    background-size: 29px 29px;
		    background-repeat: no-repeat;
		}
		div.slider-wrapper {
			---lkkheight: 120px;
		}
		div.slider-wrapper img{
			width: 100%;
			---lkkmax-height: 120px;
			position: relative;
		}
		div.menu-wrap{
			padding: 10px 0;
		    background-color: white;
		    margin-top: 5px;
		}
		div.menu-wrap ul {
			width:100%；
		}
		div.menu-wrap ul li{
			float:left;
			width:33%;
			text-align:center;
			font-size:14px;
		}
		
		div.menu-wrap ul li i{
			display: block;
		    width: 65px;
		    height: 65px;
		    background-color: red;
		    margin: auto;
		    border-radius: 30px;
		}
		i.menu-icon{
			background-size: 100%;
    		background-repeat: no-repeat;
		}
		
		i.battery-icon{
			background-image:url("${home}/image/1.png");
		}
		
		i.screen-icon{
			background-image:url("${home}/image/2.png");
		}
		
		i.other-icon{
			background-image:url("${home}/image/3.png");
		}
		
		div.search{
			height: 40px;
			width: 100%;
		    z-index: 100;
		    position:relative;
		    
		}
		div.search i.search-icon{
			background-image:url("${home}/image/search.png");
		    position: absolute;
		    z-index: 101;
		    width: 20px;
		    height: 20px;
		    top: 11px;
    		left: 17px;
		    background-size: 100%;
		}
		div.search input{
			border: 1px solid #e4e4e4;
		    height: 30px;
		    margin: 3px;
		    border-radius: 15px;
		    text-indent: 38px;
		    width: 98%;
		}
		div.search a{
			position: absolute;
		    right: 10px;
		    top: 7px;
		    font-size: 14px;
		    background-color: red;
		    color: white;
		    border-radius: 10px;
		    height: 26px;
		    display: block;
		    width: 40px;
		    line-height: 26px;
		    text-align: center;
		}
		
		div.filter-wrap{
			width:100%;
			height:35px;
			position:relative;
		}
		div.filter-wrap ul li{
			float: left;
		    width: 50%;
		    text-align: center;
		    line-height: 35px;
		    background: white;
		    border-bottom: 1px solid #e4e4e4;
		    font-size: 14px;
		}
		
		div.filter-wrap li span{
			position:relative;
			display: inline-block;
			color:red;
			font-weight:bold;
		}
		div.filter-wrap li span i.down-filter-icon{
			display:block;
			background-image:url("${home}/image/down.png");
			width: 30px;
		    height: 30px;
		    position: absolute;
		    top: 2px;
		    right: -25px;
		}
		
		div.filter-wrap li span i.up-filter-icon{
			display:block;
			background-image:url("${home}/image/top.png");
			width: 30px;
		    height: 30px;
		    position: absolute;
		    top: 2px;
		    right: -25px;
		}
		
		div.brand-filter-wrap{
			display:none;
			background: white;
		}
		div.filter-wrap div.brand-filter-wrap{
			position:absolute;
			top:36px;
			z-index:100;
			width:100%;
		}
		
		div.filter-wrap ul.condition-wrap li{
			height:35px;
			line-height:35px;
			font-weight:bold;
			text-align:left;
			text-indent:35px;
			border:0;
			font-size:12px;
			position:relative;
		}
		
		div.shield-layer{
			position: fixed;
		    top: 76px;
		    left: 0;
		    right: 0;
		    bottom: 0;
		    z-index: 99;
		    background-color: rgba(0,0,0,0.7);
		    display:none;
		}
		div.brand-filter-wrap a.reset{
			background-color:white;
			color:black;
		}
		div.brand-filter-wrap a {
			width: 50%;
		    height: 40px;
		    background-color: red;
		    color: white;
		    font-weight: bold;
		    display: inline-block;
		    float: left;
		    line-height: 40px;
		    text-align: center;
		    font-size:14px;
		    border-top:1px solid #f3f3f3
		}
		div.brand-filter-wrap  i.filter-select{
			diaplay:block;
			position:absolute;
			width:20px;
			height:20px;
			background-image: url("${home}/image/select.png");
			background-size: 100%;
		    top: 8px;
		    left: 5px;
		}
	</style>
	
	<script type="text/javascript">
	var myScroll ,pn  = 1,totalPage = ${totalPage};
	window.onload = function(){
		createScroll("product-wrapper",
				function(){
					window.location.reload(true);
				},
				function(){
					//只有总页数大于当前的页数才加载
		        	if(totalPage>pn){
		        		pn++;
		        		loadSearchData();
		        	}
				});
	}
	
	function loadSearchData(){
		var data = new Object();
		data.pn = pn;
		data.name = document.getElementById("name").value;
		data.brandIds = document.getElementById("brandIds").value;
		data.priceSort = document.getElementById("priceSort").value;
		data.category = document.getElementById("category").value;
		$.ajax({
			type:"post",
			url:"${home}/mmall/product/product.do?op=listSearchAsync",
			data:data,
			success:function(data){
				//创建
				createProductItem(data);
			}
		});
	}
	
	function createProductItem(data){
		var jsonData = JSON.parse(data);
		var productList=jsonData.lists;
		if(productList){
			var ulEle = document.getElementById("product-list-ul");
			for(var i=0;i<productList.length;i++){
				var productRow = productList[i];
				var liEle = document.createElement("li");
				
				var aEle = document.createElement("a");
				aEle.href = "${home }/mmall/product/product.do?op=viewDetail&productId="+productRow.id;
				
				var imgDivEle = document.createElement("div");
				imgDivEle.className="pro-img";
				var imgEle = document.createElement("img");
				imgEle.src = "${home}/img-"+productRow.firstPhotoId+"_100x100.do"
				
				var infoDivEle = document.createElement("div");
				infoDivEle.className = "pro-info-box";
				
				var titleDivEle = document.createElement("div");
				titleDivEle.className = "pro-info-title";
				titleDivEle.innerHTML = productRow.name;
				
				var priceDivEle = document.createElement("div");
				priceDivEle.className = "pro-price";
				var bEle1 = document.createElement("b");
				bEle1.innerHTML = "批发价:";
				var labelEle1 = document.createElement("label");
				labelEle1.className = "price";
				if(jsonData.islogin){
					if(jsonData.auto){
						labelEle1.innerHTML = "￥"+productRow.price;
					}else{
						labelEle1.innerHTML = "￥"+productRow.priceMart;
					}
					
				}else{
					labelEle1.innerHTML = "？？";
				}
				
				
				
				
				
				var bEle2 = document.createElement("b");
				bEle2.innerHTML = "<br/>市场价:";
				var labelEle2 = document.createElement("label");
				labelEle2.className = "price_mart";
				labelEle2.innerHTML = "￥"+productRow.priceMart;
				
				var saleDivEle = document.createElement("div");
				saleDivEle.className = "pro-sale";
				saleDivEle.innerHTML = "销量："+productRow.salesScount+"件";
				
				imgDivEle.appendChild(imgEle);
				
				priceDivEle.appendChild(bEle1);
				priceDivEle.appendChild(labelEle1);
				priceDivEle.appendChild(bEle2);
				priceDivEle.appendChild(labelEle2);
				
				infoDivEle.appendChild(titleDivEle);
				infoDivEle.appendChild(priceDivEle);
				infoDivEle.appendChild(saleDivEle);
				
				aEle.appendChild(imgDivEle);
				aEle.appendChild(infoDivEle);
				
				liEle.appendChild(aEle);
				ulEle.appendChild(liEle);
			}
		}
	}
	
	
	function gotoDetail(adUrl,contentPhotoId){
		if(adUrl){
			window.location = adUrl;
		}else if(contentPhotoId){
			window.location = "${home}/mmall/ad.do?contentPhotoId="+contentPhotoId;
		}
	}
	function toSearch(){
		window.location = "${home}//mmall/product/product.do?op=search";
	}
	
	function openFilter(){
		document.getElementById("shield-layer").style.display = "block"
		
		var filterWrap = document.getElementById("brand-filter-wrap");
		filterWrap.style.display = "block";
	}
	function closeFilter(){
		document.getElementById("shield-layer").style.display = "none"
			
		var filterWrap = document.getElementById("brand-filter-wrap");
		filterWrap.style.display = "none";
	}
	
	function selectBrand(){
		var iLists = this.getElementsByTagName("i");
		
		if(iLists.length ==1){
			this.removeChild(iLists[0]);
		}else{
			var iElement = document.createElement("i");
			iElement.className = "filter-select";
			this.appendChild(iElement);
		}
		
	}
	
	function search(){
		var liElements = document.getElementById("condition-wrap").getElementsByTagName("li");
		
		var brandIds = "";
		for(var i=0;i<liElements.length;i++){
			var liElement = liElements[i];
			
			var iElements =liElement.getElementsByTagName("i");
			if(iElements.length >= 1){
				brandIds = brandIds +"," + liElement.getAttribute("value");
			}
		}
		document.getElementById("brandIds").value = brandIds;
		document.forms[0].submit();
	}
	
	function priceSort(){
		var iElement = this.getElementsByTagName("i")[0];
		
		if(iElement.className == "down-filter-icon"){
			iElement.className = "up-filter-icon";
			document.getElementById("priceSort").value =1;
		}else{
			iElement.className = "down-filter-icon";
			document.getElementById("priceSort").value =0;
		}
		document.forms[0].submit();
	}
	</script>
	<jsp:include page="../initWeixin.jsp"/>	
</head>
<body >
	<div class="shield-layer" id="shield-layer"></div>
	<div class="scwrapper">
		<div class="search">
			<form action="${home}/mmall/product/product.do?op=executeSearch" method="post">
				<i class="search-icon"></i>
				<input onclick="toSearch()" name="name" id="name" value="${name }" placeholder="请输入关键字搜索"/>
				<input type="hidden" name="brandIds" id="brandIds" value="${brandIds}"/>
				<input type="hidden" name="priceSort" id="priceSort" value="${priceSort }"/>
				<input type="hidden" name="category" id="category" value="${category }"/>
				<a href="">搜索</a>
			</form>
		</div>
		<div class="filter-wrap">
			<ul>
				<li>
					<span onclick="openFilter()">
						品牌
						<i class="down-filter-icon"></i>
					</span>
				</li>
				<li>
					<span onclick="priceSort.call(this)">
						价格
						<c:if test="${priceSort ==1 }">
							<i class="up-filter-icon"></i>
						</c:if>
						<c:if test="${priceSort ==0 }">
							<i class="down-filter-icon"></i>
						</c:if>
					</span>	
				</li>
			</ul>
			<div class="brand-filter-wrap" id="brand-filter-wrap">
				<ul class="condition-wrap" id="condition-wrap">
					<c:forEach items="${brandLists }" var="productBrand">
						<li onclick="selectBrand.call(this)" value="${productBrand.id }">
							${productBrand.name }
						</li>
					</c:forEach>
				</ul>
				<div style="clear:both;"></div>
				<a class="reset" href="javascript:closeFilter()">重置</a>
				<a href="javascript:search()">确定</a>
			</div>
		</div>
		<div class="product-wrapper scroller-div" id="product-wrapper">
			<div id="scroller">
				<ul id="product-list-ul">
					<c:forEach items="${lists }" var="product">
							<li>
								<a href="${home }/mmall/product/product.do?op=viewDetail&productId=${product.id}">
									<div class="pro-img">
										<img src="${home}/img-${product.firstPhotoId}_100x100.do">	
									</div>
									<div class="pro-info-box">
										<div class="pro-info-title">${product.name }</div>
										<div class="pro-price">
											<c:if test="${islogin == false}">
											<b>批发价:</b><label class="price">？？</label>
											</c:if>
											<c:if test="${islogin == true}">
												<c:if test="${auto == true}">
													<b>批发价:</b><label class="price">￥${product.price }</label>&nbsp;&nbsp;
												</c:if>
												<c:if test="${auto == false}">
													<b>批发价:</b><label class="price">￥${product.priceMart }</label>&nbsp;&nbsp;
												</c:if>
											</c:if>
											</br>
											市场价:<label class="price_mart">￥${product.priceMart }</label>
										</div>
										<div class="pro-sale">
											销量：${product.salesScount }件
										</div>
									</div>
								</a>
							</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<c:if test="${empty lists }">
			<div class="no-data-box">
				<h3>没有找到相关数据</h3>
			</div>
		</c:if>
	</div>
</body>

</html>
