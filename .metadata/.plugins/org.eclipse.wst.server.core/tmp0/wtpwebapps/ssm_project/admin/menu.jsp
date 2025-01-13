<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 菜单区域 -->
<div class="leftnav">
	<h2>
		<span ></span>管理员信息管理
	</h2>
	<ul style="display: block">
		<li><a href="admin/createAdmin.action" target="main"><span class=""></span>新增管理员</a></li>
		<li><a href="admin/getAllAdmin.action" target="main"><span class=""></span>管理员列表</a></li>
	</ul>

	<h2>
		<span ></span>用户信息管理
	</h2>
	<ul>
		<li><a href="users/getAllUsers.action" target="main"><span class=""></span>用户信息列表</a></li>
		<li><a href="users/queryUsersByCond.action" target="main"><span class=""></span>查询用户信息</a></li>
	</ul>

	<h2>
		<span ></span>新闻公告管理
	</h2>
	<ul>
		<li><a href="article/createArticle.action" target="main"><span class=""></span>新增新闻公告</a></li>
		<li><a href="article/getAllArticle.action" target="main"><span class=""></span>新闻公告列表</a></li>
		<li><a href="article/queryArticleByCond.action" target="main"><span class=""></span>查询新闻公告</a></li>
	</ul>

	<h2>
		<span ></span>商品类型管理
	</h2>
	<ul>
		<li><a href="cate/createCate.action" target="main"><span class=""></span>新增商品类型</a></li>
		<li><a href="cate/getAllCate.action" target="main"><span class=""></span>商品类型列表</a></li>
		<li><a href="cate/queryCateByCond.action" target="main"><span class=""></span>查询商品类型</a></li>
	</ul>

	<h2>
		<span ></span>商品信息管理
	</h2>
	<ul>
		<li><a href="goods/createGoods.action" target="main"><span class=""></span>新增商品信息</a></li>
		<li><a href="goods/getAllGoods.action" target="main"><span class=""></span>商品信息列表</a></li>
		<li><a href="goods/queryGoodsByCond.action" target="main"><span class=""></span>查询商品信息</a></li>
	</ul>

	<h2>
		<span ></span>订单信息管理
	</h2>
	<ul>
		<li><a href="orders/getAllOrders.action" target="main"><span class=""></span>订单信息列表</a></li>
		<li><a href="orders/queryOrdersByCond.action" target="main"><span class=""></span>查询订单信息</a></li>
	</ul>

	<h2>
		<span ></span>意见反馈管理
	</h2>
	<ul>
		<li><a href="complains/getAllComplains.action" target="main"><span class=""></span>意见反馈列表</a></li>
		<li><a href="complains/queryComplainsByCond.action" target="main"><span class=""></span>查询意见反馈</a></li>
	</ul>
</div>



