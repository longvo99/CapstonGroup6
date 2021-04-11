package edu.group6.capston.controller.publics;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.group6.capston.dtos.ProductDTO;
import edu.group6.capston.services.DiscountService;
import edu.group6.capston.services.LocationService;
import edu.group6.capston.services.ProductService;
import edu.group6.capston.services.RatingService;
import edu.group6.capston.utils.GlobalsFunction;

@Controller
@RequestMapping("public")
public class PublicSearchController {
	
	@Autowired
	private LocationService locationService;
	
	@Autowired
	private DiscountService discountService;
	
	@Autowired
	private RatingService ratingService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "search", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<ProductDTO> searchproduct(HttpServletRequest request) {
		String searchText = request.getParameter("searchText");
		return GlobalsFunction.changeImageSearchLocation(productService.searchAllProductName(searchText));
	}
	
	@PostMapping("/search")
	public String search(@Valid @ModelAttribute("search") String search, Model model, HttpServletRequest request) {
		model.addAttribute("DiscountList", discountService.findAll());
		model.addAttribute("ratingList", ratingService.findAllRatingLocation());
		model.addAttribute("minMaxLocation", productService.findMinMaxPriceLocation());
		model.addAttribute("nameCategory","Kết quả tiềm kiếm cho: " + "'" + search +"'");
		model.addAttribute("listLocation", GlobalsFunction.changeImageTopLocation(locationService.searchLocation(search)));
		return "public.category";
	}
}
