<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%><!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
<title>欢迎使用运动用品在线商城后台系统</title>
<link rel="stylesheet" href="asset/css/pintuer.css">
<link rel="stylesheet" href="asset/css/admin.css">
<script src="asset/js/jquery.js"></script><!-- 导入JQuery包 -->
<script src="asset/js/pintuer.js"></script><!-- 导入Pintuer前端架构 -->
</head>
<body>
	<div style="background-image: url('asset/images/loginBackground.JPG');background-size: 100% 100%;object-fit: cover;">
	<div class="container">
		<div class="line bouncein">
			<div class="xs6 xm4 xs3-move xm4-move">
				<div style="height: 200px;"></div>
				<div class="media media-y margin-big-bottom"></div>
				<!-- 表单数据发送给controller:admin/login.action -->
				<form action="admin/login.action" name="myform" method="post">
					<div class="panel loginbox">
						<div class="text-center margin-big padding-big-top">
							<h1 style="color: #b027b2;font-size: 28px;font-weight: bold;letter-spacing: 2px;">运动用品在线商城后台系统</h1>
						</div>
						<div class="panel-body" style="padding: 30px; padding-bottom: 10px; padding-top: 10px;">
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="text" class="input input-big" name="username" placeholder="登录账号" data-validate="required:请填写账号" /> <span
										class="icon icon-user margin-small"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="password" class="input input-big" name="password" placeholder="登录密码" data-validate="required:请填写密码" /> <span
										class="icon icon-key margin-small"></span>
								</div>
							</div>
						</div>
						<div style="padding: 30px;">
							<input type="submit" class="button button-block bg-main text-big input-big" value="登录" style="background-color: #b027b2;">
						</div>
					</div>
				</form>
				<div style="height: 200px;"></div>
			</div>
		</div>
	</div>
	</div>
</body>
<%
	String message = (String) session.getAttribute("message");
	if (message == null) {
		message = "";
	}
	if (!message.trim().equals("")) {
		out.println("<script language='javascript'>");
		out.println("alert('" + message + "');");
		out.println("</script>");
	}
	session.removeAttribute("message");
%>
</html>