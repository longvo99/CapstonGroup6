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
									<input type="hidden" value="${obj.orders.users.userId}" name="users.userId">
								    <input type="hidden" value="${obj.orders.shipDistance}" name="shipDistance">
									<input type="hidden" value="${obj.orders.location.locationId}" name="location.locationId">
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
											value="${userAddress.stress}" id="stress"
											name="stress" readonly>
									</div>
									<div class="form-group">
									<label for="city">Tỉnh/thành</label> <select name="city"
										id="country" class="form-control input-lg" readonly>
										<option value="000">-Chọn Tỉnh/Thành:-</option>
									</select>
								</div>
								<div class="form-group">
									<label for="district">Quận huyện</label> <select
										name="district" id="state" class="form-control input-lg"
										readonly>
										<option value="000">-Chọn Quận/Huyện-</option>
									</select>
								</div>
								<div class="form-group">
									<label for="ward">Xã/phường</label> <select name="ward"
										id="city" class="form-control input-lg" readonly>
										<option value="000">-Chọn Phường/Xã-</option>
									</select>
								</div>
								<script>
					$(document).ready(function(){
						  $.getJSON('${pageContext.request.contextPath}/resources/admin/assets/js/data.json', function(data){
							  var country_id;
							  var state_id;
							  $.each(data, function (index, value) {
								    var city_id;
								    if('${userAddress.city}' == value.Id){
								    	$("#country").append('<option selected="selected" rel="' + index + '" value="'+value.Id+'">'+value.Name+'</option>');
								    } else {
								    	$("#country").append('<option rel="' + index + '" value="'+value.Id+'">'+value.Name+'</option>');
								    }
								   /*  country_id = $("#country").find('option:selected').attr('rel');
						            console.log("Country INDEX : " + country_id); */
						            /* $.each(data[country_id].Districts, function (index1, value1) {
						                 
						            	if(${location.district} == value1.Id){
						            		 $("#state").append('<option selected="selected" rel="' + index1 + '" value="'+value1.Id+'">'+value1.Name+'</option>');
									    } else {
									    	$("#state").append('<option rel="' + index1 + '" value="'+value1.Id+'">'+value1.Name+'</option>');
									    }
						               
						            });   */
						            country_id = $("#country").find('option:selected').attr('rel');
								        $("#country").change(function () {
								            $("#state, #city").find("option:gt(0)").remove();
								            $("#state").find("option:first").text("Loading...");
								            country_id = $(this).find('option:selected').attr('rel');
								            console.log("Country INDEX : " + country_id);
								            $.each(data[country_id].Districts, function (index1, value1) {
								                $("#state").find("option:first").text("-Chọn Quận/Huyện-");
								                $("#state").append('<option rel="' + index1 + '" value="'+value1.Id+'">'+value1.Name+'</option>');
								            });
								            
								        });
								        $("#state").change(function () {
								            $("#city").find("option:gt(0)").remove();
								            $("#city").find("option:first").text("Loading...");
								            state_id = $(this).find('option:selected').attr('rel');
								            console.log("State INDEX : " + state_id);
								            $.each(data[country_id].Districts[state_id].Wards, function (index2, value2) {
								                $("#city").find("option:first").text("-Chọn Phường/Xã-");
								                $("#city").append('<option rel="' + index2 + '" value="'+value2.Id+'">'+value2.Name+'</option>');
								            });
								        });     
								});
							  $.each(data[country_id].Districts, function (index1, value1) {
					            	if('${userAddress.district}' == value1.Id){
					            		 $("#state").append('<option selected="selected" rel="' + index1 + '" value="'+value1.Id+'">'+value1.Name+'</option>');
								    } else {
								    	$("#state").append('<option rel="' + index1 + '" value="'+value1.Id+'">'+value1.Name+'</option>');
								    }
					            }); 
							  state_id = $("#state").find('option:selected').attr('rel');
							  $.each(data[country_id].Districts[state_id].Wards, function (index2, value2) {
					            	if('${userAddress.ward}' == value2.Id){
					            		$("#city").append('<option selected="selected" rel="' + index2 + '" value="'+value2.Id+'">'+value2.Name+'</option>');
								    } else {
								    	$("#city").append('<option rel="' + index2 + '" value="'+value2.Id+'">'+value2.Name+'</option>');
								    }
					            });
						 });
						});
			</script>
									<div class="form-group">
										<label for="name">Tổng tiền + ship(VNĐ)</label>
										<input
											class="form-control mb-3" type="text"
											value="${fn:substring(obj.orders.totalPrice, 0, fn:indexOf(obj.orders.totalPrice, '.'))}" id="orderTime"
											name="totalPrice" readonly>
									</div>
									<div class="form-group">
										<label for="name">Thời gian đặt</label> <input
											class="form-control mb-3" type="text"
											value="${obj.orders.orderTime}" id="orderTime"
											name="orderTime" readonly>
									</div>
									<div class="form-group">
										<label for="name">Phí ship (VNĐ)</label> 
										<input
											class="form-control mb-3" type="text"
											value="${obj.orders.shipPrice}" id="shipPrice"
											name="shipPrice" readonly>
									</div>
									<div class="form-group">
										<label for="name">Ghi chú</label> <input
											class="form-control mb-3" type="text"
											value="${obj.orders.note}" id="note" name="note" readonly>
									</div>
									<div class="table-responsive p-3">
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
													<td>${fn:substring(orderDetail.currentPrice, 0, fn:indexOf(orderDetail.currentPrice, '.'))}</td>
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
									</div>
									<div class="form-group">
										<label for="orderStatus.orderStatusId">Trạng thái</label>
										<c:if
											test="${obj.orders.orderStatus.orderStatusId eq 5 || obj.orders.orderStatus.orderStatusId eq 6}">
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
													<%-- <c:choose>
														<c:when
															test="${orderStatus.orderStatusId eq obj.orders.orderStatus.orderStatusId }">
															<c:set var="selected" value="selected='selected'" />
														</c:when>
														<c:otherwise>
															<c:set var="selected" value="" />
														</c:otherwise>
													</c:choose> --%>
													<c:choose>
														<c:when
															test="${orderStatus.orderStatusId eq 2 }">
															<option disabled="disabled" ${selected} value="${orderStatus.orderStatusId}">${orderStatus.statusName}</option>
														</c:when>
														<c:otherwise>
															<option ${selected} value="${orderStatus.orderStatusId}">${orderStatus.statusName}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:if>
										</select>
									</div>
									<c:if
										test="${obj.orders.orderStatus.orderStatusId ne 5 && obj.orders.orderStatus.orderStatusId ne 6}">
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