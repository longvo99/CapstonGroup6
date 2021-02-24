package edu.group6.capston.controller.admins;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.models.LocationCategories;
import edu.group6.capston.models.LocationTypes;
import edu.group6.capston.services.LocationCategoriesService;
import edu.group6.capston.services.LocationService;
import edu.group6.capston.services.LocationTypeService;
import edu.group6.capston.utils.GlobalsConstant;

@Controller
@RequestMapping("admin/location")
public class AdminLocationController {
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	private LocationService locationService;
	
	@Autowired
	private LocationCategoriesService locationCategoriesService;
	
	@Autowired
	private LocationTypeService locationTypeService;
	
	@GetMapping("/index")
	public String Index(Model model) {
		model.addAttribute("locationList", locationService.findAll());
		return "admin.location.index";
	}
	
	@GetMapping("add")
	public String add(ModelMap modelMap) {
		List<LocationCategories> locationCategoriesList = locationCategoriesService.findAll();
		List<LocationTypes> locationTypesList = locationTypeService.findAll();
		List<LocationCategories> locationCategoriesList1 = new ArrayList<LocationCategories>();
		List<LocationCategories> locationCategoriesList2 = new ArrayList<LocationCategories>();
		for (LocationCategories locationCategories : locationCategoriesList) {
			if(locationCategories.getParentId() == locationCategories.getLocationCategoryId()){
				locationCategoriesList1.add(locationCategories);
			} else {
				locationCategoriesList2.add(locationCategories);
			}
		}
		modelMap.addAttribute("locationCategoriesList1", locationCategoriesList1);
		modelMap.addAttribute("locationCategoriesList2", locationCategoriesList2);
		modelMap.addAttribute("locationTypesList", locationTypesList);
		return "admin.location.add";
	}
	
	@PostMapping("add")
	public String add(@Valid @ModelAttribute("location") LocationDTO location, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, MultipartFile file, Model model) throws IllegalStateException, IOException {
		if (br.hasErrors()) {
			return "admin.location.add";
		}
		if (locationService.save(location)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			rd.addFlashAttribute("success", true);
			return "redirect:/admin/location/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		rd.addFlashAttribute("error", true);
		model.addAttribute("location", location);
		return "admin.location.add";
	}
	
	@PostMapping(value ="/edit")
	public String Edit(@Valid @ModelAttribute("location") LocationDTO location, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, MultipartFile file, Model model) {
		if (br.hasErrors()) {
			return "admin.location.index";
		}
		if (locationService.update(location)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			rd.addFlashAttribute("success", true);
			return "redirect:/admin/location/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		rd.addFlashAttribute("error", true);
		return "admin.location.index";
	}
	
	@RequestMapping(value ="/detele")
	public String Delete(Model model) {
		model.addAttribute("locationList" , locationService.findAll());
		return "admin.location.detele";
	}
}
