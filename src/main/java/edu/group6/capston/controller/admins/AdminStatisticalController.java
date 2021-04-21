package edu.group6.capston.controller.admins;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.group6.capston.services.OrderService;

@Controller
@RequestMapping("admin/statistical")
public class AdminStatisticalController {

	@Autowired
	MessageSource messageSource;

	@Autowired
	private OrderService orderService;

	@ModelAttribute
	public void addCommonObjects(Model model) {
		List<Integer> listYear = orderService.listYear();
		model.addAttribute("listYear", listYear);
	}
	
	@GetMapping({ "/index/{year}", "/index" })
	public String Index(Model model, @PathVariable(name = "year", required = false) Integer year) {
		if(year == null) {
			year = Calendar.getInstance().get(Calendar.YEAR);
		}
		List<Object[]> listResult = orderService.revenueByYear(year);
		List<String> totalPriceList = new ArrayList<String>();
		for (int i = 0; i < 12; i++) {
			totalPriceList.add("0");
		}
		if (listResult.size() < 12) {
			for (int i = 1; i <= 12; i++) {
				for (Object[] obj : listResult) {
					if (obj[0].equals(i)) {
						totalPriceList.set(i - 1, String.valueOf(obj[1]));
						break;
					}
				}
			}
		}
		model.addAttribute("year", year);
		model.addAttribute("totalPriceList", totalPriceList);
		model.addAttribute("largesttotalPrice", orderService.largesttotalPrice(year));
		return "admin.statistical.index";
	}

	@RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
	public ModelAndView downloadExcel() {
		ModelAndView modelAndView = new ModelAndView("excelView");
		List<Integer> listYear = orderService.listYear();
		for (Integer year : listYear) {
			modelAndView.addObject("listOrderGroupByLocationId" + year, orderService.findAllByYear(year));
		}
		modelAndView.addObject("listYear", listYear);
		return modelAndView;

	}
}
