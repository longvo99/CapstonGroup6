package edu.group6.capston.controller.auths;

import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.group6.capston.models.Role;
import edu.group6.capston.models.Users;
import edu.group6.capston.services.UserService;
import edu.group6.capston.utils.GlobalsFunction;
import edu.group6.capston.utils.GooglePojo;
import edu.group6.capston.utils.GoogleUtils;

@Controller
public class LoginController {

	@Autowired
	private GoogleUtils googleUtils;
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/auth/login")
	public String LoginAdmin() {
		return "auths.admin.login";
	}

	@RequestMapping(value = { "/public/login" })
	public String login(@RequestParam(required = false) String message, final Model model) {
		if (message != null && !message.isEmpty()) {
			if (message.equals("logout")) {
				model.addAttribute("message", "Logout!");
			}
			if (message.equals("error")) {
				model.addAttribute("message", "Login Failed!");
			}
			if (message.equals("google_error")) {
				model.addAttribute("message", "Login by Facebook Failed!");
			}
		}
		return "public.login";
	}

	@RequestMapping("/public/login-google")
	public String loginGoogle(HttpServletRequest request) throws ClientProtocolException, IOException {
		String code = request.getParameter("code");

		if (code == null || code.isEmpty()) {
			return "redirect:/public/login?message=google_error";
		}
		String accessToken = googleUtils.getToken(code);
		GooglePojo googlePojo = googleUtils.getUserInfo(accessToken);
		UserDetails userDetail = googleUtils.buildUser(googlePojo);
		UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null,
				userDetail.getAuthorities());
		authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		Users user = null;
		// create new user if not empty
		if (userService.findByEmail(googlePojo.getEmail()) == null) {
			String username = GlobalsFunction.createUsernameEmail(googlePojo.getEmail());
			if(userService.findByUsername(username) != null) {
				Random rd = new Random();
				username = username + rd.nextInt(100);  
			}
			user = new Users(username, googlePojo.getFamily_name(), googlePojo.getEmail(), GlobalsFunction.getCurrentTime(), false, false, new Role("CUSTOMER", null));
			if(userService.save(user)) {
				user = userService.findByEmail(googlePojo.getEmail());
				request.getSession().setAttribute("userSession",user);
			}
		}else{
			user = userService.findByEmail(googlePojo.getEmail());
			request.getSession().setAttribute("userSession", user);
		}
		return "redirect:/public/index";
	}
	
	@GetMapping("/public/logout")
	private String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/public/index";
	}

}
