<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="${pageContext.request.contextPath}/resources/admin/assets/img/logo/logo.png" rel="icon">
  <title>RuangAdmin - Dashboard</title>
  <link href="${pageContext.request.contextPath}/resources/admin/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/admin/assets/css/ruang-admin.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/assets/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link type="text/css" rel="stylesheet" href="http://example.com/image-uploader.min.css">
  <script src="${pageContext.request.contextPath}/resources/admin/assets/vendor/jquery/jquery.min.js"></script>
  <!-- JVALIDATE -->
  <script src="${pageContext.request.contextPath}/lib/js/jquery.validate.min.js"></script>
  <!-- CKEDITOR -->
  <script src="${pageContext.request.contextPath}/lib/ckeditor/ckeditor.js"></script>
  <style type="text/css">
		#form .form-group label span.error {color: red; font-size: 20px;} 
		#form .form-group label span.label {
			width: auto;
			display: block;
			float: none;  
		} 
	</style>
	<link href="${pageContext.request.contextPath}/resources/admin/assets/css/custom.css" rel="stylesheet" />
	
</head>

<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/admin">
        <div class="sidebar-brand-icon">
          <img src="${pageContext.request.contextPath}/resources/admin/assets/img/logo/logo3.png" width="50px">
        </div>
        <div class="sidebar-brand-text mx-3">THANH HẢI</div>
      </a>
      <hr class="sidebar-divider my-0">
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Trang chủ</span></a>
      </li>
      <hr class="sidebar-divider">
      <div class="sidebar-heading">
        Features
      </div>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBootstrap"
          aria-expanded="true" aria-controls="collapseBootstrap">
          <i class="far fa-fw fa-window-maximize"></i>
          <span>Quản lý Locations</span>
        </a>
        <div id="collapseBootstrap" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Quản lý Locations</h6>
            <a class="collapse-item" href="<%=request.getContextPath() %>/admin/location/index">Location</a>
            <a class="collapse-item" href="<%=request.getContextPath() %>/admin/locationType/index">Location Types</a>
            <a class="collapse-item" href="<%=request.getContextPath() %>/admin/locationCategory/index">Location Categories</a>
            <a class="collapse-item" href="<%=request.getContextPath() %>/admin/locationVideo/index">Location Videos</a>
          </div>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath() %>/admin/user/index">
          <i class="fab fa-fw fa-wpforms"></i>
          <span>Quản lý người dùng</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/contact/index">
          <i class="fas fa-fw fa-palette"></i>
          <span>Quản lý liên hệ</span>
        </a>
      </li>
      <hr class="sidebar-divider">
      <div class="sidebar-heading">
        Infomation
      </div>
       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePage" aria-expanded="true"
          aria-controls="collapsePage">
          <i class="fas fa-fw fa-columns"></i>
          <span>Quản lý thông tin</span>
        </a>
        <div id="collapsePage" class="collapse" aria-labelledby="headingPage" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Quản lý thông tin</h6>
            <a class="collapse-item" href="${pageContext.request.contextPath}/admin/info/index">Thông tin</a>
            <a class="collapse-item" href="register.html">Kỹ năng</a>
            <a class="collapse-item" href="404.html">Dự án</a>
            <a class="collapse-item" href="blank.html">Chặng đường</a>
          </div>
        </div>
      </li>
      <hr class="sidebar-divider">
      <div class="version" id="version-ruangadmin"></div>
    </ul>
    <!-- Sidebar -->