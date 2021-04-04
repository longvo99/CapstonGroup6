package edu.group6.capston.controller.publics;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.group6.capston.dtos.OrderDTO;
import edu.group6.capston.models.Users;
import edu.group6.capston.services.ProductService;

@Controller
@RequestMapping("public")
public class PublicOrderController {

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/addCartAjax", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<OrderDTO> addParentComment(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		Users user = (Users) request.getSession().getAttribute("userSession");
		String productId = request.getParameter("aProductId");
		String quantity = request.getParameter("aQuantity");
		String nameCookie = productId + "-" + user.getUsername();
		
		Cookie[] cookies = request.getCookies();

		boolean checkCookies = false;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equalsIgnoreCase(nameCookie)) {
				cookie.setValue(quantity);
				cookie.setMaxAge(365 * 24 * 60 * 60);
				checkCookies = true;
			}
		}
		List<OrderDTO> listOrderDTO = new ArrayList<>();
		OrderDTO product = null;
		float total = 0;
		OrderDTO order = null;
		
		if (checkCookies != true) {
			Cookie cookieProductId = new Cookie(nameCookie, quantity);
			cookieProductId.setMaxAge(365 * 24 * 60 * 60);
			response.addCookie(cookieProductId);
			product = productService.findByProductIdOrder(Integer.valueOf(productId));
			total = product.getPrice() * Integer.valueOf(quantity);
			order = new OrderDTO(user.getUserId(), Integer.valueOf(productId), product.getName(), total,
					Integer.valueOf(quantity));
			listOrderDTO.add(order);
		}
		
		for (Cookie cookie : cookies) {
			if (cookie.getName().contains(user.getUsername())) {
				productId = cookie.getName().substring(0, cookie.getName().lastIndexOf("-"));
				if(!cookie.getValue().equals("")) {
					product = productService.findByProductIdOrder(Integer.valueOf(productId));
					total = product.getPrice() * Integer.valueOf(cookie.getValue());
					order = new OrderDTO(user.getUserId(), Integer.valueOf(productId), product.getName(), total,
							Integer.valueOf(cookie.getValue()));
					listOrderDTO.add(order);
				}
			}
		}
		return listOrderDTO;
	}
	
	@RequestMapping(value = "/deleteCartAjax", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<OrderDTO> deleteCartAjax(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		Users user = (Users) request.getSession().getAttribute("userSession");
		String productId = request.getParameter("aProductId");
		String nameCookie = productId + "-" + user.getUsername();
		
		Cookie cookieDel = new Cookie(nameCookie, "");
		cookieDel.setMaxAge(0);
        response.addCookie(cookieDel);
		Cookie[] cookies = request.getCookies();
		//delete cookie
		List<OrderDTO> listOrderDTO = new ArrayList<>();
		OrderDTO product = null;
		float total = 0;
		OrderDTO order = null;
		for (Cookie cookie : cookies) {
			if (cookie.getName().contains(user.getUsername())) {
				productId = cookie.getName().substring(0, cookie.getName().lastIndexOf("-"));
				if(!cookie.getName().equals(nameCookie)) {
					product = productService.findByProductIdOrder(Integer.valueOf(productId));
					total = product.getPrice() * Integer.valueOf(cookie.getValue());
					order = new OrderDTO(user.getUserId(), Integer.valueOf(productId), product.getName(), total,
							Integer.valueOf(cookie.getValue()));
					listOrderDTO.add(order);
				}
			}
		}
		return listOrderDTO;
	}
	
	@GetMapping("/checkout")
	public String checkout(Model model) {
		return "public.checkout";
	}
	
	@GetMapping("/orderdetails")
	public String orderdetails(Model model) {
		return "public.orderdetails";
	}
}
