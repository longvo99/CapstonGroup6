package edu.group6.capston.controller.admins;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.group6.capston.services.LocationService;
import edu.group6.capston.utils.PaginationUtil;

@Controller
@RequestMapping("admin/location")
public class AdminLocationController {
	@Autowired
	private LocationService locationService;
	
	@RequestMapping("/index")
	public String Index(Model model) {
		model.addAttribute("locationList", locationService.findAll());
		return "admin.location.index";
	}
	
	@GetMapping("detail/{lid}")
	public String Detail(@PathVariable int lid, Model model) {
		model.addAttribute("locationList" , locationService.findUserId(lid));
		return "admin.detail.detail";
	}
	
	@RequestMapping(value ="/add")
	public String Add(Model model) {
		model.addAttribute("locationList" , locationService.findAll());
		return "admin.location.add";
	}
	
	@RequestMapping(value ="/update")
	public String Update(Model model) {
		model.addAttribute("locationList" , locationService.findAll());
		return "admin.location.update";
	}
	
	@RequestMapping(value ="/detele")
	public String Delete(Model model) {
		model.addAttribute("locationList" , locationService.findAll());
		return "admin.location.detele";
	}
}
