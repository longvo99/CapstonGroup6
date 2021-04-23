<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<sec:authentication var="userDetail" property="principal" />
<c:choose>
	<c:when test="${not empty sessionScope.userSession}">
		<c:set var="addUrl"
			value="${pageContext.request.contextPath}/public/combo/add" />
		<c:set var="editUrl"
			value="${pageContext.request.contextPath}/public/combo/edit" />
		<c:set var="deleteUrl"
			value="${pageContext.request.contextPath}/public/combo/del" />
	</c:when>
	<c:otherwise>
		<c:set var="addUrl"
			value="${pageContext.request.contextPath}/admin/combo/add" />
		<c:set var="editUrl"
			value="${pageContext.request.contextPath}/admin/combo/edit" />
		<c:set var="deleteUrl"
			value="${pageContext.request.contextPath}/admin/combo/del" />
	</c:otherwise>
</c:choose>
<div class="container-fluid" id="container-wrapper">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h2 class="m-0 font-weight-bold text-primary">Quản lý combo</h2>
		<ol class="breadcrumb">
			<c:set var="actionIndex"
				value="${pageContext.request.contextPath}/admin/index" />
			<c:if test="${not empty sessionScope.userSession}">
				<c:set var="actionIndex"
					value="${pageContext.request.contextPath}/public/index" />
			</c:if>
			<li class="breadcrumb-item"><a href="${actionIndex}">Trang
					chủ</a></li>
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
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<div class="col-sm-10">
						<c:if test="${empty sessionScope.userSession}">
							<c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
								<c:set var="url" value="${addUrl}/${locationId}"></c:set>
								<c:if test="${countAllByLocationId eq 0}">
									<c:set var="url" value="javascript:void(0)"></c:set>
									<c:set var="click"
										value="return alert('Chưa có sản phẩm để thêm!');"></c:set>
								</c:if>
								<a href="${url}" onclick="${click}"
									class="btn btn-success btn-md"><i class="fa fa-plus-square">
										Thêm </i></a>
							</c:if>
						</c:if>
						<c:if test="${not empty sessionScope.userSession}">
							<c:set var="url" value="${addUrl}/${locationId}"></c:set>
							<c:if test="${countAllByLocationId eq 0}">
								<c:set var="url" value="javascript:void(0)"></c:set>
								<c:set var="click"
									value="return alert('Chưa có sản phẩm để thêm!');"></c:set>
							</c:if>
							<a href="${url}" onclick="${click}"
								class="btn btn-success btn-md"><i class="fa fa-plus-square">
									Thêm </i></a>
						</c:if>
					</div>
				</div>
				<div class="table-responsive p-3">
					<c:if test="${not empty productComboList}">
						<table class="table align-items-center table-flush table-hover"
							id="dataTableHover">
							<thead class="thead-light">
								<tr>
									<th class="center text-center">ID</th>
									<th class="center text-center">Tên combo</th>
									<th class="center text-center">Phần trăm giảm</th>
									<th class="center text-center">Chức năng</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${productComboList}" var="productCombo">
									<tr class="odd gradeX">
										<td class="text-center">${productCombo.productComboId}</td>
										<td class="text-center">${productCombo.comboName}</td>
										<td class="text-center">${productCombo.rateDiscount}%</td>
										<td class="text-center">
											<%-- <a href="${pageContext.request.contextPath}/public/combo/detail" data-toggle="modal" data-target="#exampleModalCenter${productCombo.productComboId}" class="btn btn-sm btn-success" title="CHI TIẾT"><i class="fas fa-info-circle"></i></a> --%>
											<a
											href="${editUrl}/${productCombo.productComboId}/${locationId}"
											title="SỬA" class="btn btn-sm btn-primary"><i
												class="fa fa-edit"></i></a> <c:if
												test="${empty sessionScope.userSession}">
												<c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
													<a href="${deleteUrl}/${productCombo.productComboId}"
														title="XÓA" class="btn btn-sm btn-danger"><i
														class="fas fa-trash"></i></a>
												</c:if>
											</c:if> <c:if test="${not empty sessionScope.userSession}">
												<a href="${deleteUrl}/${productCombo.productComboId}"
													title="XÓA" class="btn btn-sm btn-danger"><i
													class="fas fa-trash"></i></a>
											</c:if>
										</td>
									</tr>
									<%-- <!-- Modal Center -->
			          <div class="modal fade" id="exampleModalCenter${productCombo.productComboId}" tabindex="-1" role="dialog"
			            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			            <div class="modal-dialog modal-dialog-centered" role="document">
			              <div class="modal-content">
			                <div class="modal-header">
			                  <h5 class="modal-title" id="exampleModalCenterTitle">Chi tiết giảm giá: <strong></strong> </h5>
			                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                  </button>
			                </div>
			                <div class="modal-body">
			                	<div class="comment-form">
										<div class="form-group">
					                      <label for="productComboId">Id</label>
					                      <input disabled="disabled" class="form-control mb-3" type="text" value="${productCombo.productComboId}">
					                    </div>
					                    <div class="form-group">
					                      <label for="name">Tên combo</label>
					                      <input disabled="disabled" class="form-control mb-3" type="text" value="${productCombo.comboName}">
					                    </div>
										<div class="form-group">
					                      <label for="name">Phần trăm giảm</label>
					                      <input disabled="disabled" class="form-control mb-3" type="text" value="${productCombo.rateDiscount}">
					                    </div>
					                    <div class="form-group">
					                      <label for="name">Mô tả</label>
					                      <textarea disabled="disabled" class="form-control mb-3" rows="3">${productCombo.description}</textarea>
					                    </div>
					                    <div class="form-group">
					                      <label for="name">Sản phẩm</label>
					                      <textarea disabled="disabled" class="form-control mb-3" rows="3"></textarea>
					                    </div>
					                    <div class="form-group">
					                      <label>Ảnh</label>
					                      <div class="center text-center">
									      	<img style="width: 300px; height: 150px;" src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${productCombo.imagePath}">
										  </div>
					                    </div>
								</div>
			                </div>
			              </div>
			            </div>
			          </div>
			          <!-- Modal Center --> --%>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
					<c:if test="${empty discountList}">
						<tr>
							<td colspan="5" align="center">Chưa có combo!</td>
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
