package edu.group6.capston.controller.admins;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.group6.capston.models.Location;
import edu.group6.capston.models.Users;
import edu.group6.capston.services.LocationService;
import edu.group6.capston.services.RoleService;
import edu.group6.capston.services.UserService;

@Controller
@RequestMapping("admin")
public class AdminIndexController {
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	private LocationService locationService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value ="/index")
	public String Index(Model model, HttpServletRequest request) {
		request.getSession().setAttribute("roleList", roleService.findAll());
		model.addAttribute("locationCount", locationService.locationCount());
		Users users = userService.findByUsersId(2);
		List<Location> lists = new ArrayList<>();
		model.addAttribute("users", users);
		model.addAttribute("list", lists);
		for (Location location : lists) {
			System.out.println(location.getLocationName());
		}
		return "admin.index";
	}

}
