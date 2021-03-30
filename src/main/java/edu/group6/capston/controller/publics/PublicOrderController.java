package edu.group6.capston.controller.publics;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.group6.capston.dtos.OrderDTO;
import edu.group6.capston.models.Product;
import edu.group6.capston.models.Users;
import edu.group6.capston.services.ProductService;


@Controller
@RequestMapping("public")
public class PublicOrderController  {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/addCartAjax", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<OrderDTO> addParentComment(Model model, HttpServletRequest request, HttpServletResponse response) {
		Users user = (Users) request.getSession().getAttribute("userSession");
		
		String productId = request.getParameter("aProductId");
//		String quantity = request.getParameter("aQuantity");
		System.out.println("kkk");
//		String nameProductId = productId + "p-" + user.getUsername();
//		String nameQuantity = quantity + "q-" + user.getUsername() + productId;
//		
//		Cookie cookieProductId = new Cookie(nameProductId, productId);
//		cookieProductId.setMaxAge(365 * 24 * 60 * 60);
//		
//		Cookie cookieQuantity = new Cookie(nameQuantity, quantity);
//		cookieQuantity.setMaxAge(365 * 24 * 60 * 60);
//		
//		response.addCookie(cookieProductId);
//		response.addCookie(cookieQuantity);
		
		Cookie[] cookies = request.getCookies();
		System.out.println("abbb");
		List<OrderDTO> listOrderDTO = new ArrayList<>();
		for (Cookie cookie : cookies) {
			String quantity1 = "";
			if(cookie.getName().contains("p-"+user.getUsername())) {
				productId = cookie.getName().substring(0, cookie.getName().lastIndexOf("p"));
			}
			if(cookie.getName().contains("q-"+user.getUsername())) {
				quantity1 = cookie.getName().substring(0, cookie.getName().lastIndexOf("q"));
			}
			if(!quantity1.equals("")) {
				Product product = productService.findByProductId(Integer.valueOf(productId));
				float total = product.getPrice() * Integer.valueOf(quantity1);
				OrderDTO order = new OrderDTO(user.getUserId(), Integer.valueOf(productId), product.getName(), total , Integer.valueOf(quantity1));
				listOrderDTO.add(order);
			}
		}
		System.out.println(listOrderDTO.size() + " - " + cookies.length);
		return listOrderDTO;
	}
}
