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
            <h1 class="m-0 font-weight-bold text-primarys">Cập nhập địa điểm</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Forms</li>
            </ol>
          </div>
		  <span id="result">
	      	<c:if test="${not empty msg}">
               	<c:if test="${success eq true}">
					<div class="alert alert-success">
						<strong>${msg}</strong>
					</div>
				</c:if>
				<c:if test="${error eq true}">
					<div class="alert alert-danger">
						<strong>${msg}</strong>
					</div>
				</c:if>
			</c:if>
	      </span>
          <div class="row">
            <div class="col-lg-12">
              <!-- Form Basic -->
              <div class="card mb-4">
                <div class="card-body">
                  <form role="form" method="post"  name="form-example-1" id="form-example-1" enctype="multipart/form-data">
                  	<div class="form-group">
                      <label for="name">Location ID</label>
                      <input class="form-control mb-3" type="text" value="${location.locationId}" id="locationId" name="locationId" readonly>
                    </div>
                  	<div class="form-group">
                      <label for="name">Location Name</label>
                      <input class="form-control mb-3" type="text" value="${location.locationName}" id="locationName" name="locationName" readonly>
                    </div>
                    <div class="form-group">
                      <label for="address">Address</label>
                      <input class="form-control mb-3" type="text" value="${location.address}" id="address" name="address" readonly>
                    </div>
                    <div class="form-group">
                      <label for="opentime">Open Time</label>
                      <input class="form-control mb-3" type="text" value="${location.openTime}" id="openTime" name="openTime" readonly>
                    </div>
                    <div class="form-group">
                      <label for="closetime">Close Time</label>
                      <input class="form-control mb-3" type="text" value="${location.closeTime}" id="closeTime" name="closeTime" readonly>
                    </div>
                    <div class="form-group">
                      <label for="locationcategory">Location Category</label>
                      <select class="form-control" id="locationcategory" name="locationCategory.categoryId" readonly>
	                      <c:if test="${not empty locationCategoriesList1}">
	                      	<c:forEach items="${locationCategoriesList1}" var="cat1">
	                      	<optgroup label="${cat1.locationCategoryName}">
							        <c:forEach items="${locationCategoriesList2}" var="cat2">
							        <c:if test="${cat2.parentId eq cat1.categoryId}">
							        	<c:choose>
											<c:when test="${cat2.categoryId eq location.locationCategory.categoryId }">
												<c:set var="selected" value="selected='selected'" />
											</c:when>
											<c:otherwise>
												<c:set var="selected" value="" />
											</c:otherwise>
										</c:choose>
								        <option ${selected} value="${cat2.categoryId}">${cat2.locationCategoryName}</option>
								    </c:if>
								    </c:forEach>
							</optgroup>    
							 </c:forEach>
						  </c:if>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="locationtype">Location Type</label>
                      <select class="form-control" id="locationType" name="locationType.locationTypeId" readonly>
                      <c:if test="${not empty locationTypeList}">
                      	<c:forEach items="${locationTypeList}" var="type">
							<c:choose>
								<c:when test="${type.locationTypeId eq location.locationType.locationTypeId }">
									<c:set var="selected" value="selected='selected'" />
								</c:when>
								<c:otherwise>
									<c:set var="selected" value="" />
								</c:otherwise>
							</c:choose>
							<option ${selected} value="${type.locationTypeId}">${type.locationTypeName}</option>
						 </c:forEach>
					  </c:if>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="country">Nước</label>
                      <select class="form-control" name="country" readonly>
                      	<option value="Việt Nam">Việt Nam</option>
                      </select>
                    </div>
                    <c:forEach items="${listJson}" var="json">
                    	<c:choose>
                    		<c:when test="${json.id eq location.city}">
                    			<c:set var="cityName" value="${json.name}" />
                    		</c:when>
                    		<c:when test="${json.id eq location.district}">
                    			<c:set var="districtName" value="${json.name}" />
                    		</c:when>
                    		<c:when test="${json.id eq location.ward}">
                    			<c:set var="wardName" value="${json.name}" />
                    		</c:when>
                    	</c:choose>
                    </c:forEach>
                    <div class="form-group">
                    	<label for="country">Tỉnh/thành</label>
					    <select name="city" id="city" class="form-control input-lg" readonly>
					    	<option value="${location.city}">${cityName}</option>
					    </select>
					</div>
					<div class="form-group">
						<label for="country">Quận huyện</label>
					   <select name="district" id="district" class="form-control input-lg" readonly>
					    <option value="${location.district}">${districtName}</option>
					   </select>
					</div>
					<div class="form-group">
						<label for="country">Xã/phường</label>
					   <select name="ward" id="ward" class="form-control input-lg" readonly>
					    <option value="${location.ward}">${wardName}</option>
					   </select>
					</div>
					<div class="form-group">
						<label for="country">Người tạo</label>
						<input class="form-control mb-3" type="text" value="${location.users.username}" id="user.username" name="user.username" readonly>
					</div>
					<div class="input-field">
				        <label class="active">Hình ảnh</label>
				        <div class="input-images" style="padding-top: .5rem;"></div>
				    </div>
				    	<div class="form-group">
						<label for="country">Trạng Thái</label>
					   <select class="form-control input-lg">
					    <option>Cho phép hiển thị</option>
					   </select>
					</div>
					<script>
					
					let preloaded = [
				    	<c:if test="${not empty imagePath}">
						    	<c:forEach items="${imagePath}" var="image">
						    		<c:if test="${image != ''}"> 
						  	  		{id: 1, src: '${pageContext.request.contextPath}/resources/admin/image/uploads/${image}'},
						  	  	 	</c:if>
						  	  	</c:forEach>
					    </c:if>
				    	];
				      	$('.input-images').imageUploader({
				      	    preloaded: preloaded,
				      	    imagesInputName: 'images',
				      	    preloadedInputName: 'image'
				      	});
					
					$(document).ready(function(){
						 load_json_data('city');
						 function load_json_data(id, parent_id)
						 {
						  var html_code = '';
						  $.getJSON('${pageContext.request.contextPath}/resources/admin/assets/js/city_district_ward.json', function(data){
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
					</script>
                    <!-- <div class="form-group">
	                  <label for="picture">Hình ảnh</label>
	                  <input type="file" name="picture" />
                    </div> -->
                    <!-- <div class="input-field">
				        <label class="active">Photos</label>
				        <div class="input-images" style="padding-top: .5rem;"></div>
				    </div>
				    <script type="text/javascript">
				    	$('.input-images').imageUploader();
				    </script> -->
                    <button type="submit" class="btn btn-primary" name="submit">Cập nhập</button>
                  </form>
                </div>
              </div>
          <!--Row-->
        </div>
        <!---Container Fluid-->
      </div>
