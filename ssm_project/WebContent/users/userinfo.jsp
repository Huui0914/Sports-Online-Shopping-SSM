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
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/users.js"></script>
<script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<style>
/* 外层容器样式 */
.personal {
    width: 80%;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    background-color: #fff;
    font-family: Arial, sans-serif;
}

/* 表单标题样式 */
.personal-info-table h5 {
    font-size: 20px;
    font-weight: bold;
    color: #fff;
    background-color: #EDCDEE;
    padding: 15px;
    text-align: center;
}

/* 表格样式 */
.personal-info-table table {
    width: 100%;
    border-collapse: collapse;
}

/* 表格单元格样式 */
.personal-info-table table td {
    padding: 10px 15px;
    font-size: 14px;
    color: #555;
}

/* 表格标签左对齐和右对齐 */
.personal-info-table table td:first-child {
    text-align: right;
    font-weight: bold;
    color: #333;
    width: 30%;
    background-color: #f9f9f9;
}

.personal-info-table table td:last-child {
    text-align: left;
    background-color: #fff;
}

/* 输入框样式 */
.inputBg {
    width: 80%;
    padding: 8px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
    transition: border 0.3s ease;
}

.inputBg:focus {
    border-color: #EDCDEE;
    outline: none;
}

/* 单选按钮样式 */
.personal-info-table input[type="radio"] {
    margin-right: 5px;
}

#sub {
    background-color: #EDCDEE; /* 按钮背景色 */
    color: #fff; /* 按钮文字颜色 */
    font-size: 16px; /* 文字大小 */
    font-weight: bold; /* 加粗文字 */
    padding: 10px 20px; /* 按钮内边距 */
    border: none; /* 去除边框 */
    border-radius: 5px; /* 按钮圆角 */
    cursor: pointer; /* 鼠标样式为手型 */
    transition: all 0.3s ease; /* 添加过渡动画 */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 按钮阴影 */
}

</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href="index/index.action">首页</a>
			<code> &gt; </code>
			用户中心
		</div>
	</div>
	<div class="blank"></div>

	<div class="block clearfix">
		<div class="AreaL">
			<jsp:include page="usermenu.jsp"></jsp:include>
		</div>
		<div class="AreaR">
			<div class="personal">
				<div class="personal-box">
					<div class="personal-info-table">
						<h5>
							<span>个人资料</span>
						</h5>
						<div class="blank"></div>
						<form name="formEdit" action="index/personal.action" method="post" onsubmit="return userEdit()">
							<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
								<tr>
									<td align="right" bgcolor="#FFFFFF">用户名：</td>
									<td align="left" bgcolor="#FFFFFF">${sessionScope.users.username }<input type="hidden" name="username"
										id="username" value="${sessionScope.users.username }" /> <input type="hidden" name="password" id="password"
										value="${sessionScope.users.password }" /> <input type="hidden" name="usersid" id="usersid"
										value="${sessionScope.users.usersid }" /><input type="hidden" name="regdate" id="regdate" value="${sessionScope.users.regdate }" />
									</td>
								</tr>
								<tr>
									<td align="right" bgcolor="#FFFFFF">姓名：</td>
									<td align="left" bgcolor="#FFFFFF"><input name="realname" type="text" size="25" class="inputBg" id="realname"
										value="${sessionScope.users.realname }" /></td>
								</tr>
								<tr>
									<td align="right" bgcolor="#FFFFFF">性别：</td>
									<td  align="left" bgcolor="#FFFFFF"><input type="radio" name="sex" value="男" title="男" id="sex" checked />男&nbsp;&nbsp;&nbsp;<input
										type="radio" name="sex" value="女" title="女" id="sex" />女</td>
								</tr>
								<tr>
									<td align="right" bgcolor="#FFFFFF">出生日期：</td>
									<td align="left" bgcolor="#FFFFFF"><input name="birthday" type="text" size="25" class="inputBg" id="birthday"
										onclick="WdatePicker()" readonly="readonly" value="${sessionScope.users.birthday }" /></td>
								</tr>
								<tr>
									<td align="right" bgcolor="#FFFFFF">联系方式：</td>
									<td align="left" bgcolor="#FFFFFF"><input name="contact" type="text" size="25" class="inputBg" id="contact"
										value="${sessionScope.users.contact }" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" bgcolor="#FFFFFF">
								        <input type="submit" value="确认修改" id="sub" />
								    </td>
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
