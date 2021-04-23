<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div id="content-wrapper" class="d-flex flex-column">
	<div id="content">
		<%-- <%@ include file="/templates/admin/inc/topbar.jsp" %> --%>
		<!-- Container Fluid-->
		<div class="container-fluid" id="container-wrapper">
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="m-0 font-weight-bold text-primarys">Thêm mới loại
					địa điểm</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="./">Trang chủ</a></li>
					<li class="breadcrumb-item active" aria-current="page">Forms</li>
				</ol>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<!-- Form Basic -->
					<c:if test="${not empty msg}">
						<div class="alert alert-danger">
							<strong>${msg}</strong>
						</div>
					</c:if>
					<div class="card mb-4">
						<div class="card-body">
							<form role="form" method="post" id="form">
								<div class="form-group">
									<label for="name">LocationType Name</label> <input
										class="form-control mb-3" type="text"
										value="${locationTypes.locationTypeName}"
										id="locationTypeName" name="locationTypeName">
								</div>
								<button type="submit" class="btn btn-primary" name="submit">Sửa</button>
							</form>
						</div>
					</div>
					<!--Row-->
				</div>
				<!---Container Fluid-->
			</div>