<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
<sec:authentication var="userDetail" property="principal" />
<c:choose>
	<c:when test="${not empty sessionScope.userSession}">
		<c:set var="addUrl" value="${pageContext.request.contextPath}/public/discount/add" />
		<c:set var="editUrl" value="${pageContext.request.contextPath}/public/discount/edit" />
		<c:set var="deleteUrl" value="${pageContext.request.contextPath}/public/discount/del" />
	</c:when>
	<c:otherwise>
		<c:set var="addUrl" value="${pageContext.request.contextPath}/admin/discount/add" />
		<c:set var="editUrl" value="${pageContext.request.contextPath}/admin/discount/edit" />
		<c:set var="deleteUrl" value="${pageContext.request.contextPath}/admin/discount/del" />
	</c:otherwise>
</c:choose>
	<div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h2 class="m-0 font-weight-bold text-primary">Quản lý giảm giá</h2>
            <ol class="breadcrumb">
              <c:set var="actionIndex" value="${pageContext.request.contextPath}/admin/index" />
              <c:if test="${not empty sessionScope.userSession}">
              		<c:set var="actionIndex" value="${pageContext.request.contextPath}/public/index" />
              </c:if>
              <li class="breadcrumb-item"><a href="${actionIndex}">Trang chủ</a></li>
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
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <div class="col-sm-10">
                  	<a href="${addUrl}" class="btn btn-success btn-md"><i class="fa fa-plus-square"> Thêm </i></a>
                  </div>
                  <div style="margin-right: 40px;">
                  	<a href="javascript:void(0)" id="btnDel" class="btn btn-danger btn-md"><i class="fas fa-trash"> Xóa </i></a>
                  </div>
                </div>
                <div class="table-responsive p-3">
                <c:if test="${not empty discountList}">
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                      	<th class="center text-center">ID</th>
                        <th class="center text-center">Tiêu đề</th>
                        <th class="center text-center">Tên nhà hàng</th>
                        <th class="center text-center">Địa chỉ</th>
                        <th class="center text-center">Chức năng</th>
						<th>
     						<label><input type="checkbox" id="select_all"/> Selecct All</label>
     	                </th>
                      </tr>
                    </thead>
                    <tbody>
					  <c:forEach items="${discountList}" var="discount">
					  	<tr class="odd gradeX">
					  		<td>${discount.discountId}</td>
							<td>${discount.title}</td>
							<td>${discount.location.locationName}</td>
							<td>${discount.location.address}</td>
							<td class="center text-center">
								<a href="" data-toggle="modal" data-target="#exampleModalCenter${discount.discountId}" class="btn btn-sm btn-success" title="CHI TIẾT"><i class="fas fa-info-circle"></i></a>
								<c:if test="${empty sessionScope.userSession}">
								<c:if test="${userDetail.user.role.roleId eq discount.users.role.roleId}">
									<a href="${editUrl}/${discount.discountId}" class="btn btn-sm btn-primary" title="SỬA"><i class="fa fa-edit"></i></a>
								</c:if>	
								</c:if>
								<c:if test="${not empty sessionScope.userSession}">
									<a href="${editUrl}/${discount.discountId}" class="btn btn-sm btn-primary" title="SỬA"><i class="fa fa-edit"></i></a>
								</c:if>
							</td>
							<td class="center text-center">
								<c:if test="${empty sessionScope.userSession}">
								<c:if test="${userDetail.user.role.roleId eq discount.users.role.roleId}">
									<input type="checkbox" class="checkbox" name="check[]" id="customCheck1" value="${discount.discountId}" style="zoom: 1.5;">
								</c:if>	
								</c:if>
								<c:if test="${not empty sessionScope.userSession}">
									<input type="checkbox" class="checkbox" name="check[]" id="customCheck1" value="${discount.discountId}" style="zoom: 1.5;">
								</c:if>
            				</td>
						</tr>
						<!-- Modal Center -->
			          <div class="modal fade" id="exampleModalCenter${discount.discountId}" tabindex="-1" role="dialog"
			            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			            <div class="modal-dialog modal-dialog-centered" role="document">
			              <div class="modal-content">
			                <div class="modal-header">
			                  <h5 class="modal-title" id="exampleModalCenterTitle">Chi tiết giảm giá: <strong></strong> </h5>
			                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                  </button>
			                </div>
			                <div class="modal-body">
			                	<div class="comment-form">
				                	<form action="${contextPath}/edit" method="POST">
					                      <input disabled="disabled" class="form-control mb-3" type="hidden" value="${discount.discountId}">
					                      <c:if test="${empty sessionScope.userSession}">
										<c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
					                    <div class="form-group">
					                      <label for="name">Tên nhà hàng</label>
					                      <input disabled="disabled" class="form-control mb-3" type="text" value="${discount.location.locationName}">
					                    </div>
					                    </c:if></c:if>
					                   <c:if test="${not empty sessionScope.userSession}">
					                    <div class="form-group">
					                      <label for="name">Tên nhà hàng</label>
					                      <input disabled="disabled" class="form-control mb-3" type="text" value="${discount.location.locationName}">
					                    </div>
					                   </c:if>
										<div class="form-group">
					                      <label for="name">Tiêu đề</label>
					                      <input disabled="disabled" class="form-control mb-3" type="text" value="${discount.title}">
					                    </div>
					                    <div class="form-group">
					                      <label for="name">Mô tả</label>
					                      <textarea disabled="disabled" class="form-control mb-3" rows="3">${discount.description}</textarea>
					                    </div>
					                   <%--  <div class="form-group">
					                      <label for="address">Mã giảm giá</label>
					                      <input disabled="disabled" class="form-control mb-3" type="text" value="${discount.code}">
					                    </div> --%>
					                    <div class="form-group">
					                      <label for="address">Áp dụng cho</label>
					                      <textarea disabled="disabled" class="form-control mb-3" rows="3">${discount.value}</textarea>
					                    </div>
					                    <div class="form-group">
					                      <label for="opentime">Giảm bao nhiêu</label>
					                      <c:if test="${discount.rateDiscount le 100}">
					                      	<c:set var="rd" value="${discount.rateDiscount}%" ></c:set>
					                      </c:if>
					                      <c:if test="${discount.rateDiscount gt 100}">
					                      	<c:set var="rd" value="${discount.rateDiscount} VNĐ" ></c:set>
					                      </c:if>
					                      <input disabled="disabled" class="form-control mb-3" type="text" value="${rd}">
					                    </div>
					                    <c:if test="${empty sessionScope.userSession}">
										<c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
											<div class="form-group">
						                      <label for="opentime">Điều kiện giảm</label>
						                      <input disabled="disabled" class="form-control mb-3" type="text" 
						                      value="${discount.discountRule.ruleContent}">
						                    </div>
						                    <div class="form-group">
						                      <label for="opentime">Giá trị tối thiểu của điều kiện giảm</label>
						                      <input disabled="disabled" class="form-control mb-3" type="text" value="${discount.valueRule}">
						                    </div>
										</c:if></c:if>
										<c:if test="${not empty sessionScope.userSession}">
											<div class="form-group">
						                      <label for="opentime">Điều kiện giảm</label>
						                      <input disabled="disabled" class="form-control mb-3" type="text" 
						                      value="${discount.discountRule.ruleContent}">
						                    </div>
						                    <div class="form-group">
						                      <label for="opentime">Giá trị tối thiểu của điều kiện giảm</label>
						                      <input disabled="disabled" class="form-control mb-3" type="text" value="${discount.valueRule}">
						                    </div>
										</c:if>
					                    <div class="form-group">
					                      <label for="locationcategory">Ngày bắt đầu</label>
					                      <input disabled="disabled" class="form-control mb-3" type="text" value="${discount.startDate}">
					                    </div>
					                    <div class="form-group">
					                      <label for="locationtype">Ngày kết thúc</label>
					                      <input disabled="disabled" class="form-control mb-3" type="text" value="${discount.endDate}">
					                    </div>
					                    <div class="form-group">
					                      <label for="locationtype">Người tạo</label>
					                      <input disabled="disabled" class="form-control mb-3" type="text" value="${discount.users.username}">
					                    </div>
					                    <div class="form-group">
					                      <label for="locationtype">Giới hạn dùng (lần)</label>
					                      <input disabled="disabled" class="form-control mb-3" type="text" value="${discount.limitedUse}">
					                    </div>
					                    <div class="form-group">
					                      <label for="locationtype">Số lần dùng/Người</label>
					                      <input disabled="disabled" class="form-control mb-3" type="text" value="${discount.limitedPerUser}">
					                    </div>
					                    <div class="form-group">
					                      <label>Ảnh</label>
					                      <div class="center text-center">
									      	<img style="width: 300px; height: 150px;" src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${discount.mediaPath}">
										  </div>
					                    </div>
									</form>
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
                  <c:if test="${empty discountList}">
						<tr>
							<td colspan="4" align="center">Chưa có giảm giá nào!</td>
						</tr>
				  </c:if>
                </div>
              </div>
            </div>
          </div>
          <!--Row-->
          <!-- Documentation Link -->
        </div>
        <!---Container Fluid-->
      </div>
