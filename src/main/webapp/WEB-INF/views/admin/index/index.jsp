<%@ page language="java" contentType="text/html; charset=UTF-8"
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

<p>${users.username}aaa</p>
		    		<%-- <c:if test="${not empty lists}">
		    		<p>bbbbb</p>
									<c:forEach items="lists" var="local">
									<p>${local.locationName}</p>
					          </c:forEach>
					</c:if>	
					<c:if test="${empty lists}">
							<p>cccccc</p>
					</c:if>	 --%>
					 <c:choose>
         <c:when test = "${not empty list}">
            <c:forEach items="list" var="local">
				<p>${local.locationId}</p>
          </c:forEach>
         </c:when>
         <c:when test = "${empty list}">
            Salary is very good.
         </c:when>
         <c:otherwise>
            No comment sir...
         </c:otherwise>
      </c:choose>

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
                      <div class="h5 mb-0 font-weight-bold text-gray-800">Có 5 đơn hàng mới</div>
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
                  <h6 class="m-0 font-weight-bold text-primary">Đơn hàng mới</h6>
                  <a class="m-0 float-right btn btn-danger btn-sm" href="#">Xem thêm <i
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
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><a href="#">01</a></td>
                        <td>Nguyễn Văn A</td>
                        <td>200.000</td>
                        <td><span class="badge badge-success">08:30</span></td>
                        <td><a href="#" class="btn btn-sm btn-primary">Chi tiết</a></td>
                      </tr>
                      <tr>
                        <td><a href="#">02</a></td>
                        <td>Nguyễn Văn B</td>
                        <td>200.000</td>
                        <td><span class="badge badge-success">08:35</span></td>
                        <td><a href="#" class="btn btn-sm btn-primary">Chi tiết</a></td>
                      </tr>
                      <tr>
                        <td><a href="#">03</a></td>
                        <td>Nguyễn Văn C</td>
                        <td>200.000</td>
                        <td><span class="badge badge-success">08:40</span></td>
                        <td><a href="#" class="btn btn-sm btn-primary">Chi tiết</a></td>
                      </tr>
                      <tr>
                        <td><a href="#">04</a></td>
                        <td>Nguyễn Văn D</td>
                        <td>200.000</td>
                        <td><span class="badge badge-success">08:50</span></td>
                        <td><a href="#" class="btn btn-sm btn-primary">Chi tiết</a></td>
                      </tr>
                      <tr>
                        <td><a href="#">05</a></td>
                        <td>Nguyễn Văn E</td>
                        <td>200.000</td>
                        <td><span class="badge badge-success">09:00</span></td>
                        <td><a href="#" class="btn btn-sm btn-primary">Chi tiết</a></td>
                      </tr>
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
                  <h6 class="m-0 font-weight-bold text-light">Địa điểm mới chưa duyệt</h6>
                </div>
                <div>
                  <div class="customer-message align-items-center">
                    <a class="font-weight-bold" href="#">
                      <div class="text-truncate message-title">Nhà Hàng A</div>
                      <div class="small text-gray-500 message-time font-weight-bold">03 - Lê Đại Hành</div>
                    </a>
                  </div>
                  <div class="customer-message align-items-center">
                    <a href="#">
                      <div class="text-truncate message-title">Nhà Hàng B</div>
                      <div class="small text-gray-500 message-time">05 - Lê Đại Hành</div>
                    </a>
                  </div>
                  <div class="customer-message align-items-center">
                    <a class="font-weight-bold" href="#">
                      <div class="text-truncate message-title">Nhà Hàng C</div>
                      <div class="small text-gray-500 message-time font-weight-bold">05 - Lê Lợi</div>
                    </a>
                  </div>
                  <div class="customer-message align-items-center">
                    <a class="font-weight-bold" href="#">
                      <div class="text-truncate message-title">Nhà Hàng D
                      </div>
                      <div class="small text-gray-500 message-time font-weight-bold">20 - Nguyễn Hoàng</div>
                    </a>
                  </div>
                  <div class="card-footer text-center">
                    <a class="m-0 small text-primary card-link" href="#">Xem thêm<i
                        class="fas fa-chevron-right"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--Row-->
        </div>
        <!---Container Fluid-->
      </div>
