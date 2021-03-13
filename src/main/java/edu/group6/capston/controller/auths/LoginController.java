package edu.group6.capston.controller.auths;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class LoginController {
	@RequestMapping(value ="/login")
	public String Index(Model model) {
		return "auths.admin.login";
	}
}
