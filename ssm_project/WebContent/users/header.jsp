<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    // 动态获取项目的根路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!-- 引入样式文件 -->
<link href="themes/ecmoban_dangdang/style.css" rel="stylesheet" type="text/css" />
<!-- 顶部横幅 -->
<img src="asset/images/top_bg2.jpg" alt="顶部横幅" style="height: 80px; width: 100%;" />
<!-- 头部区域 -->
<div class="clearfix">
    <div class="block header">
        <div class="top" style="display: flex; align-items: center; padding-left: 20px; height: 100%;">
            <!-- 网站LOGO -->
            <a href="index.jsp" style="font-size: 30px; font-weight: bold; text-align: center; color: #b027b2; letter-spacing: 2px;">
                <img src="asset/images/logo.jpg" alt="网站LOGO" style="height: 80px;">
            </a>
            <!-- 导航菜单 -->
            <div class="head_r" style="display: flex; align-items: center;">
                <div class="menu" style="width: 500px; margin-top: 33px; font-size: 15px;">
                    <a href="index.jsp" rel="nofollow">首页</a>
                    <a href="index/recommend.action" rel="nofollow">热销推荐</a>
                    <a href="index/special.action" rel="nofollow">特价促销</a>
                    <a href="index/all.action" rel="nofollow">查看所有</a>
                    <a href="index/article.action" rel="nofollow">新闻公告</a>
                </div>
                <!-- 搜索框 -->
				<div class="top_search" style="display: flex; align-items: center; margin-top: 5px;">
				    <form action="index/query.action" method="post" id="searchForm" name="searchForm" style="display: flex; align-items: center;">
				        <!-- 搜索框 -->
				        <input 
				            name="name" 
				            type="text" 
				            id="keyword" 
				            class="keyword" 
				            placeholder="搜索商品..." 
				            style="height: 36px; padding: 0 10px; font-size: 14px; border: 1px solid #ddd; border-radius: 4px; flex: 1;" 
				        />
				        <!-- 搜索按钮 -->
				        <input 
				            value="搜 索" 
				            id="searchbtn" 
				            type="submit" 
				            style="height: 38px; margin-left: 8px; background: #b027b2; color: white; font-size: 16px; border: none; border-radius: 4px; padding: 0 20px; cursor: pointer;" 
				        />
				    </form>
				</div>
            </div>
        </div>
    </div>
</div>

<!-- 导航栏 -->
<div style="clear: both;"></div>
<div class="menu_box clearfix">
    <div class="block" style="display: flex;">
        <!-- 合作伙伴LOGO -->
        <div style="width: 730px;">
            <img width="83" height="37" src="https://image2.cn10.cn/upload/images/20220602/17552766122_200x90.png" alt="合作伙伴1">
            <img width="83" height="37" src="https://image2.cn10.cn/upload/images/20220511/18030956843_200x90.png" alt="合作伙伴2">
            <img width="83" height="37" src="https://image2.cn10.cn/upload/images/20220506/18011886028_200x90.png" alt="合作伙伴3">
            <img width="83" height="37" src="https://image2.cn10.cn/upload/images/20220511/18030597711_200x90.png" alt="合作伙伴4">
            <img width="83" height="37" src="asset/images/5.png" alt="合作伙伴5">
            <img width="83" height="37" src="https://image2.cn10.cn/upload/images/20220511/18031023475_200x90.png" alt="合作伙伴6">
            <img width="83" height="37" src="https://image2.cn10.cn/upload/images/20220511/18030671680_200x90.png" alt="合作伙伴7">
            <img width="83" height="37" src="https://image2.cn10.cn/upload/images/20220511/18030961893_200x90.png" alt="合作伙伴8">
            <img width="83" height="37" src="https://image.maigoo.com/upload/images/20220523/15255552825_200x90.png" alt="合作伙伴9">
        </div>

        <!-- 用户登录状态 -->
        <div style="text-align: right;">
            <c:if test="${sessionScope.userid == null}">
                <a href="index/preLogin.action" rel="nofollow">用户登录</a>
                <a href="index/preReg.action" rel="nofollow">用户注册</a>
            </c:if>
            <c:if test="${sessionScope.userid != null}">
                <a href="#" rel="nofollow">欢迎您：${sessionScope.username}</a>
                <a href="index/cart.action" rel="nofollow">购物车</a>
                <a href="index/usercenter.action" rel="nofollow">用户中心</a>
                <a href="index/exit.action" rel="nofollow">退出登录</a>
            </c:if>
        </div>
    </div>
</div>
