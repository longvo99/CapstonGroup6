<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!-- restaurent top -->
<c:set var="circletag" value="" />
<c:if test="${not empty sessionScope.userSession}">
	<c:set var="circletag" value="add-wishlist" />
</c:if>

<c:choose>
	<c:when test="${not empty sessionScope.userSession.contactName}">
		<c:set var="nameUser" value="${sessionScope.userSession.contactName}" />
	</c:when>
	<c:otherwise>
		<c:set var="nameUser" value="${sessionScope.userSession.username}" />
	</c:otherwise>
</c:choose>
<div class="page-banner p-relative smoothscroll" id="menu">
	<img
		src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${image1}"
		class="img-fluid full-width" alt="banner">
	<div class="overlay-2">
		<div class="container">
			<div class="row">
				<div class="col-6">
					<div class="back-btn">
						<button type="button" class="text-light-green">
							<i class="fas fa-chevron-left"></i>
						</button>
					</div>
				</div>
				<div class="col-6">
					<div class="tag-share">
						<span class="text-light-green share-tag"> <i
							class="fas fa-chevron-right"></i>
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
					<p class="text-light-black sub-title no-margin">${location.address}<span><a
							href="${pageContext.request.contextPath}/public/index"
							class="text-success">Đổi nhà hàng</a></span>
					</p>
					<div class="head-rating">
						<div class="rating">
							<span class="fs-16 text-yellow"> <i class="fas fa-star"></i>
							</span> <span class="fs-16 text-yellow"> <i class="fas fa-star"></i>
							</span> <span class="fs-16 text-yellow"> <i class="fas fa-star"></i>
							</span> <span class="fs-16 text-yellow"> <i class="fas fa-star"></i>
							</span> <span class="fs-16 text-dark-white"> <i
								class="fas fa-star"></i>
							</span> <span class="text-light-black fs-14 rate-data">${countRating}
								đánh giá</span>
						</div>
						<div class="product-review">
							<div class="restaurent-details-mob">
								<a href="#"> <span class="text-light-black"><i
										class="fas fa-info-circle"></i></span> <span class="text-dark-white">info</span>
								</a>
							</div>
							<div class="restaurent-details-mob">
								<a href="#"> <span class="text-light-black"><i
										class="fas fa-info-circle"></i></span> <span class="text-dark-white">info</span>
								</a>
							</div>
							<div class="restaurent-details-mob">
								<a href="#"> <span class="text-light-black"><i
										class="fas fa-info-circle"></i></span> <span class="text-dark-white">info</span>
								</a>
							</div>
							<div class="restaurent-details-mob">
								<a href="#"> <span class="text-light-black"><i
										class="fas fa-info-circle"></i></span> <span class="text-dark-white">info</span>
								</a>
							</div>
							<!-- <h6 class="text-light-black no-margin">91<span class="fs-14">% Food was good</span></h6>
                                <h6 class="text-light-black no-margin">91<span class="fs-14">% Food was good</span></h6>
                                <h6 class="text-light-black no-margin">91<span class="fs-14">% Food was good</span></h6> -->
						</div>
					</div>
				</div>
				<div style="width: 200px;" class="restaurent-logo">
					<img
						src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${image2}"
						class="img-fluid" alt="#">
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
						<li class="nav-item"><a
							class="nav-link active text-light-white fw-700"
							data-toggle="pill" href="#menu">Menu</a></li>
						<li class="nav-item"><a
							class="nav-link text-light-white fw-700" data-toggle="pill"
							href="#about">Thông tin</a></li>
						<li class="nav-item"><a
							class="nav-link text-light-white fw-700" data-toggle="pill"
							href="#review">Đánh giá</a></li>
						<li class="nav-item"><a
							class="nav-link text-light-white fw-700" data-toggle="pill"
							href="#mapgallery">Bảng đồ</a></li>
					</ul>
					<div class="${circletag}">
						<c:set var="heartLNew" value="013-heart-1.svg" />
						<c:if test="${not empty locationFavorite}">
							<c:set var="heartLNew" value="010-heart.svg" />
						</c:if>
						<img onclick="editLocationFavorite(${location.locationId})"
							src="${pageContext.request.contextPath}/resources/public/assets/img/svg/${heartLNew}"
							alt="tag">
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
				<!-- <div class="address-details">
                        <div class="address">
                            <div class="delivery-address"> <a href="order-details.html" class="text-light-black">Delivery, ASAP (45–55m)</a>
                                <div class="delivery-type"> <span class="text-success fs-14 fw-500">No minimun</span><span class="text-light-white">, Free Delivery</span>
                                </div>
                            </div>
                            <div class="change-address"> <a href="checkout.html" class="fw-500">Change</a>
                            </div>
                        </div>
                        <p class="text-light-white no-margin">description</p>
                    </div> -->
			</div>
		</div>
	</div>
