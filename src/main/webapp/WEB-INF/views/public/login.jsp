<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/tags/taglib.jsp"%>

<div class="inner-wrapper">
	<div class="container-fluid no-padding">
		<div style="padding-top: 20px;" class="row no-gutters overflow-auto">
			<div class="col-md-6">
				<div class="main-banner">
					<img src="https://via.placeholder.com/952x646"
						class="img-fluid full-width main-img" alt="banner">
					<div class="overlay-2 main-padding">
						<img src="https://via.placeholder.com/190x111" class="img-fluid"
							alt="logo">
					</div>
					<img src="https://via.placeholder.com/340x220" class="footer-img"
						alt="footer-img">
				</div>
			</div>
			<div class="col-md-6">
				<div class="section-2 user-page main-padding">
					<div class="login-sec">
						<div style="margin-bottom: 20px;" class="login-box">
							<form>
								<h4 class="text-light-black fw-600">Sign in with your
									foodmart account</h4>
								<div class="row">
									<div class="col-12">
										<p class="text-light-black">
											Have a corporate username? <a href="add-restaurant.html">Click
												here</a>
										</p>
										<div class="form-group">
											<label class="text-light-white fs-14">Email</label> <input
												type="email" name="#"
												class="form-control form-control-submit"
												placeholder="Email I'd" required>
										</div>
										<div class="form-group">
											<label class="text-light-white fs-14">Password</label> <input
												type="password" id="password-field" name="#"
												class="form-control form-control-submit" value="password"
												placeholder="Password" required>
											<div data-name="#password-field"
												class="fa fa-fw fa-eye field-icon toggle-password"></div>
										</div>
										<div class="form-group checkbox-reset">
											<label class="custom-checkbox mb-0"> <input
												type="checkbox" name="#"> <span class="checkmark"></span>
												Keep me signed in
											</label> <a href="#">Reset password</a>
										</div>
										<div class="form-group">
											<button type="submit"
												class="btn-second btn-submit full-width">
												<img
													src="${pageContext.request.contextPath}/resources/public/assets/img/M.png"
													alt="btn logo">Sign in
											</button>
										</div>
										<div class="form-group text-center">
											<span>or</span>
										</div>
										<%-- <div class="form-group">
                        <button type="submit" class="btn-second btn-facebook full-width">
                          <img src="${pageContext.request.contextPath}/resources/public/assets/img/facebook-logo.svg" alt="btn logo">Continue with Facebook</button>
                      </div> --%>
										<%-- <div class="form-group">
                        <a href="${pageContext.request.contextPath}/oauth2/auth/google"><button type="submit" class="btn-second btn-google full-width">
                          <img src="${pageContext.request.contextPath}/resources/public/assets/img/google-logo.png" alt="btn logo">Continue with Google</button></a>
                      </div> --%>
										<a
											href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/Capston.Group6/public/login-google&response_type=code&client_id=620272103683-kgo588qtq63in5a2orb96nq10tlbskld.apps.googleusercontent.com&approval_prompt=force">Login
											With Google</a>
										<div class="form-group text-center mb-0">
											<a href="register.html">Create your account</a>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>

</html>