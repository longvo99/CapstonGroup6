<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
	<div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h2 class="m-0 font-weight-bold text-primary">Quản lý locations</h2>
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
                        <th>Name</th>
                        <th>Category</th>
                        <th>Chức năng</th>
                      </tr>
                    </thead>
                    <tbody>
                      <%-- <c:forEach items="${userList}" var="user">
						<c:set var="urlEdit" value="${contentPath}/edit/${user.locationVideoId}" />
						<c:set var="urlDel" value="${contentPath}/del/${user.locationVideoId}" />
						<tr class="odd gradeX">
							<td>${user.locationVideoId}</td>
							<td>${user.locationVideoPath}</td>
							<td>${user.locationVideoAtl}</td>
							<td class="center text-center">
								<a href="${urlEdit}" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Edit</a>
                                   <a href="${urlDel}" title="Xóa" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Delete</a>
							</td>
						</tr>
					  </c:forEach> --%>
					  	<tr class="odd gradeX">
							<td>a</td>
							<td>b</td>
							<td>c</td>
							<td class="center text-center">
								<a href="" data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-sm btn-success"><i class="fa fa-edit"> Detail </i></a>
								<a href="" class="btn btn-sm btn-primary"><i class="fa fa-edit"> Edit </i></a>
                                <a href=""  class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa không');"><i class="fas fa-trash"> Xóa </i></a>
							</td>
						</tr>
						<!-- <tr>
							<td colspan="4" align="center">Chưa có người dùng nào!</td>
						</tr> -->
						<!-- Modal Center -->
			          <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
			            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			            <div class="modal-dialog modal-dialog-centered" role="document">
			              <div class="modal-content">
			                <div class="modal-header">
			                  <h5 class="modal-title" id="exampleModalCenterTitle">Location Detail: <strong></strong> </h5>
			                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                  </button>
			                </div>
			                <div class="modal-body">
			                	<div class="comment-form">
										<div class="form-group">
					                      <label for="name">Location Name</label>
					                      <input class="form-control mb-3" type="text" value="" id="name" name="name">
					                    </div>
					                    <div class="form-group">
					                      <label for="address">Address</label>
					                      <input class="form-control mb-3" type="text" value="" id="address" name="address">
					                    </div>
					                    <div class="form-group">
					                      <label for="opentime">Open Time</label>
					                      <input class="form-control mb-3" type="text" value="" id="opentime" name="opentime">
					                    </div>
					                    <div class="form-group">
					                      <label for="closetime">Close Time</label>
					                      <input class="form-control mb-3" type="text" value="" id="closetime" name="closetime">
					                    </div>
					                    <div class="form-group">
					                      <label for="locationcategory">Location Category</label>
					                      <input class="form-control mb-3" type="text" value="" id="locationcategory" name="locationcategory">
					                    </div>
					                    <div class="form-group">
					                      <label for="locationtype">Location Type</label>
					                      <input class="form-control mb-3" type="text" value="" id="locationtype" name="locationtype">
					                    </div>
					                    <div class="form-group">
					                      <label for="ward">Ward</label>
					                      <input class="form-control mb-3" type="text" value="" id="ward" name="ward">
					                    </div>
					                    <div class="form-group">
					                      <label for="district">District</label>
					                      <input class="form-control mb-3" type="text" value="" id="district" name="district">
					                    </div>
					                    <div class="form-group">
					                      <label for="city">City</label>
					                      <input class="form-control mb-3" type="text" value="" id="city" name="city">
					                    </div>
					                    <div class="form-group">
					                      <label for="country">Country</label>
					                      <input class="form-control mb-3" type="text" value="" id="country" name="country">
					                    </div>
								</div>
			                </div>
			              </div>
			            </div>
			          </div>
			          <!-- Modal Center -->
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