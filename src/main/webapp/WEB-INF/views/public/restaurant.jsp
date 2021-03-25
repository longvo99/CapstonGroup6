<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/tags/taglib.jsp"%>
    <!-- restaurent top -->
    <div class="page-banner p-relative smoothscroll" id="menu">
        <img src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${image1}" class="img-fluid full-width" alt="banner">
        <div class="overlay-2">
            <div class="container">
                <div class="row">
                    <div class="col-6">
                        <div class="back-btn">
                            <button type="button" class="text-light-green"> <i class="fas fa-chevron-left"></i>
              </button>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="tag-share"> <span class="text-light-green share-tag">
                <i class="fas fa-chevron-right"></i>
              </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- restaurent top -->
    <!-- restaurent details -->
    <section class="restaurent-details  u-line">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading padding-tb-10">
                        <h3 class="text-light-black title fw-700 no-margin">${location.locationName}</h3>
                        <p class="text-light-black sub-title no-margin">4508 Fort Hamilton Pkwy <span><a href="checkout.html" class="text-success">Change locations</a></span>
                        </p>
                        <div class="head-rating">
                            <div class="rating"> <span class="fs-16 text-yellow">
                              <i class="fas fa-star"></i>
                            </span>
                                            <span class="fs-16 text-yellow">
                              <i class="fas fa-star"></i>
                            </span>
                                            <span class="fs-16 text-yellow">
                              <i class="fas fa-star"></i>
                            </span>
                                            <span class="fs-16 text-yellow">
                              <i class="fas fa-star"></i>
                            </span>
                                            <span class="fs-16 text-dark-white">
                              <i class="fas fa-star"></i>
                            </span>
                                <span class="text-light-black fs-12 rate-data">58 rating</span>
                            </div>
                            <div class="product-review">
                                <div class="restaurent-details-mob">
                                    <a href="#"> <span class="text-light-black"><i class="fas fa-info-circle"></i></span>
                                        <span class="text-dark-white">info</span>
                                    </a>
                                </div>
                                <div class="restaurent-details-mob">
                                    <a href="#"> <span class="text-light-black"><i class="fas fa-info-circle"></i></span>
                                        <span class="text-dark-white">info</span>
                                    </a>
                                </div>
                                <div class="restaurent-details-mob">
                                    <a href="#"> <span class="text-light-black"><i class="fas fa-info-circle"></i></span>
                                        <span class="text-dark-white">info</span>
                                    </a>
                                </div>
                                <div class="restaurent-details-mob">
                                    <a href="#"> <span class="text-light-black"><i class="fas fa-info-circle"></i></span>
                                        <span class="text-dark-white">info</span>
                                    </a>
                                </div>
                                <h6 class="text-light-black no-margin">91<span class="fs-14">% Food was good</span></h6>
                                <h6 class="text-light-black no-margin">91<span class="fs-14">% Food was good</span></h6>
                                <h6 class="text-light-black no-margin">91<span class="fs-14">% Food was good</span></h6>
                            </div>
                        </div>
                    </div>
                    <div style="width: 200px;" class="restaurent-logo">
                        <img src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${image2}" class="img-fluid" alt="#">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- restaurent details -->
    <!-- restaurent tab -->
    <div class="restaurent-tabs u-line">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="restaurent-menu scrollnav">
                        <ul class="nav nav-pills">
                            <li class="nav-item"> <a class="nav-link active text-light-white fw-700" data-toggle="pill" href="#menu">Menu</a>
                            </li>
                            <li class="nav-item"> <a class="nav-link text-light-white fw-700" data-toggle="pill" href="#about">About</a>
                            </li>
                            <li class="nav-item"> <a class="nav-link text-light-white fw-700" data-toggle="pill" href="#review">Reviews</a>
                            </li>
                            <li class="nav-item"> <a class="nav-link text-light-white fw-700" data-toggle="pill" href="#mapgallery">Map & Gallery</a>
                            </li>
                        </ul>
                        <div class="add-wishlist">
                            <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- restaurent tab -->
    <!-- restaurent address -->
    <div class="restaurent-address u-line">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="address-details">
                        <div class="address">
                            <div class="delivery-address"> <a href="order-details.html" class="text-light-black">Delivery, ASAP (45–55m)</a>
                                <div class="delivery-type"> <span class="text-success fs-12 fw-500">No minimun</span><span class="text-light-white">, Free Delivery</span>
                                </div>
                            </div>
                            <div class="change-address"> <a href="checkout.html" class="fw-500">Change</a>
                            </div>
                        </div>
                        <p class="text-light-white no-margin">description</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- restaurent address -->
    <!-- restaurent meals -->
    <section class="section-padding restaurent-meals bg-light-theme">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-3 col-lg-3">
                    <div class="advertisement-slider swiper-container h-auto mb-xl-20 mb-md-40">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="testimonial-wrapper">
                                    <div class="testimonial-box">
                                        <div class="testimonial-img p-relative">
                                            <a href="restaurant.html">
                                                <img src="https://via.placeholder.com/438x180" class="img-fluid full-width" alt="testimonial-img">
                                            </a>
                                            <div class="overlay">
                                                <div class="brand-logo">
                                                    <img src="https://via.placeholder.com/50" class="img-fluid" alt="logo">
                                                </div>
                                                <div class="add-fav text-success">
                                                    <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="testimonial-caption padding-15">
                                            <p class="text-light-white text-uppercase no-margin fs-12">Featured</p>
                                            <h5 class="fw-600"><a href="restaurant.html" class="text-light-black">GSA King Tomato Farm</a></h5>
                                            <div class="testimonial-user-box">
                                                <img src="https://via.placeholder.com/40" class="rounded-circle" alt="#">
                                                <div class="testimonial-user-name">
                                                    <p class="text-light-black fw-600">Sarra</p> <i class="fas fa-trophy text-black"></i><span class="text-light-black">Top Reviewer</span>
                                                </div>
                                            </div>
                                            <div class="ratings"> <span class="text-yellow fs-16">
                                                          <i class="fas fa-star"></i>
                                                        </span>
                                                                                <span class="text-yellow fs-16">
                                                          <i class="fas fa-star"></i>
                                                        </span>
                                                                                <span class="text-yellow fs-16">
                                                          <i class="fas fa-star"></i>
                                                        </span>
                                                                                <span class="text-yellow fs-16">
                                                          <i class="fas fa-star"></i>
                                                        </span>
                                                                                <span class="text-yellow fs-16">
                                                          <i class="fas fa-star"></i>
                                                        </span>
                                            </div>
                                            <p class="text-light-black">Delivery was fast and friendly...</p>
                                            <p class="text-light-white fw-100"><strong class="text-light-black fw-700">Local delivery: </strong> From $7.99 (4.0 mi)</p>
                                            <a href="checkout.html" class="btn-second btn-submit">Order Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="testimonial-wrapper">
                                    <div class="testimonial-box">
                                        <div class="testimonial-img p-relative">
                                            <a href="restaurant.html">
                                                <img src="https://via.placeholder.com/438x180" class="img-fluid full-width" alt="testimonial-img">
                                            </a>
                                            <div class="overlay">
                                                <div class="brand-logo">
                                                    <img src="https://via.placeholder.com/50" class="img-fluid" alt="logo">
                                                </div>
                                                <div class="add-fav text-success"><img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="testimonial-caption padding-15">
                                            <p class="text-light-white text-uppercase no-margin fs-12">Featured</p>
                                            <h5 class="fw-600"><a href="restaurant.html" class="text-light-black">GSA King Tomato Farm</a></h5>
                                            <div class="testimonial-user-box">
                                                <img src="https://via.placeholder.com/40" class="rounded-circle" alt="#">
                                                <div class="testimonial-user-name">
                                                    <p class="text-light-black fw-600">Sarra</p> <i class="fas fa-trophy text-black"></i><span class="text-light-black">Top Reviewer</span>
                                                </div>
                                            </div>
                                            <div class="ratings"> <span class="text-yellow fs-16">
                                                  <i class="fas fa-star"></i>
                                                </span>
                                                                        <span class="text-yellow fs-16">
                                                  <i class="fas fa-star"></i>
                                                </span>
                                                                        <span class="text-yellow fs-16">
                                                  <i class="fas fa-star"></i>
                                                </span>
                                                                        <span class="text-yellow fs-16">
                                                  <i class="fas fa-star"></i>
                                                </span>
                                                                        <span class="text-yellow fs-16">
                                                  <i class="fas fa-star"></i>
                                                </span>
                                            </div>
                                            <p class="text-light-black">Delivery was fast and friendly...</p>
                                            <p class="text-light-white fw-100"><strong class="text-light-black fw-700">Local delivery: </strong> From $7.99 (4.0 mi)</p>
                                            <a href="checkout.html" class="btn-second btn-submit">Order Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="testimonial-wrapper">
                                    <div class="testimonial-box">
                                        <div class="testimonial-img p-relative">
                                            <a href="restaurant.html">
                                                <img src="https://via.placeholder.com/438x180" class="img-fluid full-width" alt="testimonial-img">
                                            </a>
                                            <div class="overlay">
                                                <div class="brand-logo">
                                                    <img src="https://via.placeholder.com/50" class="img-fluid" alt="logo">
                                                </div>
                                                <div class="add-fav text-success"><img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="testimonial-caption padding-15">
                                            <p class="text-light-white text-uppercase no-margin fs-12">Featured</p>
                                            <h5 class="fw-600"><a href="restaurant.html" class="text-light-black">GSA King Tomato Farm</a></h5>
                                            <div class="testimonial-user-box">
                                                <img src="https://via.placeholder.com/40" class="rounded-circle" alt="#">
                                                <div class="testimonial-user-name">
                                                    <p class="text-light-black fw-600">Sarra</p> <i class="fas fa-trophy text-black"></i><span class="text-light-black">Top Reviewer</span>
                                                </div>
                                            </div>
                                            <div class="ratings"> <span class="text-yellow fs-16">
                                              <i class="fas fa-star"></i>
                                            </span>
                                                                    <span class="text-yellow fs-16">
                                              <i class="fas fa-star"></i>
                                            </span>
                                                                    <span class="text-yellow fs-16">
                                              <i class="fas fa-star"></i>
                                            </span>
                                                                    <span class="text-yellow fs-16">
                                              <i class="fas fa-star"></i>
                                            </span>
                                                                    <span class="text-yellow fs-16">
                                              <i class="fas fa-star"></i>
                                            </span>
                                            </div>
                                            <p class="text-light-black">Delivery was fast and friendly...</p>
                                            <p class="text-light-white fw-100"><strong class="text-light-black fw-700">Local delivery: </strong> From $7.99 (4.0 mi)</p>
                                            <a href="checkout.html" class="btn-second btn-submit">Order Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Add Arrows -->
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>
                    <div class="card sidebar-card">
                        <div class="card-header no-padding">
                            <div class="offer-content">
                                <h2 class="text-custom-white fw-700">Get $12 off <small class=" fw-700">your order*</small></h2>
                                <p class="text-custom-white">As an added treat, enjoy <strong>free delivery</strong> from
                                    <br>select restaurants automatically applied at checkout</p>
                            </div>
                        </div>
                        <div class="card-body padding-15">
                            <form>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label class="text-light-white fs-14">Email</label>
                                            <input type="email" name="#" class="form-control form-control-submit" placeholder="Email I'd">
                                        </div>
                                        <div class="form-group">
                                            <label class="text-light-white fs-14">ZIP Code</label>
                                            <input type="number" name="#" class="form-control form-control-submit" placeholder="10421">
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn-second btn-submit full-width">Save $12 on your first order</button>
                                        </div>

                                        <div class="text-center"> <span class="text-light-black fs-12">*Valid on first order only, for one-time use, subject to foodmart’s verification. Additional terms may apply. By signing up, you agree to receive marketing and
                        promotional emails and communications form foodmart</span>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="promocodeimg mb-xl-20 p-relative">
                                <img src="https://via.placeholder.com/1100x115" class="img-fluid full-width" alt="promocode">
                                <div class="promocode-text">
                                    <div class="promocode-text-content">
                                        <h5 class="text-custom-white mb-2 fw-600">Get $10 off your first order!</h5>
                                        <p class="text-custom-white no-margin">Spend $15 or more and get $10 off your first delivery order.</p>
                                    </div>
                                    <div class="promocode-btn"> <a href="#">Get Deal</a>
                                    </div>
                                </div>
                                <div class="overlay overlay-bg"></div>
                            </div>
                        </div>
                        <div class="col-lg-12 restaurent-meal-head mb-md-40">
                            <div class="card">
                                <div class="card-header">
                                    <div class="section-header-left">
                                        <h3 class="text-light-black header-title">
                                            <a class="card-link text-light-black no-margin" data-toggle="collapse" href="#collapseOne">
                                            Sản phẩm
                                          </a>
                                        </h3>
                                    </div>
                                </div>
                                <div id="collapseOne" class="collapse show">
                                    <div class="card-body no-padding">
                                        <div class="row">
                                        	<c:forEach items="${product}" var="product">
                                            <div class="col-lg-12">
                                                <div class="restaurent-product-list">
                                                    <div class="restaurent-product-detail">
                                                        <div class="restaurent-product-left">
                                                            <div class="restaurent-product-title-box">
                                                                <div class="restaurent-product-box">
                                                                    <div class="restaurent-product-title">
                                                                        <h6 class="mb-2" data-toggle="modal" data-target="#restaurent-product${product.productId}"><a href="javascript:void(0)" class="text-light-black fw-600">${product.name}</a></h6>
                                                                        <%-- <p class="text-light-white">${product.price}</p> --%>
                                                                    </div>
                                                                    <div class="restaurent-product-label"> <span class="rectangle-tag bg-gradient-red text-custom-white">Sale</span>
                                                                        <!-- <span class="rectangle-tag bg-dark text-custom-white">Combo</span> -->
                                                                    </div>
                                                                </div>
                                                                <div class="restaurent-product-rating">
                                                                    <div class="ratings"> <span class="text-yellow"><i class="fas fa-star"></i></span>
                                                                        <span class="text-yellow"><i class="fas fa-star"></i></span>
                                                                        <span class="text-yellow"><i class="fas fa-star"></i></span>
                                                                        <span class="text-yellow"><i class="fas fa-star"></i></span>
                                                                        <span class="text-yellow"><i class="fas fa-star-half-alt"></i></span>
                                                                    </div>
                                                                    <div class="rating-text">
                                                                        <p class="text-light-white fs-12 title">3845 ratings</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="restaurent-product-caption-box"> <span class="text-light-white">${product.describe}</span>
                                                            </div>
                                                            <div class="restaurent-tags-price">
                                                                <div class="restaurent-tags"> 
                                                                    <span class="text-custom-white square-tag">
                                                                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/004-leaf.svg" alt="tag">
                                                                    </span>
                                                                    <span class="text-custom-white square-tag">
                                                                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/006-chili.svg" alt="tag">
                                                                      </span>
                                                                    <span class="text-custom-white square-tag">
                                                                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/005-chef.svg" alt="tag">
                                                                      </span>
                                                                    <span class="text-custom-white square-tag">
                                                                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/008-protein.svg" alt="tag">
                                                                      </span>
                                                                    <span class="text-custom-white square-tag">
                                                                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/009-lemon.svg" alt="tag">
                                                                      </span>
                                                                </div> 
                                                                    <span class="circle-tag">
                                                                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/010-heart.svg" alt="tag">
                                                                    </span>
                                                                <div class="restaurent-product-price">
                                                                    <h6 class="text-success fw-600 no-margin">${product.price} VNĐ</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="restaurent-product-img">
                                                            <img  style="width: 150px;height: 151px;" src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${product.imagePath}" class="img-fluid" alt="#">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header">
                                    <div class="section-header-left">
                                        <h3 class="text-light-black header-title">
                                            <a class="card-link text-light-black no-margin" data-toggle="collapse" href="#collapseTwo">
                        Combo
                      </a>
                                        </h3>
                                    </div>
                                </div>
                                <div id="collapseTwo" class="collapse show">
                                    <div class="card-body no-padding">
                                        <div class="row">
                                        	<c:if test="${not empty comboDetailList}">
                                        		<c:forEach items="${comboDetailList}" var="comboDetail">
                                            <div class="col-lg-12">
                                                <div class="restaurent-product-list">
                                                    <div class="restaurent-product-detail">
                                                        <div class="restaurent-product-left">
                                                            <div class="restaurent-product-title-box">
                                                                <div class="restaurent-product-box">
                                                                    <div class="restaurent-product-title">
                                                                        <h6 class="mb-2" data-toggle="modal" data-target="#restaurent-combo${comboDetail.productComboId}"><a href="javascript:void(0)" class="text-light-black fw-600">${comboDetail.comboName}</a></h6>
                                                                        <p class="text-light-white">600-700 Cal.</p>
                                                                    </div>
                                                                    <div class="restaurent-product-label"> <span class="rectangle-tag bg-gradient-red text-custom-white">${comboDetail.rateDiscount}</span>
                                                                        <!-- <span class="rectangle-tag bg-dark text-custom-white">Combo</span> -->
                                                                    </div>
                                                                </div>
                                                                <div class="restaurent-product-rating">
                                                                    <div class="ratings"> <span class="text-yellow"><i class="fas fa-star"></i></span>
                                                                        <span class="text-yellow"><i class="fas fa-star"></i></span>
                                                                        <span class="text-yellow"><i class="fas fa-star"></i></span>
                                                                        <span class="text-yellow"><i class="fas fa-star"></i></span>
                                                                        <span class="text-yellow"><i class="fas fa-star-half-alt"></i></span>
                                                                    </div>
                                                                    <div class="rating-text">
                                                                        <p class="text-light-white fs-12 title">3845 ratings</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="restaurent-product-caption-box"> <span class="text-light-white">${comboDetail.description}</span>
                                                            </div>
                                                            <div class="restaurent-tags-price">
                                                                <div class="restaurent-tags"> <span class="text-custom-white square-tag">
                                    <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/004-leaf.svg" alt="tag">
                                  </span>
                                                                    <span class="text-custom-white square-tag">
                                    <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/006-chili.svg" alt="tag">
                                  </span>
                                                                    <span class="text-custom-white square-tag">
                                    <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/005-chef.svg" alt="tag">
                                  </span>
                                                                    <span class="text-custom-white square-tag">
                                    <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/008-protein.svg" alt="tag">
                                  </span>
                                                                    <span class="text-custom-white square-tag">
                                    <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/009-lemon.svg" alt="tag">
                                  </span>
                                                                </div> <span class="circle-tag">
                                  <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                                </span>
                                                                <div class="restaurent-product-price">
                                                                    <h6 class="text-success fw-600 no-margin">$7.99+</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="restaurent-product-img">
                                                            <img src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${comboDetail.comboImagePath}" class="img-fluid" alt="#">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    		</c:forEach>
                                        	</c:if>
                                    	</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3">
                    <div class="sidebar">
                        <div class="video-box mb-xl-20">
                            <div class="video_wrapper video_wrapper_full js-videoWrapper">
                                <iframe class="videoIframe js-videoIframe" src="https://www.youtube.com/embed/AdZrEIo6UYU" data-src="https://www.youtube.com/embed/AdZrEIo6UYU?autoplay=1&amp;rel=0" allow="autoplay"></iframe>
                                <div class="videoPoster js-videoPoster">
                                    <div class="video-inner">
                                        <i class="far fa-play-circle"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="discount-box main-box padding-tb-10">
                                <div class="discount-price padding-10">
                                    <div class="left-side">
                                        <h6 class="text-light-black fw-600 no-margin">Watch Now and get 50% discount</h6>
                                        <p class="text-light-white no-margin">The hung-over foody (2020)</p>
                                    </div>
                                    <div class="right-side justify-content-end">
                                        <div class="dis-text">
                                            <span class="badge bg-light-green text-custom-white fw-400">Discount</span>
                                            <h4 class="text-light-black no-margin">50%</h4>
                                        </div>
                                        <a href="restaurent.html">
                                            <img src="https://via.placeholder.com/94x54" class="img-fluid" alt="logo">
                                        </a>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="cart-detail-box">
                            <div class="card">
                                <div class="card-header padding-15 fw-700">Your Order</div>
                                <div class="card-body no-padding" id="scrollstyle-4">
                                    <div class="cat-product-box">
                                        <div class="cat-product">
                                            <div class="cat-name">
                                                <a href="#">
                                                    <p class="text-light-green fw-700"><span class="text-dark-white">1</span> Chilli Chicken Pizza</p> <span class="text-light-white fw-700">small, chilli chicken</span>
                                                </a>
                                            </div>
                                            <div class="delete-btn">
                                                <a href="#" class="text-dark-white"> <i class="far fa-trash-alt"></i>
                                                </a>
                                            </div>
                                            <div class="price"> <a href="#" class="text-dark-white fw-500">
                          $2.25
                        </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cat-product-box">
                                        <div class="cat-product">
                                            <div class="cat-name">
                                                <a href="#">
                                                    <p class="text-light-green fw-700"><span class="text-dark-white">1</span> Chilli Chicken Pizza</p> <span class="text-light-white fw-700">small, chilli chicken</span>
                                                </a>
                                            </div>
                                            <div class="delete-btn">
                                                <a href="#" class="text-dark-white"> <i class="far fa-trash-alt"></i>
                                                </a>
                                            </div>
                                            <div class="price"> <a href="#" class="text-dark-white fw-500">
                          $2.25
                        </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cat-product-box">
                                        <div class="cat-product">
                                            <div class="cat-name">
                                                <a href="#">
                                                    <p class="text-light-green fw-700"><span class="text-dark-white">1</span> Chilli Chicken Pizza</p> <span class="text-light-white fw-700">small, chilli chicken</span>
                                                </a>
                                            </div>
                                            <div class="delete-btn">
                                                <a href="#" class="text-dark-white"> <i class="far fa-trash-alt"></i>
                                                </a>
                                            </div>
                                            <div class="price"> <a href="#" class="text-dark-white fw-500">
                          $2.25
                        </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cat-product-box">
                                        <div class="cat-product">
                                            <div class="cat-name">
                                                <a href="#">
                                                    <p class="text-light-green fw-700"><span class="text-dark-white">1</span> Chilli Chicken Pizza</p> <span class="text-light-white fw-700">small, chilli chicken</span>
                                                </a>
                                            </div>
                                            <div class="delete-btn">
                                                <a href="#" class="text-dark-white"> <i class="far fa-trash-alt"></i>
                                                </a>
                                            </div>
                                            <div class="price"> <a href="#" class="text-dark-white fw-500">
                          $2.25
                        </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item-total">
                                        <div class="total-price border-0"> <span class="text-dark-white fw-700">Items subtotal:</span>
                                            <span class="text-dark-white fw-700">$9.00</span>
                                        </div>
                                        <div class="empty-bag padding-15 fw-700"> <a href="#">Empty bag</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer padding-15"> <a href="checkout.html " class="btn-first green-btn text-custom-white full-width fw-500">Proceed to Checkout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- restaurent meals -->
    <!-- restaurent about -->
    <section class="section-padding restaurent-about smoothscroll" id="about">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h3 class="text-light-black fw-700 title">Thông tin về ${location.locationName}</h3>
                    <p class="text-light-green no-margin">${location.locationType.locationTypeName}, ${location.locationCategory.locationCategoryName} </p>
                  <!--   <p class="text-light-white no-margin"></p> <span class="text-success fs-16">$</span> -->
                    <span class="text-success fs-16">$</span>
                    <span class="text-success fs-16">$</span>
                    <span class="text-dark-white fs-16">$</span>
                    <span class="text-dark-white fs-16">$</span>
                    <ul class="about-restaurent">
                        <li> <i class="fas fa-map-marker-alt"></i>
                            <span>
                <a href="#" class="text-light-white">
                  ${location.address}
                </a>
              </span>
                        </li>
                        <li> <i class="fas fa-phone-alt"></i>
                            <span><a href="tel:" class="text-light-white">${location.locationPhone}</a></span>
                        </li>
                        <li> <i class="far fa-envelope"></i>
                            <span><a href="mailto:" class="text-light-white">${location.locationEmail}</a></span>
                        </li>
                    </ul>
                    <ul class="social-media pt-2">
                        <li> <a href="#"><i class="fab fa-facebook-f"></i></a>
                        </li>
                        <li> <a href="#"><i class="fab fa-twitter"></i></a>
                        </li>
                        <li> <a href="#"><i class="fab fa-instagram"></i></a>
                        </li>
                        <li> <a href="#"><i class="fab fa-pinterest-p"></i></a>
                        </li>
                        <li> <a href="#"><i class="fab fa-youtube"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <div class="restaurent-schdule">
                        <div class="card">
                            <div class="card-header text-light-white fw-700 fs-16">Hours</div>
                            <div class="card-body">
                                <div class="schedule-box">
                                    <div class="day text-light-black">Hôm nay</div>
                                    <div class="time text-light-black">thời gian hoạt động: ${location.openTime} - ${location.closeTime}</div>
                                </div>
                                <!-- <div class="collapse" id="schdule">
                                    <div class="schedule-box">
                                        <div class="day text-light-black">Today</div>
                                        <div class="time text-light-black">Delivery: 7:00am - 10:59pm</div>
                                    </div>
                                    <div class="schedule-box">
                                        <div class="day text-light-black">Today</div>
                                        <div class="time text-light-black">Delivery: 7:00am - 10:59pm</div>
                                    </div>
                                    <div class="schedule-box">
                                        <div class="day text-light-black">Today</div>
                                        <div class="time text-light-black">Delivery: 7:00am - 10:59pm</div>
                                    </div>
                                    <div class="schedule-box">
                                        <div class="day text-light-black">Today</div>
                                        <div class="time text-light-black">Delivery: 7:00am - 10:59pm</div>
                                    </div>
                                </div> -->
                            </div>
                            <!-- <div class="card-footer"> <a class="fw-500 collapsed" data-toggle="collapse" href="#schdule">See the full schedule</a>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- restaurent about -->
    <!-- map gallery -->
    <div class="map-gallery-sec section-padding bg-light-theme smoothscroll" id="mapgallery">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="main-box">
                        <div class="row">
                            <div class="col-md-6 map-pr-0">
                                <iframe id="locmap" src="https://maps.google.com/maps?q=university%20of%20san%20francisco&t=&z=13&ie=UTF8&iwloc=&output=embed"></iframe>
                            </div>
                            <div class="col-md-6 map-pl-0">
                                <div class="gallery-box padding-10">
                                    <ul class="gallery-img">
                                        <li>
                                            <a class="image-popup" href="https://via.placeholder.com/173" title="Image title">
                                                <img src="https://via.placeholder.com/173" class="img-fluid full-width" alt="9.jpg" />
                                            </a>
                                        </li>
                                        <li>
                                            <a class="image-popup" href="https://via.placeholder.com/173" title="Image title">
                                                <img src="https://via.placeholder.com/173" class="img-fluid full-width" alt="9.jpg" />
                                            </a>
                                        </li>
                                        <li>
                                            <a class="image-popup" href="https://via.placeholder.com/173" title="Image title">
                                                <img src="https://via.placeholder.com/173" class="img-fluid full-width" alt="9.jpg" />
                                            </a>
                                        </li>
                                        <li>
                                            <a class="image-popup" href="https://via.placeholder.com/173" title="Image title">
                                                <img src="https://via.placeholder.com/173" class="img-fluid full-width" alt="9.jpg" />
                                            </a>
                                        </li>
                                        <li>
                                            <a class="image-popup" href="https://via.placeholder.com/173" title="Image title">
                                                <img src="https://via.placeholder.com/173" class="img-fluid full-width" alt="9.jpg" />
                                            </a>
                                        </li>
                                        <li>
                                            <a class="image-popup" href="https://via.placeholder.com/173" title="Image title">
                                                <img src="https://via.placeholder.com/173" class="img-fluid full-width" alt="9.jpg" />
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- map gallery -->
    <!-- restaurent reviews -->
    <section class="section-padding restaurent-review smoothscroll" id="review">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-header-left">
                        <h3 class="text-light-black header-title title">Đánh giá Nhà Hàng 1</h3>
                    </div>
                    <div class="restaurent-rating mb-xl-20">
                        <div class="star"> <span class="text-yellow fs-16">
                <i class="fas fa-star"></i>
              </span>
                            <span class="text-yellow fs-16">
                <i class="fas fa-star"></i>
              </span>
                            <span class="text-yellow fs-16">
                <i class="fas fa-star"></i>
              </span>
                            <span class="text-dark-white fs-16">
                <i class="fas fa-star"></i>
              </span>
                            <span class="text-dark-white fs-16">
                <i class="fas fa-star"></i>
              </span>
                        </div> <span class="fs-12 text-light-black">58 Ratings</span>
                    </div>
                    <p class="text-light-black mb-xl-20">Đánh giá từ mọi người</p>
                    <ul>
                        <li>
                            <h6 class="text-light-black mb-1">9</h6>
                            <span class="text-light-black fs-12 fw-400">Quality</span>
                        </li>
                        <li>
                            <h6 class="text-light-black mb-1">8,5</h6>
                            <span class="text-light-black fs-12 fw-400">Service</span>
                        </li>
                        <li>
                            <h6 class="text-light-black mb-1">8,5</h6>
                            <span class="text-light-black fs-12 fw-400">Space</span>
                        </li>
                        <li>
                            <h6 class="text-light-black mb-1">9</h6>
                            <span class="text-light-black fs-12 fw-400">Location</span>
                        </li>
                        <li>
                            <h6 class="text-light-black mb-1">8</h6>
                            <span class="text-light-black fs-12 fw-400">Price</span>
                        </li>
                    </ul>
                    <div class="u-line"></div>
                </div>
                <div style="width: 100%; 
                			border: 1px solid black; 
                			padding: 15px;
                			margin: 15px;
                			background-color: #ffffcc;" 
                			id="reviews">
					<p>
						<b>Write Your Review</b>
					</p>
					<form role="form" action="${pageContext.request.contextPath}/public/restaurant" enctype="multipart/form-data" method="post">
						<div class="form-group">
							<input type="text" class="form-control mb-10" name="title"
								id="title" placeholder="Title" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Title'" required="true">
						</div>
						<div class="form-group">
							<textarea class="form-control mb-10" id="content" rows="5"
								name="content" placeholder="Content"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Content'" required="true"></textarea>
						</div>
						<hr />
						<div class="input-field">
							<label class="active">Photos</label>
							<div class="input-images-1" style="padding-top: .5rem;"></div>
						</div>
						<!-- <div class="input-field">
					        <label class="active">Photos</label>
					        <div class="input-images-2" style="padding-top: .5rem;"></div>
					    </div> -->
						<hr />
						<div>
							<h5>Videos</h5>
							<video id="myVideo" width="400" controls>
								<source src="" id="video_here">
							</video>
							<br /> <input style="display: inline-block;" type="file"
								name="file[]" class="file_multi_video" accept="video/*">
							<button style="display: inline-block;" id="btn-file-reset-id"
								type="button">Reset file</button>
						</div>
						<hr />
						<div>
							<h5>Rating</h5>
							<p>
								<label style="display: inline-block; width: 80px;">Location:</label>
								<input style="display: inline-block;" type="range"
									name="location" class="slider" min="1" max="10" value="5">
								<span style="display: inline-block;" class="slider_label"></span>
							</p>
							<p>
								<label style="display: inline-block; width: 80px;">Price:</label>
								<input style="display: inline-block;" type="range"
									name="price" class="slider" min="1" max="10" value="5">
								<span style="display: inline-block;" class="slider_label"></span>
							</p>
							<p>
								<label style="display: inline-block; width: 80px;">Quality:</label>
								<input style="display: inline-block;" type="range"
									name="quality" class="slider" min="1" max="10" value="5">
								<span style="display: inline-block;" class="slider_label"></span>
							</p>
							<p>
								<label style="display: inline-block; width: 80px;">Service:</label>
								<input style="display: inline-block;" type="range"
									name="service" class="slider" min="1" max="10" value="5">
								<span style="display: inline-block;" class="slider_label"></span>
							</p>
							<p>
								<label style="display: inline-block; width: 80px;">Space:</label>
								<input style="display: inline-block;" type="range"
									name="space" class="slider" min="1" max="10" value="5">
								<span style="display: inline-block;" class="slider_label"></span>
							</p>
						</div>
						<input type="submit" value="Submit" name="submit"
							class="btn btn-primary pull-left" />
					</form>
				</div>
				<!-- Comment  -->
				<div style="margin-left: 15px;" class="section-header-left">
                    <h3 class="text-light-black header-title title">DANH SÁCH BÌNH LUẬN</h3>
                </div>
				<div class="container bootdey comments">
					<div class="col-md-12 bootstrap snippets">
						<div class="panel">
							<div class="panel-body">
								<!-- Newsfeed Content -->
								<!--===================================================-->
								<div class="media-block">
									<a class="media-left" href="#"><img class="img-circle img-sm" alt="Profile Picture" src="https://bootdey.com/img/Content/avatar/avatar1.png"></a>
									<div class="media-body">
										<div class="mar-btm">
											<a href="#" class="btn-link text-semibold media-heading box-inline">Thanh Hải</a>
											<p class="text-muted text-sm">
												<i class="fa fa-mobile fa-lg"></i> - From Mobile - 11 min ago
											</p>
										</div>
										<p>Nhà hàng sạch sẽ và giá cả hợp lí</p>
										<div class="pad-ver">
											<span class="tag tag-sm"><i class="fa fa-heart text-danger"></i> 250 Likes</span>
											<div class="btn-group">
												<a class="btn btn-sm btn-default btn-hover-success" href="#"><i class="fa fa-thumbs-up"></i></a> 
												<a class="btn btn-sm btn-default btn-hover-danger" href="#"><i class="fa fa-thumbs-down"></i></a>
											</div>
											<a class="btn btn-sm btn-default btn-hover-primary cmt" onclick="fn()" href="javascript:void(0)">Comment</a>
										</div>
										<hr>

										<div>
											<div class="media-block">
												<a class="media-left" href="#">
													<img class="img-circle img-sm" alt="Profile Picture" src="https://bootdey.com/img/Content/avatar/avatar2.png">
												</a>
												<div class="media-body">
													<div class="mar-btm">
														<a href="#" class="btn-link text-semibold media-heading box-inline">Đình Long</a>
														<p class="text-muted text-sm">
															<i class="fa fa-mobile fa-lg"></i> - From Mobile - 7 min ago
														</p>
													</div>
													<p>OK ok </p>
													<div class="pad-ver">
														<div class="btn-group">
															<a class="btn btn-sm btn-default btn-hover-success active" href="#"><i class="fa fa-thumbs-up"></i> You Like it</a>
															<a class="btn btn-sm btn-default btn-hover-danger" href="#"><i class="fa fa-thumbs-down"></i></a>
														</div>
														<a class="btn btn-sm btn-default btn-hover-primary cmt" onclick="fn()" href="javascript:void(0)">Comment</a>
													</div>
													<hr>
												</div>
											</div>

											<div class="media-block">
												<a class="media-left" href="#">
													<img class="img-circle img-sm" alt="Profile Picture" src="https://bootdey.com/img/Content/avatar/avatar3.png">
												</a>
												<div class="media-body">
													<div class="mar-btm">
														<a href="#" class="btn-link text-semibold media-heading box-inline">Long</a>
														<p class="text-muted text-sm">
															<i class="fa fa-globe fa-lg"></i> - From Web - 2 min ago
														</p>
													</div>
													<p>Nhà hàng đẹp</p>
													<div class="pad-ver">
														<div class="btn-group">
															<a class="btn btn-sm btn-default btn-hover-success" href="#"><i class="fa fa-thumbs-up"></i></a> 
															<a class="btn btn-sm btn-default btn-hover-danger" href="#"><i class="fa fa-thumbs-down"></i></a>
														</div>
														<a class="btn btn-sm btn-default btn-hover-primary" onclick="fn()" href="javascript:void(0)">Comment</a>
													</div>
													<hr>
												</div>
											</div>

											<div id="demo" class="media-block collapse">
												<a class="media-left" href="#">
													<img class="img-circle img-sm" alt="Profile Picture" src="https://bootdey.com/img/Content/avatar/avatar3.png">
												</a>
												<div class="media-body">
													<div class="mar-btm">
														<a href="#" class="btn-link text-semibold media-heading box-inline">Thanh Hải</a>
														<p class="text-muted text-sm">
															<i class="fa fa-globe fa-lg"></i> - From Web - 2 min ago
														</p>
													</div>
													<div class="pad-ver">
														<div>
															<textarea id="focu" class="form-control" rows="2" cols="80" placeholder="Nhập bình luận..."></textarea><br/>
															<button class="btn btn-primary btn-sm shadow-none" type="submit">Trả lời</button>
															<button style="margin-left: 10px;" class="btn btn-sm btn-primary shadow-none" type="button">Hủy</button>
														</div>
													</div>
													<hr>
												</div>
											</div>

										</div>
									</div>
								</div>
								<!--===================================================-->
								<!-- End Newsfeed Content -->


								<!-- Newsfeed Content -->
								<!--===================================================-->
								<div class="media-block pad-all">
									<a class="media-left" href="#">
										<img class="img-circle img-sm" alt="Profile Picture" src="https://bootdey.com/img/Content/avatar/avatar1.png">
									</a>
									<div class="media-body">
										<div class="mar-btm">
											<a href="#" class="btn-link text-semibold media-heading box-inline">Thanh Hải</a>
											<p class="text-muted text-sm">
												<i class="fa fa-mobile fa-lg"></i> - From Mobile - 11 min ago
											</p>
										</div>
										<p>Nhà hàng sạch sẽ và giá cả hợp lí</p>
										<img class="img-responsive thumbnail" src="https://via.placeholder.com/400x300" alt="Image">
										<div class="pad-ver">
											<span class="tag tag-sm"><i class="fa fa-heart text-danger"></i> 250 Likes</span>
											<div class="btn-group">
												<a class="btn btn-sm btn-default btn-hover-success" href="#"><i class="fa fa-thumbs-up"></i></a> 
												<a class="btn btn-sm btn-default btn-hover-danger" href="#"><i class="fa fa-thumbs-down"></i></a>
											</div>
											<a class="btn btn-sm btn-default btn-hover-primary" href="#">Comment</a>
										</div>
										<hr>

										<div>
											<div class="media-block pad-all">
												<a class="media-left" href="#">
													<img class="img-circle img-sm" alt="Profile Picture" src="https://bootdey.com/img/Content/avatar/avatar2.png">
												</a>
												<div class="media-body">
													<div class="mar-btm">
														<a href="#" class="btn-link text-semibold media-heading box-inline">Long</a>
														<p class="text-muted text-sm">
															<i class="fa fa-globe fa-lg"></i> - From Web - 2 min ago
														</p>
													</div>
													<p>Ok</p>
													<div>
														<div class="btn-group">
															<a class="btn btn-sm btn-default btn-hover-success" href="#"><i class="fa fa-thumbs-up"></i></a> 
															<a class="btn btn-sm btn-default btn-hover-danger" href="#"><i class="fa fa-thumbs-down"></i></a>
														</div>
														<a class="btn btn-sm btn-default btn-hover-primary">Comment</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--===================================================-->
								<!-- End Newsfeed Content -->
							</div>
						</div>
					</div>
				</div>
				<!-- Comment  -->
                <div class="col-md-12">
                    <div class="review-box">
                        <div class="review-user">
                            <div class="review-user-img">
                                <img src="https://via.placeholder.com/40" class="rounded-circle" alt="#">
                                <div class="reviewer-name">
                                    <p class="text-light-black fw-600">Sarra <small class="text-light-white fw-500">New York, (NY)</small>
                                    </p> <i class="fas fa-trophy text-black"></i><span class="text-light-black">Top Reviewer</span>
                                </div>
                            </div>
                            <div class="review-date"> <span class="text-light-white">Sep 20, 2020</span>
                            </div>
                        </div>
                        <div class="ratings"> 
                        	<span class="text-yellow fs-16"><i class="fas fa-star"></i></span>
                            <span class="text-yellow fs-16"><i class="fas fa-star"></i></span>
                            <span class="text-yellow fs-16"><i class="fas fa-star"></i></span>
                            <span class="text-yellow fs-16"><i class="fas fa-star"></i></span>
                            <span class="text-yellow fs-16"><i class="fas fa-star"></i></span>
                            <span class="ml-2 text-light-white">2 days ago</span>
                        </div>
                        <p class="text-light-black">Delivery was fast and friendly. Food was not great especially the salad. Will not be ordering from again. Too many options to settle for this place.</p> 
                        <span class="text-light-white fs-12 food-order">Kathy ordered:</span>
                        <ul class="food">
                            <li>
                                <button class="add-pro bg-gradient-red">Coffee <span class="close">+</span></button>
                            </li>
                            <li>
                                <button class="add-pro bg-dark">Pizza <span class="close">+</span></button>
                            </li>
                            <li>
                                <button class="add-pro bg-gradient-green">Noodles <span class="close">+</span></button>
                            </li>
                            <li>
                                <button class="add-pro bg-gradient-orange">Burger <span class="close">+</span></button>
                            </li>
                        </ul>
                    </div>
                    <div class="review-box">
                        <div class="review-user">
                            <div class="review-user-img">
                                <img src="https://via.placeholder.com/40" class="rounded-circle" alt="#">
                                <div class="reviewer-name">
                                    <p class="text-light-black fw-600">Sarra <small class="text-light-white fw-500">New York, (NY)</small>
                                    </p> <i class="fas fa-trophy text-black"></i><span class="text-light-black">Top Reviewer</span>
                                </div>
                            </div>
                            <div class="review-date"> <span class="text-light-white">Sep 20, 2020</span>
                            </div>
                        </div>
                        <div class="ratings"> <span class="text-yellow fs-16">
                <i class="fas fa-star"></i>
              </span>
                            <span class="text-yellow fs-16">
                <i class="fas fa-star"></i>
              </span>
                            <span class="text-yellow fs-16">
                <i class="fas fa-star"></i>
              </span>
                            <span class="text-yellow fs-16">
                <i class="fas fa-star"></i>
              </span>
                            <span class="text-yellow fs-16">
                <i class="fas fa-star"></i>
              </span>
                            <span class="ml-2 text-light-white">2 days ago</span>
                        </div>
                        <p class="text-light-black">Delivery was fast and friendly. Food was not great especially the salad. Will not be ordering from again. Too many options to settle for this place.</p> <span class="text-light-white fs-12 food-order">Kathy
              ordered:</span>
                        <ul class="food">
                            <li>
                                <button class="add-pro bg-gradient-red">Coffee <span class="close">+</span>
            </button>
                            </li>
                            <li>
                                <button class="add-pro bg-dark">Pizza <span class="close">+</span>
            </button>
                            </li>
                            <li>
                                <button class="add-pro bg-gradient-green">Noodles <span class="close">+</span>
            </button>
                            </li>
                            <li>
                                <button class="add-pro bg-gradient-orange">Burger <span class="close">+</span>
            </button>
                            </li>
                        </ul>
                    </div>
                    <div class="review-box">
                        <div class="review-user">
                            <div class="review-user-img">
                                <img src="https://via.placeholder.com/40" class="rounded-circle" alt="#">
                                <div class="reviewer-name">
                                    <p class="text-light-black fw-600">Sarra <small class="text-light-white fw-500">New York, (NY)</small>
                                    </p> <i class="fas fa-trophy text-black"></i><span class="text-light-black">Top Reviewer</span>
                                </div>
                            </div>
                            <div class="review-date"> <span class="text-light-white">Sep 20, 2020</span>
                            </div>
                        </div>
                        <div class="ratings"> <span class="text-yellow fs-16">
                <i class="fas fa-star"></i>
              </span>
                            <span class="text-yellow fs-16">
                <i class="fas fa-star"></i>
              </span>
                            <span class="text-yellow fs-16">
                <i class="fas fa-star"></i>
              </span>
                            <span class="text-yellow fs-16">
                <i class="fas fa-star"></i>
              </span>
                            <span class="text-yellow fs-16">
                <i class="fas fa-star"></i>
              </span>
                            <span class="ml-2 text-light-white">2 days ago </span>
                        </div>
                        <p class="text-light-black">Delivery was fast and friendly. Food was not great especially the salad. Will not be ordering from again. Too many options to settle for this place.</p> <span class="text-light-white fs-12 food-order">Kathy
              ordered:</span>
                        <ul class="food">
                            <li>
                                <button class="add-pro bg-gradient-red">Coffee <span class="close">+</span>
            </button>
                            </li>
                            <li>
                                <button class="add-pro bg-dark">Pizza <span class="close">+</span>
            </button>
                            </li>
                            <li>
                                <button class="add-pro bg-gradient-green">Noodles <span class="close">+</span>
            </button>
                            </li>
                            <li>
                                <button class="add-pro bg-gradient-orange">Burger <span class="close">+</span>
            </button>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-12">
                    <div class="review-img">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/review-footer.png" class="img-fluid" alt="#">
                        <div class="review-text">
                            <h2 class="text-light-white mb-2 fw-600">Be one of the first to review</h2>
                            <p class="text-light-white">Order now and write a review to give others the inside scoop.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- restaurent reviews -->
    <!-- offer near -->
    <section class="fresh-deals section-padding">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-header-left">
                        <h3 class="text-light-black header-title title">Offers near you</h3>
                    </div>
                </div>
                <div class="col-12">
                    <div class="fresh-deals-slider swiper-container">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="product-box">
                                    <div class="product-img">
                                        <a href="restaurant.html">
                                            <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                        </a>
                                    </div>
                                    <div class="product-caption">
                                        <div class="title-box">
                                            <h6 class="product-title"><a href="restaurant.html" class="text-light-black">Great Burger</a></h6>
                                        </div>
                                        <p class="text-light-white">American, Fast Food</p>
                                        <div class="product-details">
                                            <div class="price-time"> <span class="text-light-black time">30-40 min</span>
                                                <span class="text-light-white price">$10 min</span>
                                            </div>
                                            <div class="rating"> <span>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                        </span>
                                                <span class="text-light-white text-right">4225 ratings</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-footer-2">
                                        <div class="discount"> <span class="text-success fs-12">$3 off</span>
                                        </div>
                                        <div class="discount-coupon"> <span class="text-light-white fs-12">First order only</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="product-box">
                                    <div class="product-img">
                                        <a href="restaurant.html">
                                            <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                        </a>
                                    </div>
                                    <div class="product-caption">
                                        <div class="title-box">
                                            <h6 class="product-title"><a href="restaurant.html" class="text-light-black">Flavor Town</a></h6>
                                        </div>
                                        <p class="text-light-white">Breakfast, Lunch & Dinner</p>
                                        <div class="product-details">
                                            <div class="price-time"> <span class="text-light-black time">30-40 min</span>
                                                <span class="text-light-white price">$10 min</span>
                                            </div>
                                            <div class="rating"> <span>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                        </span>
                                                <span class="text-light-white text-right">4225 ratings</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-footer-2">
                                        <div class="discount"> <span class="text-success fs-12">$3 off</span>
                                        </div>
                                        <div class="discount-coupon"> <span class="text-light-white fs-12">First order only</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="product-box">
                                    <div class="product-img">
                                        <a href="restaurant.html">
                                            <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                        </a>
                                    </div>
                                    <div class="product-caption">
                                        <div class="title-box">
                                            <h6 class="product-title"><a href="restaurant.html" class="text-light-black">Big Bites</a></h6>
                                        </div>
                                        <p class="text-light-white">Pizzas, Fast Food</p>
                                        <div class="product-details">
                                            <div class="price-time"> <span class="text-light-black time">30-40 min</span>
                                                <span class="text-light-white price">$10 min</span>
                                            </div>
                                            <div class="rating"> <span>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                        </span>
                                                <span class="text-light-white text-right">4225 ratings</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-footer-2">
                                        <div class="discount"> <span class="text-success fs-12">$3 off</span>
                                        </div>
                                        <div class="discount-coupon"> <span class="text-light-white fs-12">First order only</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="product-box">
                                    <div class="product-img">
                                        <a href="restaurant.html">
                                            <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                        </a>
                                    </div>
                                    <div class="product-caption">
                                        <div class="title-box">
                                            <h6 class="product-title"><a href="restaurant.html" class="text-light-black">Smile N’ Delight</a></h6>
                                        </div>
                                        <p class="text-light-white">Desserts, Beverages</p>
                                        <div class="product-details">
                                            <div class="price-time"> <span class="text-light-black time">30-40 min</span>
                                                <span class="text-light-white price">$10 min</span>
                                            </div>
                                            <div class="rating"> <span>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                        </span>
                                                <span class="text-light-white text-right">4225 ratings</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-footer-2">
                                        <div class="discount"> <span class="text-success fs-12">$3 off</span>
                                        </div>
                                        <div class="discount-coupon"> <span class="text-light-white fs-12">First order only</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="product-box">
                                    <div class="product-img">
                                        <a href="restaurant.html">
                                            <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                        </a>
                                    </div>
                                    <div class="product-caption">
                                        <div class="title-box">
                                            <h6 class="product-title"><a href="restaurant.html" class="text-light-black">Lil Johnny’s</a></h6>
                                        </div>
                                        <p class="text-light-white">Continental & Mexican</p>
                                        <div class="product-details">
                                            <div class="price-time"> <span class="text-light-black time">30-40 min</span>
                                                <span class="text-light-white price">$10 min</span>
                                            </div>
                                            <div class="rating"> <span>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                          <i class="fas fa-star text-yellow"></i>
                        </span>
                                                <span class="text-light-white text-right">4225 ratings</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-footer-2">
                                        <div class="discount"> <span class="text-success fs-12">$3 off</span>
                                        </div>
                                        <div class="discount-coupon"> <span class="text-light-white fs-12">First order only</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Add Arrows -->
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- offer near -->
   
    <!-- product popup -->
    <c:forEach items="${product}" var="product">
    <div class="modal fade restaurent-popup" id="restaurent-product${product.productId}" >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div style="height: 410px"; class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <img style="height: 400px"; src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${product.imagePath}" class="img-fluid full-width" alt="#">
                </div>
                <div class="name padding-10">
                    <h3 class="text-light-black fw-700 mb-2">${product.name}</h3>
                    <h5 class="text-light-black fw-600 no-margin">${product.price}VNĐ</h5>
                </div>
                <div class="u-line">
                    <div class="product-quantity padding-10"> <span class="text-light-black fw-700 fs-16">Quantity</span>
                        <div class="input-group quantity">
                            <div class="input-group-append">
                                <button class="minus-btn" type="button" name="button"> <i class="fas fa-minus"></i></button>
                            </div>
                            <input type="text" class="text-center" name="name" value="1">
                            <div class="input-group-prepend">
                                <button class="plus-btn" type="button" name="button"><i class="fas fa-plus"></i></button>
                            </div>
                            <div class="input-group-prepend">
                            	<button class="btn-second btn-submit">${product.price}VNĐ</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn-second btn-submit center">ĐẶT HÀNG</button>
                </div>
                    <!-- sub product -->
                    <!-- <div class="additional-product">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="no-margin">
                                    <a class="card-link collapsed text-light-black fw-700" data-toggle="collapse" href="#additionalOne">
                                        <span>Select Breakfast Drink
                      <span class="text-light-white fw-500 fs-12 padding-tb-10">Select one (Required)</span></span>
                                    </a>
                                </h5>
                            </div>
                            <div id="additionalOne" class="collapse">
                                <div class="card-body padding-10">
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="no-margin">
                                    <a class="card-link collapsed text-light-black fw-700" data-toggle="collapse" href="#additionalTwo">
                                        <span>Select Breakfast Drink
                      <span class="text-light-white fw-500 fs-12 padding-tb-10">Select one (Required)</span></span>
                                    </a>
                                </h5>
                            </div>
                            <div id="additionalTwo" class="collapse">
                                <div class="card-body padding-10">
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="no-margin">
                                    <a class="card-link collapsed text-light-black fw-700" data-toggle="collapse" href="#additionalThree">
                                        <span>Select Breakfast Drink
                      <span class="text-light-white fw-500 fs-12 padding-tb-10">Select one (Required)</span></span>
                                    </a>
                                </h5>
                            </div>
                            <div id="additionalThree" class="collapse">
                                <div class="card-body padding-10">
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="no-margin">
                                    <a class="card-link collapsed text-light-black fw-700" data-toggle="collapse" href="#additionalFour">
                                        <span>Select Breakfast Drink
                      <span class="text-light-white fw-500 fs-12 padding-tb-10">Select one (Required)</span></span>
                                    </a>
                                </h5>
                            </div>
                            <div id="additionalFour" class="collapse">
                                <div class="card-body padding-10">
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                </div>
                            </div>
                        </div>
                    </div> -->
                    <!-- sub product -->
            </div>
        </div>
    </div>
	</c:forEach>
	<!-- combo popup -->
	<c:forEach items="${comboDetailList}" var="comboDetail">
    <div class="modal fade restaurent-popup" id="restaurent-combo${comboDetail.productComboId}" >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div style="height: 410px"; class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <img style="height: 400px"; src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${comboDetail.comboImagePath}" class="img-fluid full-width" alt="#">
                </div>
                <div class="name padding-10">
                    <h3 class="text-light-black fw-700 mb-2">${comboDetail.comboName}</h3>
                    <h5 class="text-light-black fw-600 no-margin">${comboDetail.rateDiscount}VNĐ</h5>
                </div>
                <div class="u-line">
                    <div class="product-quantity padding-10"> <span class="text-light-black fw-700 fs-16">Quantity</span>
                        <div class="input-group quantity">
                            <div class="input-group-append">
                                <button class="minus-btn" type="button" name="button"> <i class="fas fa-minus"></i></button>
                            </div>
                            <input type="text" class="text-center" name="name" value="1">
                            <div class="input-group-prepend">
                                <button class="plus-btn" type="button" name="button"><i class="fas fa-plus"></i></button>
                            </div>
                            <div class="input-group-prepend">
                            	<button class="btn-second btn-submit">${comboDetail.rateDiscount}VNĐ</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="u-line">
					<c:forEach items="${productComboDetailList}" var="productComboDetail">
	                	<c:if test="${productComboDetail.productComboId == comboDetail.productComboId}">
		                	<div>
		                		<p>${productComboDetail.productName}</p>
		                	</div>
	                	</c:if>
                	</c:forEach>
                </div>
                <div class="modal-footer">
                    <button class="btn-second btn-submit center">ĐẶT HÀNG</button>
                </div>
                    <!-- sub product -->
                    <!-- <div class="additional-product">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="no-margin">
                                    <a class="card-link collapsed text-light-black fw-700" data-toggle="collapse" href="#additionalOne">
                                        <span>Select Breakfast Drink
                      <span class="text-light-white fw-500 fs-12 padding-tb-10">Select one (Required)</span></span>
                                    </a>
                                </h5>
                            </div>
                            <div id="additionalOne" class="collapse">
                                <div class="card-body padding-10">
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="no-margin">
                                    <a class="card-link collapsed text-light-black fw-700" data-toggle="collapse" href="#additionalTwo">
                                        <span>Select Breakfast Drink
                      <span class="text-light-white fw-500 fs-12 padding-tb-10">Select one (Required)</span></span>
                                    </a>
                                </h5>
                            </div>
                            <div id="additionalTwo" class="collapse">
                                <div class="card-body padding-10">
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="no-margin">
                                    <a class="card-link collapsed text-light-black fw-700" data-toggle="collapse" href="#additionalThree">
                                        <span>Select Breakfast Drink
                      <span class="text-light-white fw-500 fs-12 padding-tb-10">Select one (Required)</span></span>
                                    </a>
                                </h5>
                            </div>
                            <div id="additionalThree" class="collapse">
                                <div class="card-body padding-10">
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="no-margin">
                                    <a class="card-link collapsed text-light-black fw-700" data-toggle="collapse" href="#additionalFour">
                                        <span>Select Breakfast Drink
                      <span class="text-light-white fw-500 fs-12 padding-tb-10">Select one (Required)</span></span>
                                    </a>
                                </h5>
                            </div>
                            <div id="additionalFour" class="collapse">
                                <div class="card-body padding-10">
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                    <button class="add-pro">Small Premium Roast Coffee (0 Cal.) <span>+$0.59</span>
                    <span class="close">+</span>
                  </button>
                                </div>
                            </div>
                        </div>
                    </div> -->
                    <!-- sub product -->
            </div>
        </div>
    </div>
	</c:forEach>
	
