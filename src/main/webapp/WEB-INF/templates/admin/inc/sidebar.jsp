<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<sec:authentication var="userDetail" property="principal" />
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="${pageContext.request.contextPath}/resources/public/assets/img/logoTitle.png" rel="icon">
  <title>Admin Pages</title>
  <link href="${pageContext.request.contextPath}/resources/admin/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/admin/assets/css/ruang-admin.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/assets/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link type="text/css" rel="stylesheet" href="https://www.codehim.com/demo/jquery-image-uploader-preview-and-delete/dist/image-uploader.min.css">
  <!-- ClockPicker -->
  <link type="text/css" href="${pageContext.request.contextPath}/resources/admin/assets/vendor/clock-picker/clockpicker.css" rel="stylesheet">
  <!-- Bootstrap DatePicker -->  
  <link type="text/css" href="${pageContext.request.contextPath}/resources/admin/assets/vendor/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" >
  <!-- Select2 -->
  <link type="text/css" href="${pageContext.request.contextPath}/resources/admin/assets/vendor/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css">
  <script src="${pageContext.request.contextPath}/resources/admin/assets/vendor/jquery/jquery.min.js"></script>
  <!-- VALIDATE -->  	
  <script src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery.validate.min.js"></script>
  <!-- CKEDITOR -->  	
  <script src="${pageContext.request.contextPath}/resources/admin/assets/ckeditor/ckeditor.js"></script>
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

<link
	href="${pageContext.request.contextPath}/resources/admin/assets/css/custom.css"
	rel="stylesheet" />
<link rel="apple-touch-icon" type="image/png"
	href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<!-- test dropdown -->
<!-- <meta name="apple-mobile-web-app-title" content="CodePen"> -->
<link type="text/css" rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link type="text/css" rel="stylesheet"
	href="https://www.codehim.com/demo/jquery-image-uploader-preview-and-delete/dist/image-uploader.min.css">
<link
	href="${pageContext.request.contextPath}/resources/admin/assets/css/autocomplete/jquery-ui.css"
	rel="stylesheet">
</head>

<body id="page-top">
 <div id="wrapper">
    <!-- Sidebar -->
    
    <c:set var="urlHomePage" value="${pageContext.request.contextPath}/admin/index" />
   	<c:if test="${not empty sessionScope.userSession}">
   		 <c:set var="urlHomePage" value="${pageContext.request.contextPath}/public/index" />
   	</c:if>
    <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${urlHomePage}">
        <div class="sidebar-brand-icon">
          <img src="${pageContext.request.contextPath}/resources/public/assets/img/logo.png" width="120px" height="40px;">
        </div>
        <!-- <div class="sidebar-brand-text mx-3">LHTMP</div> -->
      </a>
      <%-- <a href="${pageContext.request.contextPath}/public/index"> <img
								style="width: 106px; height: 30px;"
								src="${pageContext.request.contextPath}/resources/public/assets/img/logo.png"
								class="img-fluid" alt="Logo">
							</a> --%>
      <hr class="sidebar-divider my-0">
      <li class="nav-item active">
        <a class="nav-link" href="${urlHomePage}">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Trang chủ</span>
        </a>
      </li>
      <hr class="sidebar-divider">
      <div class="sidebar-heading">
        QUẢN LÝ
      </div>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBootstrap"
          aria-expanded="true" aria-controls="collapseBootstrap">
          <i class="fa fa-fw fa-map-marker-alt"></i>
          <span>Địa điểm</span>
        </a>
        <div id="collapseBootstrap" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Danh sách</h6>
            <c:set var="urlL" value="${pageContext.request.contextPath}/public/location/index" />
	      	<c:if test="${sessionScope.userSession.role.roleId ne 'CUSTOMER' }">
	      		<c:set var="urlL" value="${pageContext.request.contextPath}/admin/location/index" />
	      	</c:if>
            <a class="collapse-item" href="${urlL}">Địa điểm</a>
            <c:if test="${empty sessionScope.userSession}">
     		<c:if test="${userDetail.user.role.roleId eq 'ADMIN'}">
            <a class="collapse-item" href="${pageContext.request.contextPath}/admin/locationType/index">Loại địa điểm</a>
          	</c:if></c:if>
          </div>
        </div>
      </li>
      <c:if test="${empty sessionScope.userSession}">
      <c:if test="${userDetail.user.role.roleId eq 'ADMIN'}">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/order/index">
          <i class="fa fa-fw fa-shopping-bag"></i>
          <span>Đặt hàng</span>
        </a>
      </li>
      </c:if></c:if>
      <li class="nav-item">
      	<c:set var="urlD" value="${pageContext.request.contextPath}/public/discount/index" />
      	<c:if test="${sessionScope.userSession.role.roleId ne 'CUSTOMER' }">
      		<c:set var="urlD" value="${pageContext.request.contextPath}/admin/discount/index" />
      	</c:if>
        <a class="nav-link" href="${urlD}">
          <i class="fa fa-fw fa-gift"></i>
          <span>Giảm giá</span>
        </a>
      </li>
      <c:if test="${sessionScope.userSession.role.roleId ne 'CUSTOMER' }">
      <c:if test="${empty sessionScope.userSession}">
      <c:if test="${userDetail.user.role.roleId eq 'ADMIN'}">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/statistical/index">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Thống kê</span>
        </a>
      </li>
      </c:if></c:if>
      <hr class="sidebar-divider">
      <div class="sidebar-heading">
        Thông tin
      </div>
       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePage" aria-expanded="true"
          aria-controls="collapsePage">
          <i class="fas fa-address-book"></i>
          <span>Nhân sự</span>
        </a>
        <div id="collapsePage" class="collapse" aria-labelledby="headingPage" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Chung</h6>
            <%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
            <sec:authentication var="userDetail" property="principal" />
            <c:if test="${not empty sessionScope.roleList}">
            	<c:if test="${userDetail.user.role.roleId eq 'ADMIN'}">
            		<c:forEach items="${sessionScope.roleList}" var="role">
            			<c:choose>
            				<c:when test="${userDetail.user.role.roleId eq role.roleId}">
            					<a class="collapse-item" href="${pageContext.request.contextPath}/admin/user/${role.roleId}">Hồ sơ cá nhân</a>
            				</c:when>
            				<c:otherwise>
            					<a class="collapse-item" href="${pageContext.request.contextPath}/admin/user/${role.roleId}">${role.roleName}</a>
            				</c:otherwise>
            			</c:choose>
            		</c:forEach>
            	</c:if>
            	<c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
            		<c:forEach items="${sessionScope.roleList}" var="role">
            			<c:if test="${userDetail.user.role.roleId eq role.roleId}">
            				<a class="collapse-item" href="${pageContext.request.contextPath}/admin/user/${role.roleId}">Hồ sơ cá nhân</a>
            			</c:if>
            		</c:forEach>
            	</c:if>
            </c:if>
          </div>
        </div>
      </li>
       <c:if test="${empty sessionScope.userSession}">
      <c:if test="${userDetail.user.role.roleId eq 'ADMIN'}">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/role/index">
          <i class="fas fa-copyright"></i>
          <span>Chức vụ</span>
        </a>
      </li>
      </c:if></c:if>
      <hr class="sidebar-divider">
      </c:if>
    </ul>
    
    <!-- Sidebar -->
