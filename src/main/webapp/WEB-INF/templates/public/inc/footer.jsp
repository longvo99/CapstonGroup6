<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/templates/tags/taglib.jsp"%>

<!-- footer -->
<div class="footer-top section-padding bg-black">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 col-sm-4 col-4 mb-sm-20">
				<div class="icon-box">
					<span class="text-light-green"><i
						class="flaticon-credit-card-1"></i></span> <span
						class="text-custom-white">100% Bảo mật<br>Thanh toán
					</span>
				</div>
			</div>
			<div class="col-md-2 col-sm-4 col-6 mb-sm-20">
				<div class="icon-box">
					<span class="text-light-green"><i class="flaticon-wallet-1"></i></span>
					<span class="text-custom-white">Hỗ trợ thanh toán<br>
						trực tuyến
					</span>
				</div>
			</div>
			<div class="col-md-2 col-sm-4 col-4 mb-sm-20">
				<div class="icon-box">
					<span class="text-light-green"><i class="flaticon-help"></i></span>
					<span class="text-custom-white">24/7 <br>Hỗ trợ
					</span>
				</div>
			</div>
			<div class="col-md-2 col-sm-4 col-4">
				<div class="icon-box">
					<span class="text-light-green"><i class="flaticon-truck"></i></span>
					<span class="text-custom-white">Giao hàng <br>Tận nơi
					</span>
				</div>
			</div>
			<div class="col-md-2 col-sm-4 col-4">
				<div class="icon-box">
					<span class="text-light-green"><i class="flaticon-guarantee"></i></span>
					<span class="text-custom-white">Đảm bảo <br>giá tốt
						nhất
					</span>
				</div>
			</div>
			<div class="col-md-2 col-sm-4 col-6">
				<div class="icon-box">
					<span class="text-light-green"><i
						class="flaticon-app-file-symbol"></i></span> <span
						class="text-custom-white">Ứng dụng<br>trên điện thoại
					</span>
				</div>
			</div>
		</div>
	</div>
