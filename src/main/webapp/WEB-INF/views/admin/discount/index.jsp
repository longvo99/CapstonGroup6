<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/discount"/>
	<div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h2 class="m-0 font-weight-bold text-primary">Quản lý giảm giá</h2>
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
                  	<a href="${contextPath}/add" class="btn btn-success btn-md"><i class="fa fa-plus-square"> Thêm </i></a>
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
                        <th>ID</th>
                        <th>Title</th>
                        <th>Mã giảm giá</th>
                        <th>Value</th>
                        <!-- <th class="center text-center">Chức năng</th> -->
                        <th>Chức năng</th>
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
							<td>${discount.code}</td>
							<td>${discount.value}</td>
							<td class="center text-center">
								<a href="" data-toggle="modal" data-target="#exampleModalCenter${discount.discountId}" class="btn btn-sm btn-primary"><i class="fa fa-edit"> Chi tiết </i></a>
								<a href="${contextPath}/edit/${discount.discountId}" class="btn btn-sm btn-warning"><i class="fa fa-edit"> Sửa </i></a>
							</td>
							<td class="center text-center">
   								<input type="checkbox" class="checkbox" name="check[]" id="customCheck1" value="${discount.discountId}" style="zoom: 1.5;">
            				</td>
							<%-- <td class="center text-center">
								<a href="${pageContext.request.contextPath}/admin/location/edit/${location.locationId}" class="btn btn-sm btn-success"><i class="fa fa-edit">Chi tiết</i></a>
                                <a href="${pageContext.request.contextPath}/admin/location/image/${location.locationId}" class="btn btn-sm btn-primary"><i class="fa fa-edit">Hình ảnh</i></a>
                                <a href="${pageContext.request.contextPath}/admin/product/index/${location.locationId}" class="btn btn-sm btn-primary"><i class="fa fa-edit">Sản phẩm</i></a>
                                <a href="${pageContext.request.contextPath}/admin/location/delete"  class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa không');"><i class="fas fa-trash"> Xóa </i></a>
							</td> --%>
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
										<div class="form-group">
					                      <label for="name">Id</label>
					                      <input class="form-control mb-3" type="text" value="${discount.discountId}" id="locationId" name="locationId">
					                    </div>
										<div class="form-group">
					                      <label for="name">Tên giảm giá</label>
					                      <input class="form-control mb-3" type="text" value="${discount.title}" id="locationName" name="locationName">
					                    </div>
					                    <div class="form-group">
					                      <label for="address">Mã giảm giá</label>
					                      <input class="form-control mb-3" type="text" value="${discount.code}" id="address" name="address">
					                    </div>
					                    <div class="form-group">
					                      <label for="address">Áp dụng cho</label>
					                      <input class="form-control mb-3" type="text" value="${discount.value}" id="address" name="address">
					                    </div>
					                    <div class="form-group">
					                      <label for="opentime">Giảm bao nhiêu</label>
					                      <input class="form-control mb-3" type="text" value="${discount.rateDiscount}" id="opentime" name="opentime">
					                    </div>
					                    <div class="form-group">
					                      <label for="locationcategory">Ngày bắt đầu</label>
					                      <input class="form-control mb-3" type="text" value="${discount.startDate}" id="locationcategory" name="locationcategory">
					                    </div>
					                    <div class="form-group">
					                      <label for="locationtype">Ngày kết thúc</label>
					                      <input class="form-control mb-3" type="text" value="${discount.endDate}" id="locationtype" name="locationtype">
					                    </div>
					                    <div class="form-group">
					                      <label for="locationtype">Người tạo</label>
					                      <input class="form-control mb-3" type="text" value="${discount.users.username}" id="locationtype" name="locationtype">
					                    </div>
					                    <div class="form-group">
					                      <label for="locationtype">Giới hạn dùng (lần)</label>
					                      <input class="form-control mb-3" type="text" value="${discount.limitedUse}" id="locationtype" name="locationtype">
					                    </div>
					                    <div class="form-group">
					                      <label for="locationtype">Số lần dùng/Người</label>
					                      <input class="form-control mb-3" type="text" value="${discount.limitedPerUse}" id="locationtype" name="locationtype">
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
							<td colspan="4" align="center">Chưa có địa điểm nào!</td>
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
			window.location.href = "${pageContext.request.contextPath}/admin/contact/del/" + str;
       } else {return;}
   };
</script>