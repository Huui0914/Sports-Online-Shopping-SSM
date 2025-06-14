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
</head>
<body>
	<div class="list-admin-panel">
		<div class="list-admin-panel-head">
			<strong class="icon-reorder">意见反馈信息列表</strong>
		</div>
		<table class="list-admin-panel-table">

			<thead>
				<tr>
					<th>用户</th>
					<th>标题</th>
					<th>内容</th>
					<th>日期</th>
					<th>状态</th>
					<th>管理员回复</th>
					<th>操作</th>
				</tr>
			</thead>
			<c:forEach items="${complainsList}" var="complains">
				<tr>
					<td>${complains.username}</td>
					<td>${complains.title}</td>
					<td>${complains.contents}</td>
					<td>${complains.addtime}</td>
					<td>${complains.status}</td>
					<td>${complains.reps}</td>
					<td><c:if test="${complains.status eq '未回复' }">
							<a href="complains/getComplainsById.action?id=${complains.complainsid}">回复</a>&nbsp;&nbsp;</c:if><a
						href="complains/deleteComplains.action?id=${complains.complainsid}" onclick="{if(confirm('确定要删除吗?')){return true;}return false;}"><span
							class="icon-trash-o"></span>删除</a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="8"><div class="pagelist">${html }</div></td>
			</tr>
		</table>
	</div>
</body>
</html>

