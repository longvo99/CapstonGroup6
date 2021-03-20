<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/tags/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="keywords" content="#">
    <meta name="description" content="#">
    <title>foodmart | Food Delivery Hub</title>
    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="#">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="#">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="#">
    <link rel="apple-touch-icon-precomposed" href="#">
    <link rel="shortcut icon" href="#">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/public/assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Fontawesome -->
    <link href="${pageContext.request.contextPath}/resources/public/assets/css/font-awesome.css" rel="stylesheet">
    <!-- Flaticons -->
    <link href="${pageContext.request.contextPath}/resources/public/assets/css/font/flaticon.css" rel="stylesheet">
    <!-- Swiper Slider -->
    <link href="${pageContext.request.contextPath}/resources/public/assets/css/swiper.min.css" rel="stylesheet">
    <!-- Range Slider -->
    <link href="${pageContext.request.contextPath}/resources/public/assets/css/ion.rangeSlider.min.css" rel="stylesheet">
    <!-- magnific popup -->
    <link href="${pageContext.request.contextPath}/resources/public/assets/css/magnific-popup.css" rel="stylesheet">
    <!-- Nice Select -->
    <link href="${pageContext.request.contextPath}/resources/public/assets/css/nice-select.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/public/assets/css/style.css" rel="stylesheet">
    <!-- Custom Responsive -->
    <link href="${pageContext.request.contextPath}/resources/public/assets/css/responsive.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&display=swap" rel="stylesheet">
    <!-- upload multi image -->
	<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link type="text/css" rel="stylesheet" href="https://www.codehim.com/demo/jquery-image-uploader-preview-and-delete/dist/image-uploader.min.css">
	<!-- comment -->
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<!-- CSS of Productdetail  -->
    <link href="${pageContext.request.contextPath}/resources/public/assets/css/productdetail.css" rel="stylesheet">
    <!-- plus and minus  -->
   <%--  <link href="${pageContext.request.contextPath}/resources/public/assets/css/checkout.css" rel="stylesheet"> --%>
    <!-- place -->
    
    <link href="${pageContext.request.contextPath}/resources/admin/assets/css/jquery-ui.css" rel="stylesheet">
    
    <style type="text/css">
	.dropdown-submenu {
  		position: relative;
	}
	.dropdown-submenu>a:after {
	  content: ">";
	  float: right;
	}
	.dropdown-submenu>.dropdown-menu {
	  top: 0;
	  left: 100%;
	  margin-top: 0px;
	  margin-left: 0px;
	}
	.dropdown-submenu:hover>.dropdown-menu {
	  display: block;
	}
    </style>
    <style type="text/css">
input[type="file"] {
	display: block;
}

.imageThumb {
	max-height: 75px;
	border: 2px solid;
	padding: 1px;
	cursor: pointer;
}

.pip {
	display: inline-block;
	margin: 10px 10px 0 0;
}

.remove {
	display: block;
	background: #444;
	border: 1px solid black;
	color: white;
	text-align: center;
	cursor: pointer;
}

.remove:hover {
	background: white;
	color: black;
}
</style>
</head>

