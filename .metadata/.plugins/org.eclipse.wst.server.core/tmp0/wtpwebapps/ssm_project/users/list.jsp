<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
<title>${title }</title>
<style>
	/* 设置表格背景和边框 */
	.category_item {
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	    overflow: hidden;
	}
	.category_item dl {
	    background: #fafafa;
	    width: 100%;
	    padding: 0;
	    margin: 0;
	}

	.category_item h1 {
	    font-size: 16px;
	    font-weight: normal;
	    margin: 10px 0;
	    padding: 10px;
	    border-bottom: 1px solid #eee;
	}
	
	.category_tree h1 a {
	    color: #333;
	    text-decoration: none;
	    padding: 8px 15px;
	    display: block;
	    transition: all 0.3s ease;
	}
	

	.category_tree h1 a:hover {
	    color: #ffffff;
	    background-color: #EDCDEE;
	    border-radius: 3px;
	}
	
	/* 分类框样式 */
	.box1.cate {
	    padding: 15px;
	    margin: 0;
	}
	
	/* 清除浮动 */
	.box1.cate div {
	    clear: both;
	}
	
	/* 商品详情 */
	.box_list {
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	    overflow: hidden;
	    background-color: #fff;
	    margin-bottom: 20px;
	}
	
	/* 标题样式 */
	.box_list_1 h3 {
	    font-size: 18px;
	    font-weight: bold;
	    color: #ffffff;
	    background-color: #EDCDEE;
	    padding: 10px;
	    margin: 0;
	    text-align: center;
	    border-bottom: 1px solid #ddd;
	}
	
	/* 商品列表容器样式 */
	.list_details {
	    display: flex;
	    flex-wrap: wrap;
	    padding: 15px;
	    gap: 15px;
	    justify-content: flex-start;
	    background-color: #fafafa;
	}
	
	/* 单个商品样式 */
	.item_details {
	    width: 200px; /* 控制商品卡片宽度 */
	    border: 1px solid #eee;
	    border-radius: 5px;
	    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
	    background-color: #fff;
	    text-align: center;
	    padding: 10px;
	    transition: transform 0.3s ease, box-shadow 0.3s ease;
	}
	
	/* 商品悬停效果 */
	.item_details:hover {
	    transform: scale(1.05);
	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	}
	
	/* 商品图片样式 */
	.item_details img {
	    max-width: 80%;
	    height: auto;
	    border-radius: 5px;
	    margin-bottom: 10px;
	    margin-right:15px;
	    transition: opacity 0.3s ease;
	}
	
	/* 图片悬停效果 */
	.item_details img:hover {
	    opacity: 0.9;
	}
	
	/* 商品标题样式 */
	.item_details p {
	    font-size: 14px;
	    margin: 10px 0;
	    color: #333;
	}
	
	/* 商品标题链接样式 */
	.item_details p a {
	    color: #555;
	    text-decoration: none;
	    transition: color 0.3s ease;
	}
	
	/* 商品价格样式 */
	.shop_s {
	    font-size: 16px;
	    font-weight: bold;
	    color: #E74C3C;
	}
	/* 保证不同行左对齐 */
	.item_details:nth-child(1n) {
	    margin-left: 0; /* 确保每行起始元素没有偏移 */
	}
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div style="clear: both"></div>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			<a href="index.jsp">首页</a>
			<code> &gt; </code>
			商品列表
		</div>
	</div>
	<div class="blank"></div>
	<div class="block clearfix">
		<div class="AreaL">
			<div id="category_item" class="category_item">
				<h1 style="background-color: #EDCDEE;">所有商品分类</h1>
				<dl class="clearfix">
					<div class="cate" id="cate">
						<c:forEach items="${cateList}" var="cate">
							<h1>
								<a href="index/cate.action?id=${cate.cateid }">${cate.catename }</a>
							</h1>
						</c:forEach>
					</div>
					<div style="clear: both"></div>
				</dl>
			</div>
			<div class="blank"></div>
			
			<div class="blank5"></div>
		</div>


		<div class="AreaR">
			<div class="box_list">
				<div class="box_list_1">
					<h3>
						<span>商品列表</span>
					</h3>
					<div class="list_details">
						<c:forEach items="${goodsList}" var="goods">
							<div class="item_details">
								<a href="index/detail.action?id=${goods.goodsid }"><img src="${goods.image }" alt="${goods.goodsname }" class="goodsimg" /></a><br />
								<p>
									<a href="index/detail.action?id=${goods.goodsid }" title="${goods.goodsname }">${goods.goodsname }</a>
								</p>
								价格：<font class="shop_s">￥${goods.price }元</font><br />
							</div>
						</c:forEach>
					</div>

				</div>
			</div>
			<div class="blank5"></div>
			<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
				<tr>
					<!-- PageHelper中将分页的结果存储到html并设置为请求对象，供JSP调用 -->
					<td align="center" bgcolor="#ffffff">${html}</td>
				</tr>
			</table>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
