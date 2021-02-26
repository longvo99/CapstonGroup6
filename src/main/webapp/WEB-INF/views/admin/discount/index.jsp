<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div class="container-fluid" id="container-wrapper">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h2 class="m-0 font-weight-bold text-primary">Discount management</h2>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="./">Home</a></li>
			<li class="breadcrumb-item">Tables</li>
			<li class="breadcrumb-item active" aria-current="page">DataTables</li>
		</ol>
	</div>
	<!-- Row -->
	<span id="result"> <c:if test="${not empty msg}">
			<c:if test="${success eq true}">
				<div class="alert alert-success"><strong>${msg}</strong></div>
			</c:if>
			<c:if test="${error eq true}">
				<div class="alert alert-danger"><strong>${msg}</strong></div>
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
						<a href="${pageContext.request.contextPath}/admin/locationType/add" class="btn btn-success btn-md">
							<i class="fa fa-plus-square">
							Thêm
							</i>
						</a>
					</div>
				</div>

				<div class="table-responsive p-3">
					<c:if test="${not empty discountList}">
						<table class="table align-items-center table-flush table-hover" id="dataTableHover">
							<thead class="thead-light">
								<tr>
									<th>ID</th>
									<th>Title</th>
									<th>Code</th>
									<th>Description</th>
									<th>Rate</th>
									<th>Start date</th>
									<th>End date</th>
									<th>Created by</th>
									<th>Case</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${discountList}" var="discount">
									<c:set var="urlDel" value="${pageContext.request.contextPath}/admin/discount/del/${discoun.discountId}" />
									<tr class="odd gradeX">
										<td>${discount.discountId}</td>
										<td>${discount.Title}</td>
										<td>${discount.Code}</td>
										<td>${discount.Description}</td>
										<td>${discount.Rate}</td>
										<td>${discount.StartDate}</td>
										<td>${discount.EndDate}</td>
										<td>
											<!-- nguoi tao discount --> ${discount.CreatorId}
										</td>
										<td>
											<!-- Lay ruleId, roi lay Case --> ${discount.discountId}
										</td>
										<td class="center text-center">
											<a href="" data-toggle="modal" data-target="#exampleModalCenter${discount.discountId}" class="btn btn-sm btn-success">
												<i class="fa fa-edit">
												Detail
												</i>
											</a>
											<a href="" data-toggle="modal" data-target="#exampleModalCenter${discount.discountId}" class="btn btn-sm btn-success">
												<i class="fa fa-edit">
												Edit
												</i>
											</a>
											<a href="${urlDel}" title="Xóa" class="btn btn-danger">
											<span class="glyphicon glyphicon-trash"></span>
											Delete
											</a>
										</td>
									</tr>
									<!-- Modal Center -->
									<div class="modal fade"
										id="exampleModalCenter${discount.discountId}" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalCenterTitle"
										aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalCenterTitle">
														Discount details: <strong></strong>
													</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true"> &times; </span>
													</button>
												</div>
												<div class="modal-body">
													<form role="form"
														action="${pageContext.request.contextPath}/admin/locationType/edit/${user.userId}"
														method="post" id="form">
														<div class="comment-form">
															<div class="form-group">
																<label for="name">Discount ID</label> <input
																	class="form-control mb-3" type="text"
																	value="${discount.discountId}" id="discountId"
																	name="discountId">
															</div>
															<div class="form-group">
																<label for="name">Title</label> <input
																	class="form-control mb-3" type="text"
																	value="${discount.Title}" id="Title" name="Title">
															</div>
															<div class="form-group">
																<input class="form-control mb-3" type="submit" value="SỬA">
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
					<c:if test="${empty discountList}">
						<tr>
							<td colspan="4" align="center">There is not discount here!</td>
						</tr>
					</c:if>
					</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Documentation Link -->
</div>
<!---Container Fluid-->
</div>