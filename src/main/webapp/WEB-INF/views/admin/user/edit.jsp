<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery.validate.min.js"></script>
<div id="content-wrapper" class="d-flex flex-column">
	<div id="content">
		<div class="container-fluid" id="container-wrapper">
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="m-0 font-weight-bold text-primarys">Cập nhập tài
					khoản</h1>
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
								value="${pageContext.request.contextPath}/admin/user/edit" />
							<c:if test="${not empty sessionScope.userSession}">
								<c:set var="actionUrl"
									value="${pageContext.request.contextPath}/user/edit" />
							</c:if>
							<form action="${actionUrl}" role="form" method="post" name="form"
								id="form" enctype="multipart/form-data">
								<input class="form-control mb-3" type="hidden"
									value="${user.userId}" id="userId" name="userId"
									readonly="readonly"> <input type="hidden"
									value="${user.role.roleId}" name="role.roleId"> <input
									type="hidden" value="${user.password}" name="password">
								<div class="form-group">
									<label for="username">Tên tài khoản</label> <input
										class="form-control mb-3" type="text" value="${user.username}"
										id="username" name="username" readonly="readonly">
								</div>
								<div class="form-group">
									<label for="contactName">Họ và tên</label> <input
										class="form-control mb-3" type="text"
										value="${user.contactName}" id="contactName"
										name="contactName" ${readonly}>
								</div>
								<div class="form-group">
									<label for="contactPhone">Số điện thoại</label>
									<!-- <input type="tel" pattern="[0-9]{10}" name="#" class="form-control form-control-submit" required> -->
									<input class="form-control mb-3" type="text"
										value="${user.contactPhone}" id="contactPhone"
										name="contactPhone" ${readonly}>
								</div>
								<div class="form-group">
									<label for="contactEmail">Email</label> <input
										class="form-control mb-3" type="text"
										value="${user.contactEmail}" id="contactEmail"
										name="contactEmail" ${readonly}>
								</div>
								<div class="form-group">
									<label class="text-light-white fw-700">Số nhà - Tên
										đường</label> <input id="address" name="stress"
										value="${userAddress.stress}" type="text" name="#"
										class="form-control form-control-submit">
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
								<script>
					$(document).ready(function(){
						  $.getJSON('${pageContext.request.contextPath}/resources/admin/assets/js/data.json', function(data){
							  var country_id;
							  var state_id;
							  $.each(data, function (index, value) {
								    var city_id;
								    if('${userAddress.city}' == value.Id){
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
					            	if('${userAddress.district}' == value1.Id){
					            		 $("#state").append('<option selected="selected" rel="' + index1 + '" value="'+value1.Id+'">'+value1.Name+'</option>');
								    } else {
								    	$("#state").append('<option rel="' + index1 + '" value="'+value1.Id+'">'+value1.Name+'</option>');
								    }
					            }); 
							  state_id = $("#state").find('option:selected').attr('rel');
							  $.each(data[country_id].Districts[state_id].Wards, function (index2, value2) {
					            	if('${userAddress.ward}' == value2.Id){
					            		$("#city").append('<option selected="selected" rel="' + index2 + '" value="'+value2.Id+'">'+value2.Name+'</option>');
								    } else {
								    	$("#city").append('<option rel="' + index2 + '" value="'+value2.Id+'">'+value2.Name+'</option>');
								    }
					            });
						 });
						});
			</script>
								<div class="form-group">
									<label for="dateOfBirth1">Ngày sinh</label> <input
										class="form-control mb-3" type="date"
										value="${fn:substring(user.dateOfBirth, 0, fn:indexOf(user.dateOfBirth, ' '))}"
										id="dateOfBirth1" name="dateOfBirth1" ${readonly}>
								</div>
								<div class="form-group">
									<label for="gender">Giới tính</label> <select id="gender"
										name="gender" class="form-control">
										<c:if test="${user.gender eq 'Nam'}">
											<option selected="selected" value="Nam">Nam</option>
											<option value="Nữ">Nữ</option>
										</c:if>
										<c:if test="${user.gender eq 'Nữ'}">
											<option value="Nam">Nam</option>
											<option selected="selected" value="Nữ">Nữ</option>
										</c:if>
										<c:choose>
											<c:when test="${user.gender eq 'Nam'}">
												<option selected="selected" value="Nam">Nam</option>
												<option value="Nữ">Nữ</option>
											</c:when>
											<c:when test="${user.gender eq 'Nữ'}">
												<option value="Nam">Nam</option>
												<option selected="selected" value="Nữ">Nữ</option>
											</c:when>
											<c:otherwise>
												<option value="Nam">Nam</option>
												<option selected="selected" value="Nữ">Nữ</option>
											</c:otherwise>
										</c:choose>
									</select>
								</div>
								<div class="form-group">
									<label for="description">Mô tả</label>
									<textarea name="description" id="description"
										class="form-control mb-3" rows="3">${user.description}</textarea>
								</div>
								<c:if test="${empty sessionScope.userSession}">
									<div class="custom-control custom-switch">
										<input type="checkbox" name="checkbox" id="checkbox"
											class="custom-control-input"> <label
											class="custom-control-label" for="checkbox"><strong>Đổi
												mật khẩu</strong></label>
									</div>
									<div id="collapseThree" class="form-group collapse">
										<label for="passwordUser">Mật khẩu mới</label> <input
											class="form-control mb-3" type="password" value=""
											id="passwordUser" name="passwordUser"> <label
											for="repassword">Nhập lại mật khẩu</label> <input
											class="form-control mb-3" type="password" value=""
											id="repassword" name="repassword">
									</div>
								</c:if>
								<script type="text/javascript">
						$('#checkbox').change(function(){ 
						    if(this.checked == true){
						    	$('#collapseThree').collapse('show');
						    }else{
						     	$('#collapseThree').collapse('hide')
						  	}
						});
					</script>
								<div class="form-group">
									<label for="joinDate1">Ngày tạo tài khoản</label> <input
										class="form-control mb-3" type="date"
										value="${fn:substring(user.joinDate, 0, fn:indexOf(user.joinDate, ' '))}"
										id="joinDate1" name="joinDate1" readonly="readonly">
								</div>
								<div class="form-group">
									<div class="custom-file">
										<input type="file" name="file" class="custom-file-input"
											id="file"
											onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
										<label class="custom-file-label" for="file">Choose
											file</label>
									</div>
									<img
										src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${user.avatarPath}"
										id="blah" alt="your image"
										style="max-height: 300px; display: block; margin-top: 15px;" />
								</div>
								<button type="submit" class="btn btn-primary" name="submit">Cập
									nhập</button>
							</form>
						</div>
					</div>
					<!--Row-->
				</div>
				<!---Container Fluid-->
			</div>
			<script type="text/javascript">
	$().ready(function() {
		 /* $.validator.addMethod("pwcheck",
                 function (value, element) {
                     return /^(?=.*[a-z][0-9])[A-Za-z0-9\d=!\/#-@._*]+$/.test(value);
             }); */
		var validator = $("#form").validate({
			errorPlacement: function(error, element){
				$(element).closest("form").find("label[for='" + element.attr("id") + "']").append(error);
			},
			errorElement: "span",
			ignore: [],
			rules:{
				contactName: {                      //lay name
					required:true,
				},
				contactPhone: {                      
					required:true,
					digits:true,
					minlength:10, 
					maxlength:10,
				},
				contactEmail: {                      
					required:true,
					email: true,
				},
				contactAddress: {
					required: true,
				},
				dateOfBirth1: {
					required: true,
				},
				passwordUser: {
					required: function () {
		                return document.getElementById("checkbox").checked;
		            },
		            /* pwcheck: true, */
					minlength:6, 
				},
				repassword: {
					required: function () {
		                return document.getElementById("checkbox").checked;
		            },
					equalTo: "#passwordUser",
				}, 
			},
			messages: {
				contactName: {
					required: " (Mời nhập)",
				},
				contactPhone: {
					required: " (Mời nhập)",
					digits: " (Nhập số)",
					minlength:" (Nhập 10 số)", 
					maxlength:" (Nhập 10 số)",
				},
				contactEmail: {
					required: " (Mời nhập)",
					email: " (Nhập đúng định dạng)",
				},
				contactAddress: {
					required: " (Mời nhập)",
				},
				dateOfBirth1: {
					required: " (Mời nhập)",
				},
				passwordUser: {
					required: " (Mời nhập)",
					/* pwcheck: " (Mật khẩu phải chứa kí tự và số)", */
					minlength:" (Mật khẩu ít nhất 6 kí tự)", 
				},
				repassword: {
					required: " (Mời nhập)",
					equalTo: " (Mật khẩu không khớp)"
				},
			},
		});
	});
</script>