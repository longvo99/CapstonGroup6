package edu.group6.capston.controller.admins;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.group6.capston.services.OrderService;

@Controller
@RequestMapping("admin/statistical")
public class AdminStatisticalController {

	@Autowired
	MessageSource messageSource;
	
	@Autowired
	private OrderService orderService; 
	@RequestMapping(value = "/index")
	public String Index(Model model) {
		model.addAttribute("totalPriceList", orderService.revenueByYear(2021));
		model.addAttribute("largesttotalPrice", orderService.largesttotalPrice(2021));
		System.out.println(orderService.largesttotalPrice(2021));
		return "admin.statistical.index";
	}
}
