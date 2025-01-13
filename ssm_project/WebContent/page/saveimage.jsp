<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%><!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
<title>欢迎使用网站后台管理系统</title>
<link rel="stylesheet" href="asset/css/pintuer.css">
<link rel="stylesheet" href="asset/css/admin.css">
<script src="asset/js/jquery.js"></script>
<script src="asset/js/pintuer.js"></script>
<script type="text/javascript">
	function selok() {
		opener.document.getElementById("image").value = myform.p.value;
		window.close();
	}
</script>
<style>
/* 上传图片面板样式 */
.upload-img-panel {
    width: 100%;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    background-color: #fff;
    font-family: Arial, sans-serif;
}

/* 面板头部样式 */
.upload-img-panel-head {
    background-color: #EDCDEE;
    color: #fff;
    font-size: 18px;
    font-weight: bold;
    padding: 15px;
    border-radius: 8px 8px 0 0;
    text-align: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* 表单组样式 */
.form-group {
    margin-bottom: 15px;
    display: flex;
    align-items: center;
}

/* 标签样式 */
.form-group .label {
    width: 20%;
    font-weight: bold;
    color: #555;
    text-align: right;
    padding-right: 10px;
}

/* 输入区域样式 */
.form-group .field {
    width: 80%;
    text-align: left;
}

/* 输入框样式 */
.form-group input[type="file"] {
    border: 1px solid #ccc;
    padding: 8px;
    border-radius: 5px;
    width: 100%;
    font-size: 14px;
    transition: border 0.3s ease;
}

.form-group input[type="file"]:focus {
    border-color: #EDCDEE;
    outline: none;
}

/* 按钮样式 */
.button {
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
    display: inline-block;
}

/* 已上传文件名样式 */
.form-group .field {
    font-size: 14px;
    color: #333;
}

/* 响应式优化 */
@media (max-width: 768px) {
    .upload-img-panel {
        width: 90%;
        padding: 15px;
    }

    .form-group .label {
        width: 30%;
        text-align: left;
        padding-right: 5px;
    }

    .form-group .field {
        width: 70%;
    }

    .button {
        width: 100%;
        padding: 12px 0;
    }
}

</style>
</head>
<body>
	<div class="upload-img-panel" style="margin: 0 auto;">
		<div class="upload-img-panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>上传图片</strong>
		</div>
		<div class="upload-img-panel-table">
			<form method="post" class="form-x" action="upload/image.action" name="myform" method="post" enctype="multipart/form-data" name="myform">
				<c:if test="${imageFileName eq null }">
					<div class="form-group">
						<div class="label">
							<label>图片：</label>
						</div>
						<div class="field">
							<input type="file" name="image" id="image" />
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label></label>
						</div>
						<div class="field">
							<button class="button bg-main icon-check-square-o" type="submit">上传图片</button>
						</div>
					</div>
				</c:if>
				<c:if test="${imageFileName ne null }">
					<div class="form-group">
						<div class="label">
							<label></label>
						</div>
						<div class="field">${imageFileName }</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label> <input type="hidden" name="p" value="upfiles/${imageFileName }" id="p" />
							</label>
						</div>
						<div class="field">
							<button class="button bg-main icon-check-square-o" type="button" onclick="selok();">保存图片</button>
						</div>
					</div>
				</c:if>

			</form>
		</div>
	</div>
</body>
</html>