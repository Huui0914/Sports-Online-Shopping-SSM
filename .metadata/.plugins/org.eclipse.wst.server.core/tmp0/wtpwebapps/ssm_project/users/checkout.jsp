<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>" />
    <title>${title}</title>
    <script type="text/javascript">
        function checkConsignee(form) {
            // 示例函数，用于验证表单
            if (form.receiver.value.trim() === "") {
                alert("请输入收货人姓名");
                return false;
            }
            if (form.address.value.trim() === "") {
                alert("请输入详细地址");
                return false;
            }
            if (form.contact.value.trim() === "") {
                alert("请输入联系方式");
                return false;
            }
            return true;
        }
    </script>
    <style>
    	/* 外层容器样式 */
		.check-out {
		    width: 80%;
		    margin: 20px auto;
		    padding: 20px;
		    border: 1px solid #ddd;
		    border-radius: 8px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    background-color: #fff;
		    font-family: Arial, sans-serif;
		}
		
		/* 标题样式 */
		.check-out-box h6 {
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
		.check-out-box table {
		    width: 100%;
		    border-collapse: collapse;
		    margin: 15px 0;
		    font-size: 14px;
		}
		
		/* 表格单元格样式 */
		.check-out-box table td {
		    padding: 10px;
		    text-align: left;
		    color: #555;
		    background-color: #fff;
		    border-bottom: 1px solid #ddd;
		}
		
		/* 表单输入框样式 */
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
		.bnt_blue_2 {
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
		
		
		/* 必填提示文字样式 */
		.check-out-box table td span {
		    color: #E74C3C;
		    font-size: 12px;
		    margin-left: 5px;
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
            购物流程
        </div>
    </div>
    <div class="blank"></div>
    <div class="check-out">
        <form action="index/checkout.action" method="post" name="theForm" id="theForm" onsubmit="return checkConsignee(this)">
            <div class="check-out-box">
                <h6>
                    <span>收货人信息</span>
                </h6>
                <table width="99%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                    <tr>
                        <td bgcolor="#ffffff">收货人姓名:</td>
                        <td bgcolor="#ffffff" colspan="2"><input name="receiver" type="text" class="inputBg" id="receiver" /> (必填)</td>
                    </tr>
                    <tr>
                        <td bgcolor="#ffffff">详细地址:</td>
                        <td bgcolor="#ffffff" colspan="2"><input name="address" type="text" class="inputBg" id="address" /> (必填)</td>
                    </tr>
                    <tr>
                        <td bgcolor="#ffffff">联系方式:</td>
                        <td bgcolor="#ffffff" colspan="2"><input name="contact" type="text" class="inputBg" id="contact" /> (必填)</td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center" bgcolor="#ffffff"><input type="submit" value="确定" /></td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
