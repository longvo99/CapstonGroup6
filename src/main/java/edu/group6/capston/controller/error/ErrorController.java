package edu.group6.capston.controller.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("error")
public class ErrorController {
	
	@RequestMapping(value = "/404")
	public String LoginAdmin() {
		return "error.404";
	}
	
}
