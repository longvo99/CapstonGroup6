<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/tags/taglib.jsp"%>

    <!-- tracking map -->
    <section class="checkout-page section-padding bg-light-theme">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="tracking-sec">
                        <div class="tracking-details padding-20 p-relative">
                            <h5 class="text-light-black fw-600">Mã đơn hàng: ${order.orderId} - Địa điểm: ${order.location.locationName}</h5>
                            <!-- <span class="text-light-white">Thời gian giao hàng ước tính</span>
                            <h2 class="text-light-black fw-700 no-margin">9:00pm-9:10pm</h2> -->
                            <div id="add-listing-tab" class="step-app">
                                <ul class="step-steps">
                                <c:if test="${order.orderStatus.orderStatusId eq 5}">
                                	<c:forEach items="${orderStatusList}" var="orderStatus">
	                                	<c:if test="${order.orderStatus.orderStatusId eq 1}">
	                                	<li class="done">
	                                        <a href="javascript:void(0)"> <span class="number"></span>
	                                            <span class="step-name">${orderStatus.statusName}<!-- <br>8:38pm --></span>
	                                        </a>
	                                    </li>
	                                    </c:if>
	                                    <c:if test="${order.orderStatus.orderStatusId eq 5}">
	                                	<li class="active">
	                                        <a href="javascript:void(0)"> <span class="number"></span>
	                                            <span class="step-name">${orderStatus.statusName}<!-- <br>8:38pm --></span>
	                                        </a>
	                                    </li>
	                                    </c:if>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${order.orderStatus.orderStatusId != 5}">
	                                <c:forEach items="${orderStatusList}" var="orderStatus">
	                                	<c:set var="classDone" value="" />
	                                	<c:choose>
	                                		<c:when test="${orderStatus.orderStatusId < order.orderStatus.orderStatusId}">
	                                			<c:set var="classDone" value="class='done'" />
	                                		</c:when>
	                                		<c:when test="${orderStatus.orderStatusId eq order.orderStatus.orderStatusId}">
	                                			<c:set var="classDone" value="class='active'" />
	                                		</c:when>
	                                	</c:choose>
	                                	<c:if test="${orderStatus.orderStatusId != 5}">
		                                	<li ${classDone}>
		                                        <a href="javascript:void(0)"> <span class="number"></span>
		                                            <span class="step-name">${orderStatus.statusName}<!-- <br>8:38pm --></span>
		                                        </a>
		                                    </li>
	                                    </c:if>
	                                </c:forEach>
	                              </c:if>
                                </ul>
                                <!-- <div style="display: inline-block;" class=""> 
                                	<a href="#" class="btn-first white-btn fw-600 help-btn">Sửa đơn hàng</a>
                            	</div> -->
                            	<c:if test="${order.orderStatus.orderStatusId < 3}">
	                            	<div style="display: inline-block;" class=""> 
	                            		<a href="${pageContext.request.contextPath}/public/deleteOrder/${order.orderId}" class="btn-first white-btn fw-600 help-btn">Hủy đơn hàng</a>
	                            	</div>
                            	</c:if>
                            </div>
                        </div>
                        <div class="tracking-map">
                            <div id="pickupmap"></div>
                        </div>
                    </div>
                    <!-- recipt -->
                    <div class="recipt-sec padding-20">
                        <!-- <div class="recipt-name title u-line full-width mb-xl-20">
                            <div class="recipt-name-box">
                                <h5 class="text-light-black fw-600 mb-2">Nhà Hàng 1</h5>
                                <p class="text-light-white ">Thời gian giao hàng ước tính</p>
                            </div>
                            <div class="countdown-box">
                                <div class="time-box"> <span id="mb-hours"></span>
                                </div>
                                <div class="time-box"> <span id="mb-minutes"></span>
                                </div>
                                <div class="time-box"> <span id="mb-seconds"></span>
                                </div>
                            </div>
                        </div> -->
                        <div class="u-line mb-xl-20">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="recipt-name full-width padding-tb-10 pt-0">
                                        <h5 class="text-light-black fw-600">Giao tới:</h5>
                                        <span class="text-light-white ">${user.contactName}</span>
                                        <span class="text-light-white ">Địa chỉ</span>
                                        <span class="text-light-white ">${userAddress.stress}</span>
                                        <span class="text-light-white " id="resultAdress"></span>
                                        <p class="text-light-white ">${user.contactPhone}</p>
                                    </div>
                                    <script type="text/javascript">
                                    	$(document).ready(function(){
                                    		var result = "";
                                    		$.getJSON('${pageContext.request.contextPath}/resources/admin/assets/js/data.json', function(data){
                                    			var country_id;
                   							  	var state_id; 
                                    			$.each(data, function (index, value) {
	                                  	 	 		if('${userAddress.city}' == value.Id){
	                                  	 	 			result += (value.Name + ", ");
	                                  	 	 			country_id = index;
	                                  	 	 		}
	                                  	 	 	 });
                                    			$.each(data[country_id].Districts, function (index1, value1) {
                                    				if('${userAddress.district}' == value1.Id){
	                                  	 	 			result += (value1.Name + ", ");
	                                  	 	 			state_id = index1;
	                                  	 	 		}
                                    			});
                                    			$.each(data[country_id].Districts[state_id].Wards, function (index2, value2) {
                                    				if('${userAddress.ward}' == value2.Id){
	                                  	 	 			result += value2.Name;
	                                  	 	 		}
                                    			});
                                    			$("#resultAdress").text(result);
                                  	 	 	});
                                    	});
                                    </script>
                                </div>
                                <div class="col-lg-4">
                                    <div class="recipt-name full-width padding-tb-10 pt-0">
                                        <h5 class="text-light-black fw-600">Ghi chú</h5>
                                        <p class="text-light-white ">${order.note}</p>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="ad-banner padding-tb-10 h-100">
                                        <img src="https://via.placeholder.com/337x139" class="img-fluid full-width" alt="banner-adv">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="u-line mb-xl-20">
                            <div class="row">
                                <div class="col-lg-12">
                                    <%-- <h5 class="text-light-black fw-600 title">Đơn hàng của bạn <span><a href="#" class="fs-12">In biên lai</a></span></h5>
                                    <p class="title text-light-white">${order.orderTime} <span class="text-light-black">Order #123456789012345</span>
                                    </p> --%>
                                </div>
                                <div class="col-lg-12">
                                	<c:set var="total" value="0" />
                                	<c:forEach items="${orderDetail}" var="orderDetail">
	                                    <div class="checkout-product">
	                                        <div class="img-name-value">
	                                            <div class="product-img">
	                                                <a href="#">
	                                                    <img style="width: 50px; height: 50px;" src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${orderDetail.imagePath}" alt="#">
	                                                </a>
	                                            </div>
	                                            <div class="product-value"> <span class="text-light-white">${orderDetail.quantity}</span>
	                                            </div>
	                                            <div class="product-name"> <span><a href="#" class="text-light-white">${orderDetail.name}</a></span>
	                                            </div>
	                                        </div>
	                                        <div class="price"> <span class="text-light-white">${orderDetail.price * orderDetail.quantity}</span>
	                                        </div>
	                                    </div>
	                                    <c:set var="total" value="${total + (orderDetail.price * orderDetail.quantity)}" />
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-7">
                                <div class="payment-method mb-md-40">
                                    <h5 class="text-light-black fw-600">Phương thức thanh toán</h5>
                                    <div class="method-type"> <i class="far fa-credit-card text-dark-white"></i>
                                        <span class="text-light-white">Trả tiền mặt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="price-table u-line">
                                    <!-- <div class="item"> <span class="text-light-white">Giảm giá:</span>
                                        <span class="text-light-white">-15,000đ</span>
                                    </div> -->
                                    <div class="item"> <span class="text-light-white">Phí ship:</span>
                                        <span class="text-light-white">20,000đ</span>
                                    </div>
                                </div>
                                <div class="total-price padding-tb-10">
                                    <h5 class="title text-light-black fw-700">Tổng: <span>${total + 20000}</span></h5>
                                </div>
                            </div>
                        </div>
                        <div class="u-line mb-xl-20">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h5 class="text-light-black fw-600 title">Đơn hàng đã đặt </h5>
                                </div>
                                <div class="col-lg-12">
									<div class="wrap-table100-nextcols js-pscroll">
										<div class="table100-nextcols">
											<table>
												<thead>
													<tr class="row100 head">
														<th class="cell100 column1">ID</th>
														<th class="cell100 column2">Thời gian</th>
														<th class="cell100 column2">Tổng tiền</th>
														<th class="cell100 column3">Trạng thái đơn hàng</th>
														<th class="cell100 column4">Xem chi tiết</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach items="${listOrder}" var="order">
													<tr class="row100 body">
														<td class="cell100 column1">${order.orderId}</td>
														<td class="cell100 column2">${order.orderTime}</td>
														<td class="cell100 column2">${order.totalPrice}</td>
														<td class="cell100 column3">${order.orderStatus.statusName}</td>
														<td class="cell100 column4"><a href="${pageContext.request.contextPath}/public/orderdetails/${order.orderId}"><i class="fa fa-eye" style="font-size:24px"></i></a></td>
													</tr>
												</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- tracking map -->
    
    <!-- modal boxes -->
    <div class="modal fade" id="offer">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header no-padding">
                    <div class="offer-content">
                        <h2 class="text-custom-white fw-700">Get $12 off <small class=" fw-700">your order*</small></h2>
                        <p class="text-custom-white">As an added treat, enjoy <strong>free delivery</strong> from
                            <br>select restaurants automatically applied at checkout</p>
                    </div>
                    <button type="button" class="close" data-dismiss="modal">X</button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="text-light-white fs-14">E-mail</label>
                                    <input type="email" name="#" class="form-control form-control-submit" placeholder="E-mail ID">
                                </div>
                                <div class="form-group">
                                    <label class="text-light-white fs-14">ZIP Code</label>
                                    <input type="number" name="#" class="form-control form-control-submit" placeholder="10421">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn-second btn-submit full-width">Save $12 on your first order</button>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn-second btn-default full-width text-light-green fw-700" data-dismiss="modal">Dismiss</button>
                                </div>
                                <div class="text-center"> <span class="text-light-black fs-12">*Valid on first order only, for one-time use, subject to foodmartâs verification. Additional terms may apply. By signing up, you agree to receive marketing and promotional emails and communications form foodmart</span>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
   
    <div class="md-modal md-effect-12">
        <div class="md-content">
            <div class="container-fluid h-100">
                <div class="row h-100">
                    <div class="col-lg-3">
                        <div class="modal-sidebar padding-20">
                            <div class="content-box padding-15 u-line">
                                <h5 class="text-light-black title fw-600 no-margin">Delivered <span><a href="#" class="fs-14">Help</a></span></h5>
                                <p class="text-light-white mb-xl-20">Five Guys 8:56pm arrival</p>
                                <div id="add-listing-tab1" class="step-app mb-xl-20">
                                    <ul class="step-steps">
                                        <li class="done order-note">
                                            <a href="javascript:void(0)"> <span class="number"></span>
                                            </a>
                                        </li>
                                        <li class="active make-order">
                                            <a href="javascript:void(0)"> <span class="number"></span>
                                            </a>
                                        </li>
                                        <li class="bike">
                                            <a href="javascript:void(0)"> <span class="number"></span>
                                            </a>
                                        </li>
                                        <li class="home-delivery">
                                            <a href="javascript:void(0)"> <span class="number"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="rating-box"> <span class="text-light-black fs-12">Rate your delivery</span>
                                    <div class="ratings"> <span class="text-light-white">
                      <i class="fas fa-star"></i>
                    </span>
                                        <span class="text-light-white">
                      <i class="fas fa-star"></i>
                    </span>
                                        <span class="text-light-white">
                      <i class="fas fa-star"></i>
                    </span>
                                        <span class="text-light-white">
                      <i class="fas fa-star"></i>
                    </span>
                                        <span class="text-light-white">
                      <i class="fas fa-star"></i>
                    </span>
                                        <span class="arrow"><a href="#"><i class="fas fa-chevron-right"></i></a></span>
                                    </div>
                                </div>
                            </div>
                            <div class="content-box padding-15 u-line">
                                <h6 class="text-light-black fw-500 mb-2 title">Five Guys <span><a href="#" class="fs-12"><i class="fas fa-chevron-right"></i></a></span></h6>
                                <p class="text-light-black mb-1">2 Items</p>
                                <p class="text-light-white no-margin fs-12">1x Little Hamburger</p>
                                <p class="text-light-white no-margin fs-12">1x Hamburger</p>
                            </div>
                            <div class="content-box padding-15 u-line">
                                <h6 class="text-light-black fw-500 mb-2 title">Delivery Address</h6>
                                <p class="text-light-black no-margin">314 79th St, Brooklyn, NY 11209, USA</p>
                            </div>
                            <button class="md-close btn-second btn-submit full-width"><i class="fas fa-chevron-left"></i> Go Back</button>
                        </div>
                    </div>
                    <div class="col-lg-9 no-padding">
                        <div id="pickupmap2"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="md-overlay"></div>