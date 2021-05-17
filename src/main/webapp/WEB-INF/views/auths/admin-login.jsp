<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0052)https://indrijunanda.github.io/RuangAdmin/login.html -->
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="${pageContext.request.contextPath}/resources/public/assets/img/logoTitle.png"
	rel="icon">
<title>RuangAdmin - Login</title>
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/css/ruang-admin.min.css"
	rel="stylesheet">

</head>

<body class="bg-gradient-login">
	<!-- Login Content -->
	<div class="container-login">
	<div class="row justify-content-center">
      <div class="col-xl-6 col-lg-12 col-md-9">
		<div class="card shadow-sm my-5">
		<div class="card-body p-0">
			<div class="row">
				<div class="col-lg-12">
					<div class="login-form">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4">ĐĂNG NHẬP</h1>
						</div>
						<c:if test="${not empty param['msg']}">
							<p style="color: red;">Sai tên đăng nhập hoặc mật khẩu</p>
						</c:if>
						<c:if test="${not empty changepass}">
							<p style="color: green;">Bạn đã đổi mật khẩu thành công!</p>
						</c:if>
						<c:if test="${not empty param['error']}">
							<p class="text-danger">${SPRING_SECURITY_LAST_EXCEPTION.message}</p>
						</c:if>
						<form action="${pageContext.request.contextPath}/auth/login"
							name='loginForm' class="user" method="POST">
							<div class="form-group">
								<input type="text" class="form-control" name="username"
									id="username" aria-describedby="username"
									placeholder="Tên đăng nhập">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="password"
									id="password" placeholder="Mật khẩu">
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-block">Đăng
									nhập</button>
							</div>
							<div>
								<a href="${pageContext.request.contextPath}/forgot_password">Quên
									mật khẩu?</a>
							</div>
							<hr>
							<a
								href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://ec2-13-212-172-107.ap-southeast-1.compute.amazonaws.com:8080/Capstone.Group6/public/login-google&response_type=code&client_id=620272103683-kgo588qtq63in5a2orb96nq10tlbskld.apps.googleusercontent.com&approval_prompt=force"
								class="btn btn-google btn-block"> <i
								class="fab fa-google fa-fw"></i> Đăng nhập tài khoản Google
							</a>

							<!-- <a href="https://indrijunanda.github.io/RuangAdmin/index.html" class="btn btn-facebook btn-block">
                      <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                    </a>  -->
						</form>
						<hr>
						<!--  <div class="text-center">
                    <a class="font-weight-bold small" href="https://indrijunanda.github.io/RuangAdmin/register.html">Create an Account!</a>
                  </div> -->
						<div class="text-center"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
	<!-- Login Content -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/assets/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/assets/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/assets/js/ruang-admin.min.js"></script>

</body>
</html>