package edu.group6.capston.controller.admins;

import java.util.ArrayList;
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
		List<Object[]> listResult = orderService.revenueByYear(2021);
		List<String> totalPriceList = new ArrayList<String>();
		for (int i = 0; i < 12; i++) {
			totalPriceList.add("0");
		}
		if(listResult.size() < 12) {
			for (int i = 1; i <= 12; i++) {
				for (Object[] obj : listResult) {
					if(obj[0].equals(i)) {
						totalPriceList.set(i-1, String.valueOf(obj[1]));break;
					} 
				}
			}
		}
		model.addAttribute("totalPriceList", totalPriceList);
		model.addAttribute("largesttotalPrice", orderService.largesttotalPrice(2021));
		return "admin.statistical.index";
	}

	@RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
	public ModelAndView downloadExcel() {
		// create some sample data
		List<Location> listLocations = locationService.findAll();
		return new ModelAndView("excelView", "listLocations", listLocations);
	}
}
