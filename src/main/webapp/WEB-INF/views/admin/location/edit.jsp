<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
	<div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <%-- <%@ include file="/templates/admin/inc/topbar.jsp" %> --%>
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="m-0 font-weight-bold text-primarys">Edit location</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Forms</li>
            </ol>
          </div>
		<%-- <%
        	String name = "";
        	String preview = "";
        	String detail = "";
        	String picture = "";
        	int catId = 0;
            	if(request.getAttribute("objNews") != null){
	        		News objNews = (News) request.getAttribute("objNews");
	        		name = objNews.getName();
       	   			preview = objNews.getPreview();
       	    		detail = objNews.getDetail();
       	    		picture = objNews.getPicture();
       	    		catId = objNews.getCat().getId();
	             }
               	if(request.getParameter("msg") != null){
               		int code = Integer.parseInt(request.getParameter("msg"));
               		switch(code){
               			case 0: out.print(CodeMessageUtil.displayMessage2(out, "Có lỗi khi sửa")); break;
               		}
                }
        %> --%>
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
						<%-- <%
                        	if(request.getAttribute("listCat") != null){
                         		ArrayList<Category> listCat= (ArrayList<Category>) request.getAttribute("listCat");
                          		if(listCat.size() >0 ){
                          			for(Category objCat : listCat){
                      	%>    
                       	<% if(objCat.getId() == catId){ %>  
                        	<option selected="selected" value="<%=objCat.getId()%>"><%=objCat.getName() %></option>
                        <%} else { %>  
                        	<option value="<%=objCat.getId()%>"><%=objCat.getName() %></option>
						<%}}}} %> --%>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="locationtype">Location Type</label>
                      <select class="form-control" id="locationtype" name="locationtype">
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
                      <select class="form-control" id=""country"" name=""country"">
                      </select>
                    </div>
                    <div class="form-group">
	                  <label for="picture">Hình ảnh</label>
	                  <input type="file" name="picture" />
	                  <%-- <% if(!"".equals(picture)) { %>
	                      <br/>
	                      <img width="200px" height="200px" alt="Ảnh"
	                      src="<%=request.getContextPath()%>/templates/admin/img/<%=picture %>">
                      <%} else { %>
                     	 <p style="color: red">Không có hình ảnh!</p>
                      <%} %> --%>
                    </div>
                    <button type="submit" class="btn btn-primary" name="submit">Sửa</button>
                  </form>
                </div>
              </div>
          <!--Row-->
        </div>
        <!---Container Fluid-->
      </div>