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
.order-details {
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
.show-order-details-box h5 {
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
.show-order-details-box table {
    width: 100%;
    border-collapse: collapse;
    margin: 15px 0;
    font-size: 14px;
}

/* 表头样式 */
.show-order-details-box table th {
    background-color: #f9f9f9;
    color: #333;
    font-weight: bold;
    text-align: center;
    padding: 10px;
    border-bottom: 2px solid #ddd;
}

/* 表格内容单元格样式 */
.show-order-details-box table td {
    background-color: #ffffff;
    padding: 10px;
    text-align: center;
    color: #555;
    border-bottom: 1px solid #eee;
    word-wrap: break-word;
    word-break: break-word;
}

/* 响应式优化 */
@media (max-width: 768px) {
    .order-details {
        width: 95%; /* 调整宽度以适配小屏幕 */
        padding: 15px;
    }

    .show-order-details-box table td,
    .show-order-details-box table th {
        font-size: 12px; /* 缩小字体 */
    }
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
			用户中心
		</div>
	</div>
	<div class="blank"></div>
	<div class="block clearfix">
		<div class="AreaL">
			<jsp:include page="usermenu.jsp"></jsp:include>
		</div>
		<div class="AreaR">
			<div class="order-details">
				<div class="order-details-box">
					<div class="show-order-details-box" style="_height: 1%;">
						<h5>
							<span>我的订单</span>
						</h5>
						<div class="blank"></div>
						<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
							<tr>
								<th bgcolor="#ffffff">订单号</th>
								<th bgcolor="#ffffff">商品</th>
								<th bgcolor="#ffffff">单价</th>
								<th bgcolor="#ffffff">数量</th>
							</tr>
							<c:forEach items="${detailsList}" var="orders">
								<tr>
									<td align="center" bgcolor="#ffffff">${orders.ordercode}</td>
									<td align="center" bgcolor="#ffffff">${orders.goodsname}</td>
									<td align="center" bgcolor="#ffffff">${orders.price}</td>
									<td align="center" bgcolor="#ffffff">${orders.num}</td>
								</tr>
							</c:forEach>
						</table>
						<div class="blank5"></div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="blank"></div>



	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
