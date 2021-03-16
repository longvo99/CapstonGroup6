<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
	<div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h2 class="m-0 font-weight-bold text-primary">Quản lý chức vụ</h2>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item">Tables</li>
              <li class="breadcrumb-item active" aria-current="page">DataTables</li>
            </ol>
          </div>
          <!-- Row -->
	      <span id="result">
	      	<c:if test="${not empty msg}">
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
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <div class="col-sm-10">
                  	<a href="${pageContext.request.contextPath}/admin/role/add" class="btn btn-success btn-md"><i class="fa fa-plus-square"> Thêm </i></a>
                  </div>
                </div>
                
                <div class="table-responsive p-3">
                <c:if test="${not empty roleList}">
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                        <th>ID</th>
                        <th>Tên loại địa điểm</th>
                        <th>Chức năng</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${roleList}" var="role">
						<c:set var="urlDel" value="${pageContext.request.contextPath}/admin/role/del/${role.roleId}" />
						<tr class="odd gradeX">
							<td>${role.roleId}</td>
							<td>${role.roleName}</td>
							<td class="center text-center">
								<a href="" data-toggle="modal" data-target="#exampleModalCenter${role.roleId}" class="btn btn-sm btn-success"><i class="fa fa-edit">Edit</i></a>
                                <a href="${urlDel}" title="Xóa" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
							</td>
						</tr>
						<!-- Modal Center -->
			          <div class="modal fade" id="exampleModalCenter${role.roleId}" tabindex="-1" role="dialog"
			            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			            <div class="modal-dialog modal-dialog-centered" role="document">
			              <div class="modal-content">
			                <div class="modal-header">
			                  <h5 class="modal-title" id="exampleModalCenterTitle">Chi tiết chức vụ: <strong></strong> </h5>
			                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                  </button>
			                </div>
			                <div class="modal-body">
				                <form role="form" action="${pageContext.request.contextPath}/admin/role/edit" method="post" id="form">
				                	<div class="comment-form">
				                		<div class="form-group">
					                      <label for="name">ID</label>
					                      <input class="form-control mb-3" type="text" value="${role.roleId}" id="roleId" name="roleId">
					                    </div>
										<div class="form-group">
					                      <label for="name">Tên chức vụ</label>
					                      <input class="form-control mb-3" type="text" value="${role.roleName}" id="roleName" name="roleName">
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
                  <c:if test="${empty roleList}">
					<tr>
						<td colspan="4" align="center">Chưa có chức vụ nào!</td>
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