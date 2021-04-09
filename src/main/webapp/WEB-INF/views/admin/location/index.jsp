<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
	<sec:authentication var="userDetail" property="principal" />
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
                        <th>Type</th>
                        <th class="center text-center">Chức năng</th>
                      </tr>
                    </thead>
                    <tbody>
					  <c:forEach items="${locationList}" var="location">
					  	<tr class="odd gradeX">
							<td>${location.locationId}</td>
							<td>${location.locationName}</td>
							<td>${location.locationCategory.locationCategoryName}</td>
							<td>${location.locationType.locationTypeName}</td>
							<td class="center text-center">
								<a href="${pageContext.request.contextPath}/admin/location/edit/${location.locationId}" class="btn btn-sm btn-success"><i class="fa fa-edit">Chi tiết</i></a>
								<c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
			                  		<a href="${pageContext.request.contextPath}/admin/location/image/${location.locationId}" class="btn btn-sm btn-primary"><i class="fa fa-edit">Hình ảnh</i></a>
			                  	</c:if>
                                <a href="${pageContext.request.contextPath}/admin/product/index/${location.locationId}" class="btn btn-sm btn-warning"><i class="fa fa-edit">Sản phẩm</i></a>
                                <a href="${pageContext.request.contextPath}/admin/location/delete"  class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa không');"><i class="fas fa-trash"> Xóa </i></a>
                                <c:if test="${userDetail.user.role.roleId eq 'ADMIN'}">
			                  		<a href="" data-toggle="modal" data-target="#exampleModalCenter${location.locationId}" class="btn btn-sm btn-info"><i class="fa fa-edit"> Liên hệ </i></a>
			                  		<!-- Modal Center -->
							          <div class="modal fade" id="exampleModalCenter${location.locationId}" tabindex="-1" role="dialog"
							            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							            <div class="modal-dialog modal-dialog-centered" role="document">
							              <div class="modal-content">
							                <div class="modal-header">
							                  <h5 class="modal-title" id="exampleModalCenterTitle">Gửi liên hệ cho: <strong>${location.locationName}</strong> </h5>
							                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							                    <span aria-hidden="true">&times;</span>
							                  </button>
							                </div>
							                <div class="modal-body">
							                	<div class="comment-form">
													<form role="form" action="${pageContext.request.contextPath}/mail" method="post">
														<div class="form-group form-inline">
														  <div class="form-group col-lg-6 col-md-12 name">
														    <input type="text" class="form-control" name="tieude" id="tieude" placeholder="Tiêu đề" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Tiêu đề'" required="true">
														  </div>
														  <div class="form-group col-lg-6 col-md-12 email">
														    <input readonly="readonly" type="text" class="form-control" name="email" id="email" value="${location.locationEmail}">
														  </div>										
														</div>
														<div class="form-group">
															<textarea class="form-control mb-10" id="message" rows="5" name="message" placeholder="Nội dung" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nội dung'" required=""></textarea>
														</div>
														<input type="submit" value="Gửi" name="submit" class="btn btn-primary"/>
													</form>
												</div>
							                </div>
							              </div>
							            </div>
							          </div>
			         			 	<!-- Modal Center -->
			                  	</c:if>
							</td>
						</tr>
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
