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
<script src="echart/echarts.min.js" charset="UTF-8"></script>
<script src="echart/chartpie.js" charset="UTF-8"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder">评价统计</strong>
		</div>
		<table class="table table-hover text-center">
			<tr>
				<td><div class="text-center" id="chartmain" style="width: 99%; height: 500px;"></div></td>
			</tr>
		</table>
		<input type="hidden" name="basepath" id="basepath" value="<%=basePath%>">
	</div>
</body>
</html>

