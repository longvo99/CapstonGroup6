<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<sec:authentication var="userDetail" property="principal" />
<div class="container-fluid" id="container-wrapper">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<c:if test="${userDetail.user.role.roleId eq 'ADMIN'}">
			<c:choose>
				<c:when test="${roleName eq 'ADMIN'}">
					<h2 class="m-0 font-weight-bold text-primary">Quản lý hồ sơ cá
						nhân</h2>
				</c:when>
				<c:otherwise>
					<h2 class="m-0 font-weight-bold text-primary">Quản lý
						${roleName}</h2>
				</c:otherwise>
			</c:choose>
		</c:if>
		<c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
			<h2 class="m-0 font-weight-bold text-primary">Quản lý hồ sơ cá
				nhân</h2>
		</c:if>
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
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<div class="col-sm-10">
						<c:if test="${userDetail.user.role.roleId eq 'ADMIN'}">
							<c:if test="${roleName ne 'ADMIN'}">
								<a href="${pageContext.request.contextPath}/admin/user/add"
									class="btn btn-success btn-md"><i class="fa fa-plus-square">
										Thêm </i></a>
							</c:if>
						</c:if>
					</div>
				</div>
				<div class="table-responsive p-3">
					<c:if test="${not empty userList}">
						<table class="table align-items-center table-flush table-hover"
							id="dataTableHover">
							<thead class="thead-light">
								<tr>
									<th class="center text-center">ID</th>
									<th class="center text-center">Tài khoản</th>
									<th class="center text-center">Tên người dùng</th>
									<th class="center text-center">Số điện thoại</th>
									<th class="center text-center">Chức năng</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${userDetail.user.role.roleId eq 'ADMIN'}">
									<c:forEach items="${userList}" var="user">
										<c:set var="urlEdit"
											value="${pageContext.request.contextPath}/admin/user/edit/${user.userId}" />
										<c:set var="urlDel"
											value="${pageContext.request.contextPath}/admin/user/del/${user.userId}" />
										<tr class="odd gradeX">
											<td>${user.userId}</td>
											<td>${user.username}</td>
											<td>${user.contactName}</td>
											<td>${user.contactPhone}</td>
											<td class="center text-center"><a href=""
												data-toggle="modal"
												data-target="#exampleModalCenter${user.userId}"
												class="btn btn-sm btn-success"><i class="fa fa-edit">
														Detail </i></a> <c:if test="${user.role.roleId eq 'ADMIN'}">
													<a href="${urlEdit}" class="btn btn-sm btn-primary"><i
														class="fa fa-edit">Edit</i></a>
												</c:if> <a href="${urlDel}" title="Xóa"
												class="btn btn-sm btn-danger"><i class="fa fa-trash">
														Xóa </i></a></td>
										</tr>
										<!-- Modal Center -->
										<div class="modal fade" id="exampleModalCenter${user.userId}"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered"
												role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalCenterTitle">
															<strong>Chi tiết: </strong>
														</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<form role="form"
															action="${pageContext.request.contextPath}/admin/user/setbaned"
															method="post">
															<div class="comment-form">
																<input type="hidden" name="id" value="${user.userId}">
																<div class="form-group">
																	<label for="name">Tài khoản</label> <input
																		class="form-control mb-3" type="text"
																		value="${user.username}" id="userName" name="userName"
																		readonly>
																</div>
																<div class="form-group">
																	<label for="address">Họ và Tên</label> <input
																		class="form-control mb-3" type="text"
																		value="${user.contactName}" id="contactName"
																		name="contactName" readonly>
																</div>
																<div class="form-group">
																	<label for="opentime">Số điện thoại</label> <input
																		class="form-control mb-3" type="text"
																		value="${user.contactPhone}" id="contactPhone"
																		name="contactPhone" readonly>
																</div>
																<div class="form-group">
																	<label for="closetime">Email</label> <input
																		class="form-control mb-3" type="text"
																		value="${user.contactEmail}" id="contactEmail"
																		name="contactEmail" readonly>
																</div>
																<div class="form-group">
																	<label for="usercategory">Địa chỉ</label> <input
																		class="form-control mb-3" type="text"
																		value="${fn:substring(user.contactAddress, 0, fn:indexOf(user.contactAddress, '-'))}"
																		id="contactAddress" name="contactAddress" readonly>
																</div>
																<div class="form-group">
																	<label for="usertype">Giới tính</label> <input
																		class="form-control mb-3" type="text"
																		value="${user.gender}" id="gender" name="gender"
																		readonly>
																</div>
																<div class="form-group">
																	<label for="ward">Ngày sinh</label> <input
																		class="form-control mb-3" type="text"
																		value="${fn:substring(user.dateOfBirth, 0, fn:indexOf(user.dateOfBirth, ' '))}"
																		id="dateOfBirth" name="dateOfBirth" readonly>
																</div>
																<div class="form-group">
																	<label for="district">Ngày tạo tài khoản</label> <input
																		class="form-control mb-3" type="text"
																		value="${fn:substring(user.joinDate, 0, fn:indexOf(user.joinDate, ' '))}"
																		id="joinDate" name="joinDate" readonly>
																</div>
																<div class="form-group">
																	<label for="ward">Mô tả</label>
																	<textarea disabled="disabled" class="form-control mb-3"
																		rows="3">${user.description}</textarea>
																</div>
																<c:if test="${user.role.roleId ne 'ADMIN'}">
																	<div class="form-group">
																		<label for="city">Trạng thái tài khoản</label> <select
																			name="banned" class="form-control input-lg">
																			<c:if test="${user.banned}">
																				<option selected="selected" value="true">Đã
																					khóa</option>
																				<option value="false">Đang hoạt động</option>
																			</c:if>
																			<c:if test="${!user.banned}">
																				<option value="true">Đã khóa</option>
																				<option selected="selected" value="false">Đang
																					hoạt động</option>
																			</c:if>
																		</select>
																	</div>
																</c:if>
																<div class="form-group">
																	<label for="country">Chức vụ</label> <input
																		name="roleId" class="form-control mb-3" type="text"
																		value="${user.role.roleId}" readonly>
																</div>
																<div class="form-group">
																	<label>Ảnh</label> <img
																		src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${user.avatarPath}"
																		id="blah" alt="your image"
																		style="max-height: 300px; display: block; margin-top: 15px;" />
																</div>
																<c:if test="${user.role.roleId ne 'ADMIN'}">
																	<button type="submit" class="btn btn-primary"
																		name="submit">Cập nhập</button>
																</c:if>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div>
										<!-- Modal Center -->
									</c:forEach>
								</c:if>
								<c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
									<c:forEach items="${userList}" var="user">
										<c:if test="${userDetail.user.userId eq user.userId}">
											<c:set var="urlEdit"
												value="${pageContext.request.contextPath}/admin/user/edit/${user.userId}" />
											<c:set var="urlDel"
												value="${pageContext.request.contextPath}/admin/user/del/${user.userId}" />
											<tr class="odd gradeX">
												<td>${user.userId}</td>
												<td>${user.username}</td>
												<td>${user.contactName}</td>
												<td>${user.contactPhone}</td>
												<td class="center text-center"><a href=""
													data-toggle="modal"
													data-target="#exampleModalCenter${user.userId}"
													class="btn btn-sm btn-success"><i class="fa fa-edit">
															Detail </i></a> <a href="${urlEdit}"
													class="btn btn-sm btn-primary"><i class="fa fa-edit">Edit</i></a>
													<a href="${urlDel}" title="Xóa"
													class="btn btn-sm btn-danger"><i class="fa fa-trash">
															Xóa </i></a></td>
											</tr>
											<!-- Modal Center -->
											<div class="modal fade" id="exampleModalCenter${user.userId}"
												tabindex="-1" role="dialog"
												aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered"
													role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalCenterTitle">
																<strong>Chi tiết: </strong>
															</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<div class="comment-form">
																<div class="form-group">
																	<label for="name">Tài khoản</label> <input
																		class="form-control mb-3" type="text"
																		value="${user.username}" id="userName" name="userName"
																		readonly>
																</div>
																<div class="form-group">
																	<label for="address">Họ và Tên</label> <input
																		class="form-control mb-3" type="text"
																		value="${user.contactName}" id="contactName"
																		name="contactName" readonly>
																</div>
																<div class="form-group">
																	<label for="opentime">Số điện thoại</label> <input
																		class="form-control mb-3" type="text"
																		value="${user.contactPhone}" id="contactPhone"
																		name="contactPhone" readonly>
																</div>
																<div class="form-group">
																	<label for="closetime">Email</label> <input
																		class="form-control mb-3" type="text"
																		value="${user.contactEmail}" id="contactEmail"
																		name="contactEmail" readonly>
																</div>
																<div class="form-group">
																	<label for="usercategory">Địa chỉ</label> <input
																		class="form-control mb-3" type="text"
																		value="${fn:substring(user.contactAddress, 0, fn:indexOf(user.contactAddress, '-'))}"
																		id="contactAddress" name="contactAddress" readonly>
																</div>
																<div class="form-group">
																	<label for="usertype">Giới tính</label> <input
																		class="form-control mb-3" type="text"
																		value="${user.gender}" id="gender" name="gender"
																		readonly>
																</div>
																<div class="form-group">
																	<label for="ward">Ngày sinh</label> <input
																		class="form-control mb-3" type="text"
																		value="${fn:substring(user.dateOfBirth, 0, fn:indexOf(user.dateOfBirth, ' '))}"
																		id="dateOfBirth" name="dateOfBirth" readonly>
																</div>
																<div class="form-group">
																	<label for="district">Ngày tạo tài khoản</label> <input
																		class="form-control mb-3" type="text"
																		value="${fn:substring(user.joinDate, 0, fn:indexOf(user.joinDate, ' '))}"
																		id="joinDate" name="joinDate" readonly>
																</div>
																<div class="form-group">
																	<label for="ward">Mô tả</label>
																	<textarea disabled="disabled" class="form-control mb-3"
																		rows="3">${user.description}</textarea>
																</div>
																<div class="form-group">
																	<label for="country">Chức vụ</label> <input
																		class="form-control mb-3" type="text"
																		value="${user.role.roleName}" readonly>
																</div>
																<div class="form-group">
																	<label>Ảnh</label> <img
																		src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${user.avatarPath}"
																		id="blah" alt="your image"
																		style="max-height: 300px; display: block; margin-top: 15px;" />
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- Modal Center -->
										</c:if>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</c:if>
					<c:if test="${empty userList}">
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