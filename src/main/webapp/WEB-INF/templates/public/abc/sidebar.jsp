<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/tags/taglib.jsp"%>

<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				<div class="left-sidebar">
					<h2>Category</h2>
					<c:if test="${not empty locationCategoriesList1}">
						<div class="panel-group category-products" id="accordian">
							<!--category-productsr-->
							<c:forEach items="${locationCategoriesList1}" var="cat1">
								<div class="panel panel-default">
									<c:set var="check" value="0" />
									<div class="panel-heading">
										<h4 class="panel-title">
											<c:forEach items="${locationCategoriesList2}" var="cat2">
												<c:if test="${cat2.parentId eq cat1.locationCategoryId}">
													<c:set var="check" value="1" />
												</c:if>
											</c:forEach>
											<c:if test="${check eq 0}">
												<a href="#">${cat1.locationCategoryName}</a>
											</c:if>
											<c:if test="${check eq 1}">
												<a data-toggle="collapse" data-parent="#accordian"
													href="#${cat1.locationCategoryId}"> <span
													class="badge pull-right"><i class="fa fa-plus"></i></span>
													${cat1.locationCategoryName}
												</a>
											</c:if>
										</h4>
									</div>
									<c:if test="${check eq 1}">
										<div id="${cat1.locationCategoryId}"
											class="panel-collapse collapse">
											<div class="panel-body">
												<ul>
													<c:forEach items="${locationCategoriesList2}" var="cat2">
														<c:if test="${cat2.parentId eq cat1.locationCategoryId}">
															<li><a href="#">${cat2.locationCategoryName} </a></li>
														</c:if>
													</c:forEach>
												</ul>
											</div>
										</div>
									</c:if>
								</div>
							</c:forEach>
						</div>
						<!--/category-products-->
					</c:if>

					<div class="brands_products">
						<!--brands_products-->
						<h2>Brands</h2>
						<div class="brands-name">
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#"> <span class="pull-right">(50)</span>Acne
								</a></li>
								<li><a href="#"> <span class="pull-right">(56)</span>Grüne
										Erde
								</a></li>
								<li><a href="#"> <span class="pull-right">(27)</span>Albiro
								</a></li>
								<li><a href="#"> <span class="pull-right">(32)</span>Ronhill
								</a></li>
								<li><a href="#"> <span class="pull-right">(5)</span>Oddmolly
								</a></li>
								<li><a href="#"> <span class="pull-right">(9)</span>Boudestijn
								</a></li>
								<li><a href="#"> <span class="pull-right">(4)</span>Rösch
										creative culture
								</a></li>
							</ul>
						</div>
					</div>
					<!--/brands_products-->

					<div class="price-range">
						<!--price-range-->
						<h2>Price Range</h2>
						<div class="well text-center">
							<input type="text" class="span2" value="" data-slider-min="0"
								data-slider-max="600" data-slider-step="5"
								data-slider-value="[250,450]" id="sl2"><br /> <b
								class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
						</div>
					</div>
					<!--/price-range-->

					<div class="shipping text-center">
						<!--shipping-->
						<img src="images/home/shipping.jpg" alt="" />
					</div>
					<!--/shipping-->

				</div>
			</div>