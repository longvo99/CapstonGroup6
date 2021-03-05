package edu.group6.capston.controller.admins;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.group6.capston.services.LocationTypeService;

@Controller
@RequestMapping("admin")
public class AdminIndexController {
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	private LocationTypeService locationTypeService;
	
	@RequestMapping(value ="/index")
	public String Index(Model model) {
		return "admin.index";
	}
	
}