</div>
<footer class="section-padding bg-light-theme pt-0 u-line bg-black">
	<div class="u-line instagram-slider swiper-container">
		<ul class="hm-list hm-instagram swiper-wrapper">
			<c:forEach items="${imageLocation}" var="image">
				<li class="swiper-slide"><a
					href="${pageContext.request.contextPath}/public/restaurant/${image.locationId}"><img
						style="width: 250px; height: 200px;"
						src="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${image.mediaPath}"
						alt="instagram"></a></li>
			</c:forEach>
		</ul>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl col-lg-4 col-md-4 col-sm-6">
				<div class="footer-contact">
					<h6 class="text-custom-white">Thông tin</h6>
					<ul>
						<li class="fw-600"><span class="text-light-white">Số
								điện thoại</span> <a href="tel:" class="text-custom-white">+(80)
								123 456 789</a></li>
						<li class="fw-600"><span class="text-light-white">Email</span>
							<a href="mailto:" class="text-custom-white">lhtmp@lhtmp.com</a></li>
						<li class="fw-600"><span class="text-light-white">Facebook</span>
							<a href="#" class="text-custom-white">@lhtmp</a></li>
						<li class="fw-600"><span class="text-light-white">Instagram</span>
							<a href="#" class="text-custom-white">@lhtmp</a></li>
					</ul>
				</div>
			</div>
			<div class="col-xl col-lg-4 col-md-4 col-sm-6">
				<div class="footer-links">
					<h6 class="text-custom-white">Hiều về chúng tôi</h6>
					<ul>
						<li><a href="#" class="text-light-white fw-600">Giới
								thiệu</a></li>
						<li><a href="#" class="text-light-white fw-600">Blog</a></li>
						<li><a href="#" class="text-light-white fw-600">Giao lưu</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-xl col-lg-4 col-md-4 col-sm-6">
				<div class="footer-links">
					<h6 class="text-custom-white">Hỗ trợ bạn</h6>
					<ul>
						<li><a href="#" class="text-light-white fw-600">Tài khoản
								của bạn</a></li>
						<li><a href="#" class="text-light-white fw-600">Lịch sử
								đặt hàng</a></li>
						<li><a href="#" class="text-light-white fw-600">Tìm nhà
								hàng</a></li>
						<li><a href="#" class="text-light-white fw-600">Theo dõi
								đơn hàng</a></li>
					</ul>
				</div>
			</div>
			<!-- <div class="col-xl col-lg-4 col-md-4 col-sm-6">
                    <div class="footer-links">
                        <h6 class="text-custom-white">Doing Business</h6>
                        <ul>
                            <li><a href="#" class="text-light-white fw-600">Suggest an Idea</a>
                            </li>
                            <li><a href="#" class="text-light-white fw-600">Be a Partner restaurant</a>
                            </li>
                            <li><a href="#" class="text-light-white fw-600">Create an Account</a>
                            </li>
                            <li><a href="#" class="text-light-white fw-600">Help</a>
                            </li>
                        </ul>
                    </div>
                </div> -->
			<!-- <div class="col-xl col-lg-4 col-md-4 col-sm-6">
                    <div class="footer-links">
                        <h6 class="text-custom-white">Download Apps</h6>
                        <div class="appimg">
                            <a href="#">
                                <img src="https://via.placeholder.com/150x40" class="img-fluid" alt="app logo">
                            </a>
                        </div>
                        <div class="appimg">
                            <a href="#">
                                <img src="https://via.placeholder.com/150x40" class="img-fluid" alt="app logo">
                            </a>
                        </div>
                    </div>
                </div> -->
			<div class="col-xl col-lg-4 col-md-4 col-sm-6">
				<div class="footer-contact">
					<h6 class="text-custom-white">Nhận thông báo</h6>
					<form class="subscribe_form">
						<div class="input-group">
							<input type="text" class="form-control form-control-submit"
								name="email" placeholder="Nhập mail của bạn"> <span
								class="input-group-btn">
								<button class="btn btn-second btn-submit" type="button">
									<i class="fas fa-paper-plane"></i>
								</button>
							</span>
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-12">
				<div class="ft-social-media">
					<h6 class="text-center text-light-black">Follow us</h6>
					<ul>
						<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
						<li><a href="#"><i class="fab fa-twitter"></i></a></li>
						<li><a href="#"><i class="fab fa-instagram"></i></a></li>
						<li><a href="#"><i class="fab fa-pinterest-p"></i></a></li>
						<li><a href="#"><i class="fab fa-youtube"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- <div class="copyright bg-black">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <div class="payment-logo mb-md-20"> <span class="text-light-white fs-14 mr-3">We are accept</span>
                        <div class="payemt-icon">
                            <img src="https://via.placeholder.com/60x30" alt="#">
                            <img src="https://via.placeholder.com/60x30" alt="#">
                            <img src="https://via.placeholder.com/60x30" alt="#">
                            <img src="https://via.placeholder.com/60x30" alt="#">
                            <img src="https://via.placeholder.com/60x30" alt="#">
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 text-center medewithlove align-self-center">
                    <a href="#" class="text-custom-white">Made with Real <i class="fas fa-heart"></i> Slidesigma</a>
                </div>
                <div class="col-lg-4">
                    <div class="copyright-text"> <span class="text-light-white">© <a href="#" class="text-light-white">Slidesigma</a> - 2020 | All Right Reserved</span>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
<!-- footer -->
<!-- modal boxes -->
<div class="modal fade" id="address-box">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title fw-700">Change Address</h4>
			</div>
			<div class="modal-body">
				<div class="location-picker">
					<input type="text" class="form-control"
						placeholder="Enter a new address">
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="search-box">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div class="search-box p-relative full-width">
					<input type="text" class="form-control"
						placeholder="Pizza, Burger, Chinese">
				</div>
			</div>
			<div class="modal-body"></div>
		</div>
	</div>
</div>
<!-- Place all Scripts Here -->
<!-- jQuery -->
<%-- <script src="${pageContext.request.contextPath}/resources/public/assets/js/jquery.min.js"></script> --%>
<!-- Popper -->
<script
	src="${pageContext.request.contextPath}/resources/public/assets/js/popper.min.js"></script>
<!-- Bootstrap -->
<script
	src="${pageContext.request.contextPath}/resources/public/assets/js/bootstrap.min.js"></script>
<!-- Range Slider -->
<script
	src="${pageContext.request.contextPath}/resources/public/assets/js/ion.rangeSlider.min.js"></script>
<!-- Swiper Slider -->
<script
	src="${pageContext.request.contextPath}/resources/public/assets/js/swiper.min.js"></script>
<!-- Nice Select -->
<script
	src="${pageContext.request.contextPath}/resources/public/assets/js/jquery.nice-select.min.js"></script>