</div>
<!-- restaurent address -->
<!-- restaurent meals -->
<section class="section-padding restaurent-meals bg-light-theme">
	<div class="container-fluid">
		<div class="row">
			<%-- <div class="col-xl-3 col-lg-3">
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
                                            <p class="text-light-white text-uppercase no-margin fs-14">Featured</p>
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
                                            <p class="text-light-white text-uppercase no-margin fs-14">Featured</p>
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
                                            <p class="text-light-white text-uppercase no-margin fs-14">Featured</p>
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

                                        <div class="text-center"> <span class="text-light-black fs-14">*Valid on first order only, for one-time use, subject to foodmart’s verification. Additional terms may apply. By signing up, you agree to receive marketing and
                        promotional emails and communications form foodmart</span>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                a --%>
			<div style="margin-left: 200px;" class="col-xl-6 col-lg-6">
				<div class="row">
					<div class="col-lg-12"></div>
					<div class="col-lg-12 restaurent-meal-head mb-md-40">
						<div class="card">
							<div class="card-header">
								<div class="section-header-left">
									<h3 class="text-light-black header-title">
										<a class="card-link text-light-black no-margin"
											data-toggle="collapse" href="#collapseOne"> Sản phẩm </a>
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
																		<h6 class="mb-2" data-toggle="modal"
																			data-target="#restaurent-product${product.productId}">
																			<a href="javascript:void(0)"
																				class="text-light-black fw-600">${product.name}</a>
																		</h6>
																		<%-- <p class="text-light-white">${product.price}</p> --%>
																	</div>
																	<!-- <div class="restaurent-product-label"> <span class="rectangle-tag bg-gradient-red text-custom-white">Sale</span>
                                                                        <span class="rectangle-tag bg-dark text-custom-white">Combo</span>
                                                                    </div> -->
																</div>
																<!--  <div class="restaurent-product-rating">
                                                                    <div class="ratings"> <span class="text-yellow"><i class="fas fa-star"></i></span>
                                                                        <span class="text-yellow"><i class="fas fa-star"></i></span>
                                                                        <span class="text-yellow"><i class="fas fa-star"></i></span>
                                                                        <span class="text-yellow"><i class="fas fa-star"></i></span>
                                                                        <span class="text-yellow"><i class="fas fa-star-half-alt"></i></span>
                                                                    </div>
                                                                    <div class="rating-text">
                                                                        <p class="text-light-white fs-14 title">3845 ratings</p>
                                                                    </div>
                                                                </div> -->
															</div>
															<div class="restaurent-product-caption-box">
																<span class="text-light-white">${product.description}</span>
															</div>
															<div class="restaurent-tags-price">
																<div class="restaurent-tags">
																	<span class="text-custom-white square-tag"> <img
																		src="${pageContext.request.contextPath}/resources/public/assets/img/svg/004-leaf.svg"
																		alt="tag">
																	</span> <span class="text-custom-white square-tag"> <img
																		src="${pageContext.request.contextPath}/resources/public/assets/img/svg/006-chili.svg"
																		alt="tag">
																	</span> <span class="text-custom-white square-tag"> <img
																		src="${pageContext.request.contextPath}/resources/public/assets/img/svg/005-chef.svg"
																		alt="tag">
																	</span> <span class="text-custom-white square-tag"> <img
																		src="${pageContext.request.contextPath}/resources/public/assets/img/svg/008-protein.svg"
																		alt="tag">
																	</span> <span class="text-custom-white square-tag"> <img
																		src="${pageContext.request.contextPath}/resources/public/assets/img/svg/009-lemon.svg"
																		alt="tag">
																	</span>
																</div>
																<div class="restaurent-product-price">
																	<h6 class="text-success fw-600 no-margin">
																		<fmt:formatNumber value="${product.price}"
																			type="number" />
																		VNĐ
																	</h6>
																</div>
															</div>
														</div>
														<div class="restaurent-product-img">
															<img style="width: 150px; height: 151px;"
																src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${product.imagePath}"
																class="img-fluid" alt="#">
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
										<a class="card-link text-light-black no-margin"
											data-toggle="collapse" href="#collapseTwo"> Combo </a>
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
																			<h6 class="mb-2" data-toggle="modal"
																				data-target="#restaurent-combo${comboDetail.productComboId}">
																				<a href="javascript:void(0)"
																					class="text-light-black fw-600">${comboDetail.comboName}</a>
																			</h6>
																			<!-- <p class="text-light-white">600-700 Cal.</p> -->
																		</div>
																		<div class="restaurent-product-label">
																			<span
																				class="rectangle-tag bg-gradient-red text-custom-white">${comboDetail.rateDiscount}%</span>
																			<!-- <span class="rectangle-tag bg-dark text-custom-white">Combo</span> -->
																		</div>
																	</div>
																	<div class="restaurent-product-rating">
																		<div class="ratings">
																			<span class="text-yellow"><i
																				class="fas fa-star"></i></span> <span class="text-yellow"><i
																				class="fas fa-star"></i></span> <span class="text-yellow"><i
																				class="fas fa-star"></i></span> <span class="text-yellow"><i
																				class="fas fa-star"></i></span> <span class="text-yellow"><i
																				class="fas fa-star-half-alt"></i></span>
																		</div>
																		<!-- <div class="rating-text">
	                                                                        <p class="text-light-white fs-14 title">3845 ratings</p>
	                                                                    </div> -->
																	</div>
																</div>
																<div class="restaurent-product-caption-box">
																	<span class="text-light-white">${comboDetail.description}</span>
																</div>
																<div class="restaurent-tags-price">
																	<div class="restaurent-tags">
																		<span class="text-custom-white square-tag"> <img
																			src="${pageContext.request.contextPath}/resources/public/assets/img/svg/004-leaf.svg"
																			alt="tag">
																		</span> <span class="text-custom-white square-tag"> <img
																			src="${pageContext.request.contextPath}/resources/public/assets/img/svg/006-chili.svg"
																			alt="tag">
																		</span> <span class="text-custom-white square-tag"> <img
																			src="${pageContext.request.contextPath}/resources/public/assets/img/svg/005-chef.svg"
																			alt="tag">
																		</span> <span class="text-custom-white square-tag"> <img
																			src="${pageContext.request.contextPath}/resources/public/assets/img/svg/008-protein.svg"
																			alt="tag">
																		</span> <span class="text-custom-white square-tag"> <img
																			src="${pageContext.request.contextPath}/resources/public/assets/img/svg/009-lemon.svg"
																			alt="tag">
																		</span>
																	</div>
																	<div class="restaurent-product-price">
																		<h6 class="text-success fw-600 no-margin"></h6>
																	</div>
																</div>
															</div>
															<div class="restaurent-product-img">
																<img
																	src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${comboDetail.comboImagePath}"
																	class="img-fluid" alt="#">
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
							<iframe class="videoIframe js-videoIframe"
								src="https://www.youtube.com/embed/AdZrEIo6UYU"
								data-src="https://www.youtube.com/embed/AdZrEIo6UYU?autoplay=1&amp;rel=0"
								allow="autoplay"></iframe>
							<div class="videoPoster js-videoPoster">
								<div class="video-inner">
									<i class="far fa-play-circle"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="cart-detail-box">
						<div class="card">
							<div class="card-header padding-15 fw-700">Đơn hàng của bạn</div>
							<div class="card-body no-padding" id="scrollstyle-4">
								<div id="cat-product-box" class="cat-product-box">
									<c:choose>
										<c:when test="${not empty listOrderDTO}">
											<c:forEach items="${listOrderDTO}" var="orderDTO">
												<div class="cat-product">
													<div class="cat-name">
														<a
															href="${pageContext.request.contextPath}/public/restaurant/${orderDTO.locationId}">
															<p class="text-light-green">
																<span class="text-dark-white">${orderDTO.quantity}</span>
																${orderDTO.name}
															</p>
														</a>
													</div>
													<div class="delete-btn">
														<a href="javascript:void(0)"
															onclick="deleteCookieOrder('${orderDTO.productId}')"
															class="text-dark-white"> <i class="far fa-trash-alt"></i>
														</a>
													</div>
													<div class="price">
														<a href="#" class="text-dark-white fw-500"><fmt:formatNumber
																value="${orderDTO.quantity * orderDTO.price}"
																type="number" /></a>
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
								<c:if test="${not empty totalCart}">
									<div style="height: 100%;" class="item-total">
										<div class="total-price border-0">
											<span class="text-dark-white fw-700">Tổng tiền:</span> <span
												id="totalPriceDTO" class="text-dark-white fw-700"><fmt:formatNumber
													value="${totalCart}" type="number" /></span>
										</div>
									</div>
								</c:if>
							</div>
							<div class="card-footer padding-15">
								<a href="${pageContext.request.contextPath}/public/checkout"
									class="btn-first green-btn text-custom-white full-width fw-500">Thanh
									toán</a>
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
<section class="section-padding restaurent-about smoothscroll"
	id="about">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3 class="text-light-black fw-700 title">Thông tin về
					${location.locationName}</h3>
				<p class="text-light-green no-margin">${location.locationType.locationTypeName},
					${location.locationCategory.locationCategoryName}</p>
				<!--   <p class="text-light-white no-margin"></p> <span class="text-success fs-16">$</span> -->
				<span class="text-success fs-16">$</span> <span
					class="text-success fs-16">$</span> <span
					class="text-dark-white fs-16">$</span> <span
					class="text-dark-white fs-16">$</span>
				<ul class="about-restaurent">
					<li><i class="fas fa-map-marker-alt"></i> <span> <a
							href="#" class="text-light-white"> ${location.address} </a>
					</span></li>
					<li><i class="fas fa-phone-alt"></i> <span><a
							href="tel:" class="text-light-white">${location.locationPhone}</a></span>
					</li>
					<li><i class="far fa-envelope"></i> <span><a
							href="mailto:" class="text-light-white">${location.locationEmail}</a></span>
					</li>
				</ul>
				<ul class="social-media pt-2">
					<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
					<li><a href="#"><i class="fab fa-twitter"></i></a></li>
					<li><a href="#"><i class="fab fa-instagram"></i></a></li>
					<li><a href="#"><i class="fab fa-pinterest-p"></i></a></li>
					<li><a href="#"><i class="fab fa-youtube"></i></a></li>
				</ul>
			</div>
			<div class="col-md-6">
				<div class="restaurent-schdule">
					<div class="card">
						<div class="card-header text-light-white fw-700 fs-16">Giờ
							mở cửa:</div>
						<div class="card-body">
							<div class="schedule-box">
								<div class="day text-light-black">Hôm nay</div>
								<div class="time text-light-black">thời gian hoạt động:
									${location.openTime} - ${location.closeTime}</div>
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
<div class="map-gallery-sec section-padding bg-light-theme smoothscroll"
	id="mapgallery">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="main-box">
					<div class="row">
						<div class="col-md-6 map-pr-0">
							<iframe id="locmap"
								src="https://maps.google.com/maps?q=university%20of%20san%20francisco&t=&z=13&ie=UTF8&iwloc=&output=embed"></iframe>
						</div>
						<div class="col-md-6 map-pl-0">
							<div class="gallery-box padding-10">
								<ul class="gallery-img">
									<li><a class="image-popup"
										href="https://via.placeholder.com/173" title="Image title">
											<img src="https://via.placeholder.com/173"
											class="img-fluid full-width" alt="9.jpg" />
									</a></li>
									<li><a class="image-popup"
										href="https://via.placeholder.com/173" title="Image title">
											<img src="https://via.placeholder.com/173"
											class="img-fluid full-width" alt="9.jpg" />
									</a></li>
									<li><a class="image-popup"
										href="https://via.placeholder.com/173" title="Image title">
											<img src="https://via.placeholder.com/173"
											class="img-fluid full-width" alt="9.jpg" />
									</a></li>
									<li><a class="image-popup"
										href="https://via.placeholder.com/173" title="Image title">
											<img src="https://via.placeholder.com/173"
											class="img-fluid full-width" alt="9.jpg" />
									</a></li>
									<li><a class="image-popup"
										href="https://via.placeholder.com/173" title="Image title">
											<img src="https://via.placeholder.com/173"
											class="img-fluid full-width" alt="9.jpg" />
									</a></li>
									<li><a class="image-popup"
										href="https://via.placeholder.com/173" title="Image title">
											<img src="https://via.placeholder.com/173"
											class="img-fluid full-width" alt="9.jpg" />
									</a></li>
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
<section class="section-padding restaurent-review smoothscroll"
	id="review">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section-header-left">
					<h3 class="text-light-black header-title title">Đánh giá
						${location.locationName}</h3>
				</div>
				<div class="restaurent-rating mb-xl-20">
					<div class="star">
						<span class="text-yellow fs-16"> <i class="fas fa-star"></i>
						</span> <span class="text-yellow fs-16"> <i class="fas fa-star"></i>
						</span> <span class="text-yellow fs-16"> <i class="fas fa-star"></i>
						</span> <span class="text-dark-white fs-16"> <i
							class="fas fa-star"></i>
						</span> <span class="text-dark-white fs-16"> <i
							class="fas fa-star"></i>
						</span>
					</div>
					<span class="fs-14 text-light-black">${countRating} đánh giá</span>
				</div>
				<h4 class="text-light-black mb-xl-20">Đánh giá từ mọi người</h4>
				<ul>
					<c:forEach items="${pointRating}" var="pointRating">
						<li>
							<h6 class="text-light-black mb-1">
								<b>${pointRating.avgPoint}</b>
							</h6> <span class="text-light-black fs-14 fw-400">${pointRating.content}</span>
						</li>
					</c:forEach>
					<!--  <li>
                            <h6 class="text-light-black mb-1">8,5</h6>
                            <span class="text-light-black fs-14 fw-400">Service</span>
                        </li>
                        <li>
                            <h6 class="text-light-black mb-1">8,5</h6>
                            <span class="text-light-black fs-14 fw-400">Space</span>
                        </li>
                        <li>
                            <h6 class="text-light-black mb-1">9</h6>
                            <span class="text-light-black fs-14 fw-400">Location</span>
                        </li>
                        <li>
                            <h6 class="text-light-black mb-1">8</h6>
                            <span class="text-light-black fs-14 fw-400">Price</span>
                        </li> -->
				</ul>
				<div class="u-line"></div>
			</div>
			<div style="margin-left: 15px;" class="section-header-left">
				<h3 class="text-light-black header-title title">DANH SÁCH BÌNH
					LUẬN</h3>
			</div>
			<div class="container bootdey comments">
				<div class="col-md-12 bootstrap snippets">
					<div class="panel">
						<div class="panel-body">
							<!-- Newsfeed Content -->
							<!--===================================================-->
							<c:if test="${not empty commentListParent}">
								<c:forEach items="${commentListParent}" var="comment">
									<div class="media-block">
										<a class="media-left" href="#"><img
											class="img-circle img-sm" alt="Profile Picture"
											src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${comment.users.avatarPath}"></a>
										<div class="media-body">
											<div class="mar-btm">
												<a href="#"
													class="btn-link text-semibold media-heading box-inline">
													<c:choose>
														<c:when test="${not empty comment.users.contactName}">${comment.users.contactName}</c:when>
														<c:otherwise>${comment.users.username}</c:otherwise>
													</c:choose>
												</a>
												<p class="text-muted text-sm">
													<i class="fa fa-mobile fa-lg"></i> ${comment.currentTime}
												</p>
											</div>
											<p>${comment.textContent}</p>
											<img class="img-responsive thumbnail"
												src="https://via.placeholder.com/400x300" alt="Image">
											<div class="pad-ver">
												<!-- <span class="tag tag-sm"><i class="fa fa-heart text-danger"></i> 250 Likes</span>
												<div class="btn-group">
													<a class="btn btn-sm btn-default btn-hover-success" href="#"><i class="fa fa-thumbs-up"></i></a> 
													<a class="btn btn-sm btn-default btn-hover-danger" href="#"><i class="fa fa-thumbs-down"></i></a>
												</div> -->
												<a class="btn btn-sm btn-default btn-hover-primary cmt"
													onclick="fn(${comment.commentId})"
													href="javascript:void(0)">Comment</a>
											</div>
											<hr>

											<div>
												<c:forEach items="${commentListChild}" var="commentChild">
													<c:if
														test="${commentChild.parentCommentId == comment.commentId}">
														<div class="media-block">
															<a class="media-left" href="#"> <img
																class="img-circle img-sm" alt="Profile Picture"
																src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${comment.users.avatarPath}">
															</a>
															<div class="media-body">
																<div class="mar-btm">
																	<a href="#"
																		class="btn-link text-semibold media-heading box-inline">
																		<c:choose>
																			<c:when
																				test="${not empty commentChild.users.contactName}">${commentChild.users.contactName}</c:when>
																			<c:otherwise>${commentChild.users.username}</c:otherwise>
																		</c:choose>
																	</a>
																	<p class="text-muted text-sm">
																		<i class="fa fa-mobile fa-lg"></i>
																		${commentChild.currentTime}
																	</p>
																</div>
																<p>${commentChild.textContent}</p>
																<div class="pad-ver">
																	<!-- <div class="btn-group">
																<a class="btn btn-sm btn-default btn-hover-success active" href="#"><i class="fa fa-thumbs-up"></i> You Like it</a>
																<a class="btn btn-sm btn-default btn-hover-danger" href="#"><i class="fa fa-thumbs-down"></i></a>
															</div> -->
																	<a class="btn btn-sm btn-default btn-hover-primary cmt"
																		onclick="fn(${comment.commentId})"
																		href="javascript:void(0)">Comment</a>
																</div>
																<hr>
															</div>
														</div>
													</c:if>
												</c:forEach>
												<div id='replyComment${comment.commentId}'></div>
												<div id="demo${comment.commentId}"
													class="media-block collapse">
													<a class="media-left" href="#"> <img
														class="img-circle img-sm" alt="Profile Picture"
														src="https://bootdey.com/img/Content/avatar/avatar3.png">
													</a>
													<div class="media-body">
														<div class="mar-btm">
															<a href="#"
																class="btn-link text-semibold media-heading box-inline">${nameUser}</a>
															<!-- <p class="text-muted text-sm">
																<i class="fa fa-globe fa-lg"></i> 2 min ago
															</p> -->
														</div>
														<div class="pad-ver">
															<div>
																<textarea id="focu${comment.commentId}"
																	class="form-control" rows="2" cols="80"
																	placeholder="Nhập bình luận..."></textarea>
																<br />
																<button class="btn btn-primary btn-sm shadow-none"
																	onclick="addParentComment(${comment.commentId})"
																	type="submit">Trả lời</button>
																<button style="margin-left: 10px;"
																	onclick="fnClose(${comment.commentId})"
																	class="btn btn-sm btn-primary shadow-none"
																	type="button">Hủy</button>
															</div>
														</div>
														<hr>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
							<!--===================================================-->
							<!-- End Newsfeed Content -->


							<!-- Newsfeed Content -->
							<!--===================================================-->

							<!-- <div class="media-block pad-all">
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
								 -->
							<!--===================================================-->
							<!-- End Newsfeed Content -->
						</div>
					</div>
				</div>
			</div>
			<!-- Comment  -->
			<hr />
			<div
				style="width: 100%; border: 1px solid black; padding: 15px; margin: 15px; background-color: #ffffcc;"
				id="reviews">
				<p>
					<b>Write Your Review</b>
				</p>
				<form role="form"
					action="${pageContext.request.contextPath}/public/restaurant/comment/${location.locationId}"
					enctype="multipart/form-data" method="post">
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
						<div class="input-images" style="padding-top: .5rem;"></div>
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
							name="video" class="file_multi_video" accept="video/*">
						<button style="display: inline-block;" id="btn-file-reset-id"
							type="button">Reset file</button>
					</div>
					<hr />
					<div>
						<h5>Rating</h5>
						<p>
							<label style="display: inline-block; width: 80px;">Nhà
								hàng:</label> <input style="display: inline-block;" type="range"
								name="location" class="slider" min="1" max="10" value="5">
							<span style="display: inline-block;" class="slider_label"></span>
						</p>
						<p>
							<label style="display: inline-block; width: 80px;">Giá
								cả:</label> <input style="display: inline-block;" type="range"
								name="price" class="slider" min="1" max="10" value="5">
							<span style="display: inline-block;" class="slider_label"></span>
						</p>
						<p>
							<label style="display: inline-block; width: 80px;">Chất
								lượng:</label> <input style="display: inline-block;" type="range"
								name="quality" class="slider" min="1" max="10" value="5">
							<span style="display: inline-block;" class="slider_label"></span>
						</p>
						<p>
							<label style="display: inline-block; width: 80px;">Dịch
								vụ:</label> <input style="display: inline-block;" type="range"
								name="service" class="slider" min="1" max="10" value="5">
							<span style="display: inline-block;" class="slider_label"></span>
						</p>
						<p>
							<label style="display: inline-block; width: 80px;">Không
								gian: </label> <input style="display: inline-block;" type="range"
								name="space" class="slider" min="1" max="10" value="5">
							<span style="display: inline-block;" class="slider_label"></span>
						</p>
					</div>
					<input type="submit" value="Submit" name="submit"
						class="btn btn-primary pull-left" />
				</form>
			</div>
			<!-- Comment  -->

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
					<h3 class="text-light-black header-title title">Địa điểm gần
						bạn</h3>
				</div>
			</div>
			<c:if test="${not empty locationNearYou}">
				<div class="col-12">
					<div class="fresh-deals-slider swiper-container">
						<div class="swiper-wrapper">
							<c:forEach items="${locationNearYou}" var="location">
								<div class="swiper-slide">
									<div class="product-box">
										<div class="product-img">
											<a
												href="${pageContext.request.contextPath}/public/restaurant/${location.locationId}">
												<img style="width: 258px; height: 172px;"
												src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${location.mediaPath}"
												class="img-fluid full-width" alt="product-img">
											</a>
										</div>
										<div class="product-caption">
											<div class="title-box">
												<h6 class="product-title limitLength">
													<a
														href="${pageContext.request.contextPath}/public/restaurant/${location.locationId}"
														class="text-light-black">${location.locationName}</a>
												</h6>
											</div>
											<p class="text-light-white">${location.locationType.locationTypeName},
												${location.locationCategory.locationCategoryName}</p>
											<div class="product-details">
												<div class="price-time">
													<span class="text-light-black time">
														${location.openTime}-${location.closeTime}</span>
													<c:set var="minMaxPrice" value="--.--" />
													<c:forEach items="${minMaxLocation}" var="minMax">
														<c:if test="${minMax.locationId == location.locationId}">
															<span class="text-light-white price"><fmt:formatNumber
																	value="${minMax.minPrice}" type="number" />VNĐ - <fmt:formatNumber
																	value="${minMax.maxPrice}" type="number" />VNĐ</span>
															<c:set var="minMaxPrice" value="" />
														</c:if>
													</c:forEach>
													<span class="text-light-white price">${minMaxPrice}</span>
												</div>
												<div class="rating">
													<c:set var="ratingPoint" value="-.-" />
													<c:forEach items="${ratingList}" var="rating">
														<c:if
															test="${rating.locationId == locationDiscountTop.locationId}">
															<c:set var="ratingPoint" value="${rating.point}" />
														</c:if>
													</c:forEach>
													<div class="tags">
														<span class="text-custom-white rectangle-tag bg-yellow">
															${ratingPoint} </span>
													</div>
												</div>
											</div>
										</div>
										<!-- <div class="product-footer-2">
                                        <div class="discount"> <span class="text-success fs-14">$3 off</span>
                                        </div>
                                        <div class="discount-coupon"> <span class="text-light-white fs-14">First order only</span>
                                        </div>
                                    </div> -->
									</div>

								</div>
							</c:forEach>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
			</c:if>
			<c:if test="${empty locationNearYou}">
				<div class="col-12">
					<span>Bạn hãy cập nhập địa chỉ của mình để xem các địa điểm
						gần nơi bạn sống, cảm ơn!</span>
				</div>
			</c:if>
		</div>
	</div>
