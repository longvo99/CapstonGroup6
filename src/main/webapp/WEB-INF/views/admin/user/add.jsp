<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery.validate.min.js"></script>
	<div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="m-0 font-weight-bold text-primarys">Thêm tài khoản</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Forms</li>
            </ol>
          </div>
		  <span id="result">
	      	<c:if test="${not empty msg}">
					<div class="alert alert-success">
						<strong>${msg}</strong>
					</div>
				</c:if>
	      </span>
          <div class="row">
            <div class="col-lg-12">
              <!-- Form Basic -->
              <div class="card mb-4">
                <div class="card-body">
                  <form action="${pageContext.request.contextPath}/admin/user/add" role="form" method="post"  name="form" id="form">
                  	<div class="form-group">
                      <label for="username">Tên tài khoản</label>
                      <input class="form-control mb-3" type="text" value="${users.username}" id="username" name="username" >
                    </div>
                    <div class="form-group">
                      <label for="contactEmail">Email</label>
                      <input class="form-control mb-3" type="text" value="${users.contactEmail}" id="contactEmail" name="contactEmail" >
                    </div>
                   	<div class="form-group">
                      <label>Chức vụ</label>
                      <select class="form-control" id="role" name="role.roleId">
                      <c:if test="${not empty roleList}">
                      	<c:forEach items="${roleList}" var="role">
                      		<c:if test="${role.roleId ne 'CUSTOMER' && role.roleId ne 'ADMIN'}">
                      			<option value="${role.roleId}">${role.roleName}</option>
                      		</c:if>
						 </c:forEach>
					  </c:if>
                      </select>
                    </div>
                    <button type="submit" class="btn btn-primary" name="submit">Cập nhập</button>
                  </form>
                </div>
              </div>
          <!--Row-->
        </div>
        <!---Container Fluid-->
      </div>
<script type="text/javascript">
	$().ready(function() {
		$.validator.addMethod("validUsername", function (value, element) {
		    return /^[a-zA-Z0-9_.-]+$/.test(value);
		}, "Tài khoản chứa kí tự không hợp lệ");
		var validator = $("#form").validate({
			errorPlacement: function(error, element){
				$(element).closest("form").find("label[for='" + element.attr("id") + "']").append(error);
			},
			errorElement: "span",
			ignore: [],
			rules:{
				username: {                      //lay name
					required:true,
					validUsername: true,
				},
				contactEmail: {                      
					required:true,
					email: true,
				},
			},
			messages: {
				username: {
					required: " (Mời nhập)",
				},
				contactEmail: {
					required: " (Mời nhập)",
					email: " (Nhập đúng định dạng)",
				},
			},
		});
	});
</script>