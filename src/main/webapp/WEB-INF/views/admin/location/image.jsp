<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
	<sec:authentication var="userDetail" property="principal" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/assets/js/image-uploader.min.js"></script>
	<div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <%-- <%@ include file="/templates/admin/inc/topbar.jsp" %> --%>
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="m-0 font-weight-bold text-primarys">Cập nhập hình ảnh</h1>
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
                  <form role="form" method="post" action="${pageContext.request.contextPath}/admin/location/image/edit/${locationId}"  name="form-example-1" id="form-example-1" enctype="multipart/form-data">
                    <div class="input-field">
				        <label class="active">Hình ảnh</label>
				        <div class="input-images" style="padding-top: .5rem;"></div>
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
      let preloaded = [
    	<c:if test="${not empty imagePath}">
		    	<c:forEach items="${imagePath}" var="image">
		    		<c:if test="${image != ''}"> 
		  	  		{id: 1, src: '${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${image}'},
		  	  	 	</c:if>
		  	  	</c:forEach>
	    </c:if>
    	];
      	$('.input-images').imageUploader({
      	    preloaded: preloaded,
      	    imagesInputName: 'images',
      	    preloadedInputName: 'image'
      	});
       </script>