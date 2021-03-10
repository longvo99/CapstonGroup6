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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.group6.capston.models.Order;
import edu.group6.capston.services.OrderService;
import edu.group6.capston.utils.GlobalsConstant;

@Controller
@RequestMapping("admin/order")
public class AdminOrderController {
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	private OrderService OrderService;
	
	@RequestMapping(value ="/index")
	public String Index(Model model) {
		model.addAttribute("orderList" , OrderService.findAll());
		return "admin.order.index";
	}
	
	@PostMapping(value ="/edit")
	public String Edit(@Valid @ModelAttribute("order") Order Order, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, Model model) throws UnsupportedEncodingException {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "admin.order.index";
		}
		if (OrderService.update(Order)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("success", null, Locale.getDefault()));
			rd.addFlashAttribute("success", true);
			return "redirect:/admin/order/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		rd.addFlashAttribute("error", true);
		return "redirect:/admin/order/index";
	}
}