<body>
    <!-- Navigation -->
    <div class="header">
        <header class="full-width">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 mainNavCol">
                        <!-- logo -->
                        <!-- <div class="logo mainNavCol">
                            <a href="index.html">
                                <img src="https://via.placeholder.com/106x30" class="img-fluid" alt="Logo">
                            </a>
                        </div> -->
                        <div style="width: 200px; margin-right: 20px;" class="btn-group">
		                    <a id="dLabel" role="button" data-toggle="dropdown" class="btn btn-outline-secondary dropdown-toggle"
		                       href="">
		                        Select Category
		                    </a>
		                    <c:if test="${not empty locationCategoriesList1}">
		                    <ul class="selectPkeyVkey dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
			                    <c:forEach items="${locationCategoriesList1}" var="cat1">
			                    <c:set var="check" value="0" />
				                    <c:forEach items="${locationCategoriesList2}" var="cat2">
										<c:if test="${cat2.parentId eq cat1.categoryId}">
											<c:set var="check" value="1" />
										</c:if>
									</c:forEach>
									<c:if test="${check eq 0}">
										<%-- <a href="#">${cat1.locationCategoryName}</a> --%>
										<li value ="1"><a class="dropdown-item">${cat1.locationCategoryName}</a></li>
										<li class="dropdown-divider"></li>
									</c:if>
									<c:if test="${check eq 1}">
										<li class="dropdown-submenu">
				                            <a class="dropdown-item" tabindex="-1" href="#">
				                                ${cat1.locationCategoryName}
				                            </a>
				                            <ul class="dropdown-menu">
				                            	<c:forEach items="${locationCategoriesList2}" var="cat2">
													<c:if test="${cat2.parentId eq cat1.categoryId}">
														<li value="3"><a class="dropdown-item" tabindex="-1">${cat2.locationCategoryName}</a></li>
														<li class="dropdown-divider"></li>
													</c:if>
												</c:forEach>
				                                <!-- <li value="3"><a class="dropdown-item" tabindex="-1">Copy Number Gain</a></li>
				                                <li value="3"><a class="dropdown-item">Copy Number Loss</a></li>
				                                <li value ="3"><a class="dropdown-item">Deletion</a></li>
				                                <li value ="3"><a class="dropdown-item">Diplotype</a></li>
				                                <li value ="3"><a class="dropdown-item">Distinct Chromosome</a></li>
				                                <li value ="3"><a class="dropdown-item">Duplication</a></li> -->
				                            </ul>
				                        </li>
				                        <li class="dropdown-divider"></li>
									</c:if>
		                       <!--  <li value ="1"><a class="dropdown-item">Protein Search</a></li>
		                        <li value="2"><a class="dropdown-item">Nucleotide Search</a></li>
		                        <li><a class="dropdown-item">Group Variants</a></li>
		                        <li class="dropdown-divider"></li>
		                        <li class="dropdown-submenu">
		                            <a class="dropdown-item" tabindex="-1" href="#">
		                                CNV
		                            </a>
		                            <ul class="dropdown-menu">
		                                <li value="3"><a class="dropdown-item" tabindex="-1">Copy Number Gain</a></li>
		                                <li value="3"><a class="dropdown-item">Copy Number Loss</a></li>
		                                <li value ="3"><a class="dropdown-item">Deletion</a></li>
		                                <li value ="3"><a class="dropdown-item">Diplotype</a></li>
		                                <li value ="3"><a class="dropdown-item">Distinct Chromosome</a></li>
		                                <li value ="3"><a class="dropdown-item">Duplication</a></li>
		                            </ul>
		                        </li> -->
		                       </c:forEach>
		                    </ul>
		                    </c:if>
                		</div>
                        <!-- logo -->
                        <div class="main-search mainNavCol">
                            <form class="main-search search-form full-width">
                                <div class="row">
                                    <!-- location picker -->
                                    <div class="col-lg-6 col-md-5">
                                        <a href="#" class="delivery-add p-relative"> <span class="icon"><i class="fas fa-map-marker-alt"></i></span>
                                            <span class="address">Brooklyn, NY</span>
                                        </a>
                                        <div class="location-picker">
                                            <input type="text" class="form-control" placeholder="Enter a new address">
                                        </div>
                                    </div>
                                    <!-- location picker -->
                                    <!-- search -->
                                    <div class="col-lg-6 col-md-7">
                                        <div class="search-box padding-10">
                                            <input id="productName" type="text" class="form-control" placeholder="Pizza, Burger, Chinese">
                                        </div>
                    <script type="text/javascript">
						$(document).ready(function() {
							$('#productName').autocomplete({
								source : '${pageContext.request.contextPath}/public/search'
							});
						});
					</script>
                                    </div>
                                    <!-- search -->
                                </div>
                            </form>
                        </div>
                        <div class="right-side fw-700 mainNavCol">
                            <div class="gem-points">
                                <a href="#"> <i class="fas fa-concierge-bell"></i>
                                    <span>Order Now</span>
                                </a>
                            </div>
                            <div class="catring parent-megamenu">
                                <a href="#"> <span>Pages <i class="fas fa-caret-down"></i></span>
                                    <i class="fas fa-bars"></i>
                                </a>
                                <div class="megamenu">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-lg-4 col-md-5">
                                                    <div class="ex-collection-box h-100">
                                                        <a href="#">
                                                            <img src="https://via.placeholder.com/406x271" class="img-fluid full-width h-100" alt="image">
                                                        </a>
                                                        <div class="category-type overlay padding-15"> <a href="restaurant.html" class="category-btn">Top rated</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-8 col-md-7">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-sm-6">
                                                            <div class="menu-style">
                                                                <div class="menu-title">
                                                                    <h6 class="cat-name"><a href="#" class="text-light-black">Home Pages</a></h6>
                                                                </div>
                                                                <ul>
                                                                    <li class="active"><a href="index.html" class="text-light-white fw-500">Landing Page</a>
                                                                    </li>
                                                                    <li><a href="homepage-1.html" class="text-light-white fw-500">Home Page 1</a>
                                                                    </li>
                                                                    <li><a href="homepage-2.html" class="text-light-white fw-500">Home Page 2</a>
                                                                    </li>
                                                                    <li><a href="homepage-3.html" class="text-light-white fw-500">Home Page 3</a>
                                                                    </li>
                                                                    <li><a href="homepage-4.html" class="text-light-white fw-500">Home Page 4</a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-sm-6">
                                                            <div class="menu-style">
                                                                <div class="menu-title">
                                                                    <h6 class="cat-name"><a href="#" class="text-light-black">Inner Pages</a></h6>
                                                                </div>
                                                                <ul>
                                                                    <li><a href="blog.html" class="text-light-white fw-500">Blog Grid View</a>
                                                                    </li>
                                                                    <li><a href="blog-style-2.html" class="text-light-white fw-500">Blog Grid View 2</a>
                                                                    </li>
                                                                    <li><a href="blog-details.html" class="text-light-white fw-500">Blog Details</a>
                                                                    </li>
                                                                    <li><a href="ex-deals.html" class="text-light-white fw-500">Ex Deals</a>
                                                                    </li>
                                                                    <li><a href="about.html" class="text-light-white fw-500">About Us</a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-sm-6">
                                                            <div class="menu-style">
                                                                <div class="menu-title">
                                                                    <h6 class="cat-name"><a href="#" class="text-light-black">Related Pages</a></h6>
                                                                </div>
                                                                <ul>
                                                                    <li><a href="${pageContext.request.contextPath}/public/restaurant" class="text-light-white fw-500">Restaurant</a>
                                                                    <li><a href="restaurant-style-1.html" class="text-light-white fw-500">Restaurant 1</a>
                                                                    </li>
                                                                    <li><a href="restaurant-style-2.html" class="text-light-white fw-500">Restaurant 2</a>
                                                                    </li>
                                                                    <li><a href="add-restaurant.html" class="text-light-white fw-500">Add Restaurant</a>
                                                                    </li>
                                                                    <li><a href="list-view.html" class="text-light-white fw-500">List View</a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-sm-6">
                                                            <div class="menu-style">
                                                                <div class="menu-title">
                                                                    <h6 class="cat-name"><a href="#" class="text-light-black">Additional Pages</a></h6>
                                                                </div>
                                                                <ul>
                                                                    <li><a href="login.html" class="text-light-white fw-500">Login</a>
                                                                    </li>
                                                                    <li><a href="register.html" class="text-light-white fw-500">Sign-up</a>
                                                                    </li>
                                                                    <li><a href="checkout.html" class="text-light-white fw-500">Checkout</a>
                                                                    </li>
                                                                    <li><a href="order-details.html" class="text-light-white fw-500">Order Details</a>
                                                                    </li>
                                                                    <li><a href="geo-locator.html" class="text-light-white fw-500">Geo Locator</a>
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
                            </div>
                            <!-- mobile search -->
                            <div class="mobile-search">
                                <a href="#" data-toggle="modal" data-target="#search-box"> <i class="fas fa-search"></i>
                                </a>
                            </div>
                            <!-- mobile search -->
                            <!-- user account -->
                            <div class="user-details p-relative">
                            <c:choose>
                            	<c:when test="${not empty sessionScope.userSession}">
                                <a href="#" class="text-light-white fw-500">
                                	<c:set var="avatarPath" value="" />
                                	<c:choose> 
                                		<c:when test="${not empty sessionScope.userSession.avatarPath}">
                                			<c:set var="avatarPath" value="${pageContext.request.contextPath}/resources/admin/assets/img/uploads/${sessionScope.userSession.avatarPath}" />
                                		</c:when>
                                		<c:otherwise>
                                			<c:set var="avatarPath" value="https://via.placeholder.com/30" />
                                		</c:otherwise>
                                	</c:choose>
                                	<c:set var="nameUser" value="" />
                                	<c:choose>
                                		<c:when test="${not empty sessionScope.userSession.contactName}">
                                			<c:set var="nameUser" value="${sessionScope.userSession.contactName}" />
                                		</c:when>
                                		<c:otherwise>
                                			<c:set var="nameUser" value="${sessionScope.userSession.username}" />
                                		</c:otherwise>
                                	</c:choose>
                                    <img src="${avatarPath}" class="rounded-circle" alt="userimg"> <span>Hi, ${nameUser}</span>
                                </a>
                                <div class="user-dropdown">
                                   <!--
                                    <ul>
                                         <li>
                                            <a href="order-details.html">
                                                <div class="icon"><i class="flaticon-rewind"></i>
                                                </div> <span class="details">Past Orders</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="order-details.html">
                                                <div class="icon"><i class="flaticon-takeaway"></i>
                                                </div> <span class="details">Upcoming Orders</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="icon"><i class="flaticon-breadbox"></i>
                                                </div> <span class="details">Saved</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="icon"><i class="flaticon-gift"></i>
                                                </div> <span class="details">Gift cards</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="icon"><i class="flaticon-refer"></i>
                                                </div> <span class="details">Refer a friend</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="icon"><i class="flaticon-diamond"></i>
                                                </div> <span class="details">Perks</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="icon"><i class="flaticon-user"></i>
                                                </div> <span class="details">Account</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="icon"><i class="flaticon-board-games-with-roles"></i>
                                                </div> <span class="details">Help</span>
                                            </a>
                                        </li> 
                                    </ul>-->
                                    <div class="user-footer"><a href="${pageContext.request.contextPath}/public/logout">Sign Out</a></div>
                                </div>
                                </c:when>
                                <c:otherwise>
                                	<img src="https://via.placeholder.com/30" class="rounded-circle" alt="userimg"><span> <a href="${pageContext.request.contextPath}/public/login"> Đăng nhập </a></span>
                                </c:otherwise>
                            </c:choose>  
                            </div>
                            <!-- mobile search -->
                            <!-- user notification -->
                            <div class="cart-btn notification-btn">
                                <a href="#" class="text-light-green fw-700"> <i class="fas fa-bell"></i>
                                    <span class="user-alert-notification"></span>
                                </a>
                                <div class="notification-dropdown">
                                    <div class="product-detail">
                                        <a href="#">
                                            <div class="img-box">
                                                <img src="https://via.placeholder.com/50x50" class="rounded" alt="image">
                                            </div>
                                            <div class="product-about">
                                                <p class="text-light-black">Lil Johnny’s</p>
                                                <p class="text-light-white">Spicy Maxican Grill</p>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="rating-box">
                                        <p class="text-light-black">How was your last order ?.</p> <span class="text-dark-white"><i class="fas fa-star"></i></span>
                                        <span class="text-dark-white"><i class="fas fa-star"></i></span>
                                        <span class="text-dark-white"><i class="fas fa-star"></i></span>
                                        <span class="text-dark-white"><i class="fas fa-star"></i></span>
                                        <span class="text-dark-white"><i class="fas fa-star"></i></span>
                                        <cite class="text-light-white">Ordered 2 days ago</cite>
                                    </div>
                                </div>
                            </div>
                            <!-- user notification -->
                            <!-- user cart -->
                            <div class="cart-btn cart-dropdown">
                                <a href="#" class="text-light-green fw-700"> <i class="fas fa-shopping-bag"></i>
                                    <span class="user-alert-cart">3</span>
                                </a>
                                <div class="cart-detail-box">
                                    <div class="card">
                                        <div class="card-header padding-15">Your Order</div>
                                        <div class="card-body no-padding">
                                            <div class="cat-product-box">
                                                <div class="cat-product">
                                                    <div class="cat-name">
                                                        <a href="#">
                                                            <p class="text-light-green"><span class="text-dark-white">1</span> Chilli Chicken</p> <span class="text-light-white">small, chilli chicken</span>
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
                                                            <p class="text-light-green"><span class="text-dark-white">1</span> loaded cheese</p> <span class="text-light-white">small, chilli chicken</span>
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
                                                            <p class="text-light-green"><span class="text-dark-white">1</span> Tortia Chicken</p> <span class="text-light-white">small, chilli chicken</span>
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
                                                    <span class="text-dark-white fw-700">$9.99</span>
                                                </div>
                                                <div class="empty-bag padding-15"> <a href="#">Empty bag</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer padding-15"> <a href="checkout.html" class="btn-first green-btn text-custom-white full-width fw-500">Proceed to Checkout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- user cart -->
                        </div>
                    </div>
                    <div class="col-sm-12 mobile-search">
                        <div class="mobile-address">
                            <a href="#" class="delivery-add" data-toggle="modal" data-target="#address-box"> <span class="address">Brooklyn, NY</span>
                            </a>
                        </div>
                        <div class="sorting-addressbox"> <span class="full-address text-light-green">Brooklyn, NY 10041</span>
                            <div class="btns">
                                <div class="filter-btn">
                                    <button type="button"><i class="fas fa-sliders-h text-light-green fs-18"></i>
                  </button> <span class="text-light-green">Sort</span>
                                </div>
                                <div class="filter-btn">
                                    <button type="button"><i class="fas fa-filter text-light-green fs-18"></i>
                  </button> <span class="text-light-green">Filter</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </div>
    <div class="main-sec"></div>
    <!-- Navigation -->

<script language="JavaScript" src="https://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>

<script type="text/javascript">
	$(".btn-group, .dropdown").hover(
   		function() {
     		$('>.dropdown-menu', this).stop(true, true).fadeIn("fast");
     		$(this).addClass('open');
   		},
		function() {
    		$('>.dropdown-menu', this).stop(true, true).fadeOut("fast");
     		$(this).removeClass('open');
		});
	$(".dropdown-item").click(function() {
   		let text = $(this).text();
   		$("#dLabel").text(text);
	});
</script>