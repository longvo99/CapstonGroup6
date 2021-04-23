<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>

<sec:authentication var="userDetail" property="principal" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/css/autocomplete/jquery-ui.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/js/jquery.validate.min.js"></script>
<div id="content-wrapper" class="d-flex flex-column">
	<div id="content">
		<!-- Container Fluid-->
		<div class="container-fluid" id="container-wrapper">
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="m-0 font-weight-bold text-primarys">Edit discount</h1>
				<ol class="breadcrumb">
					<c:set var="actionIndex"
						value="${pageContext.request.contextPath}/admin/index" />
					<c:if test="${not empty sessionScope.userSession}">
						<c:set var="actionIndex"
							value="${pageContext.request.contextPath}/public/index" />
					</c:if>
					<li class="breadcrumb-item"><a href="${actionIndex}">Trang
							chủ</a></li>
					<li class="breadcrumb-item active" aria-current="page">Forms</li>
				</ol>
			</div>
			<c:if test="${not empty msg}">
				<div class="alert alert-success">
					<strong>${msg}</strong>
				</div>
			</c:if>
			<div class="row">
				<div class="col-lg-12">
					<!-- Form Basic -->
					<div class="card mb-4">
						<div class="card-body">
							<c:set var="actionUrl"
								value="${pageContext.request.contextPath}/admin/discount/edit" />
							<form action="${actionUrl}" role="form" method="POST" name="form"
								id="form" enctype="multipart/form-data">
								<div class="form-group">
									<label for="title">Id</label> <input readonly="readonly"
										class="form-control mb-3" type="text"
										value="${discount.discountId}" id="discountId"
										name="discountId">
								</div>
								<div class="form-group">
									<label for="title">Tiêu đề</label> <input
										class="form-control mb-3" type="text"
										value="${discount.title}" id="title" name="title">
								</div>
								<%-- <div class="form-group">
                      <label style="display: block;" for="code">Mã giảm giá</label>
                      <input readonly="readonly" style="display: inline-block;" class="form-control mb-3 col-lg-3" type="text" value="${discount.code}" id="code" name="code">
                      <button type="button" onclick="createCode(7)" class="btn btn-success mb-1">Tạo mã</button>
                      <script type="text/javascript">
                      function createCode(length) {
                    	   var result           = '';
                    	   var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
                    	   var charactersLength = characters.length;
                    	   for ( var i = 0; i < length; i++ ) {
                    	      result += characters.charAt(Math.floor(Math.random() * charactersLength));
                    	   }
                    	   document.getElementById("code").value = result;
                    	}
                      </script>
                    </div> --%>
								<div class="form-group">
									<label for="description">Mô tả</label> <input
										class="form-control mb-3" type="text"
										value="${discount.description}" id="description"
										name="description">
								</div>
								<div class="row form-group">
									<div class="col-lg-6">
										<label for="typeDiscount">Loại khuyến mãi</label> <select
											id="typeDiscount" name="typeDiscount" class="form-control">
											<option data-rate="" value="default">--Chọn--</option>
											<c:if test="${discount.rateDiscount le 100}">
												<option selected="selected" data-rate="%">Theo
													phần trăm</option>
												<option data-rate="VNĐ">Theo mức giá cố định</option>
											</c:if>
											<c:if test="${discount.rateDiscount gt 100}">
												<option data-rate="%">Theo phần trăm</option>
												<option selected="selected" data-rate="VNĐ">Theo
													mức giá cố định</option>
											</c:if>
										</select>
									</div>
									<div class="col-lg-6">
										<label for="rateDiscount">Giá trị khuyến mãi</label>
										<c:if test="${discount.rateDiscount le 100}">
											<c:set value="%" var="dataph"></c:set>
										</c:if>
										<c:if test="${discount.rateDiscount gt 100}">
											<c:set value="VNĐ" var="dataph"></c:set>
										</c:if>
										<div class="placeholderrd" data-placeholder="${dataph}">
											<input class="form-control mb-3" type="text"
												value="${discount.rateDiscount}" id="rateDiscount"
												name="rateDiscount">
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
								<c:if test="${empty sessionScope.userSession}">
									<c:if test="${userDetail.user.role.roleId eq 'ADMIN'}">
										<c:choose>
											<c:when test="${fn:contains(discount.value, 'alldistrict')}">
												<c:set value="checked='checked'" var="checked1"></c:set>
											</c:when>
											<c:when test="${fn:contains(discount.value, 'somedistrict')}">
												<c:set value="checked='checked'" var="checked2"></c:set>
												<c:set value="show" var="show2"></c:set>
												<c:set var="value2"
													value="${fn:substring(discount.value, 13, fn:length(discount.value))}" />
											</c:when>
											<c:when test="${fn:contains(discount.value, 'someward')}">
												<c:set value="checked='checked'" var="checked3"></c:set>
												<c:set value="show" var="show3"></c:set>
												<c:set var="value3"
													value="${fn:substring(discount.value, 9, fn:length(discount.value))}" />
											</c:when>
										</c:choose>
										<div class="form-group">
											<label for="optradio">Áp dụng cho</label>
											<div class="form-check">
												<label class="form-check-label"> <input type="radio"
													${checked1} class="form-check-input" value="allproduct"
													id="optradio" name="optradio">Tất cả các quận/huyện
												</label>
											</div>
											<div class="form-check">
												<label class="form-check-label"> <input type="radio"
													${checked2} class="form-check-input" value="category"
													id="optradio" name="optradio">Một số quận/huyện
												</label>
											</div>
											<div id="collapseOne" class="collapse ${show2}">
												<input class="form-control mb-3" value="${value2}"
													type="text" name="categoryName" id="categoryName"
													placeholder="Chọn bên dưới">
												<div style="margin-left: 50px;">
													<label>Tỉnh/Thành:</label> <select
														class="form-control col-lg-4" id="country" name="country">
														<option value="000">-Chọn Tỉnh/Thành:-</option>
													</select><br /> <label>Quận/huyện:</label> <select
														class="form-control col-lg-4" id="state" name="state"
														onchange="myFunction(event)">
														<option value="000">-Chọn Quận/Huyện-</option>
													</select><br />
													<!-- <label>Phường/Xã:</label>
								<select class="form-control col-lg-6" id="city" name="city">
									<option value="000">-Chọn Phường/Xã-</option>
								</select><br /> -->
													<script type='text/javascript'>
								    function myFunction(e) {
								    concat_string = $("#categoryName").val() + $("#state option:selected").html() + "(" + e.target.value + "),";
								    document.getElementById("categoryName").value = concat_string;
								}
								</script>
												</div>
											</div>
											<div class="form-check">
												<label class="form-check-label"> <input type="radio"
													${checked3} class="form-check-input" value="product"
													id="optradio" name="optradio">Một số phường/xã
												</label>
											</div>
											<div id="collapseTwo" class="collapse ${show3}">
												<input class="form-control mb-3" value="${value3}"
													type="text" name="productName" id="productName"
													placeholder="Chọn bên dưới">
												<div style="margin-left: 50px;">
													<label>Tỉnh/Thành:</label> <select id="country1"
														name="country1" class="form-control col-lg-4">
														<option value="000">-Chọn Tỉnh/Thành:-</option>
													</select><br /> <label>Quận/huyện:</label> <select id="state1"
														name="state1" class="form-control col-lg-4">
														<option value="000">-Chọn Quận/Huyện-</option>
													</select><br /> <label>Phường/Xã:</label> <select id="city1"
														name="city1" onchange="myFunction1(event)"
														class="form-control col-lg-4">
														<option value="000">-Chọn Phường/Xã-</option>
													</select><br />
													<script type='text/javascript'>
									    function myFunction1(e) {
									    concat_string = $("#productName").val() + $("#city1 option:selected").html() + "(" + e.target.value + "),";
									    document.getElementById("productName").value = concat_string;
									}
									</script>
													<script>
					$(document).ready(function(){
						  $.getJSON('${pageContext.request.contextPath}/resources/admin/assets/js/data.json', function(data){
							  $.each(data, function (index, value) {
								    var country_id;
								    var state_id;
								    var city_id;
								   		$("#country1").append('<option rel="' + index + '" value="'+value.Id+'">'+value.Name+'</option>');
								        $("#country1").change(function () {
								            $("#state1, #city1").find("option:gt(0)").remove();
								            $("#state1").find("option:first").text("Loading...");
								            country_id = $(this).find('option:selected').attr('rel');
								            console.log("Country INDEX : " + country_id);
								            $.each(data[country_id].Districts, function (index1, value1) {
								                $("#state1").find("option:first").text("-Chọn Quận/Huyện-");
								                $("#state1").append('<option rel="' + index1 + '" value="'+value1.Id+'">'+value1.Name+'</option>');
								            });
								            
								        });
								        $("#state1").change(function () {
								            $("#city1").find("option:gt(0)").remove();
								            $("#city1").find("option:first").text("Loading...");
								            state_id = $(this).find('option:selected').attr('rel');
								            console.log("State INDEX : " + state_id);
								            $.each(data[country_id].Districts[state_id].Wards, function (index2, value2) {
								                $("#city1").find("option:first").text("-Chọn Phường/Xã-");
								                $("#city1").append('<option rel="' + index2 + '" value="'+value2.Id+'">'+value2.Name+'</option>');
								            });
								        });     
								});
						 });
						});
			</script>
												</div>
											</div>
										</div>
									</c:if>
								</c:if>
								<c:if test="${not empty sessionScope.userSession}">
									<div class="form-group">
										<label for="">Chọn cơ sở: (<input type="checkbox"
											id="select_all" /> Chọn hết:)
										</label>
										<c:if test="${not empty locationByUserIdList}">
											<c:forEach var="location" items="${locationByUserIdList}">
												<div class="form-check">
													<label class="form-check-label"> <input
														type="checkbox" class="checkbox" name="check[]"
														id="customCheck1" value="${location.locationId}"
														style="zoom: 1.5;"> ${location.address}
													</label>
												</div>
											</c:forEach>
										</c:if>
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
									</div>
								</c:if>
								<c:if test="${empty sessionScope.userSession}">
									<c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
										<input type="hidden" name="locati"
											value="${discount.location.locationId}">
									</c:if>
								</c:if>
								<%-- <c:if test="${empty sessionScope.userSession}">
					<c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
					<input type="hidden" name="locati" value="${discount.location.locationId}">
					<c:choose>
                    	<c:when test="${fn:contains(discount.value, 'allproduct')}">
                    		<c:set value="checked='checked'" var="checked1" ></c:set>
                    	</c:when>
                    	<c:when test="${fn:contains(discount.value, 'category')}">
                    		<c:set value="checked='checked'" var="checked2" ></c:set>
                    		<c:set value="show" var="show2" ></c:set>
                    		<c:set var="value2" value = "${fn:substring(discount.value, 9, fn:length(discount.value))}" />
                    	</c:when>
                    	<c:when test="${fn:contains(discount.value, 'product')}">
                    		<c:set value="checked='checked'" var="checked3" ></c:set>
                    		<c:set value="show" var="show3" ></c:set>
                    		<c:set var="value3" value = "${fn:substring(discount.value, 8, fn:length(discount.value))}" />
                    	</c:when>
                    </c:choose>
					<div class="form-group">
                    	<label for="optradio" >Áp dụng cho</label>
                      	<div class="form-check">
					  		<label class="form-check-label">
				      			<input type="radio" ${checked1} class="form-check-input" value="allproduct" id="optradio" name="optradio">Tất cả sản phẩm
							</label>
						</div>
						<div class="form-check">
						  	<label class="form-check-label">
						    	<input type="radio" ${checked2} class="form-check-input" value="category" id="optradio" name="optradio">Danh mục sản phẩm
						  	</label>
						</div>
						<div id="collapseOne" class="collapse ${show2}">
							<input class="form-control mb-3" value="${value2}" type="text" onKeyDown="getCategory();" name="categoryName" id="categoryName" placeholder="Nhập danh mục cần tìm" >
			       		</div>
						<div class="form-check">
						  	<label class="form-check-label">
						    	<input type="radio" ${checked3} class="form-check-input" value="product" id="optradio" name="optradio">Sản phẩm
						  	</label>
						</div>
						<div id="collapseTwo" class="collapse ${show3}">
								<input class="form-control mb-3" value="${value3}" type="text" onKeyDown="getProduct();" name="productName" id="productName" placeholder="Nhập sản phẩm cần tìm" >
			       		</div>
                    </div>
					</c:if>	
					</c:if> --%>
								<c:if test="${discount.discountRule.ruleId ne null}">
									<c:set var="onoff" value="checked='checked'"></c:set>
									<c:set value="show" var="show4"></c:set>
								</c:if>
								<div class="form-group">
									<%-- <c:if test="${empty sessionScope.userSession}">
                  	  	<c:if test="${userDetail.user.role.roleId eq 'ADMIN'}">
						<div class="custom-control custom-switch">
	                        <input type="checkbox" ${onoff} name="condition" id="checkbox" class="custom-control-input">
	                        <label class="custom-control-label" for="checkbox"><strong>Điều kiện áp dụng</strong></label>
                        </div>
                        </c:if>
                        </c:if> --%>
									<c:if test="${empty sessionScope.userSession}">
										<c:if test="${userDetail.user.role.roleId ne 'ADMIN'}">
											<c:if test="${not empty discountRuleList}">
												<div id="collapseThree" class="row ${collapse}">
													<div class="col-lg-6">
														<label for="ruleId">Điều kiện</label> <select id="ruleId"
															name="discountRule1" class="form-control">
															<option data-rate="" value="default">--Chọn--</option>
															<c:forEach items="${discountRuleList}" var="discountRule">
																<c:if
																	test="${discountRule.ruleId eq discount.discountRule.ruleId}">
																	<c:set var="selectdr" value="selected='selected'"></c:set>
																</c:if>
																<c:if
																	test="${discountRule.ruleId ne discount.discountRule.ruleId}">
																	<c:set var="selectdr" value=""></c:set>
																</c:if>
																<c:choose>
																	<c:when test="${discountRule.ruleId eq 1}">
																		<option ${selectdr} value="${discountRule.ruleId}"
																			data-rate="VNĐ">${discountRule.ruleContent}</option>
																	</c:when>
																	<c:when test="${discountRule.ruleId eq 2}">
																		<option ${selectdr} value="${discountRule.ruleId}"
																			data-rate="Sản phẩm">${discountRule.ruleContent}</option>
																	</c:when>
																	<c:otherwise>
																		<option ${selectdr} value="${discountRule.ruleId}"
																			data-rate="">${discountRule.ruleContent}</option>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</select>
													</div>
													<div class="col-lg-6">
														<c:if test="${discount.discountRule.ruleId eq 1}">
															<c:set value="VNĐ" var="dataph1"></c:set>
														</c:if>
														<c:if test="${discount.discountRule.ruleId eq 2}">
															<c:set value="Sản phẩm" var="dataph1"></c:set>
														</c:if>
														<label>Giá trị tối thiểu</label>
														<div class="placeholderrd abc"
															data-placeholder="${dataph1}">
															<input class="form-control mb-3"
																value="${discount.valueRule}" type="text"
																name="valueRule1">
														</div>
													</div>
													<script type="text/javascript">
							   $(function(){
							      $("#ruleId").change(function(){
							         $(".abc").attr("data-placeholder", $(this).find(":selected").data("rate"));
							      });
							   });
							</script>
												</div>
											</c:if>
										</c:if>
									</c:if>
								</div>
								<c:set var="urlSearchProduct"
									value="${pageContext.request.contextPath}/public/discount/searchproduct" />
								<c:set var="urlSearchCategory"
									value="${pageContext.request.contextPath}/public/discount/searchcategory" />
								<c:if test="${not empty sessionScope.userSession}">
									<c:set var="urlSearchProduct"
										value="${pageContext.request.contextPath}/admin/discount/searchproduct" />
									<c:set var="urlSearchCategory"
										value="${pageContext.request.contextPath}/admin/discount/searchcategory" />
								</c:if>
								<script>
    function getCategory(){
    var userName = document.getElementById("categoryName");
    var string = userName.value;
    $.ajax({
	method: 'GET',
	url: '${urlSearchCategory}',
	data: {
	  str: string
	},
	success: function(content) {
	  console.log("Content: " + content);
    var availableTags = content;
    function split( val ) {
		return val.split( /,\s*/ );
	}
	function extractLast( term ) {
		return split( term ).pop();
	}
	$( "#categoryName" )
// don't navigate away from the field on tab when selecting an item
	.bind( "keydown", function( event ) {
		if ( event.keyCode === $.ui.keyCode.TAB &&
				$( this ).data( "autocomplete" ).menu.active ) {
			event.preventDefault();
		}
	})
	.autocomplete({
		minLength: 0,
		source: function( request, response ) {
			// delegate back to autocomplete, but extract the last term
			response( $.ui.autocomplete.filter(
				availableTags, extractLast( request.term ) ) );
		},
		focus: function() {
			// prevent value inserted on focus
			return false;
		},
		select: function( event, ui ) {
			var terms = split( this.value );
			// remove the current input
			terms.pop();
			// add the selected item
			terms.push( ui.item.value );
			// add placeholder to get the comma-and-space at the end
			terms.push( "" );
			this.value = terms.join( ", " );
			return false;
		}
	});
	},
	error: function(xhr, status) {
    	console.log("ERROR");
    }
    });
    } 
