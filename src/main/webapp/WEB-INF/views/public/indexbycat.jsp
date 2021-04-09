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
		<!-- advertisement banner-->
		<div class="row">
			<div class="col-12">
				<div class="section-header-left">
					<h3 class="text-light-black header-title title">Danh mục: ${listLocationByCat.get(0).locationCategory.locationCategoryName}</h3>
				</div>
			</div>
		</div>
		<!-- advertisement banner-->
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="row">
					<c:forEach items="${listLocationByCat}"
						var="locationByCat">
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="product-box mb-xl-20">
								<div class="product-img">
									<a
										href="${pageContext.request.contextPath}/public/restaurant/${locationByCat.locationId}">
										<img style="width: 255px; height: 150px;"
										src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${fn:substring(locationByCat.mediaPath, 0, fn:indexOf(locationByCat.mediaPath, ';'))}"
										class="img-fluid full-width" alt="product-img">
									</a>
									<div class="overlay">
										<div class="product-tags padding-10">
											<span class="${circletag}"> 
											<c:set var="heartLNew" value="013-heart-1.svg" /> 
											<c:forEach
													items="${locationFavoriteList}" var="locationLF">
													<c:if
														test="${locationLF.location.locationId == locationByCat.locationId}">
														<c:set var="heartLNew" value="010-heart.svg" />
													</c:if>
											</c:forEach> 
											<img onclick="editLocationFavorite(${locationByCat.locationId})"
												src="${pageContext.request.contextPath}/resources/public/assets/img/svg/${heartLNew}"
												alt="tag">
											</span>
											<c:forEach items="${listLocationTopNew}" var="location">
												<c:if
													test="${location.locationId == locationByCat.locationId}">
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
										<c:if test="${fn:length(locationByCat.locationName) le 25}">
											<a
												href="${pageContext.request.contextPath}/public/restaurant/${locationByCat.locationId}"
												class="text-light-black ">${locationByCat.locationName}</a>
										</c:if>
										<c:if test="${fn:length(locationByCat.locationName) gt 25}">
											<a
												href="${pageContext.request.contextPath}/public/restaurant/${locationByCat.locationId}"
												class="text-light-black ">${fn:substring(locationByCat.locationName, 0, 25)}...</a>
										</c:if>
											<%-- <a
												href="${pageContext.request.contextPath}/public/restaurant/${locationByCat.locationId}"
												class="text-light-black ">${fn:substring(locationByCat.locationName, 0, 15)}${locationByCat.locationName}</a> --%>
										</h6>
										<c:set var="ratingPoint" value="-.-" />
										<c:forEach items="${ratingList}" var="rating">
											<c:if test="${rating.locationId == locationByCat.locationId}"><c:set var="ratingPoint" value="${rating.point}" /></c:if>
										</c:forEach>
										<div class="tags">
											<span class="text-custom-white rectangle-tag bg-yellow">
												${ratingPoint} </span>
										</div>
									</div>
									<p class="text-light-white">${locationByCat.locationType.locationTypeName},
										${locationByCat.locationCategory.locationCategoryName}</p>
									<div class="product-details">
										<div class="price-time">
											<span class="text-light-black time">
												${locationByCat.openTime}-${locationByCat.closeTime}</span>
											<c:set var="minMaxPrice" value="--.--"/>
												<c:forEach items="${minMaxLocation}" var="minMax">
													<c:if test="${minMax.locationId == locationByCat.locationId}">
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
			<%-- <div class="col-lg-3 col-md-4">
				<div class="large-product-box mb-xl-20 p-relative">
					<img src="${pageContext.request.contextPath}/resources/public/assets/img/images.jpg"
						class="img-fluid full-width" alt="image">
					<div class="category-type overlay padding-15">
						<button class="category-btn">Địa điểm đang giảm giá</button>
						<a href="restaurant.html"
							class="btn-first white-btn text-light-black fw-600 full-width">See
							all</a>
					</div>
				</div>
			</div> --%>
		</div>
	</div>
</section>
<!-- Explore collection -->