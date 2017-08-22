<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="app://pub.form" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>汽配品牌</title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />

	<link rel="stylesheet" type="text/css"href="${home }/style/global.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/popbox.css" />
	<link rel="stylesheet" type="text/css" href="${home}/style/textarea2.css" />
	<script type="text/javascript" src="${home}/script/jquery-1.10.2.min.js"></script>
	
	<script type="text/javascript" src="${home}/script/haux.js"></script>
	<script type="text/javascript" src="${home}/script/haux.dom.form.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.date.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dynamicform.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.popbox.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.dialog.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.textarea2.js"></script>
	<script type="text/javascript" src="${home}/script/jquery.ajaxfileupload.js"></script>
	<script type="text/javascript" src="${home}/script/haux.component.file.js"></script>
	
	<script type="text/javascript" src="${home}/ueditor/ueditor.config.js"></script>  
	<script type="text/javascript" src="${home}/ueditor/ueditor.all.js"></script> 
	<script type="text/javascript" src="${home}/ueditor/lang/zh-cn/zh-cn.js"></script> 
	<style type="text/css">
		div.body_wrap div.box ul li{
			clear:both;
			width:80%;
		}
		div.logo-photo{
			display: inline-block;
			background: none;
			position: relative;
			left: -10px;
			top: -5px;
		}
		ul li div.productBrand{
			margin-left:203px;
		}
		ul.three_col li input,ul.three_col li textarea{
			width:610px;
		}
		ul.three_col li input.seq{
			width:450px;
		}
	</style>
	<script type="text/javascript">
		haux.dom.addEventHandler(window, "load", function(){
			var hiddenElement = document.getElementById("attachments");
			var fileObj = new haux.component.File({display : "big-icon",
				hiddenElement : hiddenElement,
				containerElement : hiddenElement.parentNode,
				fileElement : document.getElementsByName("uploadFile")[0],
				maxCount : 1, 
				fileType : "image", 
				maxFileSize : 5*1024
			});
		});
		function saveObject(){
			if(haux.dom.form.validate()){
				document.basic.submit();
			}
		}
	</script>		
	
</head>
<body >
	<div class="body_wrap">
		<form:form action="${home}/pmanager/productbrand/product_brand.do" modelAttribute="bean" 
			id="form" class="theme" name="basic" method="post">
			<input type="hidden" name="id" value="${bean.id }" />
			<input type="hidden" name="op" value="save" />
			<div class="tool_bar">
				<button type="button" onclick="history.back()" class="return">
					<i></i>
					返回
				</button>
				<button type="button" onclick="saveObject()" class="ok">
					<i></i>
					保存
				</button>
			</div>
			<div class="box" style="position: relative;">
				<h3>
					基本信息
				</h3>
				<ul class="input three_col">
					<li class="mandatory">
						<label>名称：</label>
						
						<form:input path="name" cssClass="text required "/>
					</li>
					
					<li class="mandatory">
						<label>备注：</label>
						<form:textarea path="remark" cols="20" rows="5"></form:textarea>
					</li>
					<li class="">
						<label>排序：</label>
						<form:input path="seq"  cssClass="text seq"/>
						(数字越小，越靠前排)
					</li>
					<li>
						<div class=" productBrand">
							<h3>品牌介绍</h3>
						</div>
					</li>
					<li class="mandatory">
						<label>logo：</label>
						<div class="logo-photo">
							<input type="hidden" name="attachmentIds" id="attachments" value="${attachmentIds}"/>
						</div>
					</li>
				</ul>
				<div class="clear"></div>
			</div>
		</form:form>
	</div>
</body>
<script type="text/javascript">

    		//实例化编辑器
    		//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    		var ue = UE.getEditor('editor',{
    			//百度Ueditor 编辑器工具栏筛选
    			toolbars: [
    			           [
    			               'source', //源代码
    			               //'anchor', //锚点
    			               'undo', //撤销
    			               'redo', //重做
    			               '|',
    			               'bold', //加粗
    			               'indent', //首行缩进
    			               //'snapscreen', //截图
    			               'italic', //斜体
    			               'underline', //下划线
    			               'strikethrough', //删除线
    			               'subscript', //下标
    			               'fontborder', //字符边框
    			               '|',
    			               'superscript', //上标
    			               'formatmatch', //格式刷
    			               //'blockquote', //引用
    			               'pasteplain', //纯文本粘贴模式
    			               'selectall', //全选
    			               '|',
    			               'print', //打印
    			               //'preview', //预览
    			               'horizontal', //分隔线
    			               
    			               //'removeformat', //清除格式
    			               'time', //时间
    			               'date', //日期
    			               //'unlink', //取消链接
    			               //'insertrow', //前插入行
    			               //'insertcol', //前插入列
    			               //'mergeright', //右合并单元格
    			               //'mergedown', //下合并单元格
    			               //'deleterow', //删除行
    			               //'deletecol', //删除列
    			               //'splittorows', //拆分成行
    			               //'splittocols', //拆分成列
    			               //'splittocells', //完全拆分单元格
    			               //'deletecaption', //删除表格标题
    			               //'inserttitle', //插入标题
    			               //'mergecells', //合并多个单元格
    			               //'deletetable', //删除表格
    			               '|',
    			               'cleardoc', //清空文档
    			               //'insertparagraphbeforetable', //"表格前插入行"
    			               //'insertcode', //代码语言
    			               'fontfamily', //字体
    			               'fontsize', //字号
    			               'paragraph', //段落格式
    			               'simpleupload', //单图上传
    			               //'insertimage', //多图上传
    			               //'edittable', //表格属性
    			               //'edittd', //单元格属性
    			               //'link', //超链接
    			               //'emotion', //表情
    			               //'spechars', //特殊字符
    			               //'searchreplace', //查询替换
    			               //'map', //Baidu地图
    			               //'gmap', //Google地图
    			               //'insertvideo', //视频
    			               //'help', //帮助
    			               '|',
    			               'justifyleft', //居左对齐
    			               'justifyright', //居右对齐
    			               'justifycenter', //居中对齐
    			               'justifyjustify', //两端对齐
    			               'forecolor', //字体颜色
    			               'backcolor', //背景色
    			               //'insertorderedlist', //有序列表
    			               //'insertunorderedlist', //无序列表
    			               'fullscreen', //全屏
    			               //'directionalityltr', //从左向右输入
    			               //'directionalityrtl', //从右向左输入
    			               //'rowspacingtop', //段前距
    			               //'rowspacingbottom', //段后距
    			               'pagebreak', //分页
    			               //'insertframe', //插入Iframe
    			               //'imagenone', //默认
    			               //'imageleft', //左浮动
    			               //'imageright', //右浮动
    			               //'attachment', //附件
    			               //'imagecenter', //居中
    			               //'wordimage', //图片转存
    			               'lineheight', //行间距
    			               'edittip ', //编辑提示
    			               'customstyle', //自定义标题
    			               'autotypeset', //自动排版
    			               //'webapp', //百度应用
    			               'touppercase', //字母大写
    			               'tolowercase', //字母小写
    			               //'background', //背景
    			               //'template', //模板
    			               //'scrawl', //涂鸦
    			               //'music', //音乐
    			               //'inserttable', //插入表格
    			               'drafts', // 从草稿箱加载
    			               //'charts', // 图表
    			           ]
    			       ]
    		});
</script>
</html>
