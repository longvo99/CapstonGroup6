package edu.group6.capston.controller.admins;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.group6.capston.services.UserService;

@Controller
@RequestMapping("admin/user")
public class AdminUserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value ="/{roleName}")
	public String Index(@PathVariable String roleName,Model model) {
		model.addAttribute("userList" , userService.findByRoleName(roleName));
		return "admin.user.index";
	}
	
	@RequestMapping(value ="/profile/{username}")
	public String profile(@PathVariable String username, Model model) {
		model.addAttribute("user" , userService.findByUsername(username));
		return "admin.user.profile";
	}
	
}
