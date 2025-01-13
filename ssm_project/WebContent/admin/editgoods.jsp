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
	<div class="update-admin-panel" style="width: 55%; margin: 0 auto;">
		<div class="update-admin-panel-head" id="add">
			<strong><span class="icon-edit"></span>编辑商品信息</strong>
		</div>
		<div class="update-admin-panel-table">
			<form method="post" class="form-x" action="goods/updateGoods.action" name="myform">

				<div class="form-group">
					<div class="label">
						<label>商品名称</label>
					</div>
					<div class="field">
						<input type="text" name="goodsname" class="input w150" id="goodsname" value="${goods.goodsname}" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>商品图片</label>
					</div>
					<div class="field">
						<input class="input w150" type="text" name="image" value="${goods.image}" id="image" onclick="selimage();" readonly="readonly" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>商品类型</label>
					</div>
					<div class="field">
						<select name="cateid" class="input w150" id="cateid"><c:forEach items="${cateList}" var="cate">
								<option value="${cate.cateid}" ${cate.cateid == goods.cateid?"selected":"" }>${cate.catename }</option>
							</c:forEach></select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>商品价格</label>
					</div>
					<div class="field">
						<input type="text" name="price" class="input w150" id="price" value="${goods.price}" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>是否推荐</label>
					</div>
					<div class="field" style="padding-top: 8px;">
						<input type="radio" name="recommend" value="是" title="是" ${goods.recommend == "是"?"checked":""}>是 &nbsp;&nbsp;&nbsp;&nbsp;<input
							type="radio" name="recommend" value="否" title="否" ${goods.recommend == "否"?"checked":""}>否
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>是否特价</label>
					</div>
					<div class="field" style="padding-top: 8px;">
						<input type="radio" name="special" value="是" title="是" ${goods.special == "是"?"checked":""}>是 &nbsp;&nbsp;&nbsp;&nbsp;<input
							type="radio" name="special" value="否" title="否" ${goods.special == "否"?"checked":""}>否
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>库存数量</label>
					</div>
					<div class="field">
						<input type="text" name="storage" class="input w150" id="storage" value="${goods.storage}" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>商品详情</label>
					</div>
					<div class="field">
						<textarea cols="80" name="contents" id="contents" rows="10">${goods.contents} </textarea>
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
						<input type="hidden" name="goodsid" id="goodsid" value="${goods.goodsid}" /><input type="hidden" name="addtime" id="addtime"
							value="${goods.addtime}" /> <input type="hidden" name="hits" id="hits" value="${goods.hits}" /> <input type="hidden" name="sellnum"
							id="sellnum" value="${goods.sellnum}" />

						<button id="sub" type="submit">提交保存</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>




