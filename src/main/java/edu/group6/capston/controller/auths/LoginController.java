package edu.group6.capston.controller.auths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("auth")
public class LoginController {
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder; 
	@RequestMapping(value = "/login")
	public String LoginAdmin() {
		System.out.println(bCryptPasswordEncoder.encode("123456"));
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
