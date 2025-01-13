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
<script type="text/javascript" src="js/cate.js" charset="utf-8"></script>
<script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</head>
<body>
	<div class="update-admin-panel" style="width: 55%; margin: 0 auto;">
		<div class="update-admin-panel-head" id="add">
			<strong><span class="icon-edit"></span>编辑商品类型信息</strong>
		</div>
		<div class="update-admin-panel-table">
			<form method="post" class="form-x" action="cate/updateCate.action" name="myform">

				<div class="form-group">
					<div class="label">
						<label>类型名称</label>
					</div>
					<div class="field">
						<input type="text" name="catename" class="input w150" id="catename" value="${cate.catename}" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>备注</label>
					</div>
					<div class="field">
						<input type="text" name="memo" class="input w150" id="memo" value="${cate.memo}" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<input type="hidden" name="cateid" id="cateid" value="${cate.cateid}" /><input type="hidden" name="addtime" id="addtime"
							value="${cate.addtime}" />

						<button id="sub" type="submit">提交保存</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>




