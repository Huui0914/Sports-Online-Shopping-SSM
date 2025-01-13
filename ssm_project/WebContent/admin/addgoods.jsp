<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="check_logstate.jsp"></jsp:include>
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
<title>欢迎使用后台管理系统</title>
<link rel="stylesheet" href="asset/css/pintuer.css">
<link rel="stylesheet" href="asset/css/admin.css">
<link rel="stylesheet" href="asset/css/table.css">
<script src="asset/js/jquery.js"></script>
<script src="asset/js/pintuer.js"></script>
<script type="text/javascript" src="js/goods.js" charset="utf-8"></script>
<script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</head>
<body>
	<div class="add-article-panel">
		<div class="add-article-panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>新增商品信息</strong>
		</div>
		<div class="add-article-panel-table">
			<form method="post" class="form-x" action="goods/addGoods.action" name="myform">

				<div class="form-group">
					<div class="label">
						<label>商品名称</label>
					</div>
					<div class="field">
						<input type="text" name="goodsname" class="input w150" id="goodsname" placeholder="请输入商品名称" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>商品图片</label>
					</div>
					<div class="field">
						<input class="input w150" type="text" name="image" id="image" onclick="selimage();" placeholder="请选择图片" readonly="readonly" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>商品类型</label>
					</div>
					<div class="field">
						<select name="cateid" class="input w150" id="cateid"><option value="">---请选择商品类型--</option>
							<c:forEach items="${cateList}" var="cate">
								<option value="${cate.cateid}">${cate.catename }</option>
							</c:forEach></select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>商品价格</label>
					</div>
					<div class="field">
						<input type="text" name="price" class="input w150" id="price" placeholder="请输入商品价格" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>是否推荐</label>
					</div>
					<div class="field" style="padding-top: 8px;">
						<input type="radio" name="recommend" value="是" title="是" checked>是 &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
							name="recommend" value="否" title="否">否
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>是否特价</label>
					</div>
					<div class="field" style="padding-top: 8px;">
						<input type="radio" name="special" value="是" title="是" checked>是 &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="special"
							value="否" title="否">否
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>库存数量</label>
					</div>
					<div class="field">
						<input type="text" name="storage" class="input w150" id="storage" placeholder="请输入库存数量" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>商品详情</label>
					</div>
					<div class="field">
						<textarea cols="80" name="contents" id="contents" rows="10" placeholder="请输入内容"> </textarea>
						<script type="text/javascript">
							CKEDITOR.replace('contents', {
								language : 'zh-cn'
							});
						</script>
					</div>
				</div>


				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button type="submit" id="sub">提交保存</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>




