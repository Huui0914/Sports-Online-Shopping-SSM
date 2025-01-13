<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
<title>${title }</title>
<style>
#goodsInfo {
    display: flex; /* 使用 flexbox 布局 */
    justify-content: space-between; /* 子元素均匀分布 */
    align-items: flex-start; /* 子元素顶部对齐 */
    width: 90%; /* 限制宽度为父容器的 90%，防止过宽 */
    max-width: 1200px; /* 限制最大宽度 */
    margin: 0 auto; /* 中心对齐 */
    padding: 20px; /* 可选：为内部内容增加间距 */
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href="index.jsp">首页</a>
			<code> &gt; </code>
			商品信息
		</div>
	</div>
	
	<div class="blank"></div>
	<div class="block clearfix">
		<!-- 商品详细信息 -->
		<div class="AreaR-detail" style="width=100%;">
			<div id="goodsInfo" class="clearfix">
				<div class="imgInfo">
					<img src="${goods.image }" alt="${goods.goodsname }" width="360px;" height="360px" />
					<div class="blank5"></div>
					<div class="blank"></div>
				</div>
				<div class="textInfo">
					<!-- 表单提交后数据发送给Controller：index/addcart.action -->
					<form action="index/addcart.action" method="post" name="ECS_FORMBUY" id="ECS_FORMBUY">
						<h1 class="clearfix">${goods.goodsname }</h1>
						<ul class="ul2 clearfix">
							<li class="clearfix" style="width: 100%">
								<dd>
									<strong>价格：</strong><font class="shop" id="ECS_SHOPPRICE">￥${goods.price }元</font>
								</dd>
							</li>
							<li class="clearfix" style="width: 100%">
								<dd>
									<strong>商品类型：</strong><a href="index/cate.action?id=${goods.cateid }">${goods.catename }</a>
								</dd>
							</li>
							<li class="clearfix" style="width: 100%">
								<dd>
									<strong>上架日期：</strong>${goods.addtime}
								</dd>
							</li>
							<li class="clearfix" style="width: 100%">
								<dd>
									<strong>点击数：</strong>${goods.hits}
								</dd>
							</li>
							<li class="clearfix" style="width: 100%">
								<dd>
									<strong>销量：</strong>${goods.sellnum}
								</dd>
							</li>
						</ul>
						<ul class="bnt_ul">
							<li class="clearfix">
								<dd>
									<strong>购买数量：</strong> <input name="num" type="text" id="number" value="1" size="4"style="border: 1px solid #ccc;" /> 
									<input type="hidden" name="goodsid" value="${goods.goodsid }" /> 
									<input type="hidden" name="price" value="${goods.price }" />
								</dd>
							</li>
							<li class="padd">
								<input type="image" src="asset/images/cartImg.png" />
							</li>
						</ul>
					</form>
				</div>
			</div>
			<div class="blank"></div>

			<div class="box">
				<div style="padding: 0 0px;">
					<div id="com_b" class="history clearfix">
						<h2>商品描述</h2>
					</div>
				</div>
				<div class="box_1">
					<div id="com_v" class="  " style="padding: 6px;"></div>
					<div id="com_h">
						<blockquote>${goods.contents }</blockquote>
					</div>
				</div>
			</div>
			<div class="blank"></div>
			<jsp:include page="introduction.jsp"></jsp:include>
			

		</div>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
