package edu.group6.capston.controller.auths;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("auth")
public class LoginController {
	
	@RequestMapping(value = "/login")
	public String LoginAdmin() {
		return "auths.admin.login";
	}

	/*
	 * @PostMapping("login") public String
	 * LoginAdmin(@Valid @ModelAttribute("users") Users users, HttpSession session)
	 * { if(userService.getProfile(users) != null) {
	 * 
	 * } return "auth.login"; }
	 */

}
