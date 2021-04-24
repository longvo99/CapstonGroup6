<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< Updated upstream
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div id="content-wrapper" class="d-flex flex-column">
	<div id="content">
		<%-- <%@ include file="/templates/admin/inc/topbar.jsp" %> --%>
		<!-- Container Fluid-->
		<div class="container-fluid" id="container-wrapper">
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="m-0 font-weight-bold text-primarys">Thêm sản phẩm</h1>
				<ol class="breadcrumb">
					<c:set var="actionIndex"
						value="${pageContext.request.contextPath}/admin/index" />
					<c:if test="${not empty sessionScope.userSession}">
						<c:set var="actionIndex"
							value="${pageContext.request.contextPath}/public/index" />
					</c:if>
					<li class="breadcrumb-item"><a href="${actionIndex}">Trang
							chủ</a></li>
					<li class="breadcrumb-item active" aria-current="page">Forms</li>
				</ol>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<!-- Form Basic -->
					<c:if test="${not empty msg}">
						<div class="alert alert-success">
							<strong>${msg}</strong>
=======
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
	<div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <%-- <%@ include file="/templates/admin/inc/topbar.jsp" %> --%>
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="m-0 font-weight-bold text-primarys">Thêm sản phẩm</h1>
            <ol class="breadcrumb">
              <c:set var="actionIndex" value="${pageContext.request.contextPath}/admin/index" />
              <c:if test="${not empty sessionScope.userSession}">
              		<c:set var="actionIndex" value="${pageContext.request.contextPath}/public/index" />
              </c:if>
              <li class="breadcrumb-item"><a href="${actionIndex}">Trang chủ</a></li>
              <li class="breadcrumb-item active" aria-current="page">Forms</li>
            </ol>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <!-- Form Basic -->
            <c:if test="${not empty msg}">
				<div class="alert alert-success">
					<strong>${msg}</strong>
				</div>
			</c:if>
              <div class="card mb-4">
                <div class="card-body">
                  <c:set var="actionUrl" value="${pageContext.request.contextPath}/admin/product/add" />
                  <c:if test="${not empty sessionScope.userSession}">
                  		<c:set var="actionUrl" value="${pageContext.request.contextPath}/public/product/add" />
                  </c:if>
                  <form role="form" action="${actionUrl}" method="post" id="form" enctype="multipart/form-data">
                  	<input type="hidden" name="orderCount" value="0">
                  	<input type="hidden" value="${locationId}" name="location.locationId">
                  	<div class="form-group">
                      <label for="name">Tên sản phẩm</label>
                      <input class="form-control mb-3" type="text" value="${product.name}" id="name" name="name">
                    </div>
                    <div class="form-group">
                      <label for="price">Giá sản phẩm</label>
                      <input class="form-control mb-3" type="text" value="${product.price}" id="price" name="price">
                    </div>
                    <div class="form-group">
                      <label for="description">Mô tả</label>
                      <input class="form-control mb-3" type="text" value="${product.description}" id="description" name="description">
                    </div>
                    <div class="form-group">
                      <label >Loại sản phẩm</label>
                      <select class="form-control" id="productCategory.productCategoryId" name="productCategory.productCategoryId">
                      <c:if test="${not empty productCategoryList}">
                      	<c:forEach items="${productCategoryList}" var="productCategory">
							<option value="${productCategory.productCategoryId}">${productCategory.productCategoryName}</option>
						 </c:forEach>
					  </c:if>
                      </select>
                    </div>
                    <div class="form-group">
                    	<label for="image">Hình ảnh</label>
                    	<input type="file" name="image" id="image" class="file" accept="image/*">
					    <div class="input-group my-3">
					      <input type="text" class="form-control" readonly="readonly" placeholder="Upload File" id="file">
					      <div class="input-group-append">
					        <button type="button" class="browse btn btn-primary">Chọn ảnh</button>
					      </div>
				    	</div>
				    	<div class="ml-2 col-sm-6">
						  <img src="https://via.placeholder.com/150x150" id="preview" class="img-thumbnail">
