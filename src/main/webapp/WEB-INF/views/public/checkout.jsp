<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/tags/taglib.jsp"%>
    <section class="final-order section-padding bg-light-theme">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-7">
                <form action="${pageContext.request.contextPath}/public/checkout" method="POST">
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
                                <div class="payment-sec">
                                     <div class="section-header-left">
                                        <h3 class="text-light-black header-title">Sử dụng mã giảm giá</h3>
                                    </div>
                                    <div class="card-body no-padding payment-option-tab">
                                        <div class="form-group">
                                            <div class="credit-card promocode p-relative input-group">
                                                <input type="text" name="#" class="form-control-submit fs-18" placeholder="Nhập mã">
                                                <button type="submit" class="btn-second btn-submit ml-1">Áp dụng</button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- <div class="driver-tip-sec mb-xl-20">
	                                    <div class="tab-content">
	                                        <div class="tab-pane active" id="tipnewcard">
	                                            <div class="row">
	                                                <div class="col-md-6">
	                                                    <div class="tip-percentage">
	                                                        <form>
	                                                            <label class="radio-inline text-light-green fw-600">
												                  <input type="radio" name="tip-percentage" checked> <span>15%</span>
												                </label>
	                                                            <label class="radio-inline text-light-green fw-600">
												                  <input type="radio" name="tip-percentage"> <span>25%</span>
												                </label>
	                                                            <label class="radio-inline text-light-green fw-600">
												                  <input type="radio" name="tip-percentage"> <span>25%</span>
												                </label>
	                                                            <label class="radio-inline text-light-green fw-600">
												                  <input type="radio" name="tip-percentage"> <span>30%</span>
												                </label>
	                                                        </form>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div> -->
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
                                                        <li class="nav-item"> <a class="nav-link fw-600 active" data-toggle="tab" href="#cash">Tiền mặt</a>
                                                        </li>
                                                        <li class="nav-item"> <a class="nav-link fw-600" data-toggle="tab" href="#paypal">PayPal<sup>TM</sup></a>
                                                        </li>
                                                        <!-- <li class="nav-item"> <a class="nav-link fw-600" data-toggle="tab" href="#amexcheckout">Amex Express Checkout</a>
                                                        </li> -->
                                                    </ul>
                                                    <div class="tab-content">
                                                        <!-- <div class="tab-pane active" id="newcreditcard">
                                                            <div class="row">
                                                                <div class="col-md-4">
                                                                    <div class="form-group">
                                                                        <label class="text-light-white fw-700">Số thẻ</label>
                                                                        <div class="credit-card card-front p-relative">
                                                                            <input type="text" name="#" class="form-control form-control-submit" placeholder="1234 5678 9101 1234">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-2">
                                                                    <div class="form-group">
                                                                        <label class="text-light-white fw-700">Ngày hết hạn</label>
                                                                        <input type="text" name="#" class="form-control form-control-submit" placeholder="12/21">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <div class="form-group">
                                                                        <label class="text-light-white fw-700">Mã bảo mật</label>
                                                                        <div class="credit-card card-back p-relative">
                                                                            <input type="text" name="#" class="form-control form-control-submit" placeholder="123">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <div class="form-group">
                                                                        <label class="text-light-white fw-700">Mã ZIP</label>
                                                                        <input type="text" name="#" class="form-control form-control-submit" placeholder="123456">
                                                                    </div>
                                                                </div>
                                                                <div class="col-12">
                                                                    <div class="form-group">
                                                                        <label class="custom-checkbox">
                                      <input type="checkbox" name="#"> <span class="checkmark"></span>
                                      Lưu thông tin thẻ</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                             <div class="form-group">
                                                                <button type="submit" class="btn-first green-btn text-custom-white full-width fw-500">Đặt hàng</button>
                                                            </div>
                                                            <p class="text-center text-light-black no-margin">Bằng cách đặt hàng bạn đồng ý với các  
                                                            	<a href="#">điều khoản sử dụng</a> và <a href="#">quyền riêng tư</a> của FoodMart
                                                            </p>
                                                        </div> -->
                                                        <div class="tab-pane active" id="cash">
                                                            <p class="text-light-black">Chuẩn bị sẵn tiền mặt khi bạn nhận được đơn đặt hàng của mình.</p>
                                                            <div class="form-group">
                                                                <button type="submit" class="btn-first green-btn text-custom-white full-width fw-500">Đặt hàng</button>
                                                            </div>
                                                            <p class="text-center text-light-black no-margin">Bằng cách đặt hàng bạn đồng ý với các  
                                                            	<a href="#">điều khoản sử dụng</a> và <a href="#">quyền riêng tư</a> của FoodMart
                                                            </p>
                                                        </div>
                                                        <div class="tab-pane fade" id="paypal">
                                                            <p class="text-light-black">Please review your order and make any necessary changes before checking out with PayPal.</p>
                                                            <div class="section-header-left">
                                                                <h3 class="text-light-black header-title">Add a tip for your driver</h3>
                                                            </div>
                                                            <div class="driver-tip-sec mb-xl-20">
                                                                <ul class="nav nav-tabs">
                                                                    <li class="nav-item"> <a class="nav-link fw-600 active" data-toggle="tab" href="#paypaltipcard">Tip with Credit Card</a>
                                                                    </li>
                                                                    <li class="nav-item"> <a class="nav-link fw-600 disabled" data-toggle="tab" href="#paypalcashtip">Tip with Cash</a>
                                                                    </li>
                                                                </ul>
                                                                <div class="tab-content">
                                                                    <div class="tab-pane active" id="paypaltipcard">
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <div class="tip-percentage">
                                                                                    <form>
                                                                                        <label class="radio-inline text-light-green fw-600">
                                              <input type="radio" name="tip-percentage" checked> <span>15%</span>
                                            </label>
                                                                                        <label class="radio-inline text-light-green fw-600">
                                              <input type="radio" name="tip-percentage"> <span>25%</span>
                                            </label>
                                                                                        <label class="radio-inline text-light-green fw-600">
                                              <input type="radio" name="tip-percentage"> <span>25%</span>
                                            </label>
                                                                                        <label class="radio-inline text-light-green fw-600">
                                              <input type="radio" name="tip-percentage"> <span>30%</span>
                                            </label>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                                <div class="custom-tip">
                                                                                    <div class="input-group mb-3">
                                                                                        <div class="input-group-prepend"> <span class="input-group-text text-light-green fw-500">Custom tip</span>
                                                                                        </div>
                                                                                        <input type="text" class="form-control form-control-submit" placeholder="Custom tip">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="section-header-left">
                                                                <h3 class="text-light-black header-title">Donate the change</h3>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="custom-checkbox">
                                  <input type="checkbox" name="#"> <span class="checkmark"></span>
                                  Donate $0.77 to No kid Hungry. By checking this box you agree to the Donate the Change <a href="#">Terms of use</a>  <span class="ml-2"><a href="#">Learn More</a></span>
                                </label>
                                                            </div>
                                                            <div class="form-group">
                                                                <button type="submit" class="btn-first paypal-btn text-custom-white full-width fw-500">Checkout with
                                  <img src="assets/img/pay-pal.png" alt="image">
                                </button>
                                                            </div>
                                                            <p class="text-center text-light-black no-margin">By placing your order, you agree to foodmart's <a href="#">terms of use</a> and <a href="#">privacy agreement</a>
                                                            </p>
                                                        </div>
                                                        <!-- <div class="tab-pane fade" id="amexcheckout">
                                                            <div class="card">
                                                                <div class="card-header"> <a class="card-link fw-500 fs-16" data-toggle="collapse" href="#saveamex">
                                            Saved Card
                                          </a>
                                                                </div>
                                                                <div id="saveamex" class="collapse show" data-parent="#accordion">
                                                                    <div class="card-body no-padding payment-option-tab">
                                                                        <div class="form-group">
                                                                            <div class="credit-card amex-card-front p-relative">
                                                                                <input type="text" name="#" class="form-control form-control-submit" value="VISA....1877,exp 12/21">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="card">
                                                                <div class="card-header"> <a class="collapsed card-link fw-500 fs-16" data-toggle="collapse" href="#newcardamex">
                                            Add New Card
                                          </a>
                                                                </div>
                                                                <div id="newcardamex" class="collapse" data-parent="#accordion">
                                                                    <div class="card-body no-padding payment-option-tab">
                                                                        <div class="row">
                                                                            <div class="col-xl-4 col-lg-6 col-md-4 col-sm-6">
                                                                                <div class="form-group">
                                                                                    <label class="text-light-white fw-700">Card Number</label>
                                                                                    <div class="credit-card amex-card-front p-relative">
                                                                                        <input type="text" name="#" class="form-control form-control-submit" placeholder="1234 5678 9101 1234">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-2 col-lg-6 col-md-2 col-sm-6">
                                                                                <div class="form-group">
                                                                                    <label class="text-light-white fw-700">Expires on</label>
                                                                                    <input type="text" name="#" class="form-control form-control-submit" placeholder="12/21">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-6 col-md-3 col-sm-6">
                                                                                <div class="form-group">
                                                                                    <label class="text-light-white fw-700">Security Code</label>
                                                                                    <div class="credit-card amex-card-back p-relative">
                                                                                        <input type="text" name="#" class="form-control form-control-submit" placeholder="123">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-6 col-md-3 col-sm-6">
                                                                                <div class="form-group">
                                                                                    <label class="text-light-white fw-700">ZIP Code</label>
                                                                                    <input type="text" name="#" class="form-control form-control-submit" placeholder="123456">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-12">
                                                                                <div class="form-group">
                                                                                    <label class="custom-checkbox">
                                            <input type="checkbox" name="#"> <span class="checkmark"></span>
                                            Save Credit card</label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="section-header-left">
                                                                <h3 class="text-light-black header-title">Add a tip for your driver</h3>
                                                            </div>
                                                            <div class="driver-tip-sec mb-xl-20">
                                                                <ul class="nav nav-tabs">
                                                                    <li class="nav-item"> <a class="nav-link fw-600 active" data-toggle="tab" href="#tipcard">Tip with Credit Card</a>
                                                                    </li>
                                                                    <li class="nav-item"> <a class="nav-link fw-600 disabled" data-toggle="tab" href="#cashtip">Tip with Cash</a>
                                                                    </li>
                                                                </ul>
                                                                <div class="tab-content">
                                                                    <div class="tab-pane active" id="tipcard">
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <div class="tip-percentage">
                                                                                    <form>
                                                                                        <label class="radio-inline text-light-green fw-600">
                                              <input type="radio" name="tip-percentage" checked> <span>15%</span>
                                            </label>
                                                                                        <label class="radio-inline text-light-green fw-600">
                                              <input type="radio" name="tip-percentage"> <span>25%</span>
                                            </label>
                                                                                        <label class="radio-inline text-light-green fw-600">
                                              <input type="radio" name="tip-percentage"> <span>25%</span>
                                            </label>
                                                                                        <label class="radio-inline text-light-green fw-600">
                                              <input type="radio" name="tip-percentage"> <span>30%</span>
                                            </label>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                                <div class="custom-tip">
                                                                                    <div class="input-group mb-3">
                                                                                        <div class="input-group-prepend"> <span class="input-group-text text-light-green fw-500">Custom tip</span>
                                                                                        </div>
                                                                                        <input type="text" class="form-control form-control-submit" placeholder="Custom tip">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="section-header-left">
                                                                <h3 class="text-light-black header-title">Donate the change</h3>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="custom-checkbox">
                                  <input type="checkbox" name="#"> <span class="checkmark"></span>
                                  Donate $0.77 to No kid Hungry. By checking this box you agree to the Donate the Change <a href="#">Terms of use</a>  <span class="ml-2"><a href="#">Learn More</a></span>
                                </label>
                                                            </div>
                                                            <div class="form-group">
                                                                <button type="submit" class="btn-first green-btn text-custom-white full-width fw-500">Place Your Order</button>
                                                            </div>
                                                            <p class="text-center text-light-black no-margin">By placing your order, you agree to foodmart's <a href="#">terms of use</a> and <a href="#">privacy agreement</a>
                                                            </p>
                                                        </div> -->
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
	                                            <div class="price"> <a href="#" id="totalPriceProduct${orderDTO.productId}" class="text-dark-white fw-500">${orderDTO.quantity * orderDTO.price}</a>
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
                                         <!-- <div class="total-price border-0 pt-0 pb-0"> <span class="text-light-green fw-600">Giảm giá:</span>
                                            <span class="text-light-green fw-600">-5,000đ</span>
                                        </div> -->
                                    </div>
                                    </c:if>
                                </div>
                                <c:if test="${not empty listOrderDTO}">
                                <div class="card-footer p-0 modify-order">
                                    <div class="total-amount"> <span class="text-custom-white fw-700">TỔNG:</span>
                                        <span id="totalCartCheckOut" class="text-custom-white fw-700" >${totalCart + 20000}</span>
                                    </div>
                                </div>
                                </c:if>
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
   	$("#totalCartCheckOut").text(totalCartResult);
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
	                 +"<div class='price'> <a href='#' class='text-dark-white fw-500'>"+ val.price +"</a></div>"
	             +"</div>"
	             totalPriceDTO += parseInt(val.price);
			 });
			 $("#cat-product-box").html(html_code);
			 $("#cat-product-box-topbar").html(html_code);
			 $("#totalPriceDTO").text(totalPriceDTO);
			 $("#totalPriceDTOTopBar").text(totalPriceDTO);
			 $("#sizeCart").text(sizeCart);
		  }
  	});
}

