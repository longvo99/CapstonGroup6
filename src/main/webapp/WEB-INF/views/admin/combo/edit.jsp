<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
<sec:authentication var="userDetail" property="principal" />
	<div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <%-- <%@ include file="/templates/admin/inc/topbar.jsp" %> --%>
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="m-0 font-weight-bold text-primarys">Chỉnh sửa combo</h1>
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
				<div class="alert alert-danger">
					<strong>${msg}</strong>
				</div>
			</c:if>
              <div class="card mb-4">
                <div class="card-body">
                  <c:set var="actionUrl" value="${pageContext.request.contextPath}/admin/combo/edit" />
                  <c:if test="${not empty sessionScope.userSession}">
                  		<c:set var="actionUrl" value="${pageContext.request.contextPath}/public/combo/edit" />
                  </c:if>
                  <form role="form" action="${actionUrl}" method="post" id="form" name="form" enctype="multipart/form-data">
                  <c:if test="${empty sessionScope.userSession}">
                  <c:if test="${userDetail.user.role.roleId eq 'ADMIN'}">
                  	<c:set var="readonly" value="readonly='readonly'" ></c:set>
                  	<c:set var="disabled" value="disabled='disabled'" ></c:set>
                  </c:if>
                  </c:if>
                  	<div class="form-group">
                      <label for="productComboId">ID</label>
                      <input class="form-control mb-3" type="text" value="${productCombo.productComboId}" id="productComboId" name="productComboId" readonly>
                    </div>
                  	<div class="form-group">
                      <label for="comboName">Tên Combo</label>
                      <input ${readonly} class="form-control mb-3" type="text" value="${productCombo.comboName}" id="comboName" name="comboName">
                    </div>
                    <div class="form-group">
                      <label for="rateDiscount">Phần trăm giảm</label>
                      <input ${readonly} class="form-control mb-3" type="text" value="${productCombo.rateDiscount}" id="rateDiscount" name="rateDiscount">
                    </div>
                    <div class="form-group">
                      <label for="description">Mô tả</label>
                      <input ${readonly} class="form-control mb-3" type="text" value="${productCombo.description}" id="description" name="description">
                    </div>
                    <div class="form-group">
                    	<label for="" >Chọn sản phẩm: </label>
                    	<input ${readonly} class="form-control" id="myInput" type="text" placeholder="Nhập tên sản phẩm..">
                    	<div style="height:200px; overflow-y: scroll; width: 500px; margin-top: 10px;">
	                    	<ul id="myList">
	                    	<c:if test="${not empty productListChecked}">
	                    		<c:forEach var="product" items="${productListChecked}">
	                    			<li><input ${disabled}  checked="checked" type="checkbox" class="checkbox" name="check[]" value="${product.productId}" style="zoom: 1.5;"> ${product.name};</li>
	                    		</c:forEach>
	                    	</c:if>
	                    	<c:if test="${not empty productListUnChecked}">
	                    		<c:forEach var="product" items="${productListUnChecked}">
	                    			<li><input ${disabled} type="checkbox" class="checkbox" name="check[]" value="${product.productId}" style="zoom: 1.5;"> ${product.name};</li>
	                    		</c:forEach>
	                    	</c:if>
	                    	</ul>
                    	</div>
                    	<script>
							$(document).ready(function(){
							  $("#myInput").on("keyup", function() {
							    var value = $(this).val().toLowerCase();
							    $("#myList li").filter(function() {
							      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
							    });
							  });
							});
						</script>
                    </div>
                    <input type="hidden" value="${productCombo.location.locationId}" name="location.locationId">
                    <div class="form-group">
                    	<label for="name">Hình ảnh</label>
                    	<c:if test="${empty sessionScope.userSession}">
                  		<c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
                    	<input type="file" name="image" class="file" accept="image/*">
					    <div class="input-group my-3">
					      <input type="text" class="form-control" value="${productCombo.imagePath}" name="image" disabled placeholder="Upload File" id="file">
					      <div class="input-group-append">
					        <button type="button" class="browse btn btn-primary">Chọn ảnh</button>
					      </div>
				    	</div>
				    	</c:if></c:if>
				    	<div class="ml-2 col-sm-6">
						  <img src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${productCombo.imagePath}" id="preview" class="img-thumbnail">
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
                    <c:if test="${empty sessionScope.userSession}">
					<c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
                    	<button type="submit" id="btn" class="btn btn-primary" name="submit">Cập nhập</button>
                   	</c:if>
                    </c:if>
                  </form>
                </div>
              </div>
          <!--Row-->
        </div>
        <!---Container Fluid-->
      </div>
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery.validate.min.js"></script>
<script type="text/javascript">
	$().ready(function() {
		var validator = $("#form").validate({
			errorPlacement: function(error, element){
				$(element).closest("form").find("label[for='" + element.attr("id") + "']").append(error);
			},
			errorElement: "span",
			ignore: [],
			rules:{
				comboName: {                      //lay name
					required:true,
				},
				rateDiscount: {                      
					required:true,
					digits:true,
					max: 100,
				},
				description: {                      
					required:true,
				},
			},
			messages: {
				comboName: {
					required: " (Mời nhập)",
				},
				rateDiscount: {
					required: " (Mời nhập)",
					digits: " (Nhập số nguyên dương)",
					max: " (Nhập số <=100)",
				},
				description: {                      
					required: " (Mời nhập)",
				},
			},
		}); 
	});
</script>