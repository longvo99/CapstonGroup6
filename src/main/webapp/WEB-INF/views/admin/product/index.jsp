<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
<sec:authentication var="userDetail" property="principal" />
	<c:choose>
		<c:when test="${not empty sessionScope.userSession}">
			<c:set var="addUrl" value="${pageContext.request.contextPath}/public/product/add" />
			<c:set var="editUrl" value="${pageContext.request.contextPath}/public/product/edit" />
			<c:set var="deleteUrl" value="${pageContext.request.contextPath}/public/product/delete" />
		</c:when>
		<c:otherwise>
			<c:set var="addUrl" value="${pageContext.request.contextPath}/admin/product/add" />
			<c:set var="editUrl" value="${pageContext.request.contextPath}/admin/product/edit" />
			<c:set var="deleteUrl" value="${pageContext.request.contextPath}/admin/product/delete" />
		</c:otherwise>
	</c:choose>
	<div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h2 class="m-0 font-weight-bold text-primary">Quản lý sản phẩm</h2>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Trang chủ</a></li>
              <li class="breadcrumb-item">Bảng</li>
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
                  	<c:if test="${empty sessionScope.userSession}">
                  	<c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
	               		<a href="${addUrl}/${locationId}" class="btn btn-success btn-md"><i class="fa fa-plus-square"> Thêm </i></a>
	               	</c:if>
	               	</c:if>
                  </div>
                </div>
                
                <div class="table-responsive p-3">
                <c:if test="${not empty productList}">
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                        <th>ID</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Loại sản phẩm</th>
                        <th>Chức năng</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${productList}" var="product">
						<tr class="odd gradeX">
							<td>${product.productId}</td>
							<td>${product.name}</td>
							<td>${product.price}</td>
							<td>${product.productCategory.productCategoryName}</td>
							<td class="center text-center">
								<a href="" data-toggle="modal" data-target="#exampleModalCenter${product.productId}" class="btn btn-sm btn-success"><i class="fa fa-edit">Detail</i></a>
								<c:if test="${empty sessionScope.userSession}">
								<c:if test="${userDetail.user.role.roleId eq 'ADMIN'}">
			                  		<a href="${editUrl}/${product.productId}" class="btn btn-sm btn-primary"><i class="fa fa-edit">Edit</i></a>
                                	<a href="${deleteUrl}/${product.productId}" title="Xóa" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
			                  	</c:if>
			                  	</c:if>
							</td>
						</tr>
						<!-- Modal Center -->
			          <div class="modal fade" id="exampleModalCenter${product.productId}" tabindex="-1" role="dialog"
			            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			            <div class="modal-dialog modal-dialog-centered" role="document">
			              <div class="modal-content">
			                <div class="modal-header">
			                  <h5 class="modal-title" id="exampleModalCenterTitle">Chi tiết sản phẩm: <strong></strong> </h5>
			                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                  </button>
			                </div>
			                <div class="modal-body">
				                <form role="form" action="${editUrl}/${product.productId}" method="post" id="form">
				                	<div class="comment-form">
				                		<div class="form-group">
					                      <label for="name">ID</label>
					                      <input class="form-control mb-3" type="text" value="${product.productId}" id="productId" name="productId" readonly>
					                    </div>
										<div class="form-group">
					                      <label for="name">Tên sản phẩm</label>
					                      <input class="form-control mb-3" type="text" value="${product.name}" id="name" name="name" readonly>
					                    </div>
					                    <div class="form-group">
					                      <label for="name">Tên giá</label>
					                      <input class="form-control mb-3" type="text" value="${product.price}" id="price" name="price" readonly>
					                    </div>
					                    <div class="form-group">
					                      <label for="name">Tên mô tả</label>
					                      <input class="form-control mb-3" type="text" value="${product.describe}" id="describe" name="describe" readonly>
					                    </div>
					                    <div class="form-group">
					                      <label for="name">Số lần đặt hàng</label>
					                      <input class="form-control mb-3" type="text" value="${product.orderCount}" id="orderCount" name="orderCount" readonly>
					                    </div>
					                    <div class="form-group">
					                      <label for="name">Loại sản phẩm</label>
					                      <input class="form-control mb-3" type="text" value="${product.productCategory.productCategoryName}" id="productCategory.productCategoryId" name="productCategory.productCategoryId" readonly>
					                    </div>
					                    <div class="form-group">
					                    	<label for="name">Hình ảnh</label>
									    	<div class="ml-2 col-sm-6">
											  <img src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${product.imagePath}" class="img-thumbnail">
											</div>
									    </div>
									    <c:if test="${empty sessionScope.userSession}">
									    <c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
			                  				<div class="form-group">
					                      		<input class="form-control mb-3" type="submit" value="SỬA">
					                    	</div>
			                  			</c:if>
			                  			</c:if>
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
                  <c:if test="${empty productList}">
					<tr>
						<td colspan="4" align="center">Chưa có sản phẩm nào!</td>
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