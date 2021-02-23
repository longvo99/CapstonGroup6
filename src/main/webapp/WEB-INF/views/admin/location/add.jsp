<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
	<div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <%-- <%@ include file="/templates/admin/inc/topbar.jsp" %> --%>
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="m-0 font-weight-bold text-primarys">Add location</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Forms</li>
            </ol>
          </div>

          <div class="row">
            <div class="col-lg-12">
              <!-- Form Basic -->
              <div class="card mb-4">
                <div class="card-body">
                  <form role="form" method="post" enctype="multipart/form-data" id="form">
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
                      <input class="form-control mb-3" type="time" value="" id="opentime" name="opentime">
                    </div>
                    <div class="form-group">
                      <label for="closetime">Close Time</label>
                      <input class="form-control mb-3" type="time" value="" id="closetime" name="closetime">
                    </div>
                    <div class="form-group">
                      <label for="locationcategory">Location Category</label>
                      <select class="form-control" id="locationcategory" name="locationcategory">
	                      <c:if test="${not empty locationCategoriesList1}">
	                      	<c:forEach items="${locationCategoriesList1}" var="cat1">
	                      	<optgroup label="${cat1.locationCategoryName}">
							        <c:forEach items="${locationCategoriesList2}" var="cat2">
							        <c:if test="${cat2.parentId eq cat1.locationCategoryId}">
								        <option>${cat2.locationCategoryName}</option>
								    </c:if>
								    </c:forEach>
							</optgroup>    
							 </c:forEach>
						  </c:if>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="locationtype">Location Type</label>
                      <select class="form-control" id="locationtype" name="locationtype">
                      <c:if test="${not empty locationTypesList}">
                      	<c:forEach items="${locationTypesList}" var="type">
							<option value="${type.locationTypeId}">${type.locationTypeName}</option>
						 </c:forEach>
					  </c:if>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="ward">Ward</label>
                      <select class="form-control" id="ward" name="ward">
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="district">District</label>
                      <select class="form-control" id="district" name="district">
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="city">City</label>
                      <select class="form-control" id="city" name="city">
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="country">Country</label>
                      <select class="form-control" id="country" name="country">
                      </select>
                    </div>
                    <div class="form-group">
	                  <label for="picture">Hình ảnh</label>
	                  <input type="file" name="picture" />
                    </div>
                    <button type="submit" class="btn btn-primary" name="submit">Sửa</button>
                  </form>
                </div>
              </div>
          <!--Row-->
        </div>
        <!---Container Fluid-->
      </div>