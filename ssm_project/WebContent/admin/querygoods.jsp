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
			<strong class="icon-search">商品信息查询</strong>
		</div>
		<table class="search-user-panel-table">

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
				</tr>
			</c:forEach>
			<tr>
				<td colspan="11"><div class="pagelist">
						<form action="goods/queryGoodsByCond.action" name="myform" method="post">
							<label>查询条件: <select name="cond" class="select" style="width: 150px; line-height: 17px; display: inline-block">
									<option value="goodsname">按商品名称查询</option>
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

