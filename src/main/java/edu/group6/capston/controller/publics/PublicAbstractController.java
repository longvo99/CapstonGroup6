package edu.group6.capston.controller.publics;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.group6.capston.dtos.OrderDTO;
import edu.group6.capston.dtos.ProductDTO;
import edu.group6.capston.models.LocationCategory;
import edu.group6.capston.models.Users;
import edu.group6.capston.services.DiscountService;
import edu.group6.capston.services.LocationCategoriesService;
import edu.group6.capston.services.LocationService;
import edu.group6.capston.services.ProductService;
import edu.group6.capston.services.RatingService;
import edu.group6.capston.utils.GlobalsFunction;

public abstract class PublicAbstractController  {
	
	@Autowired
	private LocationCategoriesService locationCategoriesService;
	
	@Autowired
	private ProductService productService;
	
	@ModelAttribute
	public void addCommonObjects(Model model, HttpServletRequest request) {
		List<LocationCategory> locationCategoriesList = locationCategoriesService.findAll();
		List<LocationCategory> locationCategoriesList1 = new ArrayList<LocationCategory>();
		List<LocationCategory> locationCategoriesList2 = new ArrayList<LocationCategory>();
		for (LocationCategory locationCategories : locationCategoriesList) {
			if(locationCategories.getParentId() == locationCategories.getCategoryId()){
				locationCategoriesList1.add(locationCategories);
			} else {
				locationCategoriesList2.add(locationCategories);
			}
		}
		Users user = (Users) request.getSession().getAttribute("userSession");
		if(request.getSession().getAttribute("userSession") != null) {
			List<OrderDTO> listOrderDTO = new ArrayList<>();
			Cookie[] cookies = request.getCookies();
			float totalCart = 0;
			String productId ="";
			for (Cookie cookie : cookies) {
				if (cookie.getName().contains(user.getUsername())) {
					productId = cookie.getName().substring(0, cookie.getName().lastIndexOf("-"));
					if(!cookie.getValue().equals("")) {
						OrderDTO product = null;
						if(productId.substring(0,1).equals("c")) {
							String comboId = cookie.getName().substring(1, cookie.getName().lastIndexOf("-"));
							product = productService.findByComboIdOrder(Integer.valueOf(comboId));
							product.setPrice(GlobalsFunction.totalPriceCombo(product.getPrice(), product.getRateDiscount()));
						}else {
							product = productService.findByProductIdOrder(Integer.valueOf(productId));
						}
						double total = product.getPrice() * Integer.valueOf(cookie.getValue());
						OrderDTO order = new OrderDTO(user.getUserId(), productId , product.getName(), product.getPrice(),
								Integer.valueOf(cookie.getValue()));
						
						listOrderDTO.add(order);
						totalCart += total;
					}
				}
			}
			model.addAttribute("sizeCart", listOrderDTO.size());
			model.addAttribute("totalCart", totalCart);
			model.addAttribute("listOrderDTO", listOrderDTO);
		}
		model.addAttribute("locationCategoriesList1", locationCategoriesList1);
		model.addAttribute("locationCategoriesList2", locationCategoriesList2);
	}
}
