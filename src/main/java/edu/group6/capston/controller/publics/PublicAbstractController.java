package edu.group6.capston.controller.publics;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import edu.group6.capston.dtos.OrderDTO;
import edu.group6.capston.models.Comment;
import edu.group6.capston.models.LocationCategory;
import edu.group6.capston.models.Users;
import edu.group6.capston.services.CommentService;
import edu.group6.capston.services.LocationCategoriesService;
import edu.group6.capston.services.LocationService;
import edu.group6.capston.services.ProductService;
import edu.group6.capston.utils.GlobalsFunction;

public abstract class PublicAbstractController {

	@Autowired
	private LocationCategoriesService locationCategoriesService;

	@Autowired
	private ProductService productService;

	@Autowired
	private LocationService locationService;

	@Autowired
	private CommentService commentService;

	@ModelAttribute
	public void addCommonObjects(Model model, HttpServletRequest request) {
		List<LocationCategory> locationCategoriesList = locationCategoriesService.findAll();
		List<LocationCategory> locationCategoriesList1 = new ArrayList<LocationCategory>();
		List<LocationCategory> locationCategoriesList2 = new ArrayList<LocationCategory>();
		for (LocationCategory locationCategories : locationCategoriesList) {
			if (locationCategories.getParentId() == locationCategories.getCategoryId()) {
				locationCategoriesList1.add(locationCategories);
			} else {
				locationCategoriesList2.add(locationCategories);
			}
		}
		Users user = (Users) request.getSession().getAttribute("userSession");
		if (user != null) {
			List<OrderDTO> listOrderDTO = new ArrayList<>();
			Cookie[] cookies = request.getCookies();
			float totalCart = 0;
			String productId = "";
			for (Cookie cookie : cookies) {
				if (cookie.getName().contains(user.getUsername())) {
					productId = cookie.getName().substring(0, cookie.getName().lastIndexOf("-"));
					if (!cookie.getValue().equals("") && !cookie.getName().contains("Discount-" + user.getUsername())) {
						OrderDTO product = null;
						if (productId.substring(0, 1).equals("c")) {
							String comboId = cookie.getName().substring(1, cookie.getName().lastIndexOf("-"));
							product = productService.findByComboIdOrder(Integer.valueOf(comboId));
							product.setPrice(
									GlobalsFunction.totalPriceCombo(product.getPrice(), product.getRateDiscount()));
						} else {
							product = productService.findByProductIdOrder(Integer.valueOf(productId));
							product.setPrice(
									GlobalsFunction.totalPriceCombo(product.getPrice(), product.getRateDiscount()));
						}
						double total = product.getPrice() * Integer.valueOf(cookie.getValue());
						OrderDTO order = new OrderDTO(user.getUserId(), productId, product.getName(),
								product.getPrice(), Integer.valueOf(cookie.getValue()), product.getLocationId());

						listOrderDTO.add(order);
						totalCart += total;
					}
				}
			}
			model.addAttribute("sizeCart", listOrderDTO.size());
			model.addAttribute("totalCart", totalCart);
			model.addAttribute("listOrderDTO", listOrderDTO);
			List<Comment> listComment = commentService.findCommentReply(user.getUserId());
			int sizeNotification = 0;
			if (listComment.size() > 0) {
				for (Comment comment : listComment) {
					if (!comment.isStatus()) {
						sizeNotification++;
					}
				}
				model.addAttribute("listNotification", listComment);
				model.addAttribute("sizeNotification", sizeNotification);
			}

		}

		model.addAttribute("imageLocation", GlobalsFunction.changeImageLocation(locationService.findImageLocation()));
		model.addAttribute("locationCategoriesList1", locationCategoriesList1);
		model.addAttribute("locationCategoriesList2", locationCategoriesList2);
	}
}
