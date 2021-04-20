<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/tags/taglib.jsp"%>
    <section class="final-order section-padding bg-light-theme">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-7">
                <form action="${pageContext.request.contextPath}/public/checkout/cash" id="formId" method="POST">
                    <div class="main-box padding-20">
                        <div class="row mb-xl-20">
                            <div class="col-md-10">
                                <div class="section-header-left">
                                    <h3 class="text-light-black header-title fw-700">Xác nhận đơn hàng</h3>
                                </div>
                                <h6 class="text-light-black fw-700 fs-16">Xác nhận địa chỉ, số điện thoại, thông tin thanh toán</h6>
                                <h6 class="text-light-black fw-700 mb-2">Địa chỉ của bạn</h6>
                                <!-- <p class="text-light-green fw-600">Delivery, ASAP (60-70m)</p> -->
                                <!-- <p>Người nhận: <b>Nguyễn Thanh Hải</b> 
                                	<a style="margin-left: 10px;" onclick="changedetails()" href="javascript:void(0)" >Change Details</a>
                                </p> -->
                                <div style="width: 300px; display: inline-block;" >
                                     <div class="form-group">
                                         <label class="text-light-white fw-700">Số nhà - Tên đường</label>
                                         <input id="address" name="stress" value="${userAddress.stress}" type="text" name="#" class="form-control form-control-submit" >
                                     </div>
                                 </div>
			                    <div style="width: 300px; display: inline-block;" >
				                    <div class="form-group">
				                    	<label class="text-light-white fw-700" for="city">Tỉnh/thành</label>
									   	<select name="city" id="country" class="form-control form-control-submit">
									    	<option value="000">-Chọn Tỉnh/Thành:-</option>
									   </select>
									</div>
								</div>
								<div style="width: 300px; display: inline-block;" >
									<div class="form-group">
										<label class="text-light-white fw-700" for="district">Quận huyện</label>
									   	<select name="district" id="state" class="form-control input-lg" ${readonly}>
									    	<option value="000">-Chọn Quận/Huyện-</option>
									   </select>
									</div>
								</div>
								<div style="width: 300px; display: inline-block;" >
									<div class="form-group">
										<label class="text-light-white fw-700" for="ward">Xã/phường</label>
									   	<select name="ward" id="city" class="form-control input-lg" ${readonly}>
									    	<option value="000">-Chọn Phường/Xã-</option>
									   </select>
									</div>
								</div>
								<script>
								$(document).ready(function(){
									  $.getJSON('${pageContext.request.contextPath}/resources/admin/assets/js/data.json', function(data){
										  var country_id;
										  var state_id;
										  $.each(data, function (index, value) {
											    var city_id;
											    if('${userAddress.city}' == value.Id){
											    	$("#country").append('<option selected="selected" rel="' + index + '" value="'+value.Id+'">'+value.Name+'</option>');
											    } else {
											    	$("#country").append('<option rel="' + index + '" value="'+value.Id+'">'+value.Name+'</option>');
											    }
									            country_id = $("#country").find('option:selected').attr('rel');
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
										  $.each(data[country_id].Districts, function (index1, value1) {
								            	if('${userAddress.district}' == value1.Id){
								            		 $("#state").append('<option selected="selected" rel="' + index1 + '" value="'+value1.Id+'">'+value1.Name+'</option>');
											    } else {
											    	$("#state").append('<option rel="' + index1 + '" value="'+value1.Id+'">'+value1.Name+'</option>');
											    }
								            }); 
										  state_id = $("#state").find('option:selected').attr('rel');
										  $.each(data[country_id].Districts[state_id].Wards, function (index2, value2) {
								            	if('${userAddress.ward}' == value2.Id){
								            		$("#city").append('<option selected="selected" rel="' + index2 + '" value="'+value2.Id+'">'+value2.Name+'</option>');
											    } else {
											    	$("#city").append('<option rel="' + index2 + '" value="'+value2.Id+'">'+value2.Name+'</option>');
											    }
								            });
									 });
									});
							</script>
                                 <div style="width: 300px;" >
                                     <div class="form-group">
                                         <label class="text-light-white fw-700">Số điện thoại</label>
                                         <input value="${sessionScope.userSession.contactPhone}" type="text" name="phone" class="form-control form-control-submit" >
                                     </div>
                                 </div>
                                 <div class="section-header-left">
                                     <h3 class="text-light-black header-title">Ghi chú</h3>
                                 </div>
                                 <div class="form-group">
                                     <textarea class="form-control form-control-submit" name="note" style="width: 610px;" rows="4"></textarea>
                                 </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                            	<c:if test="${ not empty listDiscount}">
                                	<div class="payment-sec">
                                     <div class="section-header-left">
                                        <h3 class="text-light-black header-title">Sử dụng mã giảm giá</h3>
                                    </div>
                                    </div>
                                    <div class="col-lg-12">
                                    <c:forEach items="${listDiscount}" var="discount">
	                                     <div class="restaurent-product-list">
		                                    <div class="restaurent-product-detail">
		                    						<div class="restaurent-product-img">
		                                             <img style="width: 125px; height: 125px;" src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${discount.mediaPath}" class="img-fluid" alt="#">
		                                         </div>
		                                         <div class="restaurent-product-left">
		                                             <div class="restaurent-product-title-box">
		                                                 <div class="restaurent-product-box">
		                                                 <c:set var="rateDiscountA" value="%"/>
		                                                 <c:if test="${discount.rateDiscount gt 100}">
		                                                 	<c:set var="rateDiscountA" value="VNĐ"/>
		                                                 </c:if>
		                                                 <div class="restaurent-product-label"> <span class="rectangle-tag bg-gradient-red text-custom-white"><fmt:formatNumber value="${discount.rateDiscount}" type="number"/>${rateDiscountA}</span>
		                                                         <!-- <span class="rectangle-tag bg-dark text-custom-white">Combo</span> -->
		                                                     </div>
		                                                     <div style="margin-left: 10px;" class="restaurent-product-title">
		                                                         <h6 class="mb-2" data-toggle="modal" data-target="#restaurent-combo">
		                                                         <a href="javascript:void(0)" class="text-light-black fw-600">Điều kiện:${discount.discountRule.ruleContent} tối thiểu là : ${discount.valueRule}</a></h6>
		                                                         <!-- <p class="text-light-white">600-700 Cal.</p> -->
		                                                     </div>
		                                                 </div>
		                                                 <div class="restaurent-product-rating">
		                                                 </div>
		                                             </div>
		                                             <div class="restaurent-product-caption-box"> <span class="text-light-white">Số lần dùng còn lại: ${discount.limitedPerUser}</span>
		                                             </div>
		                                             <div class="restaurent-tags-price">
		                                                 <div class="restaurent-product-price">
		                                                 	<c:if test="${discount.discountRule.ruleId eq 2}">
		                                                 	<c:choose>
		                                                 		<c:when test="${totalOrderedPrice >= discount.valueRule and totalCart >= discount.valueRule}">
		                                                 			<button type="button" id="button${discount.discountId}" onclick="applyDiscount(${discount.rateDiscount},${discount.discountId})" class="btn btn-primary btn-sm shadow-none">Áp dụng</button>
		                                                 		</c:when>
		                                                 		<c:otherwise>
		                                                 			<button disabled="disabled" class="btn btn-danger btn-sm shadow-none">Áp dụng</button>
		                                                 		</c:otherwise>
		                                                 	</c:choose>
		                                                 	</c:if>
		                                                 	<c:if test="${discount.discountRule.ruleId eq 1}">
		                                                 	<c:choose>
		                                                 		<c:when test="${totalCart >= discount.valueRule and totalCart >= discount.valueRule}">
		                                                 			<button type="button" id="button${discount.discountId}" onclick="applyDiscount(${discount.rateDiscount}, ${discount.discountId})" class="btn btn-primary btn-sm shadow-none">Áp dụng</button>
		                                                 		</c:when>
		                                                 		<c:otherwise>
		                                                 			<button disabled="disabled" class="btn btn-danger btn-sm shadow-none">Áp dụng</button>
		                                                 		</c:otherwise>
		                                                 	</c:choose>
		                                                 	</c:if>
		                                                    <span>HSD: ${discount.endDate}</span>
		                                                 </div>
		                                             </div>
		                                         </div>
		                                     </div>
                                     	</div>
                                     	</c:forEach>
                                     </div>
                                     <script type="text/javascript">
	                                     function applyDiscount(rateDiscount, discountId) {
	                                 		var totalCart = ${totalCart};
	                                 		var result = parseInt(totalCart) - parseInt(rateDiscount);
	                                 		var formatRateDiscount = "%";
	                                 		if(parseInt(rateDiscount) > 100){
	                                 			formatRateDiscount = "VNĐ";
	                                 		}else{
	                                 			var result = parseInt(totalCart) - (parseInt(rateDiscount) * parseInt(totalCart))/100;
	                                 		}
	                                 		$.ajax({
	                            				type : "GET",
	                            				contentType : "application/json",
	                            				url : "${pageContext.request.contextPath}/public/applyDiscount",
	                            				data : {'arateDiscount': rateDiscount, 'aDiscountId': discountId },
	                            				success: function (data) {
	                            					$("#totalCartCheckOut").text((parseInt(result) + 20000) + " VNĐ");
	    	                                 		$("#saleRateDiscount").html(
	    	                                 				"<span class='text-light-green fw-600'>Giảm giá:</span>"
	    	                                                +"<span class='text-light-green fw-600'>-" + rateDiscount + " " + formatRateDiscount + "</span>"	
	    	                                 		);
	    	                                 		$("#button"+ discountId).text("Đang áp dụng");
	                            				}
	                            		  	});
	                                     }
                                     </script>
                                     </c:if>
                                	<br>                         
                                    <div class="section-header-left">
                                        <h3 class="text-light-black header-title">Thông tin thanh toán</h3>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <div id="accordion">
                                                <div class="payment-option-tab">
                                                    <ul class="nav nav-tabs">
                                                        <!-- <li class="nav-item"> <a class="nav-link fw-600 active" data-toggle="tab" href="#newcreditcard">Thẻ tín dụng</a>
                                                        </li> --> 
                                                        <li class="nav-item"> <a class="nav-link fw-600 active" data-toggle="tab" id="payCash" href="#cash">Tiền mặt</a>
                                                        </li>
                                                        <li class="nav-item"> <a class="nav-link fw-600" data-toggle="tab" id="payPaypal" href="#paypal">PayPal<sup>TM</sup></a>
                                                        </li>
                                                        <!-- <li class="nav-item"> <a class="nav-link fw-600" data-toggle="tab" href="#amexcheckout">Amex Express Checkout</a>
                                                        </li> -->
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="cash">
                                                            <p class="text-light-black">Chuẩn bị sẵn tiền mặt khi bạn nhận được đơn đặt hàng của mình.</p>
                                                            <div class="form-group">
                                                                <button type="submit" class="btn-first green-btn text-custom-white full-width fw-500">Đặt hàng</button>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane" id="paypal">
                                                            <div class="form-group">
                                                                <button type="submit" class="btn-first green-btn text-custom-white full-width fw-500">Thanh toán</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <script type="text/javascript">
                    $("#payCash").click(function(){
                    	$('#formId').attr('action', '${pageContext.request.contextPath}/public/checkout/cash');
                    	});
                    $("#payPaypal").click(function(){
                    	$('#formId').attr('action', '${pageContext.request.contextPath}/public/checkout/paypal');
                    	});
                    </script>
                    </div>
                <div class="col-lg-5">
                    <div class="sidebar">
                        <div class="cart-detail-box">
                            <div class="card">
                                <div class="card-header padding-15 fw-700">Chi tiết đơn hàng
                                </div>
                                <div class="card-body no-padding" id="scrollstyle-4">
                                    <div class="cat-product-box">
                                    <c:choose>
                                    	<c:when test="${not empty listOrderDTO}">
                                    		<c:forEach items="${listOrderDTO}" var="orderDTO">
                                            <div class="cat-product" id="cat-product${orderDTO.productId}" style = "box-sizing: border-box;">
									            <div class="quantity">
										            <div class="append" style="float: left; margin-right: 10px;">
						                                <button class="minus-btn" onclick="minusQuantity('${orderDTO.productId}', ${orderDTO.price})" type="button" name="button"> <i class="fas fa-minus"></i></button>
						                            </div>
						                            <input type="text" style="width: 50px; float: left; margin-right: 10px;" class="text-center" name="name" id="quantity${orderDTO.productId}" value="${orderDTO.quantity}" readonly="readonly">
						                            <div class="prepend" style="float: left;">
						                                <button class="plus-btn" onclick="plusQuantity('${orderDTO.productId}', ${orderDTO.price})" type="button" name="button"><i class="fas fa-plus"></i></button>
						                            </div> 
					                           	</div>
									            <!-- <div class="">
				                                    <img src="https://via.placeholder.com/50x50" class="img-fluid full-width" alt="advertisement-img">
				                                </div> -->
	                                            <div class="cat-name">
	                                                <a href="#">
	                                                    <p class="text-light-green fw-700">${orderDTO.name}</p> 
	                                                   <span class="text-light-white fw-700">size L</span>
	                                                </a>
	                                            </div>
	                                            <div class="delete-btn">
	                                                <a href="javascript:void(0)" onclick="deleteCookieOrder('${orderDTO.productId}')" class="text-dark-white"> <i class="far fa-trash-alt"></i>
	                                                </a>
	                                            </div>
	                                            <div class="price"> <a href="#" id="totalPriceProduct${orderDTO.productId}" class="text-dark-white fw-500"><fmt:formatNumber value="${orderDTO.quantity * orderDTO.price}" type="number"/></a>
	                                            </div>
	                                        </div>
                                            </c:forEach>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<div class="empty-bag padding-15 fw-700"> 
	                                      		<a href="#">Đơn hàng rỗng</a>
	                                      	</div>
                                    	</c:otherwise>
                                    </c:choose>
                                    </div>
                                    <c:if test="${not empty listOrderDTO}">
                                    <div class="item-total">
                                        <div class="total-price border-0 pb-0"> <span class="text-dark-white fw-600">Phí ship:</span>
                                            <span class="text-dark-white fw-600">+ 20,000đ</span>
                                        </div>
                                        <div id="saleRateDiscount" class="total-price border-0 pt-0 pb-0"> 
                                        </div>
                                    </div>
                                    </c:if>
                                </div>
                                <c:if test="${not empty listOrderDTO}">
                                <div class="card-footer p-0 modify-order">
                                    <div class="total-amount"> <span class="text-custom-white fw-700">TỔNG:</span>
                                        <span id="totalCartCheckOut" class="text-custom-white fw-700" ><fmt:formatNumber value="${totalCart + 20000}" type="number"/></span>
                                    </div>
                                </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                
            </div>
        </div>
    </section>
<script>

function changedetails() {
	  var searchInput = $('#address');
	// Multiply by 2 to ensure the cursor always ends up at the end;
	// Opera sometimes sees a carriage return as 2 characters.
	var strLength = searchInput.val().length * 2;
	searchInput.focus();
	searchInput[0].setSelectionRange(strLength, strLength);
}


function plusQuantity(productId, price) {
	var quantity = $("#quantity" + productId).val();
   	var total = (parseInt(quantity) + 1) * parseInt(price);
   	var totalCartCurr = $("#totalCartCheckOut").text();
   	var totalCartResult = parseInt(price) + parseInt(totalCartCurr);
   	$("#totalPriceProduct" + productId).text(total);
   	$.ajax({
		type : "GET",
		contentType : "application/json",
		url : "${pageContext.request.contextPath}/public/addCartAjax",
		data : {'aProductId': productId, 'aQuantity': parseInt(quantity) + 1 },
		success: function (data) {
			var html_code = '';
			var totalPriceDTO = 0;
			var sizeCart = 0;
			$.each( data, function( key, val ) {
				 sizeCart++;
				 html_code += "<div class='cat-product'>"
                 +"<div class='cat-name'>"
	                     +"<a href='#'>"
	                         +"<p class='text-light-green'><span class='text-dark-white'>"+ val.quantity +"</span> "+ val.name +"</p>"
	                     +"</a>"
	                 +"</div>"
	                 +"<div class='delete-btn'>"
	                     +"<a href='javascript:void(0)' onclick='deleteCookieOrder("+ val.productId +")' class='text-dark-white'> <i class='far fa-trash-alt'></i></a>"
	                 +"</div>"
	                 +"<div class='price'> <a href='#' class='text-dark-white fw-500'>"+ val.price + "</a></div>"
	             +"</div>"
	             totalPriceDTO += parseInt(val.price);
			 });
			 $("#cat-product-box").html(html_code);
			 $("#cat-product-box-topbar").html(html_code);
			 $("#totalPriceDTO").text(totalPriceDTO);
			 $("#totalPriceDTOTopBar").text(totalPriceDTO);
			 $("#sizeCart").text(sizeCart);
			 $("#totalCartCheckOut").text(parseInt(totalPriceDTO) + 20000);
		  }
  	});
}

function minusQuantity(productId, price) {
	var quantity = $("#quantity"+productId).val();
	var total = parseInt(price) * (parseInt(quantity) - 1);
	var totalCartCurr = $("#totalCartCheckOut").text();
	var totalCartResult = parseInt(totalCartCurr) - parseInt(price);
	if(quantity != 1){
		quantity = parseInt(quantity) - 1
		$("#totalPriceProduct" + productId).text(total);              			    		
	}else{
		quantity = 1;
		$("#totalPriceProduct" + productId).text(price);
	}
	$.ajax({
		type : "GET",
		contentType : "application/json",
		url : "${pageContext.request.contextPath}/public/addCartAjax",
		data : {'aProductId': productId, 'aQuantity': quantity },
		success: function (data) {
			var html_code = '';
			var totalPriceDTO = 0;
			var sizeCart = 0;
			$.each( data, function( key, val ) {
				 sizeCart++;
				 html_code += "<div class='cat-product'>"
                 +"<div class='cat-name'>"
	                     +"<a href='#'>"
	                         +"<p class='text-light-green'><span class='text-dark-white'>"+ val.quantity +"</span> "+ val.name +"</p>"
	                     +"</a>"
	                 +"</div>"
	                 +"<div class='delete-btn'>"
	                     +"<a href='javascript:void(0)' onclick='deleteCookieOrder("+ val.productId +")' class='text-dark-white'> <i class='far fa-trash-alt'></i></a>"
	                 +"</div>"
	                 +"<div class='price'> <a href='#' class='text-dark-white fw-500'>" + val.price + "</a></div>"
	             +"</div>"
	             totalPriceDTO += parseInt(val.price);
			 });
			 $("#cat-product-box").html(html_code);
			 $("#cat-product-box-topbar").html(html_code);
			 $("#totalPriceDTO").text(totalPriceDTO);
			 $("#totalPriceDTOTopBar").text(totalPriceDTO);
			 $("#sizeCart").text(sizeCart);
			 $("#totalCartCheckOut").text(parseInt(totalPriceDTO) + 20000);
		  }
  	});
}


	 
</script>
<%-- <script src="${pageContext.request.contextPath}/resources/public/assets/js/input-spinner.js"></script>
<script>
    $("input[type='number']").inputSpinner()
</script> --%>





