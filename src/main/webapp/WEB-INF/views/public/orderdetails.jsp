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
                            <h5 class="text-light-black fw-600">Nhà Hàng 1</h5>
                            <span class="text-light-white">Thời gian giao hàng ước tính</span>
                            <h2 class="text-light-black fw-700 no-margin">9:00pm-9:10pm</h2>
                            <div id="add-listing-tab" class="step-app">
                                <ul class="step-steps">
                                    <li class="done">
                                        <a href="javascript:void(0)"> <span class="number"></span>
                                            <span class="step-name">Đang xác nhận<br>8:38pm</span>
                                        </a>
                                    </li>
                                    <li class="done">
                                        <a href="javascript:void(0)"> <span class="number"></span>
                                            <span class="step-name">Đã xác nhận</span>
                                        </a>
                                    </li>
                                    <li class="active">
                                        <a href="javascript:void(0)"> <span class="number"></span>
                                            <span class="step-name">Đang giao</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)"> <span class="number"></span>
                                            <span class="step-name">Đã giao</span>
                                        </a>
                                    </li>
                                </ul>
                                <div style="display: inline-block;" class=""> 
                                	<a href="#" class="btn-first white-btn fw-600 help-btn">Sửa đơn hàng</a>
                            	</div>
                            	<div style="display: inline-block;" class=""> 
                            		<a href="#" class="btn-first white-btn fw-600 help-btn">Hủy đơn hàng</a>
                            	</div>
                                <button type="button" class="fullpageview text-light-black fw-600" data-modal="modal-12">Xem toàn trang</button>
                            </div>
                        </div>
                        <div class="tracking-map">
                            <div id="pickupmap"></div>
                        </div>
                    </div>
                    <!-- recipt -->
                    <div class="recipt-sec padding-20">
                        <div class="recipt-name title u-line full-width mb-xl-20">
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
                        </div>
                        <div class="u-line mb-xl-20">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="recipt-name full-width padding-tb-10 pt-0">
                                        <h5 class="text-light-black fw-600">Giao tới:</h5>
                                        <span class="text-light-white ">Nguyễn Thanh Hải</span>
                                        <span class="text-light-white ">Địa chỉ</span>
                                        <span class="text-light-white ">21 Nguyễn Như Hạnh</span>
                                        <span class="text-light-white ">Hòa Minh, Liên Chiểu, Đà Nẵng</span>
                                        <p class="text-light-white ">0929181251</p>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="recipt-name full-width padding-tb-10 pt-0">
                                        <h5 class="text-light-black fw-600">Ghi chú</h5>
                                        <p class="text-light-white ">Gọi trước khi giao.</p>
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
                                    <h5 class="text-light-black fw-600 title">Đơn hàng của bạn <span><a href="#" class="fs-12">In biên lai</a></span></h5>
                                    <p class="title text-light-white">Nov 15, 2015 8:38pm <span class="text-light-black">Order #123456789012345</span>
                                    </p>
                                </div>
                                <div class="col-lg-12">
                                    <div class="checkout-product">
                                        <div class="img-name-value">
                                            <div class="product-img">
                                                <a href="#">
                                                    <img src="https://via.placeholder.com/100" alt="#">
                                                </a>
                                            </div>
                                            <div class="product-value"> <span class="text-light-white">1</span>
                                            </div>
                                            <div class="product-name"> <span><a href="#" class="text-light-white">Gà rán</a></span>
                                            </div>
                                        </div>
                                        <div class="price"> <span class="text-light-white">50,000đ</span>
                                        </div>
                                    </div>
                                    <div class="checkout-product">
                                        <div class="img-name-value">
                                            <div class="product-img">
                                                <a href="#">
                                                    <img src="https://via.placeholder.com/100" alt="#">
                                                </a>
                                            </div>
                                            <div class="product-value"> <span class="text-light-white">2</span>
                                            </div>
                                            <div class="product-name"> <span><a href="#" class="text-light-white">Pizza</a></span>
                                            </div>
                                        </div>
                                        <div class="price"> <span class="text-light-white">100,000đ</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-7">
                                <div class="payment-method mb-md-40">
                                    <h5 class="text-light-black fw-600">Phương thức thanh toán</h5>
                                    <div class="method-type"> <i class="far fa-credit-card text-dark-white"></i>
                                        <span class="text-light-white">Thẻ tín dụng</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="price-table u-line">
                                    <div class="item"> <span class="text-light-white">Giảm giá:</span>
                                        <span class="text-light-white">-15,000đ</span>
                                    </div>
                                    <div class="item"> <span class="text-light-white">Phí ship:</span>
                                        <span class="text-light-white">+5,000đ</span>
                                    </div>
                                </div>
                                <div class="total-price padding-tb-10">
                                    <h5 class="title text-light-black fw-700">Tổng: <span>140,000đ</span></h5>
                                </div>
                            </div>
                            <div class="col-12 d-flex"> <a href="#" class="btn-first white-btn fw-600 help-btn">Need Help?</a>
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