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
/* 外层容器样式 */
.my-complains {
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
.show-my-complains-box h5 {
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
.show-my-complains-box table {
    width: 100%;
    border-collapse: collapse;
    margin: 15px 0;
    font-size: 14px;
}

/* 表头样式 */
.show-my-complains-box table th {
    background-color: #f9f9f9;
    color: #333;
    font-weight: bold;
    text-align: center;
    padding: 10px;
    border-bottom: 2px solid #ddd;
}

/* 表格内容单元格样式 */
.show-my-complains-box table td {
    background-color: #ffffff;
    padding: 10px;
    text-align: center;
    color: #555;
    border-bottom: 1px solid #eee;
    word-wrap: break-word;
    word-break: break-word;
}

/* 状态列高亮样式 */
.show-my-complains-box table td:nth-child(4) {
    font-weight: bold;
    color: #E74C3C; /* 默认红色状态 */
}

/* 回复列样式 */
.show-my-complains-box table td:nth-child(5) {
    color: #007BFF;
    font-style: italic;
}

/* 分页部分样式 */
.show-my-complains-box table:last-child td {
    text-align: center;
    padding: 15px;
    font-size: 14px;
    background-color: #f9f9f9;
    color: #555;
}

/* 响应式优化 */
@media (max-width: 768px) {
    .my-complains {
        width: 95%;
        padding: 15px;
    }

    .show-my-complains-box table td,
    .show-my-complains-box table th {
        font-size: 12px;
    }

    .show-my-complains-box table td {
        word-break: break-word;
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

	<div class="blank"></div>
	<div class="block clearfix">
		<div class="AreaL">
			<jsp:include page="usermenu.jsp"></jsp:include>
		</div>
		<div class="AreaR">
			<div class="my-complains">
				<div class="my-complains-box">
					<div class="show-my-complains-box" style="_height: 1%;">
						<h5>
							<span>我的意见反馈</span>
						</h5>
						<div class="blank"></div>
						<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
							<tr>
								<th bgcolor="#ffffff">标题</th>
								<th bgcolor="#ffffff">内容</th>
								<th bgcolor="#ffffff">日期</th>
								<th bgcolor="#ffffff">状态</th>
								<th bgcolor="#ffffff">回复</th>
							</tr>
							<c:forEach items="${complainsList}" var="x">
								<tr>
									<td align="center" bgcolor="#ffffff">${x.title }</td>
									<td align="center" bgcolor="#ffffff">${x.contents }</td>
									<td align="center" bgcolor="#ffffff">${x.addtime }</td>
									<td align="center" bgcolor="#ffffff">${x.status }</td>
									<td align="center" bgcolor="#ffffff">${x.reps }</td>
								</tr>
							</c:forEach>
						</table>
						<div class="blank5"></div>
						<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
							<tr>
								<td align="center" bgcolor="#ffffff">${html}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="blank"></div>



	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
