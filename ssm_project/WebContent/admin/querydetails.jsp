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
			<strong>订单明细信息查询</strong>
		</div>
		<table class="search-user-panel-table">

			<thead>
				<tr>
					<th>订单号</th>
					<th>商品</th>
					<th>单价</th>
					<th>数量</th>
				</tr>
			</thead>
			<c:forEach items="${detailsList}" var="details">
				<tr>
					<td>${details.ordercode}</td>
					<td>${details.goodsname}</td>
					<td>${details.price}</td>
					<td>${details.num}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4"><div class="pagelist">
						<form action="details/queryDetailsByCond.action" name="myform" method="post">
							<label>查询条件: <select name="cond" class="select" style="width: 150px; line-height: 17px; display: inline-block">
									<option value="ordercode">按订单号查询</option>
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

