package edu.group6.capston.controller.admins;

import java.io.UnsupportedEncodingException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.models.LocationTypes;
import edu.group6.capston.services.LocationTypeService;
import edu.group6.capston.utils.GlobalsConstant;

@Controller
@RequestMapping("admin/locationType")
public class AdminLocationTypeController {
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	private LocationTypeService locationTypeService;
	
	@RequestMapping(value ="/index")
	public String Index(Model model) {
		model.addAttribute("locationTypeList" , locationTypeService.findAll());
		return "admin.locationType.index";
	}
	
	@RequestMapping(value ="/add")
	public String Add(Model model) {
		return "admin.locationType.add";
	}
	
	@PostMapping(value ="/add")
	public String Add(@Valid @ModelAttribute("location") LocationTypes locationTypes, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, Model model) {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "admin.locationType.add";
		}
		if (locationTypeService.save(locationTypes)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			rd.addFlashAttribute("success", true);
			return "redirect:/admin/locationType/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		model.addAttribute("locationTypes", locationTypes);
		return "admin.locationType.add";
	}
	
	@PostMapping(value ="/edit")
	public String Edit(@Valid @ModelAttribute("location") LocationTypes locationTypes, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, Model model) throws UnsupportedEncodingException {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "admin.locationType.index";
		}
		if (locationTypeService.update(locationTypes)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("success", null, Locale.getDefault()));
			rd.addFlashAttribute("success", true);
			return "redirect:/admin/locationType/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		rd.addFlashAttribute("error", true);
		return "redirect:/admin/locationType/index";
	}
	
	@RequestMapping(value ="/del/{id}")
	public String delete(@PathVariable Integer id, RedirectAttributes rd, HttpServletRequest request, Model mode) {
		if (locationTypeService.delete(id)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			rd.addFlashAttribute("error", true);
			return "redirect:/admin/locationType/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("success", null, Locale.getDefault()));
		rd.addFlashAttribute("success", true);
		System.out.println("aaas");
		return "redirect:/admin/locationType/index";
	}
}