>>>>>>> Stashed changes
						</div>
					</c:if>
					<div class="card mb-4">
						<div class="card-body">
							<c:set var="actionUrl"
								value="${pageContext.request.contextPath}/admin/product/add" />
							<c:if test="${not empty sessionScope.userSession}">
								<c:set var="actionUrl"
									value="${pageContext.request.contextPath}/public/product/add" />
							</c:if>
							<form role="form" action="${actionUrl}" method="post" id="form"
								enctype="multipart/form-data">
								<input type="hidden" name="orderCount" value="0"> <input
									type="hidden" value="${locationId}" name="location.locationId">
								<div class="form-group">
									<label for="name">Tên sản phẩm</label> <input
										class="form-control mb-3" type="text" value="${product.name}"
										id="name" name="name">
								</div>
								<div class="form-group">
									<label for="price">Giá sản phẩm</label> <input
										class="form-control mb-3" type="text" value="${product.price}"
										id="price" name="price">
								</div>
								<div class="form-group">
									<label for="description">Mô tả</label> <input
										class="form-control mb-3" type="text"
										value="${product.description}" id="description"
										name="description">
								</div>
								<div class="form-group">
									<label>Loại sản phẩm</label> <select class="form-control"
										id="productCategory.productCategoryId"
										name="productCategory.productCategoryId">
										<c:if test="${not empty productCategoryList}">
											<c:forEach items="${productCategoryList}"
												var="productCategory">
												<option value="${productCategory.productCategoryId}">${productCategory.productCategoryName}</option>
											</c:forEach>
										</c:if>
									</select>
								</div>
								<div class="form-group">
									<label for="file">Upload hình ảnh</label> <input type="file"
										name="image" class="file" accept="image/*">
									<div class="input-group my-3">
										<input type="text" class="form-control" readonly="readonly"
											placeholder="Upload File" id="file">
										<div class="input-group-append">
											<button type="button" class="browse btn btn-primary">Chọn
												ảnh</button>
										</div>
									</div>
									<div class="ml-2 col-sm-6">
										<img src="https://placehold.it/80x80" id="preview"
											class="img-thumbnail">
									</div>
								</div>
								<style type="text/css">
.file {
	visibility: hidden;
	position: absolute;
}

.img-thumbnail {
	width: 400px;
	height: 300px;
}
</style>
								<script type="text/javascript">
                    $(document).on("click", ".browse", function() {
                    	  var file = $(this).parents().find(".file");
                    	  file.trigger("click");
                    	});
                    	$('input[type="file"]').change(function(e) {
                    	  var fileName = e.target.files[0].name;
                    	  $("#file").val(fileName);

                    	  var reader = new FileReader();
                    	  reader.onload = function(e) {
                    	    // get loaded data and render thumbnail.
                    	    document.getElementById("preview").src = e.target.result;
                    	  };
                    	  // read the image file as a data URL.
                    	  reader.readAsDataURL(this.files[0]);
                    	});
                    </script>
								<button type="submit" class="btn btn-primary" name="submit">Thêm
									mới</button>
							</form>
						</div>
					</div>
					<!--Row-->
				</div>
				<!---Container Fluid-->
			</div>
			<script
				src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery.validate.min.js"></script>
			<script type="text/javascript">
$.validator.addMethod("valueNotEquals", function(value, element, arg){
	  return arg !== value;
	 }, "Value must not equal arg.");
	$().ready(function() {
		var validator = $("#form").validate({
			errorPlacement: function(error, element){
				$(element).closest("form").find("label[for='" + element.attr("id") + "']").append(error);
			},
			errorElement: "span",
			ignore: [],
			rules:{
				name: {                      //lay name
					required:true,
				},
				price: {                      
					required:true,
					digits:true,
				},
				description: {                      
					required:true,
				},
				image: {                      
					required:true,
				},
			},
			messages: {
				name: {
					required: " (Mời nhập)",
				},
				price: {
					required: " (Mời nhập)",
					digits: " (Nhập số dương)",
				},
				description: {
					required: " (Mời nhập)",
				},
				image: {
					required: " (Chọn ảnh)",
				},
			},
		});
	});
</script>