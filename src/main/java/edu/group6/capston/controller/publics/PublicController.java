package edu.group6.capston.controller.publics;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("public")
public class PublicController {

	@GetMapping("/index")
	public String index(Model model) {
		return "public.index";
	}

	@GetMapping("/shop")
	public String shop(Model model) {
		return "public.shop";
	}

	@GetMapping("/contact")
	public String contact(Model model) {
		return "public.contact";
	}

	@GetMapping("/productdetail")
	public String productdetail(Model model) {
		return "public.productdetail";
	}

	@GetMapping("/cart")
	public String cart(Model model) {
		return "public.cart";
	}
}
