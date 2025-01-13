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
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/pwd.js"></script>
<style>
/* 外层容器样式 */
.editPwd {
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
.edit-pwd-box h5 {
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
.edit-pwd-box table {
    width: 100%;
    border-collapse: collapse;
    margin: 15px 0;
}

/* 表格单元格样式 */
.edit-pwd-box table td {
    padding: 10px 15px;
    font-size: 14px;
    color: #555;
}

/* 左侧标签单元格样式 */
.edit-pwd-box table td:first-child {
    text-align: right;
    font-weight: bold;
    color: #333;
    width: 30%;
    background-color: #f9f9f9;
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
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href="<%=basePath%>">首页</a>
			<code> &gt; </code>
			修改密码
		</div>
	</div>
	<div class="blank"></div>

	<div class="blank"></div>
	<div class="block clearfix">
		<div class="AreaL">
			<jsp:include page="usermenu.jsp"></jsp:include>
		</div>
		<div class="AreaR">
			<div class="editPwd">
				<div class="pwd-box">
					<div class="edit-pwd-box" >
						<h5>
							<span>修改密码</span>
						</h5>
						<div class="blank"></div>
						<form action="index/editpwd.action" name="myform" method="post">
							<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">用户名：</td>
									<td width="76%" align="left" bgcolor="#FFFFFF">${sessionScope.username }</td>
								</tr>
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">原密码：</td>
									<td width="76%" align="left" bgcolor="#FFFFFF"><input name="password" type="password" size="25"
										class="inputBg" id="password" /></td>
								</tr>
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">新密码：</td>
									<td align="left" bgcolor="#FFFFFF"><input name="newpassword" type="password" size="25" class="inputBg"
										id="newpassword" /></td>
								</tr>
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">确认密码：</td>
									<td align="left" bgcolor="#FFFFFF"><input name="repassword" type="password" size="25" class="inputBg"
										id="repassword" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" bgcolor="#FFFFFF">
										<input type="submit" value="确认修改" id="sub" /></td>
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
