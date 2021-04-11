<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
	<div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h2 class="m-0 font-weight-bold text-primary">Quản lý đơn đặt hàng</h2>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Trang chủ</a></li>
              <li class="breadcrumb-item">Bảng</li>
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
                <div class="table-responsive p-3">
                <c:if test="${not empty orderList}">
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                        <th>ID</th>
                        <th>Người đặt hàng</th>
                        <th>Thời gian đặt hàng</th>
                        <th>Trạng thái</th>
                        <th>Chức năng</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${orderList}" var="order">
						<tr class="odd gradeX">
							<td>${order.orderId}</td>
							<td>${order.users.contactName}</td>
							<td>${order.orderTime}</td>
							<c:choose>
								<c:when test="${order.orderStatus.orderStatusId eq 1}">
									<td style="color:red; font-weight:bold;" >${order.orderStatus.statusName}...</td>
								</c:when>
								<c:when test="${order.orderStatus.orderStatusId eq 2}">
									<td style="color:#0000b3; font-weight:bold;" >${order.orderStatus.statusName}</td>
								</c:when>
								<c:when test="${order.orderStatus.orderStatusId eq 3}">
									<td style="color:#0000b3; font-weight:bold;" >${order.orderStatus.statusName} <i style='font-size:24px' class='fas'>&#xf21c;</i></td>
								</c:when>
								<c:when test="${order.orderStatus.orderStatusId eq 4}">
									<td style="color:#258e25; font-weight:bold;" >${order.orderStatus.statusName} <i class="fa fa-check" style="font-size:24px"></i></td>
								</c:when>
								<c:otherwise>
									<td style="font-weight:bold; text-decoration: line-through; font-weight:bold;" >${order.orderStatus.statusName}</td>
								</c:otherwise>
							</c:choose>
							<td class="center text-center">
								<a href="${pageContext.request.contextPath}/admin/order/detail/${order.orderId}"  class="btn btn-success" ><i class="fa fa-edit">Chi tiết</i></a>
							</td>
						</tr>
			          </c:forEach>
                    </tbody>
                  </table>
                  </c:if>
                  <c:if test="${empty orderList}">
					<tr>
						<td colspan="4" align="center">Chưa có đơn đặt hàng nào!</td>
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