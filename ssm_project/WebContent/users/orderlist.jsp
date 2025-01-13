<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>" />
<title>${title }</title>
<style>
/* 外层容器样式 */
.order {
    width: 90%;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    background-color: #fff;
    font-family: Arial, sans-serif;
}

/* 标题样式 */
.show-order-box h5 {
    font-size: 20px;
    font-weight: bold;
    color: #fff;
    background-color: #EDCDEE;
    padding: 15px;
    text-align: center;
    margin: 0;
    border-radius: 8px 8px 0 0;
}

/* 表格样式 */
.show-order-box table {
    width: 100%;
    border-collapse: collapse;
    margin: 15px 0;
    font-size: 14px;
}

/* 表头样式 */
.show-order-box table tr:first-child td {
    background-color: #f9f9f9;
    font-weight: bold;
    color: #333;
    text-align: center;
    padding: 10px;
    border-bottom: 2px solid #ddd;
}

/* 表格内容单元格样式 */
.show-order-box table td {
    background-color: #ffffff;
    padding: 10px;
    text-align: center;
    color: #555;
    border-bottom: 1px solid #eee;
    word-wrap: break-word;
    word-break: break-all;
}

/* 链接样式 */
.show-order-box table td a {
    color: #007BFF;
    text-decoration: none;
    font-weight: bold;
    margin-right: 10px;
    transition: color 0.3s ease;
}

.show-order-box table td a:hover {
    color: #0056b3;
}

/* 按钮悬停效果 */
.show-order-box table td a:last-child {
    color: #E74C3C;
}

.show-order-box table td a:last-child:hover {
    color: #FF5733;
}

/* 底部分页表格样式 */
.show-order-box table:last-child td {
    text-align: center;
    padding: 15px;
    font-size: 14px;
    background-color: #f9f9f9;
    color: #555;
}
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href=".">首页</a>
			<code> &gt; </code>
			我的订单
		</div>
	</div>
	<div class="blank"></div>

	<div class="blank"></div>
	<div class="block clearfix">
		<div class="AreaL">
			<jsp:include page="usermenu.jsp"></jsp:include>
		</div>
		<div class="AreaR">
			<div class="order">
				<div class="order-box">
					<div class="show-order-box" style="_height: 1%;">
						<h5>
							<span>我的订单</span>
						</h5>
						<div class="blank"></div>
						<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
							<tr>
								<td align="center" bgcolor="#ffffff">订单号</td>
								<td align="center" bgcolor="#ffffff">总计</td>
								<td align="center" bgcolor="#ffffff">生成日期</td>
								<td align="center" bgcolor="#ffffff">状态</td>
								<td align="center" bgcolor="#ffffff">收货人</td>
								<td align="center" bgcolor="#ffffff">送货地址</td>
								<td align="center" bgcolor="#ffffff">联系方式</td>
								<td align="center" bgcolor="#ffffff">操作</td>
							</tr>
							<c:forEach items="${ordersList}" var="orders">
								<tr>
									<td align="center" bgcolor="#ffffff">${orders.ordercode}</td>
									<td align="center" bgcolor="#ffffff">${orders.total}</td>
									<td align="center" bgcolor="#ffffff">${orders.addtime}</td>
									<td align="center" bgcolor="#ffffff">${orders.status}</td>
									<td align="center" bgcolor="#ffffff">${orders.receiver}</td>
									<td align="center" bgcolor="#ffffff">${orders.address}</td>
									<td align="center" bgcolor="#ffffff">${orders.contact}</td>
									<td align="center" bgcolor="#ffffff"><c:if test="${orders.status eq '未付款'}">
											<a href="index/prePay.action?id=${orders.ordersid}">付款</a>
										</c:if> <c:if test="${orders.status eq '已发货'}">
											<a href="index/over.action?id=${orders.ordersid}">确认收货</a>
										</c:if><a href="index/orderdetail.action?id=${orders.ordercode}">订单明细</a></td>
								</tr>
							</c:forEach>
						</table>
						<div class="blank5"></div>
						<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
							<tr>
								<td align="center" bgcolor="#ffffff">${html}</td>
							</tr>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="blank"></div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
