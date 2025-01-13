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
			<strong class="icon-reorder">订单信息列表</strong>
		</div>
		<table class="list-admin-panel-table">

			<thead>
				<tr>
					<th>订单号</th>
					<th>用户</th>
					<th>总计</th>
					<th>状态</th>
					<th>下单日期</th>
					<th>收货人</th>
					<th>送货地址</th>
					<th>联系方式</th>
					<th>操作</th>
				</tr>
			</thead>
			<c:forEach items="${ordersList}" var="orders">
				<tr>
					<td>${orders.ordercode}</td>
					<td>${orders.username}</td>
					<td>${orders.total}</td>
					<td>${orders.status}</td>
					<td>${orders.addtime}</td>
					<td>${orders.receiver}</td>
					<td>${orders.address}</td>
					<td>${orders.contact}</td>
					<td>
						<c:if test="${orders.status eq '已付款'}">
							<a href="orders/status.action?id=${orders.ordersid}">发货</a>&nbsp;&nbsp;
						</c:if>
							<a href="orders/deleteOrders.action?id=${orders.ordersid}" onclick="{if(confirm('确定要删除吗?')){return true;}return false;}">
								<span class="icon-trash-o"></span>
							删除</a>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="8"><div class="pagelist">${html }</div></td>
			</tr>
		</table>
	</div>
</body>
</html>

