package edu.group6.capston.controller.admins;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import edu.group6.capston.models.Users;
import edu.group6.capston.services.UserService;
import edu.group6.capston.services.impls.UserServiceImpl;

@Component
public class CustomLoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	@Autowired
	private UserServiceImpl userServiceImpl;

	@Autowired
	private UserService UserService;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		String username = request.getParameter("username");
		Users user = userServiceImpl.findByUsername(username);

		if (user != null) {
			if (!user.isHide() && !user.isBanned()) {
				if (user.getFailedAttempt() < UserServiceImpl.MAX_FAILED_ATTEMPTS - 1) {
					userServiceImpl.increaseFailedAttempts(user);
					exception = new LockedException("Sai mật khẩu - Vui lòng thử lại!");
				} else {
					userServiceImpl.lock(user);
					exception = new LockedException(
							"Tài khoản bị khóa do 3 lần đăng nhập không thành công. " + "Mở lại sau 24h.");
					UserService.sendMailWarning(user.getContactEmail());
				}
			} else if (user.isBanned() && user.getLockTime() != null) {
				if (userServiceImpl.unlockWhenTimeExpired(user)) {
					exception = new LockedException("Tài khoản của bạn đã được mở - Vui lòng thử lại!");
				} else {
					exception = new LockedException("Tài khoản của bạn đã bị khóa tạm thời!");
				}
			} else if(user.isBanned() && user.getLockTime() == null) {
				exception = new LockedException("Tài khoản của bạn đã bị khóa vĩnh viễn - Hãy liên hệ admin!");
			}

		} else {
			exception = new LockedException("Tài khoản không tồn tại!");
		}

		super.setDefaultFailureUrl("/auth/login?error=abc");
		super.onAuthenticationFailure(request, response, exception);
	}

}