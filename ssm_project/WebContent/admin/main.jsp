<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%><!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
<title>欢迎使用运动商品在线商城系统</title>
<link rel="stylesheet" href="asset/css/pintuer.css">
<link rel="stylesheet" href="asset/css/admin.css">
<script src="asset/js/jquery.js"></script>
</head>
<body style="background-color: #f2f9fd;">
	<!-- 导航条 -->
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>
				运动商品在线商城后台系统
			</h1>
		</div>
		<div class="head-l">
			<a class="button button-little bg-black" href="admin/prePwd.action" target="main"><span class="icon-key"></span>修改密码</a> &nbsp;&nbsp; <a
				class="button button-little bg-black" href="admin/exit.action"><span class="icon-power-off"></span>退出登录</a>
		</div>
	</div>
	<!-- 左侧菜单 -->
	<jsp:include page="menu.jsp"></jsp:include>
	<!-- 动态控制左侧导航栏的显示和高亮效果 -->
	<script type="text/javascript">
		$(function() {
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);//slideToggle切换被选元素的可见性
				$(this).toggleClass("on");//选择要操作的元素集合
			})
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());//文本内容更新
				$(".leftnav ul li a").removeClass("on");//链接样式切换
				$(this).addClass("on");
			})
		});
	</script>
	<!-- 面包屑导航 -->
	<ul class="bread">
		<li><a href="" target="right" class="icon-home"> 首页</a></li>
		<li><a href="" id="a_leader_txt"></a></li>
	</ul>
	<!-- 主页面显示区 -->
	<div class="admin">
		<iframe scrolling="auto" rameborder="0" src="" name="main" width="100%" height="100%"></iframe>
	</div>
</body>
</html>