<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div class="container-fluid" id="container-wrapper">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h2 class="m-0 font-weight-bold text-primary">Quản lý loại địa
			điểm</h2>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="./">Trang chủ</a></li>
			<li class="breadcrumb-item">Bảng</li>
			<li class="breadcrumb-item active" aria-current="page">DataTables</li>
		</ol>
	</div>
	<!-- Row -->
	<span id="result"> <c:if test="${not empty msg}">
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
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<div class="col-sm-10">
						<a
							href="${pageContext.request.contextPath}/admin/locationType/add"
							class="btn btn-success btn-md"><i class="fa fa-plus-square">
								Thêm </i></a>
					</div>
				</div>

				<div class="table-responsive p-3">
					<c:if test="${not empty locationTypeList}">
						<table class="table align-items-center table-flush table-hover"
							id="dataTableHover">
							<thead class="thead-light">
								<tr>
									<th>ID</th>
									<th>Tên loại địa điểm</th>
									<th>Chức năng</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${locationTypeList}" var="locationType">
									<c:set var="urlDel"
										value="${pageContext.request.contextPath}/admin/locationType/del/${locationType.locationTypeId}" />
									<tr class="odd gradeX">
										<td>${locationType.locationTypeId}</td>
										<td>${locationType.locationTypeName}</td>
										<td class="center text-center"><a href=""
											data-toggle="modal"
											data-target="#exampleModalCenter${locationType.locationTypeId}"
											class="btn btn-sm btn-success"><i class="fa fa-edit">Detail</i></a>
											<a href="" data-toggle="modal"
											data-target="#exampleModalCenter${locationType.locationTypeId}"
											class="btn btn-sm btn-primary"><i class="fa fa-edit">Edit</i></a>
											<a href="${urlDel}" title="Xóa" class="btn btn-danger"><span
												class="glyphicon glyphicon-trash"></span> Xóa</a></td>
									</tr>
									<!-- Modal Center -->
									<div class="modal fade"
										id="exampleModalCenter${locationType.locationTypeId}"
										tabindex="-1" role="dialog"
										aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalCenterTitle">
														Chi tiết loại địa chỉ: <strong></strong>
													</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<form role="form"
														action="${pageContext.request.contextPath}/admin/locationType/edit/${user.userId}"
														method="post" id="form">
														<div class="comment-form">
															<div class="form-group">
																<label for="name">ID loại địa điểm</label> <input
																	class="form-control mb-3" type="text"
																	value="${locationType.locationTypeId}"
																	id="locationTypeId" name="locationTypeId">
															</div>
															<div class="form-group">
																<label for="name">Tên loại địa điểm</label> <input
																	class="form-control mb-3" type="text"
																	value="${locationType.locationTypeName}"
																	id="locationTypeName" name="locationTypeName">
															</div>
															<div class="form-group">
																<input class="form-control mb-3" type="submit"
																	value="SỬA">
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
									<!-- Modal Center -->
								</c:forEach>
							</tbody>
						</table>
					</c:if>
					<c:if test="${empty locationTypeList}">
						<tr>
							<td colspan="4" align="center">Chưa có người dùng nào!</td>
						</tr>
					</c:if>
					<!-- <tr>
							<td colspan="4" align="center">Chưa có người dùng nào!</td>
						</tr> -->

					</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!--Row-->

	<!-- Documentation Link -->


</div>
<!---Container Fluid-->
</div>