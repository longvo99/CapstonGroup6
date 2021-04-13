package edu.group6.capston.controller.admins;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.group6.capston.models.Location;
import edu.group6.capston.services.LocationService;
import edu.group6.capston.services.OrderService;

@Controller
@RequestMapping("admin/statistical")
public class AdminStatisticalController {

	@Autowired
	MessageSource messageSource;

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private LocationService locationService;

	@RequestMapping(value = "/index")
	public String Index(Model model) {
		model.addAttribute("totalPriceList", orderService.revenueByYear(2021));
		model.addAttribute("largesttotalPrice", orderService.largesttotalPrice(2021));
		System.out.println(orderService.largesttotalPrice(2021));
		return "admin.statistical.index";
	}

	@RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
	public ModelAndView downloadExcel() {
		// create some sample data
		List<Location> listLocations = locationService.findAll();
		return new ModelAndView("excelView", "listLocations", listLocations);
	}
}
