package edu.group6.capston.controller.admins;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.group6.capston.models.DiscountInfo;
import edu.group6.capston.services.DiscountService;
import edu.group6.capston.services.ProductCategoryService;
import edu.group6.capston.utils.GlobalsConstant;

@Controller
@RequestMapping("admin/discount")
public class AdminDiscountController {

	@Autowired
	MessageSource messageSource;

	@Autowired
	private DiscountService DiscountService;

	@Autowired
	private ProductCategoryService productCategoryService;

	@RequestMapping(value = "/index")
	public String Index(Model model) {
		model.addAttribute("discountList", DiscountService.findAll());
		return "admin.discount.index";
	}

	@RequestMapping(value = "/add")
	public String Add(Model model) {
		return "admin.discount.add";
	}

	@RequestMapping(value = "search", method = RequestMethod.GET)
	@ResponseBody
	public List<String> search(HttpServletRequest request) {
		System.out.println(productCategoryService.search(request.getParameter("term")));
		List<String> listStr = new ArrayList<String>();
		listStr.add("Hau");
		listStr.add("Sua");
		listStr.add("cafe");
		System.out.println(listStr);
		return listStr;
	}

	@PostMapping(value = "/add")
	public String Add(@Valid @ModelAttribute("DiscountInfo") DiscountInfo DiscountInfo, BindingResult br,
			RedirectAttributes rd, HttpServletRequest request, Model model) {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "admin.discount.add";
		}
		if (DiscountService.save(DiscountInfo)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			rd.addFlashAttribute("success", true);
			return "redirect:/admin/discount/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		model.addAttribute("DiscountInfo", DiscountInfo);
		return "admin.DiscountInfo.add";
	}

	@PostMapping(value = "/edit")
	public String Edit(@Valid @ModelAttribute("DiscountInfo") DiscountInfo DiscountInfo, BindingResult br,
			RedirectAttributes rd, HttpServletRequest request, Model model) throws UnsupportedEncodingException {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "admin.discount.index";
		}
		if (DiscountService.update(DiscountInfo)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			rd.addFlashAttribute("success", true);
			return "redirect:/admin/discount/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		rd.addFlashAttribute("error", true);
		return "redirect:/admin/discount/index";
	}

	@RequestMapping(value = "/del/{id}")
	public String delete(@PathVariable Integer id, RedirectAttributes rd, HttpServletRequest request, Model mode) {
		if (DiscountService.delete(id)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			rd.addFlashAttribute("error", true);
			return "redirect:/admin/discount/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("success", null, Locale.getDefault()));
		rd.addFlashAttribute("success", true);
		return "redirect:/admin/discount/index";
	}
}
