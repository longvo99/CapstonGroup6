package edu.group6.capston.controller.admins;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/statistical")
public class AdminStatisticalController {

	@Autowired
	MessageSource messageSource;

	@RequestMapping(value = "/index")
	public String Index(Model model) {
		return "admin.statistical.index";
	}
}
