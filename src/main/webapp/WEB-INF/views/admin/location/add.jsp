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
            <h1 class="m-0 font-weight-bold text-primarys">Add location</h1>
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
                      <label for="locationName">Location Name</label>
                      <input class="form-control mb-3" type="text" value="" id="locationName" name="locationName">
                    </div>
                    <div class="form-group">
                      <label for="address">Address</label>
                      <input class="form-control mb-3" type="text" value="" id="address" name="address">
                    </div>
                    <div class="form-group">
                      <label for="openTime">Open Time</label>
                      <input class="form-control mb-3" type="time" value="" id="openTime" name="openTime">
                    </div>
                    <div class="form-group">
                      <label for="closeTime">Close Time</label>
                      <input class="form-control mb-3" type="time" value="" id="closeTime" name="closeTime">
                    </div>
                    <div class="form-group">
                      <label for="locationcategory">Location Category</label>
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
                      <label for="locationtype">Location Type</label>
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
                    
                    
                    
					
					<!-- <script>
					$(document).ready(function(){

						 load_json_data('city');

						 function load_json_data(id, parent_id)
						 {
						  var html_code = '';
						  $.getJSON('${pageContext.request.contextPath}/resources/admin/assets/js/city_district_ward.json', function(data){

						   html_code += '<option value="">Select</option>';
						   $.each(data, function(key, value){
						    if(id == 'city')
						    {
						     if(value.parent_id == '0')
						     {
						      html_code += '<option value="'+value.id+'">'+value.name+'</option>';
						     }
						    }
						    else
						    {
						     if(value.parent_id == parent_id)
						     {
						      html_code += '<option value="'+value.id+'">'+value.name+'</option>';
						     }
						    }
						   });
						   $('#'+id).html(html_code);
						  });

						 }

						 $(document).on('change', '#city', function(){
						  var city_id = $(this).val();
						  if(city_id != '')
						  {
						   load_json_data('district', city_id);
						  }
						  else
						  {
						   $('#district').html('<option value="">Select</option>');
						   $('#ward').html('<option value="">Select</option>');
						  }
						 });
						 $(document).on('change', '#district', function(){
						  var district_id = $(this).val();
						  if(district_id != '')
						  {
						   load_json_data('ward', district_id);
						  }
						  else
						  {
						   $('#ward').html('<option value="">Select</option>');
						  }
						 });
						});
					</script> -->
                    <!-- <div class="form-group">
	                  <label for="picture">Hình ảnh</label>
	                  <input type="file" name="picture" />
                    </div> -->
                    <div class="input-field">
				        <label class="active">Photos</label>
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
				city: {                      
					valueNotEquals: "000",
				},
				district: {                      
					valueNotEquals: "000",
				},
				ward: {                      
					valueNotEquals: "000",
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
				city: {
					valueNotEquals: " (Mời nhập)",
				},
				district: {
					valueNotEquals: " (Mời nhập)",
				},
				ward: {
					valueNotEquals: " (Mời nhập)",
				},
			},
		});
	});
</script>