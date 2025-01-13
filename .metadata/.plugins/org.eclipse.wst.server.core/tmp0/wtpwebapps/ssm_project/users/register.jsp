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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title }</title>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/users.js"></script>
<script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</head>
<style>
	/* 外层容器样式 */
	.register-panel {
	    width: 50%;
	    margin: 20px auto;
	    padding: 20px;
	    border: 1px solid #ddd;
	    border-radius: 8px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    background-color: #fff;
	    font-family: Arial, sans-serif;
	}
	
	/* 标题样式 */
	.register-table h3 {
	    font-size: 24px;
	    font-weight: bold;
	    color: #fff;
	    background-color: #EDCDEE;
	    padding: 15px;
	    text-align: center;
	    margin: 0;
	    border-radius: 8px 8px 0 0;
	}
	
	/* 表格样式 */
	.register-table table {
	    width: 100%;
	    border-collapse: collapse;
	    margin: 15px 0;
	    font-size: 14px;
	}
	
	/* 表格单元格样式 */
	.register-table table td {
	    padding: 10px;
	    font-size: 14px;
	    color: #555;
	    background-color: #fff;
	    border-bottom: 1px solid #ddd;
	}
	
	.register-table table td:first-child {
	    text-align: right;
	    font-weight: bold;
	    color: #333;
	    width: 30%;
	}
	
	.register-table table td:last-child {
	    text-align: left;
	}
	
	/* 输入框样式 */
	.inputBg {
	    width: 95%;
	    padding: 10px;
	    font-size: 14px;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
	    transition: border 0.3s ease;
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
	    .register-panel {
	        width: 90%;
	        padding: 15px;
	    }
	
	    .inputBg {
	        width: 100%;
	    }
	
	    #sub {
	        width: 100%;
	    }
	}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href="index/index.action">首页</a>
			<code> &gt; </code>
			用户注册
		</div>
	</div>
	<div class="register-panel">
		<div class="register-box">
			<div class="register-table">
				<h3>
					<span>用户注册</span>
				</h3>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr valign="top">
						<td bgcolor="#FFFFFF" align="center">
							<form action="index/register.action" method="post" name="myform">
								<table width="60%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">用户名：</td>
										<td width="76%" align="left" bgcolor="#FFFFFF"><input type="text" name="username" size="25" class="inputBg" id="username"
											placeholder="请输入用户名" /></td>
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">密码：</td>
										<td width="76%" align="left" bgcolor="#FFFFFF"><input name="password" type="password" size="25" class="inputBg" id="password"
											placeholder="请输入密码" /></td>
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">姓名：</td>
										<td width="76%" align="left" bgcolor="#FFFFFF"><input name="realname" type="text" size="25" class="inputBg" id="realname"
											placeholder="请输入姓名" /></td>
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">性别：</td>
										<td width="76%" align="left" bgcolor="#FFFFFF"><input type="radio" name="sex" value="男" title="男" id="sex" checked />男&nbsp;&nbsp;&nbsp;<input
											type="radio" name="sex" value="女" title="女" id="sex" />女</td>
									</tr>
									<tr>
									    <td width="28%" align="right" bgcolor="#FFFFFF">出生日期：</td>
									    <td width="76%" align="left" bgcolor="#FFFFFF">
									    	<!-- 使用原生HTML5 <input type="date"> 的日期选择器 -->
									        <input name="birthday" type="date" class="inputBg" id="birthday" placeholder="请输入出生日期" />
									    </td>
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">联系方式：</td>
										<td width="76%" align="left" bgcolor="#FFFFFF"><input name="contact" type="text" size="25" class="inputBg" id="contact"
											placeholder="请输入联系方式" /></td>
									</tr>
									<tr>
										<td colspan="2" align="center" bgcolor="#FFFFFF"><input type="submit" id="sub" value="确认注册"/></td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="blank5"></div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
