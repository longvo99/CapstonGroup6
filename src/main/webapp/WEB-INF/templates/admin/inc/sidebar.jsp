<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
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
  <link type="text/css" rel="stylesheet" href="https://www.codehim.com/demo/jquery-image-uploader-preview-and-delete/dist/image-uploader.min.css">
  <script src="${pageContext.request.contextPath}/resources/admin/assets/vendor/jquery/jquery.min.js"></script> 
 <!-- JVALIDATE -->
  <script src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery.validate.min.js"></script>
  <!-- CKEDITOR -->
  <script src="${pageContext.request.contextPath}/lib/ckeditor/ckeditor.js"></script>
  <style type="text/css">
		#form .form-group label span.error {color: red; font-size: 20px;} 
		#form .form-group label span.label {
			width: auto;
			display: block;
			float: none;  
		} 
		select[readonly] option, select[readonly] optgroup {
    		display: none;
		}
	</style>
	<style>
	.ui-autocomplete {
		max-height: 100px;
		overflow-y: auto;
		/* prevent horizontal scrollbar */
		overflow-x: hidden;
		/* add padding to account for vertical scrollbar */
		padding-right: 20px;
	}
	/* IE 6 doesn't support max-height
	 * we use height instead, but this forces the menu to always be this tall
	 */
	* html .ui-autocomplete {
		height: 100px;
	}
	</style>
	
	<link href="${pageContext.request.contextPath}/resources/admin/assets/css/custom.css" rel="stylesheet" />
	<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
	<!-- test dropdown -->
	<!-- <meta name="apple-mobile-web-app-title" content="CodePen"> -->
	<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link type="text/css" rel="stylesheet" href="https://www.codehim.com/demo/jquery-image-uploader-preview-and-delete/dist/image-uploader.min.css">
    <link href="${pageContext.request.contextPath}/resources/admin/assets/css/autocomplete/jquery-ui.css" rel="stylesheet">
</head>

<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/admin/index">
        <div class="sidebar-brand-icon">
          <img src="${pageContext.request.contextPath}/resources/admin/assets/img/logo/logo3.png" width="50px">
        </div>
        <div class="sidebar-brand-text mx-3">LHTMP</div>
      </a>
      <hr class="sidebar-divider my-0">
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/index">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Trang chủ</span></a>
      </li>
      <hr class="sidebar-divider">
      <div class="sidebar-heading">
        ĐẶC TRƯNG
      </div>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBootstrap"
          aria-expanded="true" aria-controls="collapseBootstrap">
          <i class="far fa-fw fa-window-maximize"></i>
          <span>Quản lý địa điểm</span>
        </a>
        <div id="collapseBootstrap" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Quản lý Locations</h6>
            <a class="collapse-item" href="${pageContext.request.contextPath}/admin/location/index">Địa điểm</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/admin/locationType/index">Kiểu địa điểm</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/admin/locationCategory/index">Phân loại địa điểm</a>
          </div>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/order/index">
          <i class="fab fa-fw fa-wpforms"></i>
          <span>Quản lý đặt hàng</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/discount/index">
          <i class="fab fa-fw fa-wpforms"></i>
          <span>Quản lý giảm giá</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/contact/index">
          <i class="fab fa-fw fa-wpforms"></i>
          <span>Quản lý liên hệ</span>
        </a>
      </li>
      <hr class="sidebar-divider">
      <div class="sidebar-heading">
        Thông tin
      </div>
       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePage" aria-expanded="true"
          aria-controls="collapsePage">
          <i class="fas fa-fw fa-columns"></i>
          <span>Quản lý Thông tin</span>
        </a>
        <div id="collapsePage" class="collapse" aria-labelledby="headingPage" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Quản lý nhân sự</h6>
            <c:if test="${ not empty sessionScope.roleList}">
            	<c:forEach items="${sessionScope.roleList}" var="role">
            		<a class="collapse-item" href="${pageContext.request.contextPath}/admin/user/${role.roleId}">${role.roleName}</a>
            	</c:forEach>
            </c:if>
            <a class="collapse-item" href="${pageContext.request.contextPath}/admin/role/index">Quản lý Chức vụ</a>
          </div>
        </div>
      </li>
      <hr class="sidebar-divider">
      <div class="version" id="version-ruangadmin"></div>
    </ul>
    <!-- Sidebar -->