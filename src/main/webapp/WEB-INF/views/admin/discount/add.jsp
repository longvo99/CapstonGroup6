<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>

	<div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="m-0 font-weight-bold text-primarys">Add discount</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Forms</li>
            </ol>
          </div>
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
            <div class="col-lg-12">
              <!-- Form Basic -->
              <div class="card mb-4">
                <div class="card-body">
                  <form role="form" method="post"  name="form-example-1" id="form-example-1" enctype="multipart/form-data">
                  	<div class="form-group">
                      <label for="title">Tiêu đề</label>
                      <input class="form-control mb-3" type="text" value="" id="title" name="title">
                    </div>
                    <div class="form-group">
                      <label for="code">Mã giảm giá</label>
                      <input class="form-control mb-3" type="text" value="" id="code" name="code">
                    </div>
                    <div class="form-group">
                      <label for="description">Mô tả</label>
                      <input class="form-control mb-3" type="text" value="" id="description" name="description">
                    </div>
                   <!--  <div class="form-group">
                      <label for="rateDiscount">Số tiền hoặc số % giảm</label>
                      <input class="form-control mb-3" type="text" value="" id="rateDiscount" name="rateDiscount">
                    </div> -->
                    <div class="row" >
	                    <div class="col-lg-6">
	                    	<label>Loại khuyến mãi</label>
	                    	<select id="typeDiscount" class="form-control">
	                    		<option data-rate="" >--Chọn--</option>
								<option data-rate="%" >Theo phần trăm</option>
								<option data-rate="VNĐ">Theo mức giá cố định</option>
	                      	</select>
	                    </div>
	                    <div class="col-lg-6">
	                    	<label for="rateDiscount">Giá trị khuyến mãi</label>
	                   		<div class="placeholderrd" data-placeholder="">
					    		<input class="form-control mb-3" type="text" value="" id="rateDiscount" name="rateDiscount">
					  		</div>
					  	</div>
					  	<script type="text/javascript">
						   $(function(){
						      $("#typeDiscount").change(function(){
						         $(".placeholderrd").attr("data-placeholder", $(this).find(":selected").data("rate"));
						      });
						   });
						</script>
                    </div>
                    <div class="form-group">
                    	<label for="value">Áp dụng cho</label>
                      	<div class="form-check">
					  		<label class="form-check-label">
				      			<input type="radio" class="form-check-input" name="optradio">Tất cả sản phẩm
							</label>
						</div>
						<div class="form-check">
						  	<label class="form-check-label">
						    	<input type="radio" class="form-check-input" name="optradio">Danh mục sản phẩm
						  	</label>
						</div>
						<div class="form-check disabled">
						  	<label class="form-check-label">
						    	<input type="radio" class="form-check-input" name="optradio">Sản phẩm
						  	</label>
						</div>
                    </div>
                    <div class="form-group">
                      <label for="startDate">Ngày bắt đầu</label>
                      <input class="form-control mb-3" type="datetime-local" id="startDate" name="startDate">
                    </div>
                    <div class="form-group">
                      <label for="endDate">Ngày kết thúc</label>
                      <input class="form-control mb-3" type="datetime-local" id="endDate" name="endDate">
                    </div>
                    <div class="form-group">
                      <label for="limitedUse">Tổng số lần dùng</label>
                      <input class="form-control mb-3" type="text" value="" id="limitedUse" name="limitedUse">
                    </div>
                    <div class="form-group">
                      <label for="limitedPerUse">Số lần dùng/1 người</label>
                      <input class="form-control mb-3" type="text" value="" id="limitedPerUse" name="limitedPerUse">
                    </div>
                    
                    <input type="text" id="productName">
                    <script type="text/javascript">
						$(document).ready(function() {
							$('#productName').autocomplete({
								source : '${pageContext.request.contextPath}/admin/discount/search'
							});
						});
					</script>
                    <div class="form-group">
                      	<label class="text-light-white fs-14">Ảnh</label><br>
                        <img id="blah" alt="your image" style="max-height: 100px; " />
					    <input type="file" onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
                      </div>
                    <button type="submit" class="btn btn-primary" name="submit">Thêm mới</button>
                  </form>
                </div>
              </div>
          <!--Row-->
        </div>
        <!---Container Fluid-->
      </div>