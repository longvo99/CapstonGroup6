<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!-- slider -->
<c:set var="circletag" value="" />
<c:if test="${not empty sessionScope.userSession}">
	<c:set var="circletag" value="circle-tag" />
</c:if>
<section class="about-us-slider swiper-container p-relative">
	<div class="swiper-wrapper">
		<c:forEach items="${DiscountTopList}" var="discountTop">
			<div class="swiper-slide slide-item">
				<img
					src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${discountTop.mediaPath}"
					class="img-fluid full-width" alt="Banner">
				<div class="transform-center">
					<div class="container">
						<div class="row justify-content-start">
							<div class="col-lg-7 align-self-center">
								<div class="right-side-content">
									<h1 class="text-custom-white fw-600">${discountTop.title}</h1>
									<h3 class="text-custom-white fw-400">${discountTop.description}</h3>
									<a
										href="${pageContext.request.contextPath}/public/restaurant/${discountTop.location.locationId}"
										class="btn-second btn-submit">Xem ngây</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="overlay overlay-bg"></div>
			</div>
		</c:forEach>
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
					<h3 class="text-light-black header-title title">Địa điểm nổi
						bật</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${RateTopList}" var="topRateLocation">
				<div class="col-md-6">
					<div class="ex-collection-box mb-xl-20">
						<img style="width: 540px; height: 300px;"
							src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${topRateLocation.mediaPath}"
							class="img-fluid full-width" alt="image">
						<div class="custom-tag">
							<span class="text-custom-white rectangle-tag bg-gradient-red">
								<a
								href="${pageContext.request.contextPath}/public/restaurant/${topRateLocation.locationId}">${topRateLocation.locationName}</a>
							</span>
						</div>
						<div class="category-type overlay padding-15">
							<a
								href="${pageContext.request.contextPath}/public/restaurant/${topRateLocation.locationId}"
								class="category-btn">Top xếp hạng</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- advertisement banner-->
		<div class="row">
			<div class="col-12">
				<div class="section-header-left">
					<h3 class="text-light-black header-title title">Địa điểm đang
						giảm giá</h3>
				</div>
			</div>
		</div>
		<!-- advertisement banner-->
		<div class="row">
			<div class="col-lg-9 col-md-8">
				<div class="row">
					<c:forEach items="${LocationDiscountTopList}"
						var="locationDiscountTop">
						<div class="col-lg-4 col-md-6 col-sm-6">
							<div class="product-box mb-xl-20">
								<div class="product-img">
									<a
										href="${pageContext.request.contextPath}/public/restaurant/${locationDiscountTop.locationId}">
										<img style="width: 255px; height: 150px;"
										src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${locationDiscountTop.mediaPath}"
										class="img-fluid full-width" alt="product-img">
									</a>
									<div class="overlay">
										<div class="product-tags padding-10">
											<span class="${circletag}"> 
											<c:set var="heartLNew" value="013-heart-1.svg" /> 
											<c:forEach
													items="${locationFavoriteList}" var="locationLF">
													<c:if
														test="${locationLF.location.locationId == locationDiscountTop.locationId}">
														<c:set var="heartLNew" value="010-heart.svg" />
													</c:if>
											</c:forEach> 
											<img onclick="editLocationFavorite(${locationDiscountTop.locationId})"
												src="${pageContext.request.contextPath}/resources/public/assets/img/svg/${heartLNew}"
												alt="tag">
											</span>
											<c:forEach items="${listLocationTopNew}" var="location">
												<c:if
													test="${location.locationId == locationDiscountTop.locationId}">
													<span class="text-custom-white type-tag bg-gradient-orange">NEW</span>
												</c:if>
											</c:forEach>
											<div class="custom-tag">
												<span
													class="text-custom-white rectangle-tag bg-gradient-red">sale</span>
											</div>
										</div>
									</div>
								</div>
								<div class="product-caption">
									<div class="title-box">
										<h6 class="product-title">
											<a
												href="${pageContext.request.contextPath}/public/restaurant/${locationDiscountTop.locationId}"
												class="text-light-black ">${locationDiscountTop.locationName}</a>
										</h6>
										<c:set var="ratingPoint" value="-.-" />
										<c:forEach items="${ratingList}" var="rating">
											<c:if test="${rating.locationId == locationDiscountTop.locationId}"><c:set var="ratingPoint" value="${rating.point}" /></c:if>
										</c:forEach>
										<div class="tags">
											<span class="text-custom-white rectangle-tag bg-yellow">
												${ratingPoint} </span>
										</div>
									</div>
									<p class="text-light-white">${locationDiscountTop.locationTypeName},
										${locationDiscountTop.locationCategoryName}</p>
									<div class="product-details">
										<div class="price-time">
											<span class="text-light-black time">
												${locationDiscountTop.openTime}-${locationDiscountTop.closeTime}</span>
											<c:set var="minMaxPrice" value="--.--"/>
												<c:forEach items="${minMaxLocation}" var="minMax">
													<c:if test="${minMax.locationId == locationDiscountTop.locationId}">
														<c:set var="minMaxPrice" value="${minMax.minPrice}VNĐ - ${minMax.maxPrice}VNĐ"/>
													</c:if>
											</c:forEach>
											<span class="text-light-white price">${minMaxPrice}</span>
										</div>
										<div class="rating">
											<!-- <span> <i class="fas fa-star text-yellow"></i> <i
												class="fas fa-star text-yellow"></i> <i
												class="fas fa-star text-yellow"></i> <i
												class="fas fa-star text-yellow"></i> <i
												class="fas fa-star text-yellow"></i>
											</span>  -->
											<!-- <span class="text-light-white text-right">4225
												ratings</span> -->
										</div>
									</div>
									<div class="product-footer">
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
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-3 col-md-4">
				<div class="large-product-box mb-xl-20 p-relative">
					<img src="${pageContext.request.contextPath}/resources/public/assets/img/images.jpg"
						class="img-fluid full-width" alt="image">
					<div class="category-type overlay padding-15">
						<button class="category-btn">Địa điểm đang giảm giá</button>
						<a href="${pageContext.request.contextPath}/public/listview/discount"
							class="btn-first white-btn text-light-black fw-600 full-width">Xem thêm</a>
					</div>
				</div>
			</div>
		</div>
		<!-- advertisement banner-->
		<div class="row">
			<div class="col-12">
				<div class="section-header-left">
					<h3 class="text-light-black header-title title">Địa điểm mới</h3>
				</div>
			</div>
		</div>
		<!-- advertisement banner-->
		<div class="row">
			<div class="col-lg-3 col-md-4">
				<div class="large-product-box mb-xl-20 p-relative">
					<img src="${pageContext.request.contextPath}/resources/public/assets/img/images (1).jpg"
						class="img-fluid full-width" alt="image">
					<div class="category-type overlay padding-15">
						<button class="category-btn">Địa điểm mới</button>
						<a href="${pageContext.request.contextPath}/public/listview/new"
							class="btn-first white-btn text-light-black fw-600 full-width">Xem thêm</a>
					</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-8">
				<div class="row">
					<c:forEach items="${listLocationTopNew}" var="location">
						<div class="col-lg-4 col-md-6 col-sm-6">
							<div class="product-box mb-xl-20">
								<div class="product-img">
									<a
										href="${pageContext.request.contextPath}/public/restaurant/${location.locationId}">
										<img style="width: 255px; height: 150px;"
										src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${location.mediaPath}"
										class="img-fluid full-width" alt="product-img">
									</a>
									<div class="overlay">
										<div class="product-tags padding-10">
											<span class="${circletag}"> <c:set var="heartLNew"
													value="013-heart-1.svg" /> <c:forEach
													items="${locationFavoriteList}" var="locationLF">
													<c:if
														test="${locationLF.location.locationId == location.locationId}">
														<c:set var="heartLNew" value="010-heart.svg" />
													</c:if>
												</c:forEach> <img onclick="editLocationFavorite(${location.locationId})"
												src="${pageContext.request.contextPath}/resources/public/assets/img/svg/${heartLNew}"
												alt="tag">
											</span> <span class="text-custom-white type-tag bg-gradient-orange">
												NEW </span>
											<c:forEach items="${DiscountList}" var="discount">
												<c:if
													test="${discount.location.locationId == location.locationId}">
													<div class="custom-tag">
														<span
															class="text-custom-white rectangle-tag bg-gradient-red">sale</span>
													</div>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="product-caption">
									<div class="title-box">
										<h6 class="product-title">
											<a
												href="${pageContext.request.contextPath}/public/restaurant/${location.locationId}"
												class="text-light-black ">${location.locationName}</a>
										</h6>
										<c:set var="ratingPoint" value="-.-" />
										<c:forEach items="${ratingList}" var="rating">
											<c:if test="${rating.locationId == location.locationId}"><c:set var="ratingPoint" value="${rating.point}" /></c:if>
										</c:forEach>
										<div class="tags">
											<span class="text-custom-white rectangle-tag bg-yellow">
												${ratingPoint} </span>
										</div>
									</div>
									<p class="text-light-white">${location.locationTypeName},
										${location.locationCategoryName}</p>
									<div class="product-details">
										<div class="price-time">
											<span class="text-light-black time">
												${location.openTime}-${location.closeTime}</span> 
												<c:set var="minMaxPrice" value="--.--"/>
												<c:forEach items="${minMaxLocation}" var="minMax">
													<c:if test="${minMax.locationId == location.locationId}">
														<c:set var="minMaxPrice" value="${minMax.minPrice}VNĐ - ${minMax.maxPrice}VNĐ"/>
													</c:if>
											</c:forEach>
											<span class="text-light-white price">${minMaxPrice}</span>
										</div>
										<div class="rating">
											<!-- <span> <i class="fas fa-star text-yellow"></i> <i
												class="fas fa-star text-yellow"></i> <i
												class="fas fa-star text-yellow"></i> <i
												class="fas fa-star text-yellow"></i> <i
												class="fas fa-star text-yellow"></i>
											</span>  -->
											<!-- <span class="text-light-white text-right">4225
												ratings</span> -->
										</div>
									</div>
									<div class="product-footer">
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
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- advertisement banner-->
		<c:if test="${not empty sessionScope.userSession}">
			<div class="row">
				<div class="col-12">
					<div class="section-header-left">
						<h3 class="text-light-black header-title title">Địa điểm bạn
							yêu thích</h3>
					</div>
				</div>
			</div>
			<!-- advertisement banner-->
			<div class="row">
				<div class="col-lg-9 col-md-8">
					<div class="row">
						<c:choose>
							<c:when test="${not empty locationFavoriteList}">
								<c:forEach items="${locationFavoriteList}"
									var="locationFavorite">
									<div class="col-lg-4 col-md-6 col-sm-6">
										<div class="product-box mb-xl-20">
											<div class="product-img">
												<a
													href="${pageContext.request.contextPath}/public/restaurant/${locationFavorite.location.locationId}">
													<img style="width: 255px; height: 150px;"
													src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${locationFavorite.location.mediaPath}"
													class="img-fluid full-width" alt="product-img">
												</a>
												<div class="overlay">
													<div class="product-tags padding-10">
														<span class="${circletag}"><img onclick="editLocationFavorite(${locationFavorite.location.locationId})"
															src="${pageContext.request.contextPath}/resources/public/assets/img/svg/010-heart.svg"
															alt="tag"></span>
														<c:forEach items="${listLocationTopNew}" var="location">
															<c:if
																test="${location.locationId == locationFavorite.location.locationId}">
																<span
																	class="text-custom-white type-tag bg-gradient-orange">NEW</span>
															</c:if>
														</c:forEach>
														<c:forEach items="${DiscountList}" var="discount">
															<c:if
																test="${discount.location.locationId == locationFavorite.location.locationId}">
																<div class="custom-tag">
																	<span
																		class="text-custom-white rectangle-tag bg-gradient-red">sale</span>
																</div>
															</c:if>
														</c:forEach>
													</div>
												</div>
											</div>
											<div class="product-caption">
												<div class="title-box">
													<h6 class="product-title">
														<a
															href="${pageContext.request.contextPath}/public/restaurant/${locationFavorite.location.locationId}"
															class="text-light-black ">${locationFavorite.location.locationName}</a>
													</h6>
													<c:set var="ratingPoint" value="-.-" />
													<c:forEach items="${ratingList}" var="rating">
														<c:if test="${rating.locationId == locationFavorite.location.locationId}"><c:set var="ratingPoint" value="${rating.point}" /></c:if>
													</c:forEach>
													<div class="tags">
														<span class="text-custom-white rectangle-tag bg-yellow">
															${ratingPoint} </span>
													</div>
												</div>
												<p class="text-light-white">${locationFavorite.location.locationType.locationTypeName}, ${locationFavorite.location.locationCategory.locationCategoryName}</p>
												<div class="product-details">

													<div class="price-time">
														<span class="text-light-black time">${locationFavorite.location.openTime}-${locationFavorite.location.closeTime}</span>
														<c:set var="minMaxPrice" value="--.--"/>
														<c:forEach items="${minMaxLocation}" var="minMax">
															<c:if test="${minMax.locationId == locationFavorite.location.locationId}">
																<c:set var="minMaxPrice" value="${minMax.minPrice}VNĐ - ${minMax.maxPrice}VNĐ"/>
															</c:if>
														</c:forEach>
														<span class="text-light-white price">${minMaxPrice}</span>
													</div>
													<div class="rating">
														<!-- <span> <i class="fas fa-star text-yellow"></i> <i
															class="fas fa-star text-yellow"></i> <i
															class="fas fa-star text-yellow"></i> <i
															class="fas fa-star text-yellow"></i> <i
															class="fas fa-star text-yellow"></i>
														</span>  -->
														<!-- <span class="text-light-white text-right">4225
															ratings</span> -->
													</div>
												</div>
												<div class="product-footer">
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
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<span>Bạn chưa có địa điểm yêu thích nào, hãy tìm địa
									điểm yêu thích ngây để lưu lại.</span>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<c:if test="${not empty locationFavoriteList}">
					<div class="col-lg-3 col-md-4">
						<div class="large-product-box mb-xl-20 p-relative">
							<img src="${pageContext.request.contextPath}/resources/public/assets/img/images (2).jpg"
								class="img-fluid full-width" alt="image">
							<div class="category-type overlay padding-15">
								<button class="category-btn">Địa điểm bạn yêu thích</button>
								<a href="${pageContext.request.contextPath}/public/listview/favorite"
									class="btn-first white-btn text-light-black fw-600 full-width">Xem thêm</a>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</c:if>
	</div>
</section>
<!-- Explore collection -->