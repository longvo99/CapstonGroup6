package edu.group6.capston.controller.admins;

import java.io.UnsupportedEncodingException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
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

import edu.group6.capston.models.Discounts;
import edu.group6.capston.services.DiscountService;
import edu.group6.capston.utils.GlobalsConstant;

@Controller
@RequestMapping("admin/discount")
public class AdminDiscountController {
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	private DiscountService discountService;
	
	@RequestMapping(value ="/index")
	public String Index(Model model) {
		model.addAttribute("discountList" , discountService.findAll());
		return "admin.discount.index";
	}
	
	@RequestMapping(value ="/add")
	public String Add(Model model) {
		return "admin.discount.add";
	}
	
	@PostMapping(value ="/add")
	public String Add(@Valid @ModelAttribute("discounts") Discounts discounts, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, Model model) {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "admin.discount.add";
		}
		if (discountService.save(discounts)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			rd.addFlashAttribute("success", true);
			return "redirect:/admin/discount/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		model.addAttribute("discounts", discounts);
		return "admin.discounts.add";
	}
	
	@PostMapping(value ="/edit")
	public String Edit(@Valid @ModelAttribute("discounts") Discounts discounts, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, Model model) throws UnsupportedEncodingException {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "admin.discount.index";
		}
		if (discountService.update(discounts)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("success", null, Locale.getDefault()));
			rd.addFlashAttribute("success", true);
			return "redirect:/admin/discount/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		rd.addFlashAttribute("error", true);
		return "redirect:/admin/discount/index";
	}
	
	@RequestMapping(value ="/del/{id}")
	public String delete(@PathVariable Integer id, RedirectAttributes rd, HttpServletRequest request, Model mode) {
		if (discountService.delete(id)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			rd.addFlashAttribute("error", true);
			return "redirect:/admin/discount/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("success", null, Locale.getDefault()));
		rd.addFlashAttribute("success", true);
		return "redirect:/admin/discount/index";
	}
}
