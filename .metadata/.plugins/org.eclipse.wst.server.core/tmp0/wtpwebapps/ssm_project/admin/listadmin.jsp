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
			<strong>管理员信息列表</strong>
		</div>
		<table class="list-admin-panel-table">

			<thead>
				<tr>
					<th>用户名</th>
					<th>姓名</th>
					<th>联系方式</th>
					<th>创建日期</th>
					<th>操作</th>
				</tr>
			</thead>
			<c:forEach items="${adminList}" var="admin">
				<tr>
					<td>${admin.username}</td>
					<td>${admin.realname}</td>
					<td>${admin.contact}</td>
					<td>${admin.addtime}</td>
					<td><a href="admin/getAdminById.action?id=${admin.adminid}"><span class="icon-edit"></span>编辑</a>&nbsp;&nbsp;<a
						href="admin/deleteAdmin.action?id=${admin.adminid}" onclick="{if(confirm('确定要删除吗?')){return true;}return false;}"><span
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