</script>
								<script>
    function getProduct(){
    var userName = document.getElementById("productName");
    var string = userName.value;
    $.ajax({
	method: 'GET',
	url: '${urlSearchProduct}',
	data: {
	  str: string
	},
	success: function(content) {
	  console.log("Content: " + content);
    var availableTags = content;
    function split( val ) {
		return val.split( /,\s*/ );
	}
	function extractLast( term ) {
		return split( term ).pop();
	}
	$( "#productName" )
// don't navigate away from the field on tab when selecting an item
	.bind( "keydown", function( event ) {
		if ( event.keyCode === $.ui.keyCode.TAB &&
				$( this ).data( "autocomplete" ).menu.active ) {
			event.preventDefault();
		}
	})
	.autocomplete({
		minLength: 0,
		source: function( request, response ) {
			// delegate back to autocomplete, but extract the last term
			response( $.ui.autocomplete.filter(
				availableTags, extractLast( request.term ) ) );
		},
		focus: function() {
			// prevent value inserted on focus
			return false;
		},
		select: function( event, ui ) {
			var terms = split( this.value );
			// remove the current input
			terms.pop();
			// add the selected item
			terms.push( ui.item.value );
			// add placeholder to get the comma-and-space at the end
			terms.push( "" );
			this.value = terms.join( ", " );
			return false;
		}
	});
	},
	error: function(xhr, status) {
    	console.log("ERROR");
    }
    });
    } 
