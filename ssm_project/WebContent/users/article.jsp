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
        .container {
        	width:85%;
            display: flex;
            flex-direction: row; 
        }
        .AreaR {
            flex: 3; /* 主内容区域占据大部分宽度 */
            margin-left: 30px; /* 主内容和右侧栏的间距 */
        }
        .sidebar {
            flex: 1; 
            background-color: #f9f9f9; /* 设置右侧栏背景色 */
            padding: 10px;
        }
        .sidebar img {
            max-width: 100%; /* 图片自适应宽度 */
            margin-bottom: 10px; /* 图片间距 */
            border: 1px solid #ccc; /* 图片边框 */
            padding: 5px; /* 图片内边距 */
            background-color: #fff; /* 图片背景色 */
        }
         /* 外层容器样式 */
		.art_cat_box_article {
		    width: 100%;
		    margin: 20px auto;
		    padding: 20px;
		    border: 1px solid #ddd;
		    border-radius: 8px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    background-color: #fff;
		    font-family: Arial, sans-serif;
		}

		/* 表格样式 */
		.art_cat_box_article table {
		    width: 100%;
		    border-collapse: collapse;
		    margin: 15px 0;
		    font-size: 14px;
		}

		/* 表头样式 */
		.art_cat_box_article table th {
		    background-color: #EDCDEE;
		    color: #333;
		    font-weight: bold;
		    text-align: center;
		    padding: 10px;
		    border-bottom: 2px solid #ddd;
		}

		/* 表格内容单元格样式 */
		.art_cat_box_article table td {
		    background-color: #ffffff;
		    padding: 10px;
		    text-align: left;
		    color: #555;
		    border-bottom: 1px solid #eee;
		    word-wrap: break-word;
		    word-break: break-word;
		}

		/* 单元格对齐调整 */
		.art_cat_box_article table td:last-child {
		    text-align: center;
		}
		
		/* 链接样式 */
		.art_cat_box_article table td a {
		    color: purple;
		    text-decoration: none;
		    font-weight: bold;
		    transition: color 0.3s ease;
		}
		
		.art_cat_box_article table td a:hover {
		    color: #B027B2;
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
            新闻公告
        </div>
    </div>
    <!-- 主容器，包含主内容和右侧栏 -->
    <div class="container">
    	<!-- 左侧栏 -->
        <div class="sidebar">
            <img src="upfiles/article1.jpg" alt="图片1" title="图片1">
            <img src="upfiles/article2.jpg" alt="图片2" title="图片2">
        </div>
        <!-- 主内容 -->
        <div class="AreaR">
            <div>
                <div class="art_cat_box_article">
                    <table width="100%" border="0" cellpadding="5" cellspacing="0">
                        <tr>
                            <th>文章标题</th>
                            <th>添加日期</th>
                        </tr>
                        <c:forEach items="${articleList}" var="article">
                            <tr>
                                <td><a title="${article.title }" href="index/read.action?id=${article.articleid }"
                                    style="text-decoration: none" class="f6">${article.title }</a>
                                </td>
                                <td align="center">${article.addtime }</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="blank5"></div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>

    
</body>

