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
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                        <th>ID</th>
                        <th>Tên người dùng</th>
                        <th>Fullname</th>
                        <th>Chức năng</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${userList}" var="user">
						<c:set var="urlEdit" value="${contentPath}/edit/${user.locationVideoId}" />
						<c:set var="urlDel" value="${contentPath}/del/${user.locationVideoId}" />
						<tr class="odd gradeX">
							<td>${user.locationVideoId}</td>
							<td>${user.locationVideoPath}</td>
							<td>${user.locationVideoAtl}</td>
							<td class="center text-center">
								<a href="${urlEdit}" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
                                   <a href="${urlDel}" title="Xóa" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
							</td>
						</tr>
					  </c:forEach>
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