</section>
<!-- offer near -->

<!-- product popup -->
<c:forEach items="${product}" var="product">
	<div class="modal fade restaurent-popup"
		id="restaurent-product${product.productId}">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div style="height: 410px;" class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<img style="height: 400px;"
						src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${product.imagePath}"
						class="img-fluid full-width" alt="#">
				</div>
				<div class="name padding-10">
					<h3 class="text-light-black fw-700 mb-2">${product.name}</h3>
					<h5 class="text-light-black fw-600 no-margin">
						<fmt:formatNumber value="${product.price}" type="number" />
						VNĐ
					</h5>
				</div>
				<div class="u-line">
					<div class="product-quantity padding-10">
						<span class="text-light-black fw-700 fs-16">Quantity</span>
						<div class="input-group quantity">
							<div class="input-group-append">
								<button class="minus-btn product${product.productId}"
									type="button" name="button">
									<i class="fas fa-minus"></i>
								</button>
							</div>
							<input type="text" class="text-center" name="name"
								id="quantity${product.productId}" value="1" readonly="readonly">
							<div class="input-group-prepend">
								<button class="plus-btn product${product.productId}"
									type="button" name="button">
									<i class="fas fa-plus"></i>
								</button>
							</div>
							<div class="input-group-prepend">
								<button class="btn-second btn-submit">
									<span id="totalPriceProduct${product.productId}"><fmt:formatNumber
											value="${product.price}" type="number" /></span>VNĐ
								</button>
							</div>
						</div>
						<script type="text/javascript">
                         $(".plus-btn.product${product.productId}").on('click', function () {
           			      	var quantity = $("#quantity${product.productId}").val();
           			    	var price = ${product.price};
           			    	var total = (parseInt(quantity) + 1) * parseInt(price);
           			    	$("#totalPriceProduct${product.productId}").text(total);
           				});
                         $(".minus-btn.product${product.productId}").on('click', function () {
           			      	var quantity = $("#quantity${product.productId}").val();
           			      	var price =${product.price};
           			    	var total = parseInt(price) * (parseInt(quantity) - 1);
           			    	if(quantity != 1){
           			    		$("#totalPriceProduct${product.productId}").text(total);              			    		
           			    	}else{
           			    		$("#totalPriceProduct${product.productId}").text(price);
           			    	}
           				});
                        </script>
					</div>
				</div>
				<div class="modal-footer">
					<button onclick="setCookieOrder(${product.productId})"
						class="btn-second btn-submit center" data-dismiss="modal">ĐẶT
						HÀNG</button>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
