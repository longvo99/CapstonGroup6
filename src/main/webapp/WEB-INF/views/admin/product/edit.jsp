<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
	<div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <%-- <%@ include file="/templates/admin/inc/topbar.jsp" %> --%>
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="m-0 font-weight-bold text-primarys">Chỉnh sửa sản phẩm</h1>
            <ol class="breadcrumb">
              <c:set var="actionIndex" value="${pageContext.request.contextPath}/admin/index" />
              <c:if test="${not empty sessionScope.userSession}">
              		<c:set var="actionIndex" value="${pageContext.request.contextPath}/public/index" />
              </c:if>
            </ol>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <!-- Form Basic -->
            <c:if test="${not empty msg}">
				<div class="alert alert-danger">
					<strong>${msg}</strong>
				</div>
			</c:if>
              <div class="card mb-4">
                <div class="card-body">
                  <c:set var="actionUrl" value="${pageContext.request.contextPath}/admin/product/edit" />
                  <c:if test="${not empty sessionScope.userSession}">
                  		<c:set var="actionUrl" value="${pageContext.request.contextPath}/public/product/edit" />
                  </c:if>
                  <form role="form" action="${actionUrl}" method="post" id="form" enctype="multipart/form-data">
                      <input type="hidden" value="${product.productId}" id="productId" name="productId">
                      <input type="hidden" value="${product.orderCount}" id="orderCount" name="orderCount">
                      <input type="hidden" value="${product.location.locationId}" id="locationId" name="location.locationId">
                  	<div class="form-group">
                      <label for="name">Tên sản phẩm</label>
                      <input class="form-control mb-3" type="text" value="${product.name}" id="name" name="name">
                    </div>
                    <div class="form-group">
                      <label for="price">Giá sản phẩm (VNĐ)</label>
                      <fmt:formatNumber var="product1" value="${fn:substring(product.price, 0, fn:indexOf(product.price, '.'))}" type="number"/>
                      <input class="form-control mb-3" type="text" value="${fn:substring(product.price, 0, fn:indexOf(product.price, '.'))}" id="price" name="price">
                    </div>
                    <div class="form-group">
                      <label for="description">Mô tả</label>
                      <input class="form-control mb-3" type="text" value="${product.description}" id="description" name="description">
                    </div>
                    <div class="form-group">
                      <label for="">Loại sản phẩm</label>
                      <select class="form-control" id="productCategory.productCategoryId" name="productCategory.productCategoryId">
                      <c:if test="${not empty productCategoryList}">
                      	<c:forEach items="${productCategoryList}" var="productCategory">
							<c:choose>
								<c:when test="${productCategory.productCategoryId eq product.productCategory.productCategoryId}">
									<c:set var="selected" value="selected='selected'" />
								</c:when>
								<c:otherwise>
									<c:set var="selected" value="" />
								</c:otherwise>
							</c:choose>
							<option ${selected} value="${productCategory.productCategoryId}">${productCategory.productCategoryName}</option>
						 </c:forEach>
					  </c:if>
                      </select>
                    </div>
                    <div class="form-group">
                    	<label for="image">Hình ảnh</label>
                    	<input type="file" name="image" id="image" class="file" accept="image/*">
					    <div class="input-group my-3">
					      <input type="text" class="form-control" value="${product.imagePath}" readonly="readonly"  placeholder="Upload File" id="file">
					      <div class="input-group-append">
					        <button type="button" class="browse btn btn-primary">Chọn ảnh</button>
					      </div>
				    	</div>
				    	<div class="ml-2 col-sm-6">
						  <img src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${product.imagePath}" id="preview" class="img-thumbnail">
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
								<button type="submit" class="btn btn-primary" name="submit">Cập
									nhập</button>
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
			},
		});
	});
</script>