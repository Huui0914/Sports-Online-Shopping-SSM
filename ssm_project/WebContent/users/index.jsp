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
<link href="themes/ecmoban_dangdang/index.css" rel="stylesheet" type="text/css" />
<style>
	.goodsIndex {
	    display: flex;
	    flex-direction: row;
	    gap: 10px;
	}
	
	.index-box {
	    display: flex;
	    flex-direction: column; 
	    align-items: center; /* 垂直居中对齐 */
	    border: 1px solid #ddd; /* 添加边框以区分每个 index-box */
	    padding: 20px; /* 添加内边距 */
	    background-color: #f9f9f9; /* 背景色 */
	}
	
	.index-box h4 {
		display: flex;
	    flex-direction: column; 
	    align-items: center; /* 子元素垂直居中对齐 */
    	justify-content: space-between; /* 两端对齐 */
	}
	
	.index-box img {
	    width:220px;
	    height:240px;
	    margin-right:20px;
	}	
	.index-box .title span {
	    font-weight: bold; /* 加粗 */
	    font-size:20px;
	    text-align: center; /* 居中 */
	    display: block; /* 设置为块元素以便生效 */
	    color: purple; /* 紫色 */
	    margin-bottom: 10px; /* 增加与其他元素的间距 */
	}
	.index-box .title .more {
	    font-size: 14px;
	    color: #666;
	    margin-right:20px;
	    text-decoration: underline;
	}
</style>
</head>

<body class="index_page" style="min-width: 1200px;">
	<!-- 头部 -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- 主题：遍历 frontList 中的分类列表 -->
	<div class="block clearfix">
		<div class="blank"></div>
		<div class="goodsIndex">
			<c:forEach items="${frontList}" var="cate" varStatus="status">
				<div class="index-box">
					<!-- 获取 goodsList 的第一个元素 -->
			        <c:if test="${not empty cate.goodsList}">
			            <c:set var="goods" value="${cate.goodsList[0]}" />
			            <a href="index/cate.action?id=${cate.cateid }">
			                <img src="${goods.image}" alt="${goods.goodsname}"/>
			            </a>
			        </c:if>
					<h4 class="title">
						<span>${cate.catename}</span> 
						<a class="more" href="index/cate.action?id=${cate.cateid }">更多</a>
					</h4>
				</div>
				<div class="blank"></div>
			</c:forEach>
		</div>
	</div>
	<!-- 脚注 -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
