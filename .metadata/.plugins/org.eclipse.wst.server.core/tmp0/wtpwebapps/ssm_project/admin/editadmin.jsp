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
<script type="text/javascript" src="js/admin.js" charset="utf-8"></script>
<script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<style>

</style>
</head>
<body>
	<div class="update-admin-panel">
		<div class="update-admin-panel-head">
			<strong>编辑管理员信息</strong>
		</div>
		<div class="update-admin-panel-table">
			<form method="post" class="form-x" action="admin/updateAdmin.action" name="myform">
				<div class="form-group">
					<div class="label">
						<label>用户名</label>
					</div>
					<div class="field">
						<input type="text" name="username" class="input w150" id="username" value="${admin.username}" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>姓名</label>
					</div>
					<div class="field">
						<input type="text" name="realname" class="input w150" id="realname" value="${admin.realname}" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>联系方式</label>
					</div>
					<div class="field">
						<input type="text" name="contact" class="input w150" id="contact" value="${admin.contact}" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<input type="hidden" name="adminid" id="adminid" value="${admin.adminid}" /><input type="hidden" name="password" id="password"
							value="${admin.password}" /> <input type="hidden" name="addtime" id="addtime" value="${admin.addtime}" />

						<button id="sub" type="submit">提交保存</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>