</script>
								<script type="text/javascript">
$('[name="optradio"]').on('change', function(){  
	if($(this).val()  === "category"){
    	$('#collapseOne').collapse('show')
  	}else{
     	$('#collapseOne').collapse('hide')
  	}
	if($(this).val()  === "product"){
    	$('#collapseTwo').collapse('show')
  	}else{
     	$('#collapseTwo').collapse('hide')
  	}
});
</script>
								<script type="text/javascript">
$('#checkbox').change(function(){ 
    if(this.checked == true){
    	$('#collapseThree').collapse('show');
    }else{
     	$('#collapseThree').collapse('hide')
  	}
});
</script>
								<div class="form-group">
									<label for="startDate">Ngày bắt đầu</label> <input
										value="${discount.startDate}" class="form-control mb-3"
										type="date" id="startDate" name="startDate">
								</div>
								<div class="form-group">
									<label for="endDate">Ngày kết thúc</label> <input
										value="${discount.endDate}" class="form-control mb-3"
										type="date" id="endDate" name="endDate">
								</div>
								<div class="form-group">
									<label for="limitedUse">Tổng số lần dùng</label> <input
										value="${discount.limitedUse}" class="form-control mb-3"
										type="text" value="" id="limitedUse" name="limitedUse">
								</div>
								<div class="form-group">
									<label for="limitedPerUser">Số lần dùng/1 người</label> <input
										value="${discount.limitedPerUser}" class="form-control mb-3"
										type="text" value="" id="limitedPerUser" name="limitedPerUser">
								</div>
								<!--  <div class="form-group">
                      	<label class="text-light-white fs-14">Ảnh</label><br>
                        <img id="blah" alt="your image" style="max-height: 100px; " />
					    <input type="file" onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
                    </div> -->
								<div class="form-group">
									<div class="custom-file">
										<input type="file" name="file" class="custom-file-input"
											id="file"
											onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
										<label class="custom-file-label" for="file">Choose
											file</label>
									</div>
									<img
										src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${discount.mediaPath}"
										id="blah" alt="your image"
										style="max-height: 300px; display: block; margin-top: 15px;" />
								</div>
								<button type="submit" class="btn btn-primary" name="submit">Sửa</button>
							</form>
						</div>
					</div>
					<!--Row-->
				</div>
				<!---Container Fluid-->
			</div>
			<script>
					$(document).ready(function(){
						  $.getJSON('${pageContext.request.contextPath}/resources/admin/assets/js/data.json', function(data){
							  $.each(data, function (index, value) {
								    var country_id;
								    var state_id;
								    var city_id;
								        $("#country").append('<option rel="' + index + '" value="'+value.Id+'">'+value.Name+'</option>');
								        $("#country").change(function () {
								            $("#state, #city").find("option:gt(0)").remove();
								            $("#state").find("option:first").text("Loading...");
								            country_id = $(this).find('option:selected').attr('rel');
								            console.log("Country INDEX : " + country_id);
								            $.each(data[country_id].Districts, function (index1, value1) {
								                $("#state").find("option:first").text("-Chọn Quận/Huyện-");
								                $("#state").append('<option rel="' + index1 + '" value="'+value1.Id+'">'+value1.Name+'</option>');
								            });
								            
								        });
								        $("#state").change(function () {
								            $("#city").find("option:gt(0)").remove();
								            $("#city").find("option:first").text("Loading...");
								            state_id = $(this).find('option:selected').attr('rel');
								            console.log("State INDEX : " + state_id);
								            $.each(data[country_id].Districts[state_id].Wards, function (index2, value2) {
								                $("#city").find("option:first").text("-Chọn Phường/Xã-");
								                $("#city").append('<option rel="' + index2 + '" value="'+value2.Id+'">'+value2.Name+'</option>');
								            });
								        });     
								});
						 });
						});
			</script>
			<script type="text/javascript">
