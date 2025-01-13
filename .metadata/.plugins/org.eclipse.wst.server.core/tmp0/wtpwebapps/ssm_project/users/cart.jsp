<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>" />
<title>${title }</title>
<style>
	/* 购物车容器样式 */
	.cart_table {
		width:80%;
	    margin: 20px auto;
	    padding: 10px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	    background-color: #fff;
	}
	
	/* 购物车标题 */
	.cart h6 {
	    font-size: 20px;
	    font-weight: bold;
	    color: #fff;
	    background-color: #EDCDEE;
	    padding: 10px;
	    text-align: center;
	    margin: 0;
	    border-radius: 5px 5px 0 0;
	}
	
	/* 表格整体样式 */
	.cart table {
	    width: 90%;
	    border-collapse: collapse;
	    margin: 15px auto; 
	}
	
	/* 表头样式 */
	.cart table th {
	    background-color: #f9f9f9;
	    color: #333;
	    font-size: 16px;
	    font-weight: bold;
	    padding: 10px;
	    text-align: center;
	    border-bottom: 2px solid #ddd;
	}
	
	/* 表格内容行样式 */
	.cart table td {
	    background-color: #fff;
	    padding: 10px;
	    text-align: center;
	    font-size: 14px;
	    color: #555;
	    border-bottom: 1px solid #eee;
	}
	/* 图片样式 */
	#cart-img {
	    width: 80px;
	    height: 60px;
	    border-radius: 5px;
	    margin-bottom: 5px;
		display: block; /* 使图片成为块级元素 */
	    margin-left: auto; /* 水平居中 */
	    margin-right: auto; /* 水平居中 */
	}
	/* “继续购物”和“结算中心”样式 */
	.cart table td img {
	    vertical-align: middle;
	    cursor: pointer;
	}
	
	.cart table td:first-child {
	    text-align: left; /* 继续购物按钮靠左 */
	    padding-left: 10px;
	}
	
	.cart table td:last-child {
	    text-align: right; /* 结算中心按钮靠右 */
	    padding-right: 10px;
	}
	
	.cart table td img {
	    width: auto;
	    height: auto;
	    max-height: 40px; /* 确保图片高度适中 */
	}
	/* 商品名称链接样式 */
	.cart table td a.f6 {
	    color: #555;
	    text-decoration: none;
	    font-weight: bold;
	    transition: color 0.3s ease;
	}
	
	.cart table td a.f6:hover {
	    color: #EDCDEE;
	}
	
	/* 操作按钮样式 */
	.cart table td a {
	    color: #E74C3C;
	    text-decoration: underline;
	    font-size: 14px;
	    font-weight: bold;
	}
	
	.cart table td a:hover {
	    color: #FF5733;
	}
	
	/* 响应式优化 */
	@media (max-width: 768px) {
	    .cart table td {
	        font-size: 12px;
	    }
	
	    .cart table td img {
	        width: 60px;
	        height: 60px;
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
			购物车
		</div>
	</div>
	<div class="blank"></div>
	<div class="cart_table">
		<div class="cart">
			<h6>
				<span>购物车</span>
			</h6>
			<!-- 表单提交的数据发送到Controller：index/deletecart.action -->
			<form action="index/deletecart.action" method="post">
				<!-- 购物车信息的表格 -->
				<table width="99%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th bgcolor="#ffffff">商品名称</th>
						<th bgcolor="#ffffff">价格</th>
						<th bgcolor="#ffffff">数量</th>
						<th bgcolor="#ffffff">日期</th>
						<th bgcolor="#ffffff">操作</th>
					</tr>
					<c:forEach items="${cartList}" var="cart">
						<tr>
							<td bgcolor="#ffffff" align="center" style="width: 300px;">
								<a href="index/detail.action?id=${cart.goodsid }"target="_blank">
									<img id="cart-img" src="${cart.image }" border="0" title="${cart.goodsname }" />
								</a> 
								<br /> 
								<a href="index/detail.action?id=${cart.goodsid }" target="_blank" class="f6">${cart.goodsname }</a>
							</td>
							<td align="center" bgcolor="#ffffff">￥${cart.price }元</td>
							<td align="center" bgcolor="#ffffff">${cart.num }</td>
							<td align="center" bgcolor="#ffffff">${cart.addtime }</td>
							<!-- 前端以 URL 查询参数的形式传递 id -->
							<td bgcolor="#ffffff">
								<a
								href="javascript:if (confirm('您确实要移出购物车吗？')) location.href='<%=basePath%>index/deletecart.action?id=${cart.cartid}'; "
								>移除
								</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				
				<!-- 继续购物和结算中心 -->
				<table width="99%" align="center" border="0" cellpadding="5" cellspacing="0" bgcolor="#dddddd">
					<tr>
						<td bgcolor="#ffffff"><a href="index.jsp">
						<img src="asset/images/continue.png"
								alt="continue" /> </a></td>
						<td bgcolor="#ffffff" align="right"><a href="index/preCheckout.action">
						<img src="asset/images/checkout.png" alt="checkout" /> </a></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="blank"></div>
		<div class="blank5"></div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
