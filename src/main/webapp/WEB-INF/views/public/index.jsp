<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/tags/taglib.jsp"%>

     <!-- slider -->
    <section class="about-us-slider swiper-container p-relative">
        <div class="swiper-wrapper">
            <div class="swiper-slide slide-item">
                <img src="https://via.placeholder.com/1920x700" class="img-fluid full-width" alt="Banner">
                <div class="transform-center">
                    <div class="container">
                        <div class="row justify-content-start">
                            <div class="col-lg-7 align-self-center">
                                <div class="right-side-content">
                                    <h1 class="text-custom-white fw-600">Increase takeout sales by 50%</h1>
                                    <h3 class="text-custom-white fw-400">with the largest delivery platform in the U.S. and Canada</h3>
                                    <a href="restaurant.html" class="btn-second btn-submit">Learn More.</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="overlay overlay-bg"></div>
            </div>
            <div class="swiper-slide slide-item">
                <img src="https://via.placeholder.com/1920x700" class="img-fluid full-width" alt="Banner">
                <div class="transform-center">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8 align-self-center">
                                <div class="right-side-content text-center">
                                    <h1 class="text-custom-white fw-600">Increase takeout sales by 50%</h1>
                                    <h3 class="text-custom-white fw-400">with the largest delivery platform in the U.S. and Canada</h3>
                                    <a href="restaurant.html" class="btn-second btn-submit">Learn More.</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="overlay overlay-bg"></div>
            </div>
            <div class="swiper-slide slide-item">
                <img src="https://via.placeholder.com/1920x700" class="img-fluid full-width" alt="Banner">
                <div class="transform-center">
                    <div class="container">
                        <div class="row justify-content-end">
                            <div class="col-lg-7 align-self-center">
                                <div class="right-side-content text-right">
                                    <h1 class="text-custom-white fw-600">Increase takeout sales by 50%</h1>
                                    <h3 class="text-custom-white fw-400">with the largest delivery platform in the U.S. and Canada</h3>
                                    <a href="restaurant.html" class="btn-second btn-submit">Learn More.</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="overlay overlay-bg"></div>
            </div>
        </div>
        <!-- Add Arrows -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </section>
    <!-- slider -->
    <!-- Explore collection -->
    <section class="ex-collection section-padding">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-header-left">
                        <h3 class="text-light-black header-title title">Địa điểm nổi bật</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="ex-collection-box mb-xl-20">
                        <img src="https://via.placeholder.com/540x300" class="img-fluid full-width" alt="image">
                        <div class="category-type overlay padding-15"> <a href="restaurant.html" class="category-btn">Top rated</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="ex-collection-box mb-xl-20">
                        <img src="https://via.placeholder.com/540x300" class="img-fluid full-width" alt="image">
                        <div class="category-type overlay padding-15"> <a href="restaurant.html" class="category-btn">Top rated</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-4">
                    <div class="large-product-box mb-xl-20 p-relative">
                        <img src="https://via.placeholder.com/255x587" class="img-fluid full-width" alt="image">
                        <div class="category-type overlay padding-15">
                            <button class="category-btn">Most popular near you</button> <a href="restaurant.html" class="btn-first white-btn text-light-black fw-600 full-width">See all</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8">
                    <div class="row">
                    <c:forEach items="${locationList}" var="location">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${location.mediaPath}" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> 
                                        <span class="circle-tag">
                        					<img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      					</span>
                                            <div class="custom-tag"><span class="text-custom-white rectangle-tag bg-gradient-red">10%</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black ">${location.locationName}</a></h6>
                                        <div class="tags"><span class="text-custom-white rectangle-tag bg-yellow">${location.users.role.roleName}</span></div>
                                    </div>
                                    <p class="text-light-white">${location.locationType.locationTypeName}</p>
                                    <div class="product-details">
                                        <div class="price-time"> 
                                        	<span class="text-light-black time">30-40 min</span>
                                            <span class="text-light-white price">$10 min</span>
                                        </div>
                                        <div class="rating"> 
	                                        <span>
						                        <i class="fas fa-star text-yellow"></i>
						                        <i class="fas fa-star text-yellow"></i>
						                        <i class="fas fa-star text-yellow"></i>
						                        <i class="fas fa-star text-yellow"></i>
						                        <i class="fas fa-star text-yellow"></i>
	                      					</span>
	                                      	<span class="text-light-white text-right">4225 ratings</span>
                                        </div>
                                    </div>
                                    <div class="product-footer"> 
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
                                </div>
                            </div>
                        </div>
           			</c:forEach>   
                    </div>
                </div>
            </div>
            <!-- advertisement banner-->
            <div class="row">
            	<div class="col-12">
                    <div class="section-header-left">
                        <h3 class="text-light-black header-title title">Địa điểm đang giảm giá</h3>
                    </div>
                </div>
            </div>
            <!-- advertisement banner-->
            <div class="row">
                <div class="col-lg-9 col-md-8">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      </span>
                                            <div class="custom-tag"> <span class="text-custom-white rectangle-tag bg-gradient-red">
                          10%
                        </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black "> Great Burger</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-yellow">
                        3.1
                      </span>
                                        </div>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
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
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black "> Flavor Town</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-red">
                        2.1
                      </span>
                                        </div>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/007-chili-1.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/004-leaf.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/009-lemon.svg" alt="tag">
                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      </span>
                                            <span class="type-tag bg-gradient-green text-custom-white">
                        Trending
                      </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black "> Big Bites</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-green">
                        4.5
                      </span>
                                        </div>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/005-chef.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/004-leaf.svg" alt="tag">
                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      </span>
                                            <span class="type-tag bg-gradient-green text-custom-white">
                        Trending
                      </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black "> Smile N’ Delight</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-green">
                        4.5
                      </span>
                                        </div>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/005-chef.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/008-protein.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/009-lemon.svg" alt="tag">
                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      </span>
                                            <div class="custom-tag"> <span class="text-custom-white rectangle-tag bg-gradient-red">
                          20%
                        </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black ">Lil Johnny’s</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-red">
                        2.1
                      </span>
                                        </div>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/008-protein.svg" alt="tag">
                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      </span>
                                            <span class="text-custom-white type-tag bg-gradient-orange">
                        NEW
                      </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black ">Choice Foods</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-green">
                        4.5
                      </span>
                                        </div>
                                    </div>
                                    <p class="text-light-white">Indian, Chinese, Tandoor </p>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/005-chef.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/008-protein.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/009-lemon.svg" alt="tag">
                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4">
                    <div class="large-product-box mb-xl-20 p-relative">
                        <img src="https://via.placeholder.com/255x587" class="img-fluid full-width" alt="image">
                        <div class="category-type overlay padding-15">
                            <button class="category-btn">Most popular near you</button> <a href="restaurant.html" class="btn-first white-btn text-light-black fw-600 full-width">See all</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- advertisement banner-->
            <div class="row">
                <div class="col-12">
                    <div class="section-header-left">
                        <h3 class="text-light-black header-title title">Địa điểm được xem nhiều</h3>
                    </div>
                </div>
            </div>
            <!-- advertisement banner-->
            <div class="row">
                <div class="col-lg-3 col-md-4">
                    <div class="large-product-box mb-xl-20 p-relative">
                        <img src="https://via.placeholder.com/255x587" class="img-fluid full-width" alt="image">
                        <div class="category-type overlay padding-15">
                            <button class="category-btn">Most popular near you</button> <a href="restaurant.html" class="btn-first white-btn text-light-black fw-600 full-width">See all</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      </span>
                                            <div class="custom-tag"> <span class="text-custom-white rectangle-tag bg-gradient-red">
                          10%
                        </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black "> Great Burger</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-yellow">
                        3.1
                      </span>
                                        </div>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
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
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black ">Flavor Town</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-red">
                        2.1
                      </span>
                                        </div>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/007-chili-1.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/004-leaf.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/009-lemon.svg" alt="tag">
                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      </span>
                                            <span class="type-tag bg-gradient-green text-custom-white">
                        Trending
                      </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black">Big Bites</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-green">
                        4.5
                      </span>
                                        </div>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/005-chef.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/004-leaf.svg" alt="tag">
                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      </span>
                                            <span class="type-tag bg-gradient-green text-custom-white">
                        Trending
                      </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black ">Smile N’ Delight</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-green">
                        4.5
                      </span>
                                        </div>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/005-chef.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/008-protein.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/009-lemon.svg" alt="tag">
                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      </span>
                                            <div class="custom-tag"> <span class="text-custom-white rectangle-tag bg-gradient-red">
                          20%
                        </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black">Lil Johnny’s</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-red">
                        2.1
                      </span>
                                        </div>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/008-protein.svg" alt="tag">
                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      </span>
                                            <span class="text-custom-white type-tag bg-gradient-orange">
                        NEW
                      </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black ">Choice Foods</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-green">
                        4.5
                      </span>
                                        </div>
                                    </div>
                                    <p class="text-light-white">Indian, Chinese, Tandoor</p>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/005-chef.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/008-protein.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/009-lemon.svg" alt="tag">
                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- advertisement banner-->
            <c:if test="${not empty sessionScope.userSession}">
            <div class="row">
                <div class="col-12">
                    <div class="section-header-left">
                        <h3 class="text-light-black header-title title">Địa điểm bạn yêu thích</h3>
                    </div>
                </div>
            </div>
            <!-- advertisement banner-->
            <div class="row">
                <div class="col-lg-9 col-md-8">
                    <div class="row">
                    <c:choose>
                    <c:when test="${not empty locationFavoriteList}">
                    	<c:forEach items="${locationFavoriteList}" var="locationFavorite" >
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${locationFavorite.location.mediaPath}" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/010-heart.svg" alt="tag">
                      </span>
                                            <div class="custom-tag"> <span class="text-custom-white rectangle-tag bg-gradient-red">
                          10%
                        </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black ">${locationFavorite.location.locationName}</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-yellow">
                        3.1
                      </span>
                                        </div>
                                    </div>
                                    <p class="text-light-white">${locationFavorite.location.locationType.locationTypeName}</p>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
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
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                       </c:when>
						<c:otherwise>
							<p>Bạn chưa có địa điểm yêu thích nào, hãy tìm địa điểm yêu thích ngây để lưu lại.</p>
						</c:otherwise>
                       </c:choose>
                        <%-- <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black ">Flavor Town</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-red">
                        2.1
                      </span>
                                        </div>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/007-chili-1.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/004-leaf.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/009-lemon.svg" alt="tag">
                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      </span>
                                            <span class="type-tag bg-gradient-green text-custom-white">
                        Trending
                      </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black ">Big Bites</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-green">
                        4.5
                      </span>
                                        </div>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/005-chef.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/004-leaf.svg" alt="tag">
                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      </span>
                                            <span class="type-tag bg-gradient-green text-custom-white">
                        Trending
                      </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black ">Smile N’ Delight</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-green">
                        4.5
                      </span>
                                        </div>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/005-chef.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/008-protein.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/009-lemon.svg" alt="tag">
                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      </span>
                                            <div class="custom-tag"> <span class="text-custom-white rectangle-tag bg-gradient-red">
                          20%
                        </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black ">Lil Johnny’s</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-red">
                        2.1
                      </span>
                                        </div>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/008-protein.svg" alt="tag">
                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product-box mb-xl-20">
                                <div class="product-img">
                                    <a href="restaurant.html">
                                        <img src="https://via.placeholder.com/255x150" class="img-fluid full-width" alt="product-img">
                                    </a>
                                    <div class="overlay">
                                        <div class="product-tags padding-10"> <span class="circle-tag">
                        <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/013-heart-1.svg" alt="tag">
                      </span>
                                            <span class="text-custom-white type-tag bg-gradient-orange">
                        NEW
                      </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-caption">
                                    <div class="title-box">
                                        <h6 class="product-title"><a href="restaurant.html" class="text-light-black ">Choice Foods</a></h6>
                                        <div class="tags"> <span class="text-custom-white rectangle-tag bg-green">
                        4.5
                      </span>
                                        </div>
                                    </div>
                                    <p class="text-light-white">Indian, Chinese, Tandoor </p>
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
                                    <div class="product-footer"> <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/005-chef.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/008-protein.svg" alt="tag">
                    </span>
                                        <span class="text-custom-white square-tag">
                      <img src="${pageContext.request.contextPath}/resources/public/assets/img/svg/009-lemon.svg" alt="tag">
                    </span>
                                    </div>
                                </div>
                            </div>
                        </div> --%>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4">
                    <div class="large-product-box mb-xl-20 p-relative">
                        <img src="https://via.placeholder.com/255x587" class="img-fluid full-width" alt="image">
                        <div class="category-type overlay padding-15">
                            <button class="category-btn">Most popular near you</button> <a href="restaurant.html" class="btn-first white-btn text-light-black fw-600 full-width">See all</a>
                        </div>
                    </div>
                </div>
            </div>
            </c:if>
        </div>
    </section>
    <!-- Explore collection -->