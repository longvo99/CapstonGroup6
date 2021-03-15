<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/tags/taglib.jsp"%>

  <div class="inner-wrapper">
    <div class="container-fluid no-padding">
      <div style="padding-top: 280px;" class="row no-gutters overflow-auto">
        <div class="col-md-6">
          <div class="main-banner">
            <img src="https://via.placeholder.com/952x646" class="img-fluid full-width main-img" alt="banner">
            <div class="overlay-2 main-padding">
              <img src="https://via.placeholder.com/190x111" class="img-fluid" alt="logo">
            </div>
          </div>
        </div>
        <div style="padding-top: 100px;" class="col-md-6">
          <div class="section-2 user-page main-padding">
            <div style="padding-top: 50px;" class="login-sec">
              <div style="margin-bottom: 20px;" class="login-box">
                <form>
                  <h4 class="text-light-black fw-600">Create your account</h4>
                  <div class="row">
                   <!--  <div class="col-lg-6 col-md-12 col-sm-6">
                      <div class="form-group">
                        <label class="text-light-white fs-14">First name</label>
                        <input type="text" name="#" class="form-control form-control-submit" placeholder="First Name" required>
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-6">
                      <div class="form-group">
                        <label class="text-light-white fs-14">Last name</label>
                        <input type="text" name="#" class="form-control form-control-submit" placeholder="Last Name" required>
                      </div>
                    </div> -->
                    <div class="col-12">
                      <div class="form-group">
                        <label class="text-light-white fs-14">Username</label>
                        <input type="text" name="#" class="form-control form-control-submit" required>
                      </div>
                      <div class="form-group">
                        <label class="text-light-white fs-14">Password (8 character minimum)</label>
                        <input type="password" id="password-field" name="#" class="form-control form-control-submit" value="password" required>
                        <div data-name="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></div>
                      </div>
                      <div class="form-group">
                        <label class="text-light-white fs-14">Fullname</label>
                        <input type="text" name="#" class="form-control form-control-submit" required>
                      </div>
                       <div class="form-group">
                        <label class="text-light-white fs-14">Phone number</label>
                        <input type="tel" pattern="[0-9]{10}" name="#" class="form-control form-control-submit" required>
                      </div>
                      <div class="form-group">
                        <label class="text-light-white fs-14">Address</label>
                        <input type="text" name="#" class="form-control form-control-submit" required>
                      </div>
                      <div class="form-group">
                        <label class="text-light-white fs-14">Email</label>
                        <input type="email" name="#" class="form-control form-control-submit" required>
                      </div>
                      <div class="form-group">
                      	<label class="text-light-white fs-14">Gender</label>
                        <input type="radio" id="male" name="gender" value="male">
					  	<label for="male">Male</label>
					  	<input type="radio" id="female" name="gender" value="female">
					  	<label for="female">Female</label>
                      </div>
                      <div class="form-group">
                        <label class="text-light-white fs-14">Birthday</label>
						<input type="date" id="birthday" name="birthday">
                      </div>
                      <div class="form-group">
                      	<label class="text-light-white fs-14">Avatar</label><br>
                        <img id="blah" alt="your image" style="max-height: 100px; " />
					    <input type="file" onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
                      </div>
                      <div class="form-group checkbox-reset">
                        <label class="custom-checkbox mb-0">
                          <input type="checkbox" name="#"> <span class="checkmark"></span> Keep me signed in</label>
                      </div>
                      <div class="form-group">
                        <button type="submit" class="btn-second btn-submit full-width">Create your account</button>
                      </div>
                      <div class="form-group text-center"> <span>or</span>
                      </div>
                      <div class="form-group">
                        <button type="submit" class="btn-second btn-facebook full-width">
                          <img src="${pageContext.request.contextPath}/resources/public/assets/img/facebook-logo.svg" alt="btn logo">Continue with Facebook</button>
                      </div>
                      <div class="form-group">
                        <button type="submit" class="btn-second btn-google full-width">
                          <img src="${pageContext.request.contextPath}/resources/public/assets/img/google-logo.png" alt="btn logo">Continue with Google</button>
                      </div>
                      <div class="form-group text-center">
                        <p class="text-light-black mb-0">Have an account? <a href="login.html">Sign in</a>
                        </p>
                      </div> <span class="text-light-black fs-12 terms">By creating your foodmart account, you agree to the <a href="#"> Terms of Use </a> and <a href="#"> Privacy Policy.</a></span>
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