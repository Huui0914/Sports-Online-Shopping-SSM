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

</head>
<style>
	/* 外层容器样式 */
	.login-panel {
	    width: 40%;
	    margin: 50px auto;
	    padding: 20px;
	    border: 1px solid #ddd;
	    border-radius: 8px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    background-color: #fff;
	    font-family: Arial, sans-serif;
	}
	
	/* 标题样式 */
	.login-table h3 {
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
	.login-table table {
	    width: 100%;
	    border-collapse: collapse;
	    margin: 20px 0;
	    font-size: 14px;
	}
	
	/* 表格单元格样式 */
	.login-table table td {
	    padding: 10px;
	    font-size: 14px;
	    color: #555;
	    background-color: #fff;
	    border-bottom: 1px solid #ddd;
	}
	
	.login-table table td:first-child {
	    text-align: right;
	    font-weight: bold;
	    color: #333;
	    width: 30%;
	}
	
	.login-table table td:last-child {
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
	
	.inputBg:focus {
	    border-color: #EDCDEE;
	    outline: none;
	}
	
	/* 提交按钮样式 */
	#sub{
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
	    .login-panel {
	        width: 90%;
	        padding: 15px;
	    }
	
	    .inputBg {
	        width: 100%;
	    }
	
	    .bnt_blue_1 {
	        width: 100%;
	    }
	}

</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href="<%=basePath%>">首页</a>
			<code> &gt; </code>
			用户登录
		</div>
	</div>
	
	<div class="login-panel">
		<div class="login-box">
			<div class="login-table">
				<h3 style="text-align: center;">
					<span>用户登录</span>
				</h3>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr valign="top">
						<td bgcolor="#FFFFFF" align="center">
							<form action="index/login.action" method="post" name="myform">
								<table width="60%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">用户名：</td>
										<td width="76%" align="left" bgcolor="#FFFFFF"><input type="text" name="username" size="25" class="inputBg" id="username" /></td>
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">密码：</td>
										<td width="76%" align="left" bgcolor="#FFFFFF"><input name="password" type="password" size="25" class="inputBg" /></td>
									</tr>
									<tr>
										<td colspan="2" align="center" bgcolor="#FFFFFF"><input type="submit" id="sub" value="确认登录" /></td>
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
