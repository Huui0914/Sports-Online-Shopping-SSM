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
			<strong class="icon-reorder">商品信息列表</strong>
		</div>
		<table class="list-admin-panel-table">

			<thead>
				<tr>
					<th>商品名称</th>
					<th>商品类型</th>
					<th>商品价格</th>
					<th>是否推荐</th>
					<th>是否特价</th>
					<th>库存数量</th>
					<th>上架日期</th>
					<th>点击数</th>
					<th>销售数</th>
					<th>操作</th>
				</tr>
			</thead>
			<c:forEach items="${goodsList}" var="goods">
				<tr>
					<td>${goods.goodsname}</td>
					<td>${goods.catename}</td>
					<td>${goods.price}</td>
					<td>${goods.recommend}</td>
					<td>${goods.special}</td>
					<td>${goods.storage}</td>
					<td>${goods.addtime}</td>
					<td>${goods.hits}</td>
					<td>${goods.sellnum}</td>
					<td><a href="goods/getGoodsById.action?id=${goods.goodsid}"><span class="icon-edit"></span>编辑</a>&nbsp;&nbsp;<a
						href="goods/deleteGoods.action?id=${goods.goodsid}" onclick="{if(confirm('确定要删除吗?')){return true;}return false;}"><span
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

