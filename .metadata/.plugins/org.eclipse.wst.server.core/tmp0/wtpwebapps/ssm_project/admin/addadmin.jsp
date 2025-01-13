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
<script src="asset/js/jquery.js"></script>
<script src="asset/js/pintuer.js"></script>
<script type="text/javascript" src="js/admin.js" charset="utf-8"></script>
<script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<style>
/* 外层容器样式 */
.add-admin-panel {
    width: 70%;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    background-color: #fff;
    font-family: Arial, sans-serif;
}

/* 标题样式 */
.add-admin-panel-title {
    font-size: 20px;
    font-weight: bold;
    color: #fff;
    background-color: #EDCDEE;
    padding: 15px;
    text-align: center;
    border-radius: 8px 8px 0 0;
}

/* 表单内容样式 */
.add-admin-panel-content {
    padding: 20px;
}

/* 表单组样式 */
.form-group {
    display: flex;
    margin-bottom: 15px;
    align-items: center;
}

/* 标签部分样式 */
.label {
    width: 20%;
    text-align: right;
    font-weight: bold;
    color: #333;
    padding-right: 10px;
}

/* 输入框容器样式 */
.field {
    width: 80%;
    text-align: left;
}

/* 输入框样式 */
.input {
    width: 100%;
    padding: 8px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
    transition: border 0.3s ease;
}

.input:focus {
    border-color: #4CAF50;
    outline: none;
}

/* 提交按钮样式 */
button[type="submit"] {
    background-color: #EDCDEE;
    color: #fff;
    font-size: 16px;
    font-weight: bold;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
}

/* 响应式优化 */
@media (max-width: 768px) {
    .add-admin-panel {
        width: 90%;
    }

    .form-group {
        flex-direction: column;
        align-items: flex-start;
    }

    .label {
        text-align: left;
        padding-right: 0;
        margin-bottom: 5px;
    }

    .field {
        width: 100%;
    }

    .input {
        width: 100%;
    }

    button[type="submit"] {
        width: 100%;
    }
}

</style>
</head>
<body>
	<div class="add-admin-panel" style="width: 70%; margin: 0 auto;">
		<div class="add-admin-panel-title" id="add">
			<strong>新增管理员信息</strong>
		</div>
		<div class="add-admin-panel-content">
			<!-- 表单数据发送给Controller：admin/addAdmin.action -->
			<form method="post" class="form-x" action="admin/addAdmin.action" name="myform">
				<div class="form-group">
					<div class="label">
						<label>用户名</label>
					</div>
					<div class="field">
						<input type="text" name="username" class="input w150" id="username" placeholder="请输入用户名" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>密码</label>
					</div>
					<div class="field">
						<input type="password" name="password" class="input w150" id="password" placeholder="请输入密码" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>姓名</label>
					</div>
					<div class="field">
						<input type="text" name="realname" class="input w150" id="realname" placeholder="请输入姓名" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>联系方式</label>
					</div>
					<div class="field">
						<input type="text" name="contact" class="input w150" id="contact" placeholder="请输入联系方式" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button type="submit">提交保存</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>




