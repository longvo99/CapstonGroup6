<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/assets/js/image-uploader.min.js"></script>
	<div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h2 class="m-0 font-weight-bold text-primary">Quản lý địa điểm</h2>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item">Tables</li>
              <li class="breadcrumb-item active" aria-current="page">DataTables</li>	
            </ol>
          </div>
          <!-- Row -->
	      <span id="result">
	      	<c:if test="${not empty msg}">
               	<c:if test="${success eq true}">
					<div class="alert alert-success">
						<strong>${msg}</strong>
					</div>
				</c:if>
				<c:if test="${error eq true}">
					<div class="alert alert-danger">
						<strong>${msg}</strong>
					</div>
				</c:if>
			</c:if>
	      </span>
          <div class="row">
            <!-- DataTable with Hover -->
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <div class="col-sm-10">
                  	<a href="${pageContext.request.contextPath}/admin/location/add" class="btn btn-success btn-md"><i class="fa fa-plus-square"> Thêm </i></a>
                  </div>
                </div>
                <div class="table-responsive p-3">
                <c:if test="${not empty locationList}">
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th class="center text-center">Chức năng</th>
                      </tr>
                    </thead>
                    <tbody>
					  <c:forEach items="${locationList}" var="location">
					  	<tr class="odd gradeX">
							<td>${location.locationId}</td>
							<td>${location.locationName}</td>
							<td>${location.locationCategoryName}</td>
							<td class="center text-center">
								<a href="" data-toggle="modal" data-target="#exampleModalCenter${location.locationId}" class="btn btn-sm btn-success"><i class="fa fa-edit"> Chi tiết </i></a>
                                <a href="${pageContext.request.contextPath}/admin/locationVideo/image/${location.locationId}" class="btn btn-sm btn-primary"><i class="fa fa-edit"> Hình ảnh  </i></a>
                                <a href="${pageContext.request.contextPath}/admin/location/delete"  class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa không');"><i class="fas fa-trash"> Xóa </i></a>
							</td>
						</tr>
						<!-- Modal Center -->
			          <div class="modal fade" id="exampleModalCenter${location.locationId}" tabindex="-1" role="dialog"
			            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			            <div class="modal-dialog modal-dialog-centered" role="document">
			              <div class="modal-content">
			                <div class="modal-header">
			                  <h5 class="modal-title" id="exampleModalCenterTitle">Chi tiết địa điểm: <strong></strong> </h5>
			                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                  </button>
			                </div>
			                <div class="modal-body">
			                	<div class="comment-form">
				                	<form action="${pageContext.request.contextPath}/admin/location/edit" method="POST">
										<div class="form-group">
					                      <label for="name">Location ID</label>
					                      <input class="form-control mb-3" type="text" value="${location.locationId}" id="locationId" name="locationId">
					                    </div>
										<div class="form-group">
					                      <label for="name">Location Name</label>
					                      <input class="form-control mb-3" type="text" value="${location.locationName}" id="locationName" name="locationName">
					                    </div>
					                    <div class="form-group">
					                      <label for="address">Address</label>
					                      <input class="form-control mb-3" type="text" value="${location.address}" id="address" name="address">
					                    </div>
					                    <div class="form-group">
					                      <label for="opentime">Open Time</label>
					                      <input class="form-control mb-3" type="text" value="${location.openTime}" id="opentime" name="opentime">
					                    </div>
					                    <div class="form-group">
					                      <label for="closetime">Close Time</label>
					                      <input class="form-control mb-3" type="text" value="${location.closeTime}" id="closetime" name="closetime">
					                    </div>
					                    <div class="form-group">
					                      <label for="locationcategory">Location Category</label>
					                      <input class="form-control mb-3" type="text" value="${location.locationCategoryName}" id="locationcategory" name="locationcategory">
					                    </div>
					                    <div class="form-group">
					                      <label for="locationtype">Location Type</label>
					                      <input class="form-control mb-3" type="text" value="${location.locationTypeName}" id="locationtype" name="locationtype">
					                    </div>
					                    <div class="form-group">
					                      <label for="ward">Ward</label>
					                      <input class="form-control mb-3" type="text" value="${location.ward}" id="ward" name="ward">
					                    </div>
					                    <div class="form-group">
					                      <label for="district">District</label>
					                      <input class="form-control mb-3" type="text" value="${location.district}" id="district" name="district">
					                    </div>
					                    <div class="form-group">
					                      <label for="city">City</label>
					                      <input class="form-control mb-3" type="text" value="${location.city}" id="city" name="city">
					                    </div>
					                    <div class="form-group">
					                      <label for="country">Country</label>
					                      <input class="form-control mb-3" type="text" value="${location.country}" id="country" name="country">
					                    </div>
									</form>
								</div>
			                </div>
			              </div>
			            </div>
			          </div>
			          <!-- Modal Center -->
			          </c:forEach>
                    </tbody>
                  </table>
                  </c:if>
                  <c:if test="${empty locationList}">
						<tr>
							<td colspan="4" align="center">Chưa có địa điểm nào!</td>
						</tr>
				  </c:if>
                </div>
              </div>
            </div>
          </div>
          <!--Row-->
          <!-- Documentation Link -->
        </div>
        <!---Container Fluid-->
      </div>
      