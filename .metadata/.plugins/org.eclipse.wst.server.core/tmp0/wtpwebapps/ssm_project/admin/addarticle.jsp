<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="check_logstate.jsp"></jsp:include>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎使用后台管理系统</title>
<link rel="stylesheet" href="asset/css/pintuer.css">
<link rel="stylesheet" href="asset/css/admin.css">
<link rel="stylesheet" href="asset/css/table.css">
<script src="asset/js/jquery.js"></script>
<script src="asset/js/pintuer.js"></script>
<script type="text/javascript" src="js/article.js" charset="utf-8"></script>
<script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<style>
</style>
</head>
<body>
	<div class="add-article-panel" style="width: 80%; margin: 0 auto;">
		<div class="add-article-panel-head">
			<strong>新增新闻公告信息</strong>
		</div>
		<div class="add-article-panel-table">
			<form method="post" class="form-x" action="article/addArticle.action" name="myform">
				<div class="form-group">
					<div class="label">
						<label>标题</label>
					</div>
					<div class="field">
						<input type="text" name="title" class="input w150" id="title" placeholder="请输入标题" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>图片</label>
					</div>
					<div class="field">
						<input class="input w150" type="text" name="image" id="image" onclick="selimage();" placeholder="请选择图片" readonly="readonly" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>内容</label>
					</div>
					<div class="field">
						<textarea cols="80" name="contents" id="contents" rows="10" placeholder="请输入内容"> </textarea>
						<script type="text/javascript">
							CKEDITOR.replace('contents', {
								language : 'zh-cn'
							});
						</script>
					</div>
				</div>


				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button type="submit" id="sub">提交保存</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>




