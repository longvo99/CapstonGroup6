<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
	<sec:authentication var="userDetail" property="principal" />
	<c:choose>
		<c:when test="${not empty sessionScope.userSession}">
			<c:set var="addUrl" value="${pageContext.request.contextPath}/public/location/add" />
			<c:set var="editUrl" value="${pageContext.request.contextPath}/public/location/edit" />
			<c:set var="imageUrl" value="${pageContext.request.contextPath}/public/location/image" />
			<c:set var="deleteUrl" value="${pageContext.request.contextPath}/public/location/delete" />
			<c:set var="productUrl" value="${pageContext.request.contextPath}/public/product/index" />
			<c:set var="comboUrl" value="${pageContext.request.contextPath}/public/combo/index" />
		</c:when>
		<c:otherwise>
			<c:set var="addUrl" value="${pageContext.request.contextPath}/admin/location/add" />
			<c:set var="editUrl" value="${pageContext.request.contextPath}/admin/location/edit" />
			<c:set var="imageUrl" value="${pageContext.request.contextPath}/admin/location/image" />
			<c:set var="deleteUrl" value="${pageContext.request.contextPath}/admin/location/delete" />
			<c:set var="productUrl" value="${pageContext.request.contextPath}/admin/product/index" />
			<c:set var="comboUrl" value="${pageContext.request.contextPath}/admin/combo/index" />
		</c:otherwise>
	</c:choose>
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
	      <c:if test="${not empty msg}">
			<div class="alert alert-success">
				<strong>${msg}</strong>
			</div>
		  </c:if>
          <div class="row">
            <!-- DataTable with Hover -->
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <div class="col-sm-10">
                  <c:if test="${empty sessionScope.userSession}">
				  <c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
	                	<a href="${addUrl}" class="btn btn-success btn-md"><i class="fa fa-plus-square"> Thêm </i></a>
	              </c:if>
	              </c:if>
                <c:if test="${not empty sessionScope.userSession}">
                	<a href="${addUrl}" class="btn btn-success btn-md"><i class="fa fa-plus-square"> Thêm </i></a>
                </c:if>
                  </div>
                </div>
                <div class="table-responsive p-3">
                <c:if test="${not empty locationList}">
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                        <th>ID</th>
                        <th>Tên</th>
                        <th>Danh mục</th>
                        <th>Kiểu</th>
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
								<a href="${editUrl}/${location.locationId}" class="btn btn-sm btn-success" title="CHI TIẾT"><i class="fas fa-info-circle"></i></a>
								<%-- <c:if test="${empty sessionScope.userSession}">
								<c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
			                  		<a href="${pageContext.request.contextPath}/admin/location/image/${location.locationId}" title="HÌNH ẢNH" class="btn btn-sm btn-primary"><i class="fas fa-image" aria-hidden="true"></i></a>
			                  	</c:if>
			                  	</c:if> --%>
                                <a href="${productUrl}/${location.locationId}" class="btn btn-sm btn-warning" title="SẢN PHẨM"><i class="fab fa-product-hunt"></i></a>
                                <a href="${comboUrl}/${location.locationId}" class="btn btn-sm btn-info" title="COMBO"><i class="fas fa-certificate"></i></a>
                                <a href="${deleteUrl}"  class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa không');" title="XÓA"><i class="fas fa-trash"></i></a>
                                <c:if test="${empty sessionScope.userSession}">
                                <c:if test="${userDetail.user.role.roleId eq 'ADMIN'}">
			                  		<a href="" data-toggle="modal" data-target="#exampleModalCenter${location.locationId}" title="LIÊN HỆ" class="btn btn-sm btn-info"><i class="fas fa-comment-dots"></i></a>
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
													</div>
													<!-- Modal Center -->
												</c:if>
											</c:if></td>
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
