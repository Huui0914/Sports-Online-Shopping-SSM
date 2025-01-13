<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<title>${title }</title>
<style>
/* 外层容器样式 */
.pay {
    width: 50%;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    background-color: #fff;
    font-family: Arial, sans-serif;
}

/* 头部样式 */
.pay-header {
    background-color: #EDCDEE;
    padding: 15px;
    text-align: center;
    border-radius: 8px 8px 0 0;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.pay-header h1 {
    font-size: 24px;
    color: #fff;
    margin: 0;
    font-weight: bold;
}

/* 标签导航样式 */
.tab-head {
    background-color: #f9f9f9;
    border-bottom: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}

.tab-head h2 {
    font-size: 20px;
    color: #555;
    margin: 0;
}

.tab-head h2.selected {
    color: #EDCDEE;
    font-weight: bold;
    border-bottom: 2px solid #EDCDEE;
}

/* 表单内容样式 */
.content {
    margin: 20px 0;
}

.content dt {
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 10px;
    color: #333;
}

.content dd {
    margin: 0 0 20px 0;
}

.content input[type="text"],
.content input[type="number"],
.content input[type="email"] {
    width: 95%;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
    transition: border 0.3s ease;
}

.content input[type="text"]:focus,
.content input[type="number"]:focus,
.content input[type="email"]:focus {
    border-color: #EDCDEE;
    outline: none;
}

/* 提交按钮样式 */
.new-btn-login {
    background-color: #EDCDEE;
    color: #fff;
    font-size: 16px;
    font-weight: bold;
    padding: 12px 25px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.new-btn-login:hover {
    background-color: #d2a9c7;
    box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
    transform: translateY(-2px);
}

.new-btn-login:active {
    background-color: #b890aa;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    transform: translateY(2px);
}

/* 提示文字样式 */
.note-help {
    display: block;
    margin-top: 10px;
    font-size: 12px;
    color: #888;
    text-align: center;
}

/* 响应式优化 */
@media (max-width: 768px) {
    .pay {
        width: 90%;
        padding: 15px;
    }

    .content input[type="text"],
    .content input[type="number"],
    .content input[type="email"] {
        width: 100%;
    }

    .new-btn-login {
        width: 100%;
        padding: 15px;
    }
}

</style>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.3.2.min.js" charset="utf-8"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href="<%=basePath%>">首页</a>
			<code> &gt; </code>
			付款
		</div>
	</div>
	<div class="blank"></div>
	<div class="pay">
		<header class="pay-header">
			<h1>付款</h1>
		</header>
		<div id="pay-main">
			<div id="tabhead" class="tab-head">
				<h2 id="tab1" class="selected" name="tab">付 款</h2>
			</div>
			<form autocomplete="off" name=alipayment action="index/pay.action" method=post>
				<div id="body1" class="show" name="divcontent">
					<dl class="content">
						<dt>商户订单号 ：</dt>
						<dd>
							<input id="WIDout_trade_no" name="WIDout_trade_no" />
						</dd>
						<dt>订单名称 ：</dt>
						<dd>
							<input id="WIDsubject" name="WIDsubject" />
						</dd>
						<dt>付款金额 ：</dt>
						<dd>
							<input id="WIDtotal_amount" name="WIDtotal_amount" />
						</dd>
						<dt></dt>
						<dd id="btn-dd">
							<span class="new-btn-login-sp">
								<button id="pay" class="new-btn-login" type="submit" style="text-align: center;">付 款</button> <input
								type="hidden" name="id" id="ordersid" value="${orders.ordersid}" /> <input type="hidden" name="basepath"
								id="basepath" value="<%=basePath%>" />
							</span> <span class="note-help">如果您点击“付款”按钮，即表示您同意该次的执行操作。</span>
						</dd>
					</dl>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<script language="javascript">
	var tabs = document.getElementsByName('tab');
	var contents = document.getElementsByName('divcontent');

	(function changeTab(tab) {
		for (var i = 0, len = tabs.length; i < len; i++) {
			tabs[i].onmouseover = showTab;
		}
	})();

	function showTab() {
		for (var i = 0, len = tabs.length; i < len; i++) {
			if (tabs[i] === this) {
				tabs[i].className = 'selected';
				contents[i].className = 'show';
			} else {
				tabs[i].className = '';
				contents[i].className = 'tab-content';
			}
		}
	}

	function GetDateNow() {
		var vNow = new Date();
		var sNow = "";
		sNow += String(vNow.getFullYear());
		sNow += String(vNow.getMonth() + 1);
		sNow += String(vNow.getDate());
		sNow += String(vNow.getHours());
		sNow += String(vNow.getMinutes());
		sNow += String(vNow.getSeconds());
		sNow += String(vNow.getMilliseconds());
		document.getElementById("WIDout_trade_no").value = sNow;
		document.getElementById("WIDsubject").value = "${orders.ordercode}";
		document.getElementById("WIDtotal_amount").value = "${orders.total}";
	}
	GetDateNow();
</script>