jQuery.validator.addMethod("greaterThan", 
		function(value, element, params) {

		    if (!/Invalid|NaN/.test(new Date(value))) {
		        return new Date(value) > new Date($(params).val());
		    }

		    return isNaN(value) && isNaN($(params).val()) 
		        || (Number(value) > Number($(params).val())); 
		},'Must be greater than {0}.');
$.validator.addMethod("valueNotEquals", function(value, element, arg){
	  return arg !== value;
	 }, "Value must not equal arg.");
	$().ready(function() {
		var validator = $("#form").validate({
			errorPlacement: function(error, element){
				$(element).closest("form").find("label[for='" + element.attr("id") + "']").append(error);
			},
			errorElement: "span",
			ignore: [],
			rules:{
				title: {                      //lay name
					required:true,
				},
				code: {                      
					required:true,
				},
				description: {                      
					required:true,
				},
				startDate: {                      
					required:true,
				},
				endDate: {                      
					required:true,
					greaterThan: "#startDate",
				},
				limitedUse: {  
					required:true,
					digits:true,
					max: 1000,
				},
				limitedPerUser: {  
					required:true,
					digits:true,
					max: 5,
				},
				optradio: {                      
					required:true,
				},
				typeDiscount: {                      
					valueNotEquals: "default",
				},
				rateDiscount: {  
					required:true,
					digits:true,
				},
			},
			messages: {
				title: {
					required: " (Mời nhập)",
				},
				code: {
					required: " (Tạo mã code)",
				},
				description: {
					required: " (Mời nhập)",
				},
				startDate: {
					required: " (Mời nhập)",
				},
				endDate: {
					required: " (Mời nhập)",
					greaterThan: " (Ngày kết thúc không hợp lệ)",
				},
				limitedUse: {
					required: " (Mời nhập)",
					digits: " (Nhập số nguyên dương)",
					max: " (Nhập số <=1000)",
				},
				limitedPerUser: {
					required: " (Mời nhập)",
					digits: " (Nhập số nguyên dương)",
					max: " (Nhập số <=5)",
				},
				optradio: {
					required: " (Mời chọn)",
				},
				typeDiscount: {
					valueNotEquals: " (Mời chọn)",
				},
				rateDiscount: {  
					required:" (Mời nhập)",
					digits:" (Nhập số nguyên dương)",
				},
			},
		});
	});
</script>