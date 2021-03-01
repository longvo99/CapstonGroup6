<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="https://www.codehim.com/demo/jquery-image-uploader-preview-and-delete/dist/image-uploader.min.js"></script>
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

          <div class="row">
            <div class="col-lg-12">
              <!-- Form Basic -->
              <div class="card mb-4">
                <div class="card-body">
                  <form role="form" method="post"  name="form-example-1" id="form-example-1" enctype="multipart/form-data">
                  	<div class="form-group">
                      <label for="name">Location Name</label>
                      <input class="form-control mb-3" type="text" value="" id="name" name="name">
                    </div>
                    <div class="form-group">
                      <label for="address">Address</label>
                      <input class="form-control mb-3" type="text" value="" id="address" name="address">
                    </div>
                    <div class="form-group">
                      <label for="opentime">Open Time</label>
                      <input class="form-control mb-3" type="time" value="" id="opentime" name="opentime">
                    </div>
                    <div class="form-group">
                      <label for="closetime">Close Time</label>
                      <input class="form-control mb-3" type="time" value="" id="closetime" name="closetime">
                    </div>
                    <div class="form-group">
                      <label for="locationcategory">Location Category</label>
                      <select class="form-control" id="locationcategory" name="locationcategory">
	                      <c:if test="${not empty locationCategoriesList1}">
	                      	<c:forEach items="${locationCategoriesList1}" var="cat1">
	                      	<optgroup label="${cat1.locationCategoryName}">
							        <c:forEach items="${locationCategoriesList2}" var="cat2">
							        <c:if test="${cat2.parentId eq cat1.locationCategoryId}">
								        <option>${cat2.locationCategoryName}</option>
								    </c:if>
								    </c:forEach>
							</optgroup>    
							 </c:forEach>
						  </c:if>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="locationtype">Location Type</label>
                      <select class="form-control" id="locationtype" name="locationtype">
                      <c:if test="${not empty locationTypeList}">
                      	<c:forEach items="${locationTypeList}" var="type">
							<option value="${type.locationTypeId}">${type.locationTypeName}</option>
						 </c:forEach>
					  </c:if>
                      </select>
                    </div>
                    <div class="form-group">
					   <select name="country" id="country" class="form-control input-lg">
					    <option value="">Select country</option>
					   </select>
					</div>
					<div class="form-group">
					   <select name="state" id="state" class="form-control input-lg">
					    <option value="">Select state</option>
					   </select>
					</div>
					<div class="form-group">
					   <select name="city" id="city" class="form-control input-lg">
					    <option value="">Select city</option>
					   </select>
					</div>
					<script>
					$(document).ready(function(){

						 load_json_data('country');

						 function load_json_data(id, parent_id)
						 {
						  var html_code = '';
						  $.getJSON('${pageContext.request.contextPath}/resources/admin/assets/js/country_state_city.json', function(data){

						   html_code += '<option value="">Select '+id+'</option>';
						   $.each(data, function(key, value){
						    if(id == 'country')
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
						 $(document).on('change', '#country', function(){
						  var country_id = $(this).val();
						  if(country_id != '')
						  {
						   load_json_data('state', country_id);
						  }
						  else
						  {
						   $('#state').html('<option value="">Select state</option>');
						   $('#city').html('<option value="">Select city</option>');
						  }
						 });
						 $(document).on('change', '#state', function(){
						  var state_id = $(this).val();
						  if(state_id != '')
						  {
						   load_json_data('city', state_id);
						  }
						  else
						  {
						   $('#city').html('<option value="">Select city</option>');
						  }
						 });
						});
					</script>
                    <div class="form-group">
                      <label for="country">Country</label>
                      <select class="form-control" id="country" name="country">
                      	<option>Việt Nam</option>
                      </select>
                    </div>
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
                  <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
                  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/assets/js/dropdown.js"></script>
                </div>
              </div>
          <!--Row-->
        </div>
        <!---Container Fluid-->
      </div>