<!-- combo popup -->
<c:forEach items="${comboDetailList}" var="comboDetail">
	<div class="modal fade restaurent-popup"
		id="restaurent-combo${comboDetail.productComboId}">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div style="height: 200px;" class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<img style="height: 200px;"
						src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${comboDetail.comboImagePath}"
						class="img-fluid full-width" alt="#">
				</div>
				<div class="name padding-10">
					<h3 class="text-light-black fw-700 mb-2">${comboDetail.comboName}</h3>
					<h5 class="text-light-black fw-600 no-margin">${comboDetail.rateDiscount}%</h5>
				</div>
				<div class="u-line">
					<div class="product-quantity padding-10">
						<span class="text-light-black fw-700 fs-16">Quantity</span>
						<div class="input-group quantity">
							<div class="input-group-append">
								<button class="minus-btn combo${comboDetail.productComboId}"
									type="button" name="button">
									<i class="fas fa-minus"></i>
								</button>
							</div>
							<input type="text" class="text-center" name="quantity"
								id="quantityCombo${comboDetail.productComboId}" value="1"
								readonly="readonly">
							<div class="input-group-prepend">
								<button class="plus-btn combo${comboDetail.productComboId}"
									type="button" name="button">
									<i class="fas fa-plus"></i>
								</button>
							</div>

							<div class="input-group-prepend">
								<c:set var="totalPrice" value="0" />
								<c:forEach items="${productComboDetailList}"
									var="productComboDetail">
									<c:if
										test="${productComboDetail.productComboId == comboDetail.productComboId}">
										<c:set var="totalPrice"
											value="${productComboDetail.price + totalPrice}" />
									</c:if>
								</c:forEach>
								<button class="btn-second btn-submit">
									<span id="totalPrice${comboDetail.productComboId}">${totalPrice + (totalPrice*comboDetail.rateDiscount/100)}</span>VNĐ
								</button>
							</div>
							<script type="text/javascript">
	                            $(".plus-btn.combo${comboDetail.productComboId}").on('click', function () {
	              			      	var quantity = $("#quantityCombo${comboDetail.productComboId}").val();
	              			    	var price = ${totalPrice + (totalPrice*comboDetail.rateDiscount/100)};
	              			    	var total = (parseInt(quantity) + 1) * parseInt(price);
	              			    	$("#totalPrice${comboDetail.productComboId}").text(total);
	              				});
	                            $(".minus-btn.combo${comboDetail.productComboId}").on('click', function () {
	              			      	var quantity = $("#quantityCombo${comboDetail.productComboId}").val();
	              			      	var price = ${totalPrice + (totalPrice*comboDetail.rateDiscount/100)};
	              			    	var priceCurr = $("#totalPrice${comboDetail.productComboId}").text();
	              			    	var total = parseInt(price) * (parseInt(quantity) - 1);
	              			    	if(quantity != 1){
	              			    		$("#totalPrice${comboDetail.productComboId}").text(total);              			    		
	              			    	}else{
	              			    		$("#totalPrice${comboDetail.productComboId}").text(price);
	              			    	}
	              			    	
	              				});
                            </script>
						</div>
					</div>
				</div>
				<div class="u-line">
					<c:forEach items="${productComboDetailList}"
						var="productComboDetail">
						<c:if
							test="${productComboDetail.productComboId == comboDetail.productComboId}">
							<div class="col-lg-12">
								<div class="restaurent-product-list">
									<div class="restaurent-product-detail">
										<div class="restaurent-product-left">
											<div class="restaurent-product-title-box">
												<div class="restaurent-product-box">
													<div class="restaurent-product-title">
														<h6 class="mb-2" data-toggle="modal">
															<a href="javascript:void(0)"
																class="text-light-black fw-600">${productComboDetail.productName}</a>
														</h6>
													</div>
												</div>
											</div>
											<div class="restaurent-tags-price">
												<div class="restaurent-product-price">
													<h6 class="text-success fw-600 no-margin">${productComboDetail.price}</h6>
												</div>
											</div>
										</div>
										<div class="restaurent-product-img">
											<img
												src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${productComboDetail.productImagePath}"
												class="img-fluid" alt="#">
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="modal-footer">
					<button class="btn-second btn-submit center"
						onclick="setCookieOrderCombo(${comboDetail.productComboId})"
						data-dismiss="modal">ĐẶT HÀNG</button>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
