<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="check_logstate.jsp"></jsp:include>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%><!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
<title>欢迎使用网站后台管理系统</title>
<link rel="stylesheet" href="asset/css/pintuer.css">
<link rel="stylesheet" href="asset/css/admin.css">
<link rel="stylesheet" href="asset/css/table.css">
<script src="asset/js/jquery.js"></script>
<script src="asset/js/pintuer.js"></script>
</head>
<body>
	<div class="search-user-panel">
		<div class="search-user-panel-head">
			<strong>新闻公告信息查询</strong>
		</div>
		<table class="search-user-panel-table">

			<thead>
				<tr>
					<th>标题</th>
					<th>发布日期</th>
					<th>点击数</th>
				</tr>
			</thead>
			<c:forEach items="${articleList}" var="article">
				<tr>
					<td>${article.title}</td>
					<td>${article.addtime}</td>
					<td>${article.hits}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5"><div class="pagelist">
						<form action="article/queryArticleByCond.action" name="myform" method="post">
							<label>查询条件: <select name="cond" class="select" style="width: 150px; line-height: 17px; display: inline-block">
									<option value="title">按标题查询</option>
							</select>
							</label>&nbsp;&nbsp;&nbsp; <label>关键字: <input type="text" name="name" required style="width: 100px" /></label>&nbsp;&nbsp;&nbsp; <label><input
								type="submit" value="查询" class="button border-main " /> </label>${html }
						</form>
					</div></td>
			</tr>
		</table>
	</div>
</body>
</html>