<!-- magnific popup -->
<script
	src="${pageContext.request.contextPath}/resources/public/assets/js/jquery.magnific-popup.min.js"></script>
<!-- Maps -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnd9JwZvXty-1gHZihMoFhJtCXmHfeRQg"></script>
<script
	src="${pageContext.request.contextPath}/resources/public/assets/js/map.js"></script>
<!-- sticky sidebar -->
<script
	src="${pageContext.request.contextPath}/resources/public/assets/js/sticksy.js"></script>
<!-- Munch Box Js -->
<script
	src="${pageContext.request.contextPath}/resources/public/assets/js/foodmart.js"></script>
<!-- /Place all Scripts Here -->
<c:set var="userId" value="0" />
<c:if test="${not empty sessionScope.userSession}">
	<c:set var="userId" value="${sessionScope.userSession.userId}" />
</c:if>
<script>
   	function editLocationFavorite(locationId) {
   			var userId = ${userId};
   			if(userId == 0){
   				return alert("Bạn hãy đăng nhập để thực hiện thao tác này!!!");
   			}else{
    		$.ajax({
    			type : "POST",
    			contentType : "application/json",
    			url : "${pageContext.request.contextPath}/public/editLocationFavorite/"+locationId,
    			data : JSON.stringify(userId),
    			dataType : 'json'				
    		});
    	}
   	}
   	
   	/* COOKIE */
	function setCookieOrder(productId) {
	  var quantity = $("#quantity" + productId).val();
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
		                     +"<a href='javascript:void(0)' onclick=deleteCookieOrder('" + val.productId + "') class='text-dark-white'> <i class='far fa-trash-alt'></i></a>"
		                 +"</div>"
		                 +"<div class='price'> <a href='#' class='text-dark-white fw-500'>"+ parseInt(val.price) +"</a></div>"
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
   	
	function setCookieOrderCombo(productId) {
		  var quantity = $("#quantityCombo" + productId).val();
		  $.ajax({
				type : "GET",
				contentType : "application/json",
				url : "${pageContext.request.contextPath}/public/addCartAjax",
				data : {'aProductId': 'c' + productId, 'aQuantity': quantity },
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
			                     +"<a href='javascript:void(0)' onclick=deleteCookieOrder('" + val.productId + "') class='text-dark-white'> <i class='far fa-trash-alt'></i></a>"
			                 +"</div>"
			                 +"<div class='price'> <a href='#' class='text-dark-white fw-500'>"+ (parseInt(val.price) * parseInt(val.quantity)) +"</a></div>"
			             +"</div>"
			             totalPriceDTO += (parseInt(val.price) * parseInt(val.quantity));
					 });
					 $("#cat-product-box").html(html_code);
					 $("#cat-product-box-topbar").html(html_code);
					 $("#totalPriceDTO").text(totalPriceDTO);
					 $("#totalPriceDTOTopBar").text(totalPriceDTO);
					 $("#sizeCart").text(sizeCart);
				  }
		  	});
		}
	
	function deleteCookieOrder(productId) {
		  $.ajax({
				type : "GET",
				contentType : "application/json",
				url : "${pageContext.request.contextPath}/public/deleteCartAjax",
				data : {'aProductId': productId },
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
			                     +"<a href='javascript:void(0)' onclick=deleteCookieOrder('" + val.productId + "') class='text-dark-white'> <i class='far fa-trash-alt'></i></a>"
			                 +"</div>"
			                 +"<div class='price'> <a href='#' class='text-dark-white fw-500'>"+ (parseInt(val.price) * parseInt(val.quantity)) +"</a></div>"
			             +"</div>"
			             totalPriceDTO += (parseInt(val.price) * parseInt(val.quantity));
					 });
					 $("#cat-product-box").html(html_code);
					 $("#cat-product-box-topbar").html(html_code);
					 $("#totalPriceDTO").text(totalPriceDTO);
					 $("#totalPriceDTOTopBar").text(totalPriceDTO);
					 $("#sizeCart").text(sizeCart);
					 $('#cat-product' + productId).hide();
					 $("#totalCartCheckOut").text(totalPriceDTO + 20000);
				  }
		  	});
		}
   	</script>
   	<style>
   		.limitLength {
		  white-space: nowrap; 
		  width: 100px; 
		  overflow: hidden;
		  text-overflow: ellipsis; 
		}
   	</style>
</body>

</html>