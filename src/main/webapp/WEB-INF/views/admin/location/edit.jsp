<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< Updated upstream
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<sec:authentication var="userDetail" property="principal" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/admin/assets/js/image-uploader.min.js"></script>
<div id="content-wrapper" class="d-flex flex-column">
	<div id="content">
		<%-- <%@ include file="/templates/admin/inc/topbar.jsp" %> --%>
		<!-- Container Fluid-->
		<div class="container-fluid" id="container-wrapper">
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="m-0 font-weight-bold text-primarys">Cập nhập địa
					điểm</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="./">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Forms</li>
				</ol>
			</div>
			<c:if test="${not empty msg}">
				<div class="alert alert-success">
					<strong>${msg}</strong>
				</div>
			</c:if>
			<div class="row">
				<div class="col-lg-12">
					<!-- Form Basic -->
					<div class="card mb-4">
						<div class="card-body">
							<c:set var="actionUrl"
								value="${pageContext.request.contextPath}/admin/location/edit" />
							<c:if test="${not empty sessionScope.userSession}">
								<c:set var="actionUrl"
									value="${pageContext.request.contextPath}/public/location/edit" />
							</c:if>
							<form action="${actionUrl}" role="form" method="post"
								name="form-example-1" id="form-example-1"
								enctype="multipart/form-data">
								<c:if test="${empty sessionScope.userSession}">
									<c:if test="${userDetail.user.role.roleId eq 'ADMIN'}">
										<c:set var="readonly" value="readonly='readonly'"></c:set>
									</c:if>
								</c:if>
								<input class="form-control mb-3" type="hidden"
									value="${location.locationId}" name="locationId">
								<div class="form-group">
									<label for="name">Tên địa điểm</label> <input
										class="form-control mb-3" type="text"
										value="${location.locationName}" id="locationName"
										name="locationName" ${readonly}>
								</div>
								<div class="form-group">
									<label for="address">Địa chỉ</label> <input
										class="form-control mb-3" type="text"
										value="${location.address}" id="address" name="address"
										${readonly}>
								</div>
								<div class="form-group">
									<label for="opentime">Giờ mở cửa</label> <input
										class="form-control mb-3" type="time"
										value="${location.openTime}" id="openTime" name="openTime"
										${readonly}>
								</div>
								<div class="form-group">
									<label for="closetime">Giờ đóng cửa</label> <input
										class="form-control mb-3" type="time"
										value="${location.closeTime}" id="closeTime" name="closeTime"
										${readonly}>
								</div>
								<div class="form-group">
									<label for="closetime">Mô tả</label>
									<textarea ${readonly} class="form-control mb-10"
										id="description" rows="5" name="description"
										placeholder="Nội dung" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Nội dung'">${location.description}</textarea>
								</div>
								<div class="form-group">
									<label for="locationcategory">Danh mục địa điểm</label> <select
										class="form-control" id="locationcategory"
										name="locationCategory.categoryId" ${readonly}>
										<c:if test="${not empty locationCategoriesList1}">
											<c:forEach items="${locationCategoriesList1}" var="cat1">
												<optgroup label="${cat1.locationCategoryName}">
													<c:forEach items="${locationCategoriesList2}" var="cat2">
														<c:if test="${cat2.parentId eq cat1.categoryId}">
															<c:choose>
																<c:when
																	test="${cat2.categoryId eq location.locationCategory.categoryId }">
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
									<label for="locationtype">Kiểu địa điểm</label> <select
										class="form-control" id="locationType"
										name="locationType.locationTypeId" ${readonly}>
										<c:if test="${not empty locationTypeList}">
											<c:forEach items="${locationTypeList}" var="type">
												<c:choose>
													<c:when
														test="${type.locationTypeId eq location.locationType.locationTypeId }">
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
								<div>
									<div class="form-group">
										<label for="country">Nước</label> <select class="form-control"
											name="country" ${readonly}>
											<option value="Việt Nam">Việt Nam</option>
										</select>
									</div>
									<div class="form-group">
										<label for="city">Tỉnh/thành</label> <select name="city"
											id="country" class="form-control input-lg" ${readonly}>
											<option value="000">-Chọn Tỉnh/Thành:-</option>
										</select>
									</div>
									<div class="form-group">
										<label for="district">Quận huyện</label> <select
											name="district" id="state" class="form-control input-lg"
											${readonly}>
											<option value="000">-Chọn Quận/Huyện-</option>
										</select>
									</div>
									<div class="form-group">
										<label for="ward">Xã/phường</label> <select name="ward"
											id="city" class="form-control input-lg" ${readonly}>
											<option value="000">-Chọn Phường/Xã-</option>
										</select>
									</div>
								</div>
								<script>
