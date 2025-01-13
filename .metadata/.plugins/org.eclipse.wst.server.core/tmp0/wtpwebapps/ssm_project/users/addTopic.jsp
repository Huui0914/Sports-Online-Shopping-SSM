<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>" />
<title>${title }</title>
<style>
/* 外层容器样式 */
.add-topic {
    width: 100%;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    background-color: #fff;
    font-family: Arial, sans-serif;
}

/* 标题样式 */
.show-add-topic-box h5 {
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
.show-add-topic-box table {
    width: 100%;
    border-collapse: collapse;
    margin: 15px 0;
    font-size: 14px;
}

/* 左侧标签单元格样式 */
.show-add-topic-box table td:first-child {
    width: 20%;
    text-align: right;
    font-weight: bold;
    color: #333;
    background-color: #f9f9f9;
    padding: 10px;
}

/* 输入单元格样式 */
.show-add-topic-box table td:last-child {
    width: 80%;
    text-align: left;
    background-color: #fff;
    padding: 10px;
}

/* 链接样式 */
.show-add-topic-box table td a {
    color: #007BFF;
    text-decoration: none;
    font-weight: bold;
    transition: color 0.3s ease;
}

.show-add-topic-box table td a:hover {
    color: #0056b3;
}

/* 单选评分按钮样式 */
.show-add-topic-box table td input[type="radio"] {
    margin-right: 5px;
    vertical-align: middle;
}

.show-add-topic-box table td img {
    vertical-align: middle;
    cursor: pointer;
}

/* 文本域样式 */
.show-add-topic-box textarea {
    width: 95%;
    height: 140px;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
    resize: none;
    transition: border 0.3s ease;
}

.show-add-topic-box textarea:focus {
    border-color: #EDCDEE;
    outline: none;
}

/* 提交按钮样式 */
#sub {
    background-color: #EDCDEE;
    color: #fff;
    font-size: 16px;
    font-weight: bold;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}


/* 响应式优化 */
@media (max-width: 768px) {
    .add-topic {
        width: 95%;
        padding: 15px;
    }

    .show-add-topic-box table td,
    .show-add-topic-box table th {
        font-size: 12px;
    }

    .show-add-topic-box textarea {
        width: 100%;
    }

    #sub {
        width: 100%;
    }
}

</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href="<%=basePath%>">首页</a>
			<code> &gt; </code>
			订单评价
		</div>
	</div>
	<div class="blank"></div>

	<div class="blank"></div>
	<div class="block clearfix">
		<div class="AreaL">
			<jsp:include page="usermenu.jsp"></jsp:include>
		</div>
		<div class="AreaR">
			<div class="add-topic">
				<div class="add-topic-box">
					<div class="show-add-topic-box" style="_height: 1%;">
						<h5>
							<span>订单评价</span>
						</h5>
						<div class="blank"></div>
						<form action="index/addTopic.action" name="myform" method="post">
							<c:forEach items="${itemsList}" var="orders" varStatus="st">
								<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
									<tr>
										<td width="20%" align="right" bgcolor="#FFFFFF">商品：</td>
										<td width="80%" align="left" bgcolor="#FFFFFF"><a href="index/detail.action?id=${orders.goodsid }"> <font color="black">${orders.goodsname }</font></a></td>
									</tr>
									<tr>
										<td width="20%" align="right" bgcolor="#FFFFFF">评分：</td>
										<td width="80%" align="left" bgcolor="#FFFFFF"><input type="radio" name="tnum_${st.index}" id="tnum" value="1"> <img
											src="themes/ecmoban_dangdang/images/stars1.gif" /> &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="tnum_${st.index}"
											id="tnum" value="2"> <img src="themes/ecmoban_dangdang/images/stars2.gif" /> &nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="tnum_${st.index}" id="tnum" value="3"> <img src="themes/ecmoban_dangdang/images/stars3.gif" />
											&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="tnum_${st.index}" id="tnum" value="4"> <img
											src="themes/ecmoban_dangdang/images/stars4.gif" /> &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="tnum_${st.index}"
											id="tnum" value="5" checked> <img src="themes/ecmoban_dangdang/images/stars5.gif" /></td>
									</tr>
									<tr>
										<td align="right" bgcolor="#FFFFFF">内容：</td>
										<td align="left" bgcolor="#FFFFFF"><textarea rows="" cols="" name="contents_${st.index}" placeholder="请输入内容"
												style="width: 99%; height: 140px"></textarea></td>
									</tr>
								</table>
							</c:forEach>
							<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
								<tr>
									<td colspan="2" align="center" bgcolor="#FFFFFF">
									<input type="hidden" name="id" value="${id }">
									<input type="submit" value="确认提交" id="sub"/></td>
								</tr>
							</table>
						</form>

					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="blank"></div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
