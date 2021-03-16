package edu.group6.capston.controller.admins;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.group6.capston.services.LocationService;
import edu.group6.capston.services.RoleService;

@Controller
@RequestMapping("admin")
public class AdminIndexController {
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	private LocationService locationService;
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value ="/index")
	public String Index(Model model, HttpServletRequest request) {
		request.getSession().setAttribute("roleList", roleService.findAll());
		model.addAttribute("locationCount", locationService.locationCount());
		return "admin.index";
	}

}