=======
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
	<sec:authentication var="userDetail" property="principal" />
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
		  <c:if test="${not empty msg}">
			<div class="alert alert-success">
				<strong>${msg}</strong>
			</div>
		  </c:if>
          <div class="row">
            <div class="col-lg-12">
              <!-- Form Basic -->
              <div class="card mb-4">
                <div class="card-body">
                  <c:set var="actionUrl" value="${pageContext.request.contextPath}/admin/location/edit" />
                  <c:if test="${not empty sessionScope.userSession}">
                  		<c:set var="actionUrl" value="${pageContext.request.contextPath}/public/location/edit" />
                  </c:if>
                  <form action="${actionUrl}" role="form" method="post"  name="form-example-1" id="form" enctype="multipart/form-data">
                  <c:if test="${empty sessionScope.userSession}">
                  <c:if test="${userDetail.user.role.roleId eq 'ADMIN'}">
                  	<c:set var="readonly" value="readonly='readonly'" ></c:set>
                  </c:if>
                  </c:if>
                    <input class="form-control mb-3" type="hidden" value="${location.locationId}" name="locationId">
                  	<div class="form-group">
                      <label for="name">Tên địa điểm</label>
                      <input class="form-control mb-3" type="text" value="${location.locationName}" id="locationName" name="locationName" ${readonly}>
                    </div>
                    <div class="form-group">
                      <label for="address">Địa chỉ</label>
                      <input class="form-control mb-3" type="text" value="${location.address}" id="address" name="address" ${readonly}>
                    </div>
                    <div class="form-group">
                      <label for="openTime">Giờ mở cửa</label>
                      <!-- <input class="form-control mb-3" type="time" value="" id="openTime" name="openTime"> -->
                      <div class="input-group clockpicker" id="clockPicker2">
                      <input type="text" class="form-control" id="openTime" name="openTime" placeholder="00:00" value="${location.openTime}" ${readonly}">                     
                      <div class="input-group-append">
                        <span class="input-group-text"><i class="fas fa-clock"></i></span>
                      </div>                      
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="closeTime">Giờ đóng cửa</label>
                      <!-- <input class="form-control mb-3" type="time" value="" id="closeTime" name="closeTime"> -->
                      <div class="input-group clockpicker" id="clockPicker3">
                      <input type="text" class="form-control" id="closeTime" name="closeTime" placeholder="00:00" value="${location.closeTime}" ${readonly}">                     
                      <div class="input-group-append">
                        <span class="input-group-text"><i class="fas fa-clock"></i></span>
                      </div>                      
                      </div>
                    </div>
                    <%-- <div class="form-group">
                      <label for="opentime">Giờ mở cửa</label>
                      <input class="form-control mb-3" type="time" value="${location.openTime}" id="openTime" name="openTime" ${readonly}>
                    </div>
                    <div class="form-group">
                      <label for="closetime">Giờ đóng cửa</label>
                      <input class="form-control mb-3" type="time" value="${location.closeTime}" id="closeTime" name="closeTime" ${readonly}>
                    </div> --%>
                   <div class="form-group">
                   		<label for="closetime">Mô tả</label>
						<textarea ${readonly} class="form-control mb-10" id="description" rows="5" name="description" placeholder="Nội dung" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nội dung'">${location.description}</textarea>
					</div>
                    <div class="form-group">
                      <label for="locationcategory">Danh mục địa điểm</label>
                      <select class="form-control" id="locationcategory" name="locationCategory.categoryId" ${readonly}>
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
                      <label for="locationtype">Kiểu địa điểm</label>
                      <select class="form-control" id="locationType" name="locationType.locationTypeId" ${readonly}>
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
                     <div>
                    <div class="form-group">
                      <label for="country">Nước</label>
                      <select class="form-control" name="country" ${readonly}>
                      	<option value="Việt Nam">Việt Nam</option>
                      </select>
                    </div>
                    <div class="form-group">
                    	<label for="city">Tỉnh/thành</label>
					   <select name="city" id="country" class="form-control input-lg" ${readonly}>
					    	<option value="000">-Chọn Tỉnh/Thành:-</option>
					   </select>
					</div>
					<div class="form-group">
						<label for="district">Quận huyện</label>
					   <select name="district" id="state" class="form-control input-lg" ${readonly}>
					    	<option value="000">-Chọn Quận/Huyện-</option>
					   </select>
					</div>
					<div class="form-group">
						<label for="ward">Xã/phường</label>
					   <select name="ward" id="city" class="form-control input-lg" ${readonly}>
					    	<option value="000">-Chọn Phường/Xã-</option>
					   </select>
					</div>
      				</div>
			<script>