<!-- upload multi image -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/public/assets/js/image-uploader.min.js"></script>
<!-- comment -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

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
	function fn(commentId) {
		  $('#demo' + commentId).collapse('show');
		 /*  window.location = "#demo" + commentId;
		  document.getElementById("focu" + commentId).focus() */
	}
	
	function fnClose(commentId) {
		  $('#demo' + commentId).collapse('hide');
	}
	
	function addParentComment(commentId) {
		var content = $('#focu' + commentId).val();
		var locationId = ${location.locationId};
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "${pageContext.request.contextPath}/public/restaurant/parentComment/" + commentId + "/" + locationId,
			data : JSON.stringify(content),
			dataType : 'text',
			success: function (data) {
				$('#demo' + commentId).collapse('hide');
               	$('#replyComment' + commentId).html(
               			"<div class='media-block'>"
               			+"<a class='media-left' href='#'>"
							+"<img class='img-circle img-sm' alt='Profile Picture' src='${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${sessionScope.userSession.avatarPath}'>"
						+"</a>"
						+"<div class='media-body'>"
							+"<div class='mar-btm'>"
								+"<a href='#' class='btn-link text-semibold media-heading box-inline'>"
								+"${nameUser}</a>"
								+"<p class='text-muted text-sm'>"
									+"<i class='fa fa-mobile fa-lg'></i> 0 phút trước"
								+"</p>"
							+"</div>"
							+"<p>" + content + "</p>"
							+"<div class='pad-ver'>"
								+"<a class='btn btn-sm btn-default btn-hover-primary cmt' onclick='fn("+ commentId +")' href='javascript:void(0)'>Comment</a>"
							+"</div>"
							+"<hr>"
						+"</div>"
						+"</div>"
               	);
            },
            error: function (e) {
            	alert("Bạn cần phải đăng nhập để thực hiện thao tác này");
            }
		});
	}
</script>
<script type="text/javascript">
	$('.input-images').imageUploader();
</script>
<!-- <script>
let preloaded = [
    {id: 1, src: '${pageContext.request.contextPath}/uploads/${linkanh}'},
];

$('.input-images-2').imageUploader({
    preloaded: preloaded,
    imagesInputName: 'images',
    preloadedInputName: 'images'
});
</script> -->