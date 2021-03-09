package edu.group6.capston.controller.admins;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.group6.capston.services.UserService;

@Controller
@RequestMapping("admin/user")
public class AdminUserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value ="/index")
	public String Index(Model model) {
		model.addAttribute("userList" , userService.findAll());
		return "admin.user.index";
	}
	
	@RequestMapping(value ="/profile")
	public String profile(Model model) {
		model.addAttribute("userList" , userService.findAll());
		return "admin.user.index";
	}
	
}
