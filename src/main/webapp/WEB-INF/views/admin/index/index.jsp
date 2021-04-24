<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< Updated upstream
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div id="content-wrapper" class="d-flex flex-column">
	<div id="content">
		<!-- Container Fluid-->
		<div class="container-fluid" id="container-wrapper">
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">Trang chủ</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="./">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Dashboard</li>
				</ol>
			</div>
			<div class="row mb-3">
				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<div class="row align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-uppercase mb-1">QUẢN
										LÝ ĐỊA ĐIỂM</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">Có
										tổng ${locationCount} địa điểm</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-calendar fa-2x text-primary"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Earnings (Annual) Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-uppercase mb-1">QUẢN
										LÝ ĐẶT HÀNG</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">Có
										${newOrderCount} đơn hàng mới</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-shopping-cart fa-2x text-success"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- New User Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-uppercase mb-1">QUẢN
										LÝ NGƯỜI DÙNG</div>
									<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">Có
										20 người đăng nhập gần đây</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-users fa-2x text-info"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Pending Requests Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-uppercase mb-1">QUẢN
										LÝ LIÊN HỆ</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">Có 18
										liên hệ chưa trả lời</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-comments fa-2x text-warning"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Invoice Example -->
				<div class="col-xl-8 col-lg-7 mb-4">
					<div class="card">
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">Đơn hàng mới</h6>
							<a class="m-0 float-right btn btn-danger btn-sm"
								href="${pageContext.request.contextPath}/admin/order/neworder">Xem
								thêm <i class="fas fa-chevron-right"></i>
							</a>
						</div>
						<div class="table-responsive">
							<table class="table align-items-center table-flush">
								<thead class="thead-light">
									<tr>
										<th>ID</th>
										<th>Người đặt</th>
										<th>Tổng tiền</th>
										<th>Thời gian đặt</th>
										<th>Chức năng</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty newOrderList}">
										<c:choose>
											<c:when test="${newOrderList.size() gt 5}">
												<c:forEach begin="0" end="4" var="obj"
													items="${newOrderList}">
													<tr>
														<td>${obj.orderId}</td>
														<td>${obj.users.username}</td>
														<td><fmt:formatNumber value="${obj.totalPrice}"
																type="number" /></td>
														<td><span class="badge badge-success"><fmt:formatDate
																	pattern="HH:mm (dd-MM-yyyy)" value="${obj.orderTime}" /></span></td>
														<td><a
															href="${pageContext.request.contextPath}/admin/order/detail/${obj.orderId}"
															class="btn btn-sm btn-primary">Chi tiết</a></td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:forEach var="obj" items="${newOrderList}">
													<tr>
														<td>${obj.orderId}</td>
														<td>${obj.users.username}</td>
														<td><fmt:formatNumber value="${obj.totalPrice}"
																type="number" /></td>
														<td><span class="badge badge-success"><fmt:formatDate
																	pattern="HH:mm (dd-MM-yyyy)" value="${obj.orderTime}" /></span></td>
														<td><a
															href="${pageContext.request.contextPath}/admin/order/detail/${obj.orderId}"
															class="btn btn-sm btn-primary">Chi tiết</a></td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</c:if>
									<c:if test="${empty newOrderList}">
										<tr>
											<td colspan="5" align="center">Chưa có đơn hàng mới nào!</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
						<div class="card-footer"></div>
					</div>
				</div>
				<!-- Message From Customer-->
				<div class="col-xl-4 col-lg-5 ">
					<div class="card">
						<div
							class="card-header py-4 bg-primary d-flex flex-row align-items-center justify-content-between">
							<c:set value="0" var="count"></c:set>
							<c:if test="${not empty unapprovedLocationList}">
								<c:set value="${unapprovedLocationList.size()}" var="count"></c:set>
							</c:if>
							<h6 class="m-0 font-weight-bold text-light">Địa điểm mới
								chưa duyệt (${count})</h6>
						</div>
						<div style="height: 350px; overflow-y: scroll;">
							<c:if test="${not empty unapprovedLocationList}">
								<c:forEach var="location" items="${unapprovedLocationList}">
									<div class="customer-message align-items-center">
										<a class="font-weight-bold"
											href="${pageContext.request.contextPath}/admin/location/edit/${location.locationId}">
											<div class="text-truncate message-title">${location.locationName}</div>
											<div
												class="small text-gray-500 message-time font-weight-bold">${location.address}</div>
										</a>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${empty unapprovedLocationList}">
								<div class="text-center">Chưa có địa điểm nào!</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<!--Row-->
		</div>
		<!---Container Fluid-->
	</div>
