package edu.group6.capston.controller.admins;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/location")
public class AdminLocationController {
	@RequestMapping(value ="/index")
	public String Index() {
		return "admin.location.index";
	}
	
	@RequestMapping(value ="/location1")
	public String Location() {
		return "admin.location.index";
	}
}
