<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
<!DOCTYPE html>
<!-- saved from url=(0052)https://indrijunanda.github.io/RuangAdmin/login.html -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="https://indrijunanda.github.io/RuangAdmin/img/logo/logo.png" rel="icon">
  <title>RuangAdmin - Login</title>
  <link href="${pageContext.request.contextPath}/resources/admin/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/admin/assets/css/ruang-admin.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-login">
  <!-- Login Content -->
  <div class="container-login">
        <div class="card shadow-sm my-5">
            <div class="row">
              <div class="col-lg-12">
                <div class="login-form">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">ĐẶT LẠI MẬT KHẨU CỦA BẠN</h1>
                  </div>
                  <form action="${pageContext.request.contextPath}/reset_password" name='forgotPasswordForm' class="" method="POST">
                    <input type="hidden" name="token" value="${token}" />
                    <div class="form-group">
                      <input type="password" name="password" id="password" class="form-control" placeholder="Nhập mật khẩu mới" required autofocus />
                    </div>
                    <div class="form-group">
                    	<input type="password" class="form-control" placeholder="Xác nhận lại mật khẩu mới" required/>
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-primary btn-block">Thay đổi</button>
                    </div>
                    <!-- <hr>
                    <a href="https://indrijunanda.github.io/RuangAdmin/index.html" class="btn btn-google btn-block">
                      <i class="fab fa-google fa-fw"></i> Login with Google
                    </a>
                    <a href="https://indrijunanda.github.io/RuangAdmin/index.html" class="btn btn-facebook btn-block">
                      <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                    </a> -->
                  </form>
                  <hr>
                 <!--  <div class="text-center">
                    <a class="font-weight-bold small" href="https://indrijunanda.github.io/RuangAdmin/register.html">Create an Account!</a>
                  </div> -->
                  <div class="text-center">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Login Content -->
  <script src="${pageContext.request.contextPath}/resources/admin/assets/vendor/jquery/jquery.min.js"></script> 
  <script src="${pageContext.request.contextPath}/resources/admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin/assets/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin/assets/js/ruang-admin.min.js"></script>

</body></html>