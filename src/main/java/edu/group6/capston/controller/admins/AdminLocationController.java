package edu.group6.capston.controller.admins;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/location")
public class AdminLocationController {
	
	
	@RequestMapping(value ="/index")
	public String Index(Model model) {
		return "admin.location.index";
	}
	@RequestMapping(value ="/edit")
	public String edit() {
		return "admin.location.edit";
	}
	@RequestMapping(value ="/add")
	public String add() {
		return "admin.location.add";
	}
	
}
