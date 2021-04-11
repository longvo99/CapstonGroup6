<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
	<div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h2 class="m-0 font-weight-bold text-primary">Đơn hàng đang chờ xử lý</h2>
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
                <c:if test="${not empty newOrderList}">
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
                      <c:forEach items="${newOrderList}" var="order">
						<tr class="odd gradeX">
							<td>${order.orderId}</td>
							<td>${order.users.contactName}</td>
							<td><fmt:formatDate pattern = "HH:mm (dd-MM-yyyy)"  value = "${order.orderTime}" /></td>
							<td style="color:red; font-weight:bold;" >${order.orderStatus.statusName}...</td>
							<td class="center text-center">
								<a href="${pageContext.request.contextPath}/admin/order/detail/${order.orderId}"  class="btn btn-success" ><i class="fa fa-edit">Chi tiết</i></a>
							</td>
						</tr>
			          </c:forEach>
                    </tbody>
                  </table>
                  </c:if>
                  <c:if test="${empty newOrderList}">
					<tr>
						<td colspan="4" align="center">Chưa có đơn đặt hàng nào!</td>
					</tr>
				  </c:if>
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