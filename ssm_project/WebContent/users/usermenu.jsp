<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<style>
	/* 外层容器样式 */
	.userInfo-box {
	    width: 80%;
	    margin: 20px auto;
	    padding: 20px;
	    border: 1px solid #ddd;
	    border-radius: 8px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    background-color: #fff;
	    font-family: Arial, sans-serif;
	}
	
	/* 用户信息菜单整体布局 */
	.userInfoMenu {
	    display: flex;
	    flex-wrap: wrap; /* 支持多行布局 */
	    gap: 15px; /* 设置菜单项之间的间距 */
	    justify-content: flex-start; /* 子项靠左对齐 */
	}
	
	/* 用户菜单项样式：图片和文字按行排列 */
	.userInfoMenu a {
		width:100%;
	    display: flex;
	    flex-direction: row; /* 垂直排列 */
	    align-items: center; /* 居中对齐 */
	    color: #555;
	    font-size: 16px;
	    font-weight: bold;
	    border: 1px solid #ddd;
	    border-radius: 8px;
	    transition: all 0.3s ease;
	    background-color: #f9f9f9;
	    text-align: center;
	}
	
	/* 用户菜单项图标样式 */
	.userInfoMenu a img {
	    width: 20px; /* 设置图标大小 */
	    height: 20px;
	    margin-left: 10px; /* 图标和文字之间的间距 */
	    transition: transform 0.3s ease;
	}
	
	/* 段落文字样式 */
	.userInfoMenu a p {
	    width: 100%; /* 占满一行 */
	    text-align: center; /* 居中对齐文字 */
	    margin: 0; /* 去除默认外边距 */
	    line-height: 2; /* 设置合适的行高 */
	}
	
	/* 鼠标悬停效果 */
	.userInfoMenu a:hover {
	    color: #fff;
	    background-color: #EDCDEE;
	    border-color: #EDCDEE;
	}

	.userInfoMenu a:last-child img {
	    vertical-align: middle;
	}
	
	/* 响应式支持 */
	@media (max-width: 768px) {
	    .userInfoMenu a {
	        width: calc(50% - 15px); /* 两列布局 */
	        font-size: 14px;
	    }
	}
	
	@media (max-width: 480px) {
	    .userInfoMenu a {
	        width: 100%; /* 单列布局 */
	        font-size: 14px;
	    }
	}

</style>

			<div class="userInfo-box">
				<div class="user-box">
					<div class="userCenterInfo">
						<div class="userInfoMenu">
							<a href="index/userinfo.action">
								<img src="asset/images/userimg.png" />
								<p>用户信息</p>
							</a> 
							<a href="index/prePwd.action"><img src="asset/images/fileImg.png" /><p>修改密码</p></a> 
							<a href="index/showOrders.action"><img src="asset/images/fileImg.png" /><p>我的订单</p></a> 
							<a href="index/preComplains.action"><img src="asset/images/fileImg.png" /><p>意见反馈</p></a> 
							<a href="index/myComplains.action"><img src="asset/images/fileImg.png" /><p>我的意见反馈</p></a> 
							<a href="index/exit.action">
								<p>安全退出</p>
							</a>
						</div>
					</div>
				</div>
			</div>
