<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div class="container bootstrap snippet">
	<div class="row">
		<div class="col-sm-10">
			<h1>${user.username}</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-3">
			<!--left col-->
			<div class="text-center">
				<c:set var="avatarPath" value="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" />
				<c:if test="${not empty user.avatarPath}">
					<c:set var="avatarPath" value="${pageContext.request.contextPath}/resources/admin/image/uploads/${user.avatarPath}" />
				</c:if>
				<img src="${avatarPath}"
					class="avatar img-circle img-thumbnail" alt="avatar">
				<h6>Upload a different photo...</h6>
				<input type="file" class="text-center center-block file-upload">
			</div>
			</hr>
			<br>
			<!-- <ul class="list-group">
				<li class="list-group-item text-muted">Activity <i class="fa fa-dashboard fa-1x"></i></li>
				<li class="list-group-item text-right"><span class="pull-left">
					<strong>Shares</strong></span>125
				</li>
				<li class="list-group-item text-right"><span class="pull-left"><strong>Likes</strong></span>
					13</li>
				<li class="list-group-item text-right"><span class="pull-left"><strong>Posts</strong></span>
					37</li>
				<li class="list-group-item text-right"><span class="pull-left"><strong>Followers</strong></span>
					78</li>
			</ul> -->

			<!-- <div class="panel panel-default">
				<div class="panel-heading">Social Media</div>
				<div class="panel-body">
					<i class="fa fa-facebook fa-2x"></i> <i class="fa fa-github fa-2x"></i>
					<i class="fa fa-twitter fa-2x"></i> <i
						class="fa fa-pinterest fa-2x"></i> <i
						class="fa fa-google-plus fa-2x"></i>
				</div>
			</div> -->

		</div>
		<!--/col-3-->
		<div class="col-sm-9">
			<div class="tab-content">
				<div class="tab-pane active" id="home">
					<form class="form" action="##" method="post" id="registrationForm">
						<div class="form-group">
							<div class="col-xs-6">
								<label for="first_name"> Họ và Tên </label> 
								<input type="text" class="form-control" value="${user.contactName}" name="contactName" id="contactName" >
							</div>
						</div>
						<div class="form-group">

							<div class="col-xs-6">
								<label for="phone"> Số điện thoại </label> 
								<input type="text" value="${user.contactPhone}" class="form-control" name="phone" id="phone">
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-6">
								<label for="email"> Email </label> 
								<input type="email" class="form-control" value="${user.contactEmail}" name="contactAddress" id="contactAddress" >
						</div>
						<div class="form-group">
							<div class="col-xs-6">
								<label for="email"> Địa chỉ </label> 
								<input type="email" class="form-control" value="${user.contactAddress}" name="contactAddress" id="contactAddress" >
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-6">
								<label for="mobile"> Giới tính </label> 
								<input type="text" class="form-control" value="${user.gender}" name="gender" id="gender">
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-6">
								<label for="mobile"> Ngày sinh </label> 
								<input type="text" class="form-control" value="${user.dateOfBirth}" name="dateOfBirth" id="dateOfBirth">
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-6">
								<label for="mobile"> Mô tả </label> 
								<input type="text" class="form-control" value="${user.description}" name="description" id="description">
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-6">
								<label for="password"> Password </label> 
								<input type="password" class="form-control" value="********" name="password" >
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-6">
								<label for="password2"> Nhập lại mật khẩu </label> 
								<input type="password" class="form-control" name="password2" id="password2"> 
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<br>
								<button class="btn btn-lg btn-success" type="submit">
									<i class="glyphicon glyphicon-ok-sign"></i> Save
								</button>
								<button class="btn btn-lg" type="reset">
									<i class="glyphicon glyphicon-repeat"></i> Reset
								</button>
							</div>
						</div>
					</form>

					<hr>

				</div>
		</div>
		<!--/tab-content-->

		<script type="text/javascript">
			$(document).ready(function() {
		
				var readURL = function(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
		
						reader.onload = function(e) {
							$('.avatar').attr('src', e.target.result);
						}
		
						reader.readAsDataURL(input.files[0]);
					}
				}
		
				$(".file-upload").on('change', function() {
					readURL(this);
				});
			});
		</script>