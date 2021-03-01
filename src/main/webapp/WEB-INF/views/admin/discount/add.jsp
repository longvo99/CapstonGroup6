<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
	<div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <%-- <%@ include file="/templates/admin/inc/topbar.jsp" %> --%>
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="m-0 font-weight-bold text-primarys">Add location type</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
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
                      <label for="name">ID</label>
                      <input class="form-control mb-3" type="text" value="${discount.discountId}" id="discountId" name="discountId">
                    </div>
					<div class="form-group">
                      <label for="name">Tiêu đề giảm giá</label>
                      <input class="form-control mb-3" type="text" value="${discount.discountTitle}" id="discountTitle" name="discountTitle">
                    </div>
                    <div class="form-group">
                      <label for="name">Mã giảm giá</label>
                      <input class="form-control mb-3" type="text" value="${discount.codeDiscount}" id="codeDiscount" name="codeDiscount">
                    </div>
                    <div class="form-group">
                      <label for="name">Mức giảm giá</label>
                      <input class="form-control mb-3" type="text" value="${discount.rateDiscount}" id="rateDiscount" name="rateDiscount">
                    </div>
                    <div class="form-group">
                      <label for="name">Mô tả</label>
                      <input class="form-control mb-3" type="text" value="${discount.description}" id="description" name="description">
                    </div>
                    <div class="form-group">
                      <label for="name">Ngày bắt đầu</label>
                      <input class="form-control mb-3" type="text" value="${discount.startDate}" id="startDate" name="startDate">
                    </div>
                    <div class="form-group">
                      <label for="name">Ngày kết thúc</label>
                      <input class="form-control mb-3" type="text" value="${discount.endDate}" id="endDate" name="endDate">
                    </div>
                    <div class="form-group">
                      <label for="name">Đơn hàng tối thiểu</label>
                      <input class="form-control mb-3" type="text" value="${discount.minimumOrder}" id="minimumOrder" name="minimumOrder">
                    </div>
                    <div class="form-group">
                      <label for="name">Hình ảnh</label>
                      <input class="form-control mb-3" type="text" value="${discount.discountVideoId}" id="discountVideoId" name="discountVideoId">
                    </div>
                    <button type="submit" class="btn btn-primary" name="submit">Thêm mới</button>
                  </form>
                </div>
              </div>
          <!--Row-->
        </div>
        <!---Container Fluid-->
      </div>