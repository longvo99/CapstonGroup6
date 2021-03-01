<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
	<div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h2 class="m-0 font-weight-bold text-primary">Quản lý người dùng</h2>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item">Tables</li>
              <li class="breadcrumb-item active" aria-current="page">DataTables</li>
            </ol>
          </div>
          <!-- Row -->
	        <span id="result"></span>
          <div class="row">
            <!-- DataTable with Hover -->
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <div class="col-sm-10">
                  	<a href="${pageContext.request.contextPath}/admin/user/add" class="btn btn-success btn-md"><i class="fa fa-plus-square"> Thêm </i></a>
                  </div>
                </div>
                <div class="table-responsive p-3">
                <c:if test="${not empty userList}">
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                        <th>ID</th>
                        <th>Tên người dùng</th>
                        <th>Số điến thoại</th>
                        <th>Chức năng</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${userList}" var="user">
						<c:set var="urlEdit" value="${pageContext.request.contextPath}/admin/user/edit/${user.userId}" />
						<c:set var="urlDel" value="${pageContext.request.contextPath}/admin/user/del/${user.userId}" />
						<tr class="odd gradeX">
							<td>${user.userId}</td>
							<td>${user.fullname}</td>
							<td>${user.phone}</td>
							<td class="center text-center">
								<a href="" data-toggle="modal" data-target="#exampleModalCenter${user.userId}" class="btn btn-sm btn-success"><i class="fa fa-edit"> Detail </i></a>
								<a href="" data-toggle="modal" data-target="#exampleModalCenter${user.userId}" class="btn btn-sm btn-primary"><i class="fa fa-edit">Edit</i></a>
                                <a href="${urlDel}" title="Xóa" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
							</td>
						</tr>
						<!-- Modal Center -->
			          <div class="modal fade" id="exampleModalCenter${user.userId}" tabindex="-1" role="dialog"
			            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			            <div class="modal-dialog modal-dialog-centered" role="document">
			              <div class="modal-content">
			                <div class="modal-header">
			                  <h5 class="modal-title" id="exampleModalCenterTitle">user Detail: <strong></strong> </h5>
			                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                  </button>
			                </div>
			                <div class="modal-body">
			                	<div class="comment-form">
										<div class="form-group">
					                      <label for="name">Tài khoản</label>
					                      <input class="form-control mb-3" type="text" value="${user.username}" id="userName" name="userName">
					                    </div>
					                    <div class="form-group">
					                      <label for="address">Họ và Tên</label>
					                      <input class="form-control mb-3" type="text" value="${user.fullname}" id="fullname" name="fullname">
					                    </div>
					                    <div class="form-group">
					                      <label for="opentime">Số điện thoại</label>
					                      <input class="form-control mb-3" type="text" value="${user.phone}" id="phone" name="phone">
					                    </div>
					                    <div class="form-group">
					                      <label for="closetime">Email</label>
					                      <input class="form-control mb-3" type="text" value="${user.email}" id="email" name="email">
					                    </div>
					                    <div class="form-group">
					                      <label for="usercategory">Địa chỉ</label>
					                      <input class="form-control mb-3" type="text" value="${user.address}" id="address" name="address">
					                    </div>
					                    <div class="form-group">
					                      <label for="usertype">Giới tính</label>
					                      <input class="form-control mb-3" type="text" value="${user.gender}" id="gender" name="gender">
					                    </div>
					                    <div class="form-group">
					                      <label for="ward">Ngày sinh</label>
					                      <input class="form-control mb-3" type="text" value="${user.dateOfBirth}" id="dateOfBirth" name="dateOfBirth">
					                    </div>
					                    <div class="form-group">
					                      <label for="district">Ngày tạo tài khoản</label>
					                      <input class="form-control mb-3" type="text" value="${user.joinDate}" id="joinDate" name="joinDate">
					                    </div>
					                    <div class="form-group">
					                      <label for="city">Trạng thái tài khoản</label>
					                      <input class="form-control mb-3" type="text" value='<c:choose><c:when test="${user.banned}">Đã khóa</c:when><c:when test="${user.banned}">Đã ẩn</c:when><c:otherwise>Đang hoạt động</c:otherwise></c:choose>' id="status" name="status">
					                    </div>
					                    <div class="form-group">
					                      <label for="country">Chức vụ</label>
					                      <input class="form-control mb-3" type="text" value="${user.roleName}" id="roleId" name="roleId">
					                    </div>
								</div>
			                </div>
			              </div>
			            </div>
			          </div>
			          <!-- Modal Center -->
			          </c:forEach>
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