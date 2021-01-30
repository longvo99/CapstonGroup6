package edu.group6.capston.controller.admins;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.group6.capston.services.LocationService;

@Controller
@RequestMapping("admin/location")
public class AdminLocationController {
	@Autowired
	private LocationService locationService;
	
	@GetMapping("/index")
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
	
	@RequestMapping(value ="/edit")
	public String Edit(Model model) {
		model.addAttribute("locationList" , locationService.findAll());
		return "admin.location.edit";
	}
	
	@RequestMapping(value ="/detele")
	public String Delete(Model model) {
		model.addAttribute("locationList" , locationService.findAll());
		return "admin.location.detele";
	}
}