function minusQuantity(productId, price) {
	var quantity = $("#quantity"+productId).val();
	var total = parseInt(price) * (parseInt(quantity) - 1);
	var totalCartCurr = $("#totalCartCheckOut").text();
	var totalCartResult = parseInt(totalCartCurr) - parseInt(price);
	if(quantity != 1){
	$("#totalPriceProduct" + productId).text(total);              			    		
	}else{
	$("#totalPriceProduct" + productId).text(price);
	}
	$("#totalCartCheckOut").text(totalCartResult);
	$.ajax({
		type : "GET",
		contentType : "application/json",
		url : "${pageContext.request.contextPath}/public/addCartAjax",
		data : {'aProductId': productId, 'aQuantity': parseInt(quantity) - 1 },
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
	                 +"<div class='price'> <a href='#' class='text-dark-white fw-500'>"+ val.price +"</a></div>"
	             +"</div>"
	             totalPriceDTO += parseInt(val.price);
			 });
			 $("#cat-product-box").html(html_code);
			 $("#cat-product-box-topbar").html(html_code);
			 $("#totalPriceDTO").text(totalPriceDTO);
			 $("#totalPriceDTOTopBar").text(totalPriceDTO);
			 $("#sizeCart").text(sizeCart);
		  }
  	});
}


	 
</script>
<%-- <script src="${pageContext.request.contextPath}/resources/public/assets/js/input-spinner.js"></script>
<script>
    $("input[type='number']").inputSpinner()
</script> --%>





