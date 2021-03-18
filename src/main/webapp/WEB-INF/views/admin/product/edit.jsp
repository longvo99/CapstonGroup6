<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
	<div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <%-- <%@ include file="/templates/admin/inc/topbar.jsp" %> --%>
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="m-0 font-weight-bold text-primarys">Thêm mới loại địa điểm</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Trang chủ</a></li>
              <li class="breadcrumb-item active" aria-current="page">Forms</li>
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
                  <form role="form" action="${pageContext.request.contextPath}/admin/product/edit" method="post" id="form" enctype="multipart/form-data">
                  	<div class="form-group">
                      <label for="name">ID sản phẩm</label>
                      <input class="form-control mb-3" type="text" value="${product.productId}" id="productId" name="productId" readonly>
                    </div>
                  	<div class="form-group">
                      <label for="name">Tên sản phẩm</label>
                      <input class="form-control mb-3" type="text" value="${product.name}" id="name" name="name">
                    </div>
                    <div class="form-group">
                      <label for="name">Tên giá</label>
                      <input class="form-control mb-3" type="text" value="${product.price}" id="price" name="price">
                    </div>
                    <div class="form-group">
                      <label for="name">Mô tả</label>
                      <input class="form-control mb-3" type="text" value="${product.describe}" id="describe" name="describe">
                    </div>
                    <div class="form-group">
                      <label for="name">Loại sản phẩm</label>
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
                      <label for="name">Id địa điểm</label>
                      <input class="form-control mb-3" type="text" value="${product.locationId}" id="locationId" name="locationId" readonly>
                    </div>
                    <div class="form-group">
                    	<label for="name">Upload hình ảnh</label>
                    	<input type="file" name="image" class="file" accept="image/*">
					    <div class="input-group my-3">
					      <input type="text" class="form-control" value="${product.imagePath}" name="image" disabled placeholder="Upload File" id="file">
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
						.img-thumbnail{
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
                    <button type="submit" class="btn btn-primary" name="submit">Cập nhập</button>
                  </form>
                </div>
              </div>
          <!--Row-->
        </div>
        <!---Container Fluid-->
      </div>