<script type="text/javascript">
  $("#select_all").change(function(){  //"select all" change 
	    var status = this.checked; // "select all" checked status
	    $('.checkbox').each(function(){ //iterate all listed checkbox items
	        this.checked = status; //change ".checkbox" checked status
	    });
	});
	$('.checkbox').change(function(){ //".checkbox" change 
	    //uncheck "select all", if one of the listed checkbox item is unchecked
	    if(this.checked == false){ //if this item is unchecked
	        $("#select_all")[0].checked = false; //change "select all" checked status to false
	    }
	    //check "select all" if all checkbox items are checked
	    if ($('.checkbox:checked').length == $('.checkbox').length ){ 
	        $("#select_all")[0].checked = true; //change "select all" checked status to true
	    }
	});
  </script>
  <script type="text/javascript">
   document.getElementById('btnDel').onclick = function()
   {
       var checkbox = document.getElementsByName('check[]'); //Trả về 1 mảng do các checkbox cùng tên vs nhau
       var kt = true; 
       for (var i = 0; i < checkbox.length; i++){ // Lặp qua từng checkbox để lấy giá trị
           if (checkbox[i].checked == true){
               kt = true; break;
           } else {kt = false;}
       }
       if(kt == false){
       		return alert("Mời bạn chọn tin để xóa!");
       } 
       var x = confirm('Bạn có chắc muốn xóa không');
       if(x == true) {
			var str = "";
	           for (var i = 0; i < checkbox.length; i++){
	               if (checkbox[i].checked == true){
	                   str += checkbox[i].value + ",";
	               } 
	           }
			window.location.href = "${deleteUrl}/" + str;
       } else {return;}
   };
</script>