package edu.group6.capston.controller.admins;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/locaiton")
public class AdminLocationController {
	@RequestMapping(value ="/index")
	public String Index() {
		return "admin.location.index";
	}
}
