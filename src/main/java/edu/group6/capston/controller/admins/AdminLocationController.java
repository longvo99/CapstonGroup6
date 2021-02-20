package edu.group6.capston.controller.admins;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.services.LocationService;
import edu.group6.capston.utils.GlobalsConstant;
import edu.group6.capston.utils.UploadFile;

@Controller
@RequestMapping("admin/location")
public class AdminLocationController {
	
	@Autowired
	MessageSource messageSource;
	
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
	public String Add() {
		return "admin.location.add";
	}
	
	@PostMapping("add")
	public String add(@Valid @ModelAttribute("location") LocationDTO location, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, MultipartFile file, Model model) throws IllegalStateException, IOException {
		if (br.hasErrors()) {
			return "admin.location.add";
		}
		String filename = UploadFile.upload(file, request);
		if (locationService.save(location)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			return "redirect:/admin/location/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		model.addAttribute("location", location);
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
