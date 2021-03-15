<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/tags/taglib.jsp"%>

    <section class="final-order section-padding bg-light-theme">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-9">
                    <div class="main-box padding-20">
                        <div class="row mb-xl-20">
                            <div class="col-md-6">
                                <div class="section-header-left">
                                    <h3 class="text-light-black header-title fw-700">Xác nhận đơn hàng</h3>
                                </div>
                                <h6 class="text-light-black fw-700 fs-14">Xác nhận địa chỉ, số điện thoại, thông tin thanh toán</h6>
                                <h6 class="text-light-black fw-700 mb-2">Đơn hàng của bạn</h6>
                                <p class="text-light-green fw-600">Delivery, ASAP (60-70m)</p>
                                <p class="text-light-white title2 mb-1">Nguyễn Thanh Hải <span><a href="#">Change Details</a></span>
                                </p>
                                <p class="text-light-black fw-600 mb-1">Địa chỉ</p>
                                <p class="text-light-white mb-1">21 Nguyễn Như Hạnh
                                    <br>Hòa Minh - Liên Chiểu - Đà Nẵng</p>
                                <p class="text-light-white">0929181251</p>
                            </div>
                            <div class="col-md-6">
                                <div class="advertisement-img">
                                    <img src="https://via.placeholder.com/670x300" class="img-fluid full-width" alt="advertisement-img">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="payment-sec">
                                    <div class="section-header-left">
                                        <h3 class="text-light-black header-title">Ghi chú</h3>
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control form-control-submit" rows="4"></textarea>
                                    </div>
                                    
                                     <div class="section-header-left">
                                        <h3 class="text-light-black header-title">Sử dụng mã giảm giá</h3>
                                    </div>
                                    <div class="driver-tip-sec mb-xl-20">
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
	                                </div>
                                	<br>                         
                                    <div class="section-header-left">
                                        <h3 class="text-light-black header-title">Thông tin thanh toán</h3>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <div id="accordion">
                                                <div class="payment-option-tab">
                                                    <ul class="nav nav-tabs">
                                                        <li class="nav-item"> <a class="nav-link fw-600 active" data-toggle="tab" href="#newcreditcard">Thẻ tín dụng</a>
                                                        </li>
                                                        <li class="nav-item"> <a class="nav-link fw-600" data-toggle="tab" href="#cash">Tiền mặt</a>
                                                        </li>
                                                        <li class="nav-item"> <a class="nav-link fw-600" data-toggle="tab" href="#paypal">PayPal<sup>TM</sup></a>
                                                        </li>
                                                        <li class="nav-item"> <a class="nav-link fw-600" data-toggle="tab" href="#amexcheckout">Amex Express Checkout</a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="newcreditcard">
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
                                                        </div>
                                                        <div class="tab-pane fade" id="cash">
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
                                                        <div class="tab-pane fade" id="amexcheckout">
                                                            <div class="card">
                                                                <div class="card-header"> <a class="card-link fw-500 fs-14" data-toggle="collapse" href="#saveamex">
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
                                                                <div class="card-header"> <a class="collapsed card-link fw-500 fs-14" data-toggle="collapse" href="#newcardamex">
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
                </div>
                <div class="col-lg-3">
                    <div class="sidebar">
                        <div class="cart-detail-box">
                            <div class="card">
                                <div class="card-header padding-15 fw-700">Đơn giao từ
                                    <p class="text-light-white no-margin fw-500">Nhà Hàng 1</p>
                                </div>
                                <div class="card-body no-padding" id="scrollstyle-4">
                                    <div class="cat-product-box">
                                        <div class="cat-product">
                                            <div class="cat-name">
                                                <a href="#">
                                                    <p class="text-light-green fw-700"><span class="text-dark-white">1</span> Gà rán</p> <span class="text-light-white fw-700">size L</span>
                                                </a>
                                            </div>
                                            <div class="delete-btn">
                                                <a href="#" class="text-dark-white"> <i class="far fa-trash-alt"></i>
                                                </a>
                                            </div>
                                            <div class="price"> <a href="#" class="text-dark-white fw-500">
                          50,000đ
                        </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item-total">
                                        <div class="total-price border-0 pb-0"> <span class="text-dark-white fw-600">Phí ship:</span>
                                            <span class="text-dark-white fw-600">+5,000đ</span>
                                        </div>
                                         <div class="total-price border-0 pt-0 pb-0"> <span class="text-light-green fw-600">Giảm giá:</span>
                                            <span class="text-light-green fw-600">-5,000đ</span>
                                        </div>
                                        <div class="total-price border-0 "> <span class="text-light-black fw-700">Tổng:</span>
                                            <span class="text-light-black fw-700">50,000đ</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer p-0 modify-order">
                                    <a href="#" class="total-amount"> <span class="text-custom-white fw-700">TỔNG:</span>
                                        <span class="text-custom-white fw-700">50,000đ</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
