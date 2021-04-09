package edu.group6.capston.controller.admins;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.group6.capston.mail.CustomerNotFoundException;
import edu.group6.capston.mail.Utility;
import edu.group6.capston.models.Users;
import edu.group6.capston.services.impls.UserServiceImpl;
import net.bytebuddy.utility.RandomString;

@Controller
public class ForgotPasswordController {

	@Autowired
	private UserServiceImpl userServiceImpl;

	@GetMapping("/forgot_password")
	public String showForgotPasswordForm() {
		return "admin.forgotpassword";
	}

	@PostMapping("/forgot_password")
	public String processForgotPassword(HttpServletRequest request, Model model) {
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String token = RandomString.make(30);
		try {
			userServiceImpl.updateResetPasswordToken(token, email, username);
			String resetPasswordLink = Utility.getSiteURL(request) + "/reset_password?token=" + token;
			userServiceImpl.sendMailResetPassword(email, resetPasswordLink);
			model.addAttribute("message", "Chúng tôi đã gửi link đổi mật khẩu thành công. Hãy kiểm tra email!");
		} catch (CustomerNotFoundException ex) {
			model.addAttribute("error", ex.getMessage());
		}
		return "admin.forgotpassword";
	}

	@GetMapping("/reset_password")
	public String showResetPasswordForm(@RequestParam(value = "token") String token, Model model) {
		Users users = userServiceImpl.getByResetPasswordToken(token);
		model.addAttribute("token", token);
		if (users == null) {
			model.addAttribute("message", "Mã token không hợp lệ!");
			return "admin.forgotpassword";
		}
		return "admin.resetpassword";
	}

	@PostMapping("/reset_password")
	public String processResetPassword(HttpServletRequest request, Model model, RedirectAttributes rd) {
		String token = request.getParameter("token");
		String password = request.getParameter("password");
		Users users = userServiceImpl.getByResetPasswordToken(token);
		if (users == null) {
			model.addAttribute("message", "Mã token không hợp lệ!");
			return "admin.forgotpassword";
		} else {
			userServiceImpl.updatePassword(users, password);
			rd.addFlashAttribute("changepass", true);
		}
		return "redirect:/auth/login";

	}
}