>>>>>>> Stashed changes
					$(document).ready(function(){
						  $.getJSON('${pageContext.request.contextPath}/resources/admin/assets/js/data.json', function(data){
							  var country_id;
							  var state_id;
							  $.each(data, function (index, value) {
								    var city_id;
								    if(${location.city} == value.Id){
								    	$("#country").append('<option selected="selected" rel="' + index + '" value="'+value.Id+'">'+value.Name+'</option>');
								    } else {
								    	$("#country").append('<option rel="' + index + '" value="'+value.Id+'">'+value.Name+'</option>');
								    }
								   /*  country_id = $("#country").find('option:selected').attr('rel');
						            console.log("Country INDEX : " + country_id); */
						            /* $.each(data[country_id].Districts, function (index1, value1) {
						                 
						            	if(${location.district} == value1.Id){
						            		 $("#state").append('<option selected="selected" rel="' + index1 + '" value="'+value1.Id+'">'+value1.Name+'</option>');
									    } else {
									    	$("#state").append('<option rel="' + index1 + '" value="'+value1.Id+'">'+value1.Name+'</option>');
									    }
						               
						            });   */
						            country_id = $("#country").find('option:selected').attr('rel');
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
							  $.each(data[country_id].Districts, function (index1, value1) {
					            	if(${location.district} == value1.Id){
					            		 $("#state").append('<option selected="selected" rel="' + index1 + '" value="'+value1.Id+'">'+value1.Name+'</option>');
								    } else {
								    	$("#state").append('<option rel="' + index1 + '" value="'+value1.Id+'">'+value1.Name+'</option>');
								    }
					            }); 
							  state_id = $("#state").find('option:selected').attr('rel');
							  $.each(data[country_id].Districts[state_id].Wards, function (index2, value2) {
					            	if(${location.ward} == value2.Id){
					            		$("#city").append('<option selected="selected" rel="' + index2 + '" value="'+value2.Id+'">'+value2.Name+'</option>');
								    } else {
								    	$("#city").append('<option rel="' + index2 + '" value="'+value2.Id+'">'+value2.Name+'</option>');
								    }
					            });
						 });
						});
			</script>
<<<<<<< Updated upstream
								<div class="form-group">
									<label for="country">Người tạo</label> <input
										readonly="readonly" class="form-control mb-3" type="text"
										value="${location.users.username}" id="user.username"
										name="user.username">
								</div>
								<div class="form-group">
									<label for="locationPhone">Số điện thoại</label> <input
										${readonly} class="form-control mb-3" type="text"
										value="${location.locationPhone}" id="locationPhone"
										name="locationPhone">
								</div>
								<div class="form-group">
									<label for="locationEmail">Email</label> <input ${readonly}
										class="form-control mb-3" type="text"
										value="${location.locationEmail}" id="locationEmail"
										name="locationEmail">
								</div>
								<div class="input-field">
									<label class="active">Hình ảnh</label>
									<div style="pointer-events: none; background-color: #e6e6ff;"
										class="input-images" style="padding-top: .5rem;"></div>
								</div>
								<c:if test="${empty sessionScope.userSession}">
									<c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
										<c:set var="readonly1" value="readonly='readonly'"></c:set>
									</c:if>
								</c:if>
								<div class="form-group">
									<label for="country">Trạng Thái</label> <select name="status"
										class="form-control input-lg" ${readonly1}>
										<c:if test="${location.status eq false}">
											<option value="true">Đang hiển thị</option>
											<option selected="selected" value="false">Đang tắt</option>
										</c:if>
										<c:if test="${location.status eq true}">
											<option selected="selected" value="true">Đang hiển
												thị</option>
											<option value="false">Đang tắt</option>
										</c:if>
									</select>
								</div>
								<script>
					
					let preloaded = [
				    	<c:if test="${not empty imagePath}">
						    	<c:forEach items="${imagePath}" var="image">
						    		<c:if test="${image != ''}"> 
						  	  		{id: 1, src: '${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${image}'},
						  	  	 	</c:if>
						  	  	</c:forEach>
					    </c:if>
=======
					<div class="form-group">
						<label for="country">Người tạo</label>
						<input readonly="readonly" class="form-control mb-3" type="text" value="${location.users.username}" id="user.username" name="user.username">
					</div>
					<div class="form-group">
						<label for="locationPhone">Số điện thoại</label>
						<input ${readonly} class="form-control mb-3" type="text" value="${location.locationPhone}" id="locationPhone" name="locationPhone">
					</div>
					<div class="form-group">
						<label for="locationEmail">Email</label>
						<input ${readonly} class="form-control mb-3" type="text" value="${location.locationEmail}" id="locationEmail" name="locationEmail">
					</div>
				     <c:if test="${empty sessionScope.userSession}">
				    <c:if test="${userDetail.user.role.roleId eq 'ADMIN'}">
				    	<c:set var="style" value="pointer-events:none; background-color: #e6e6ff;" ></c:set>
				    </c:if></c:if>
				    <div class="input-field">
				        <label class="active">Hình ảnh</label>
				        <div style="${style}" class="input-images" style="padding-top: .5rem;" ></div>
				    </div>
				    <script type="text/javascript">
				      let preloaded = [
				    	  <c:if test="${not empty imagePath}">
				    	  	<c:forEach items="${imagePath}" var="image" varStatus="theCount">
						    	<c:if test="${not empty image}">
						  	  		{id: ${theCount.index}, src: '${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${image}'},
						  	  	</c:if>	
					  	  	</c:forEach>
				  		  </c:if>
>>>>>>> Stashed changes
				    	];
				      	$('.input-images').imageUploader({
				      	    preloaded: preloaded,
				      	    imagesInputName: 'images',
				      	    preloadedInputName: 'image'
				      	});
<<<<<<< Updated upstream
					
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
=======
				       </script>
				    <c:if test="${empty sessionScope.userSession}">
				    <c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
                  		<c:set var="readonly1" value="readonly='readonly'" ></c:set>
                  	</c:if>
                  	</c:if>
				    <div class="form-group">
						<label for="country">Trạng Thái</label>
					   	<select name="status" class="form-control input-lg" ${readonly1}>
					   	<c:if test="${location.status eq false}">
					   		<option value="true">Đang hiển thị</option>
					    	<option selected="selected" value="false">Đang tắt</option>
					   	</c:if>
					   	<c:if test="${location.status eq true}">
					   		<option selected="selected" value="true">Đang hiển thị</option>
					    	<option value="false">Đang tắt</option>
					   	</c:if>
					   	</select>
					</div>
                    <button type="submit" class="btn btn-primary" name="submit">Cập nhập</button>
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
		
		$('#clockPicker2').clockpicker({
	        autoclose: true
	      });
		$('#clockPicker3').clockpicker({
	        autoclose: true
	      });
	});
</script>
>>>>>>> Stashed changes
