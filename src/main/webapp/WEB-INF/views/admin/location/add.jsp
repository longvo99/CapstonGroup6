<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/assets/js/image-uploader.min.js"></script>
	<div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <%-- <%@ include file="/templates/admin/inc/topbar.jsp" %> --%>
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="m-0 font-weight-bold text-primarys">Tạo địa điểm mới</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Forms</li>
            </ol>
          </div>
		  <span id="result">
	      	<c:if test="${not empty msg}">
					<div class="alert alert-success">
						<strong>${msg}</strong>
					</div>
				</c:if>
	      </span>
          <div class="row">
            <div class="col-lg-12">
              <!-- Form Basic -->
              <div class="card mb-4">
                <div class="card-body">
                  <form role="form" method="post"  name="form" id="form" enctype="multipart/form-data">
                  	<div class="form-group">
                      <label for="locationName">Tên địa điểm</label>
                      <input class="form-control mb-3" type="text" value="" id="locationName" name="locationName">
                    </div>
                    <div class="form-group">
                      <label for="address">Địa chỉ</label>
                      <input class="form-control mb-3" type="text" value="" id="address" name="address">
                    </div>
                    <div class="form-group">
                      <label for="openTime">Giờ mở cửa</label>
                      <input class="form-control mb-3" type="time" value="" id="openTime" name="openTime">
                    </div>
                    <div class="form-group">
                      <label for="closeTime">Giờ đóng cửa</label>
                      <input class="form-control mb-3" type="time" value="" id="closeTime" name="closeTime">
                    </div>
                    <div class="form-group">
                    	<label for="description">Mô tả</label>
						<textarea class="form-control mb-10" id="description" rows="5" name="description" placeholder="Nội dung" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nội dung'"></textarea>
					</div>
                    <div class="form-group">
                      <label for="locationcategory">Danh mục địa điểm</label>
                      <select class="form-control" id="locationcategory" name="locationCategory.categoryId">
	                      <c:if test="${not empty locationCategoriesList1}">
	                      	<c:forEach items="${locationCategoriesList1}" var="cat1">
	                      	<optgroup label="${cat1.locationCategoryName}">
							        <c:forEach items="${locationCategoriesList2}" var="cat2">
							        <c:if test="${cat2.parentId eq cat1.categoryId}">
								        <option value="${cat2.categoryId}">${cat2.locationCategoryName}</option>
								    </c:if>
								    </c:forEach>
							</optgroup>    
							 </c:forEach>
						  </c:if>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="locationtype">Kiểu địa điểm</label>
                      <select class="form-control" id="locationType" name="locationType.locationTypeId">
                      <c:if test="${not empty locationTypeList}">
                      	<c:forEach items="${locationTypeList}" var="type">
							<option value="${type.locationTypeId}">${type.locationTypeName}</option>
						 </c:forEach>
					  </c:if>
                      </select>
                    </div>
                    
                    <div>
                    <div class="form-group">
                      <label for="">Nước</label>
                      <select class="form-control" name="country">
                      	<option value="Việt Nam">Việt Nam</option>
                      </select>
                    </div>
                    <div class="form-group">
                    	<label for="country">Tỉnh/thành</label>
					   <select name="city" id="country" class="form-control input-lg">
					    	<option value="000">-Chọn Tỉnh/Thành:-</option>
					   </select>
					</div>
					<div class="form-group">
						<label for="state">Quận huyện</label>
					   <select name="district" id="state" class="form-control input-lg">
					    	<option value="000">-Chọn Quận/Huyện-</option>
					   </select>
					</div>
					<div class="form-group">
						<label for="city">Xã/phường</label>
					   <select name="ward" id="city" class="form-control input-lg">
					    	<option value="000">-Chọn Phường/Xã-</option>
					   </select>
					</div>
      				</div>
      				<div class="form-group">
						<label for="locationPhone">Số điện thoại</label>
						<input class="form-control mb-3" type="text" value="${location.locationPhone}" id="locationPhone" name="locationPhone">
					</div>
					<div class="form-group">
						<label for="locationEmail">Email</label>
						<input class="form-control mb-3" type="text" value="${location.locationEmail}" id="locationEmail" name="locationEmail">
					</div>
			<script>
					$(document).ready(function(){
						  $.getJSON('${pageContext.request.contextPath}/resources/admin/assets/js/data.json', function(data){
							  $.each(data, function (index, value) {
								    var country_id;
								    var state_id;
								    var city_id;
								        $("#country").append('<option rel="' + index + '" value="'+value.Id+'">'+value.Name+'</option>');
								        $("#country").change(function () {
								            $("#state, #city").find("option:gt(0)").remove();
								            $("#state").find("option:first").text("Loading...");
								            country_id = $(this).find('option:selected').attr('rel');
								            console.log("Country INDEX : " + country_id);
								            $.each(data[country_id].Districts, function (index1, value1) {
								                $("#state").find("option:first").text("-Chọn Quận/Huyện-");
								                $("#state").append('<option rel="' + index1 + '" value="'+value1.Id+'">'+value1.Name+'</option>');
								            });
								            
								        });
								        $("#state").change(function () {
								            $("#city").find("option:gt(0)").remove();
								            $("#city").find("option:first").text("Loading...");
								            state_id = $(this).find('option:selected').attr('rel');
								            console.log("State INDEX : " + state_id);
								            $.each(data[country_id].Districts[state_id].Wards, function (index2, value2) {
								                $("#city").find("option:first").text("-Chọn Phường/Xã-");
								                $("#city").append('<option rel="' + index2 + '" value="'+value2.Id+'">'+value2.Name+'</option>');
								            });
								        });     
								});
						 });
						});
			</script>
                    <div class="input-field">
				        <label class="active">Hình ảnh</label>
				        <div class="input-images" style="padding-top: .5rem;"></div>
				    </div>
				    <script type="text/javascript">
				    	$('.input-images').imageUploader();
				    </script>
                    <button type="submit" class="btn btn-primary" name="submit">Thêm mới</button>
                  </form>
                </div>
              </div>
          <!--Row-->
        </div>
        <!---Container Fluid-->
      </div>
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery.validate.min.js"></script>
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
				locationName: {                      //lay name
					required:true,
				},
				address: {                      
					required:true,
				},
				openTime: {                      
					required:true,
				},
				closeTime: {                      
					required:true,
				},
				description: {                      
					required:true,
				},
				city: {                      
					valueNotEquals: "000",
				},
				district: {                      
					valueNotEquals: "000",
				},
				ward: {                      
					valueNotEquals: "000",
				},
				locationPhone: {                      
					required:true,
					digits:true,
					minlength:10, 
					maxlength:10,
				},
				locationEmail: {                      
					required:true,
					email: true,
				},
			},
			messages: {
				locationName: {
					required: " (Mời nhập)",
				},
				address: {
					required: " (Mời nhập)",
				},
				openTime: {
					required: " (Mời nhập)",
				},
				closeTime: {
					required: " (Mời nhập)",
				},
				description: {                      
					required: " (Mời nhập)",
				},
				city: {
					valueNotEquals: " (Mời nhập)",
				},
				district: {
					valueNotEquals: " (Mời nhập)",
				},
				ward: {
					valueNotEquals: " (Mời nhập)",
				},
				locationPhone: {
					required: " (Mời nhập)",
					digits: " (Nhập số)",
					minlength:" (Nhập 10 số)", 
					maxlength:" (Nhập 10 số)",
				},
				locationEmail: {
					required: " (Mời nhập)",
					email: " (Nhập đúng định dạng)",
				},
			},
		});
	});
</script>