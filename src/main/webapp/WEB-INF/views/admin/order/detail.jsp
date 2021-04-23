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
				<h1 class="m-0 font-weight-bold text-primarys">Chi tiết đơn
					hàng</h1>
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
							<form role="form"
								action="${pageContext.request.contextPath}/admin/order/edit"
								method="post" id="form">
								<div class="comment-form">
									<c:set var="obj" value="${orderDetailList.get(0)}"></c:set>
									<div class="form-group">
										<label for="name">ID đơn hàng</label> <input
											class="form-control mb-3" type="text"
											value="${obj.orders.orderId}" id="orderId" name="orderId"
											readonly>
									</div>
									<input type="hidden" value="${obj.orders.users.userId}"
										name="users.userId"> <input type="hidden"
										value="${obj.orders.shipDistance}" name="shipDistance">
									<div class="form-group">
										<label for="name">Người đặt</label> <input
											class="form-control mb-3" type="text"
											value="${obj.orders.users.contactName}"
											id="users.contactName" name="users.contactName" readonly>
									</div>
									<div class="form-group">
										<label for="name">Số điện thoại</label> <input
											class="form-control mb-3" type="text"
											value="${obj.orders.users.contactPhone}"
											id="users.contactName" name="users.contactName" readonly>
									</div>
									<div class="form-group">
										<label for="name">Địa chỉ giao hàng</label> <input
											class="form-control mb-3" type="text"
											value="${obj.orders.recieverAddress}" id="recieverAddress"
											name="recieverAddress" readonly>
									</div>
									<div class="form-group">
										<label for="name">Tổng tiền + ship</label> <input
											class="form-control mb-3" type="text"
											value="${obj.orders.totalPrice}" id="orderTime"
											name="totalPrice" readonly>
									</div>
									<div class="form-group">
										<label for="name">Thời gian đặt</label> <input
											class="form-control mb-3" type="text"
											value="${obj.orders.orderTime}" id="orderTime"
											name="orderTime" readonly>
									</div>
									<div class="form-group">
										<label for="name">Phí ship</label> <input
											class="form-control mb-3" type="text"
											value="${obj.orders.shipPrice}" id="shipPrice"
											name="shipPrice" readonly>
									</div>
									<div class="form-group">
										<label for="name">Ghi chú</label> <input
											class="form-control mb-3" type="text"
											value="${obj.orders.note}" id="note" name="note" readonly>
									</div>
									<table class="table align-items-center table-flush table-hover">
										<thead class="thead-light">
											<tr>
												<th>Tên sản phẩm</th>
												<th>Giá tiền</th>
												<th>Số lượng</th>
												<th>Của nhà hàng</th>
												<th>Địa chỉ nhà hàng</th>
												<th>Sđt nhà hàng</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${orderDetailList}" var="orderDetail">
												<tr class="odd gradeX">
													<c:choose>
														<c:when test="${not empty orderDetail.product.productId}">
															<td>${orderDetail.product.name}</td>
														</c:when>
														<c:otherwise>
															<td>Combo:${orderDetail.productCombo.comboName}</td>
														</c:otherwise>
													</c:choose>
													<td>${orderDetail.currentPrice}</td>
													<td>${orderDetail.quantity}</td>
													<c:choose>
														<c:when test="${not empty orderDetail.product.productId}">
															<td>${orderDetail.product.location.locationName}</td>
															<td>${orderDetail.product.location.address}</td>
															<td>${orderDetail.product.location.locationPhone}</td>
														</c:when>
														<c:otherwise>
															<td>${orderDetail.productCombo.location.locationName}</td>
															<td>${orderDetail.productCombo.location.address}</td>
															<td>${orderDetail.productCombo.location.locationPhone}</td>
														</c:otherwise>
													</c:choose>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="form-group">
										<label for="orderStatus.orderStatusId">Trạng thái</label>
										<c:if
											test="${obj.orders.orderStatus.orderStatusId eq 4 || obj.orders.orderStatus.orderStatusId eq 5}">
											<c:set var="disabled" value="disabled='disabled'" />
										</c:if>
										<select ${disabled} class="form-control" id="orderStatus"
											name="orderStatus.orderStatusId">
											<c:if test="${not empty orderStatus}">
												<c:forEach items="${orderStatus}" var="orderStatus">
													<c:choose>
														<c:when
															test="${orderStatus.orderStatusId eq obj.orders.orderStatus.orderStatusId }">
															<c:set var="selected" value="selected='selected'" />
														</c:when>
														<c:otherwise>
															<c:set var="selected" value="" />
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when
															test="${orderStatus.orderStatusId eq obj.orders.orderStatus.orderStatusId }">
															<c:set var="selected" value="selected='selected'" />
														</c:when>
														<c:otherwise>
															<c:set var="selected" value="" />
														</c:otherwise>
													</c:choose>
													<option ${selected} value="${orderStatus.orderStatusId}">${orderStatus.statusName}</option>
												</c:forEach>
											</c:if>
										</select>
									</div>
									<c:if
										test="${obj.orders.orderStatus.orderStatusId ne 4 && obj.orders.orderStatus.orderStatusId ne 5}">
										<div class="form-group">
											<button type="submit" class="btn btn-primary" name="submit">Cập
												nhập</button>
										</div>
									</c:if>
								</div>
							</form>
						</div>
					</div>
					<!--Row-->
				</div>
				<!---Container Fluid-->
			</div>