<!-- upload multi image -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://www.codehim.com/demo/jquery-image-uploader-preview-and-delete/dist/image-uploader.min.js"></script>
<!-- comment -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<script>
var filelist = new Array();
  $(document).ready(function() {
      $('#imgupload').on('click', function() {
    	 /*  var input = document.getElementById('images-1614651272519');
    	  for (var i = 0; i < input.files.length; ++i) {
    	        filelist.push(input.files.item(i).name);
    	    }  
    	  alert(filelist); */
    	  var filename = $('input[type=file]').val().split('\\').pop();
    	  alert(filename);
    	  
    	    /* var inp = document.getElementById('fileElementId');
    	    for (var i = 0; i < inp.files.length; ++i) {
    	      var name = inp.files.item(i).name;
    	      alert("here is a file name: " + name);
    	    } */
        });
    });
</script>
<script type="text/javascript">
$(function(){
$('.slider').on('input change', function(){
          $(this).next($('.slider_label')).html(this.value);
        });
      $('.slider_label').each(function(){
          var value = $(this).prev().attr('value');
          $(this).html(value);
        });  
})
</script>
<script>
$(document).on("change", ".file_multi_video", function(evt) {
	  var $source = $('#video_here');
	  $source[0].src = URL.createObjectURL(this.files[0]);
	  $source.parent()[0].load();
	});
</script>
<script>
  $(document).ready(function() {
      $('#btn-file-reset-id').on('click', function() {
          $('.file_multi_video').val('');
          document.getElementById("video_here").src = "";
          document.getElementById("myVideo").load();
        });
    });
</script>
<script>
function fn() {
		  $('#demo').collapse('show');
		  /* var divPosition = $('#demo').offset();
		  $('.comment').animate({scrollTop: divPosition.top}, "slow"); */
		  window.location = "#demo";
		  document.getElementById("focu").focus()
}
</script>
<script type="text/javascript">
	$('.input-images-1').imageUploader();
</script>
<script>
let preloaded = [
    {id: 1, src: '${pageContext.request.contextPath}/uploads/${linkanh}'},
];

$('.input-images-2').imageUploader({
    preloaded: preloaded,
    imagesInputName: 'images',
    preloadedInputName: 'images'
});
</script>