=======
    pageEncoding="UTF-8"%>
    	<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>	
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Trang chủ</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
            </ol>
          </div>
          <div class="row mb-3">
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">QUẢN LÝ ĐỊA ĐIỂM</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">Có tổng ${locationCount} địa điểm</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-primary"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Earnings (Annual) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">QUẢN LÝ ĐẶT HÀNG</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">Có ${newOrderCount} đơn hàng mới</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-shopping-cart fa-2x text-success"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- New User Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">QUẢN LÝ NGƯỜI DÙNG</div>
                      <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">Có 20 người đăng nhập gần đây</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-users fa-2x text-info"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">QUẢN LÝ LIÊN HỆ</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">Có 18 liên hệ chưa trả lời</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-warning"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Invoice Example -->
            <div class="col-xl-8 col-lg-7 mb-4">
              <div class="card">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Đơn hàng mới </h6>
                  <a class="m-0 float-right btn btn-danger btn-sm" href="${pageContext.request.contextPath}/admin/order/neworder">Xem thêm <i
                      class="fas fa-chevron-right"></i></a>
                </div>
                <div class="table-responsive">
                  <table class="table align-items-center table-flush">
                    <thead class="thead-light">
                      <tr>
                        <th>ID</th>
                        <th>Người đặt</th>
                        <th>Tổng tiền</th>
                        <th>Thời gian đặt</th>
                        <th>Chức năng</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty newOrderList}">
                    <c:choose>
                    	<c:when test="${newOrderList.size() gt 5}">
                    		<c:forEach begin="0" end="4" var="obj" items="${newOrderList}" >
	                    		<tr>
			                        <td>${obj.orderId}</td>
			                        <td>${obj.users.username}</td>
			                        <td><fmt:formatNumber value="${obj.totalPrice}" type="number"/></td>
			                        <td><span class="badge badge-success"><fmt:formatDate pattern = "HH:mm (dd-MM-yyyy)"  value = "${obj.orderTime}" /></span></td>
			                        <td><a href="${pageContext.request.contextPath}/admin/order/detail/${obj.orderId}" class="btn btn-sm btn-primary">Chi tiết</a></td>
	                      		</tr>
                    		</c:forEach>
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach  var="obj" items="${newOrderList}" >
	                    		<tr>
			                        <td>${obj.orderId}</td>
			                        <td>${obj.users.username}</td>
			                        <td><fmt:formatNumber value="${obj.totalPrice}" type="number"/></td>
			                        <td><span class="badge badge-success"><fmt:formatDate pattern = "HH:mm (dd-MM-yyyy)"  value = "${obj.orderTime}" /></span></td>
			                        <td><a href="${pageContext.request.contextPath}/admin/order/detail/${obj.orderId}" class="btn btn-sm btn-primary">Chi tiết</a></td>
	                      		</tr>
                    		</c:forEach>
                    	</c:otherwise>
                    </c:choose>
                    </c:if>
                    <c:if test="${empty newOrderList}">
                    	<tr>
	             	  		<td colspan="5" align="center">Chưa có đơn hàng mới!</td>
					 	</tr>
                    </c:if>
                    </tbody>
                  </table>
                </div>
                <div class="card-footer"></div>
              </div>
            </div>
            <!-- Message From Customer-->
            <div class="col-xl-4 col-lg-5 ">
              <div class="card">
                <div class="card-header py-4 bg-primary d-flex flex-row align-items-center justify-content-between">
				  <c:set value="0" var="count" ></c:set>	                 
                  <c:if test="${not empty unapprovedLocationList}">
                  	<c:set value="${unapprovedLocationList.size()}" var="count" ></c:set>
                  </c:if>
                  <h6 class="m-0 font-weight-bold text-light">Địa điểm mới chưa duyệt (${count})</h6>
                </div>
                <div style="height:350px; overflow-y: scroll;">
                <c:if test="${not empty unapprovedLocationList}">
                	<c:forEach var="location" items="${unapprovedLocationList}">
                		 <div class="customer-message align-items-center">
		                    <a class="font-weight-bold" href="${pageContext.request.contextPath}/admin/location/edit/${location.locationId}">
		                      <div class="text-truncate message-title">${location.locationName}</div>
		                      <div class="small text-gray-500 message-time font-weight-bold">${location.address}</div>
		                    </a>
		                  </div>
                	</c:forEach>
                </c:if>
                <c:if test="${empty unapprovedLocationList}">
                		 <div class="text-center">
		                    Chưa có địa điểm nào!
		                  </div>
                </c:if>
                </div>
              </div>
            </div>
          </div>
          <!--Row-->
        </div>
        <!---Container Fluid-->
      </div>
>>>>>>> Stashed changes
