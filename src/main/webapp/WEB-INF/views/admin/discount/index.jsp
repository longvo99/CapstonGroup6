<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
	<div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h2 class="m-0 font-weight-bold text-primary">Discount management</h2>
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
                  	<a href="${pageContext.request.contextPath}/admin/discount/add" class="btn btn-success btn-md"><i class="fa fa-plus-square"> Thêm </i></a>
                  </div>
                </div>
                
                <div class="table-responsive p-3">
                <c:if test="${not empty discountList}"> 
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
<<<<<<< Updated upstream
                        <th>ID</th>
                        <th>Tiêu đề giảm giá</th>
                        <th>Ngày bắt đầu</th>
                        <th>Ngày kết thúc</th>
=======
                        <th>ID</th> 
                        <th>Loại giảm giá</th> 
                        <th>Mã giảm giá</th> 
>>>>>>> Stashed changes
                        <th>Chức năng</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${discountList}" var="discount">
<<<<<<< Updated upstream
						<c:set var="urlDel" value="${pageContext.request.contextPath}/admin/discount/del/${discount.discountId}" />
						<tr class="odd gradeX">
							<td>${discount.discountId}</td>
							<td>${discount.discountTitle}</td>
							<td>${discount.startDate}</td>
							<td>${discount.endDate}</td>
							<td class="center text-center">
								<a href="" data-toggle="modal" data-target="#exampleModalCenter${discount.discountId}" class="btn btn-sm btn-success"><i class="fa fa-edit">Detail</i></a>
								<a href="" data-toggle="modal" data-target="#exampleModalCenter${discount.discountId}" class="btn btn-sm btn-primary"><i class="fa fa-edit">Edit</i></a>
=======
						<c:set var="urlDel" value="${pageContext.request.contextPath}/admin/locationType/del/${discount.discountId}" />
						<tr class="odd gradeX">
							<td>${discount.discountId}</td>
							<td>${discount.discountTitle}</td>
							<td>${discount.codeDiscount}</td>
							<td class="center text-center">
								<a href="" data-toggle="modal" data-target="#exampleModalCenter${discount.discountId}" class="btn btn-sm btn-success"><i class="fa fa-edit">Detail</i></a>
								<a href="" data-toggle="modal" data-target="#exampleModalCenter${discount.discountId}" class="btn btn-sm btn-success"><i class="fa fa-edit">Edit</i></a>
>>>>>>> Stashed changes
                                <a href="${urlDel}" title="Xóa" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
							</td>
						</tr>
						<!-- Modal Center -->
			          <div class="modal fade" id="exampleModalCenter${discount.discountId}" tabindex="-1" role="dialog"
			            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			            <div class="modal-dialog modal-dialog-centered" role="document">
			              <div class="modal-content">
			                <div class="modal-header">
			                  <h5 class="modal-title" id="exampleModalCenterTitle">Chi tiết loại địa chỉ: <strong></strong> </h5>
			                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                  </button>
<<<<<<< Updated upstream
			                </div>
			                <div class="modal-body">
				                <form role="form" action="${pageContext.request.contextPath}/admin/discount/edit/${discount.discountId}" method="post" id="form">
				                	<div class="comment-form">
				                		<div class="form-group">
					                      <label for="name">ID</label>
					                      <input class="form-control mb-3" type="text" value="${discount.discountId}" id="discountId" name="discountId">
					                    </div>
										<div class="form-group">
					                      <label for="name">Tiêu đề giảm giá</label>
					                      <input class="form-control mb-3" type="text" value="${discount.discountTitle}" id="discountTitle" name="discountTitle">
					                    </div>
					                    <div class="form-group">
					                      <label for="name">Mã giảm giá</label>
					                      <input class="form-control mb-3" type="text" value="${discount.codeDiscount}" id="codeDiscount" name="codeDiscount">
					                    </div>
					                    <div class="form-group">
					                      <label for="name">Mức giảm giá</label>
					                      <input class="form-control mb-3" type="text" value="${discount.rateDiscount}" id="rateDiscount" name="rateDiscount">
					                    </div>
					                    <div class="form-group">
					                      <label for="name">Mô tả</label>
					                      <input class="form-control mb-3" type="text" value="${discount.description}" id="description" name="description">
					                    </div>
					                    <div class="form-group">
					                      <label for="name">Ngày bắt đầu</label>
					                      <input class="form-control mb-3" type="text" value="${discount.startDate}" id="startDate" name="startDate">
					                    </div>
					                    <div class="form-group">
					                      <label for="name">Ngày kết thúc</label>
					                      <input class="form-control mb-3" type="text" value="${discount.endDate}" id="endDate" name="endDate">
					                    </div>
					                    <div class="form-group">
					                      <label for="name">Đơn hàng tối thiểu</label>
					                      <input class="form-control mb-3" type="text" value="${discount.minimumOrder}" id="minimumOrder" name="minimumOrder">
					                    </div>
					                    <div class="form-group">
					                      <label for="name">Hình ảnh</label>
					                      <input class="form-control mb-3" type="text" value="${discount.discountVideoId}" id="discountVideoId" name="discountVideoId">
=======
			                </div> 
			                <div class="modal-body"> 
				                <form role="form" action="${pageContext.request.contextPath}/admin/discount/edit/${discount.discountId}" method="post" id="form">
				                	<div class="comment-form">
				                		<div class="form-group">
					                      <label for="name">ID loại địa điểm</label>
					                      <input class="form-control mb-3" type="text" value="${discount.discountId}" id="discountId" name="discountId">
					                    </div>
										<div class="form-group">
					                      <label for="name">Tên loại địa điểm</label>
					                      <input class="form-control mb-3" type="text" value="${discount.discounTitle}" id="discounTitle" name="discounTitle">
>>>>>>> Stashed changes
					                    </div>
					                    <div class="form-group">
					                      <label for="name">Tên loại địa điểm</label>
					                      <input class="form-control mb-3" type="text" value="${discount.codeDiscount}" id="codeDiscount" name="codeDiscount">
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
                  <c:if test="${empty discountList}">
					<tr>
						<td colspan="4" align="center">Chưa có mã giảm giá nào!</td>
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