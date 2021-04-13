package edu.group6.capston.controller.publics;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.group6.capston.dtos.OrderDTO;
import edu.group6.capston.dtos.UserAddress;
import edu.group6.capston.models.Location;
import edu.group6.capston.models.OrderDetail;
import edu.group6.capston.models.OrderStatus;
import edu.group6.capston.models.Orders;
import edu.group6.capston.models.Product;
import edu.group6.capston.models.ProductCombo;
import edu.group6.capston.models.Users;
import edu.group6.capston.services.OrderDetailService;
import edu.group6.capston.services.OrderService;
import edu.group6.capston.services.OrderStatusService;
import edu.group6.capston.services.ProductService;
import edu.group6.capston.services.UserService;
import edu.group6.capston.utils.GlobalsConstant;
import edu.group6.capston.utils.GlobalsFunction;

@Controller
@RequestMapping("public")
public class PublicOrderController extends PublicAbstractController {

	@Autowired
	private ProductService productService;

	@Autowired
	private UserService usersService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderDetailService orderDetailService;

	@Autowired
	private OrderStatusService orderStatusService;

	@Autowired
	MessageSource messageSource;

	@Override
	public void addCommonObjects(Model model, HttpServletRequest request) {
		super.addCommonObjects(model, request);
	}

	@RequestMapping(value = "/addCartAjax", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<OrderDTO> addParentComment(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		Users user = (Users) request.getSession().getAttribute("userSession");
		String productId = request.getParameter("aProductId");
		String quantity = request.getParameter("aQuantity");
		String nameCookie = productId + "-" + user.getUsername();

		Cookie cookieProductId = new Cookie(nameCookie, quantity);
		cookieProductId.setMaxAge(365 * 24 * 60 * 60);
		response.addCookie(cookieProductId);

		List<OrderDTO> listOrderDTO = new ArrayList<>();
		OrderDTO product = null;
		OrderDTO order = null;

		if (productId.substring(0, 1).equals("c")) {
			String comboId = productId.substring(1, productId.length());
			product = productService.findByComboIdOrder(Integer.valueOf(comboId));
			product.setPrice(GlobalsFunction.totalPriceCombo(product.getPrice(), product.getRateDiscount()));
		} else {
			product = productService.findByProductIdOrder(Integer.valueOf(productId));
		}
		order = new OrderDTO(user.getUserId(), productId, product.getName(), product.getPrice(),
				Integer.valueOf(quantity), product.getLocationId());
		listOrderDTO.add(order);

		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if (cookie.getName().contains(user.getUsername())) {
				if (!cookie.getName().equalsIgnoreCase(nameCookie)) {
					productId = cookie.getName().substring(0, cookie.getName().lastIndexOf("-"));
					if (productId.substring(0, 1).equals("c")) {
						String comboId = cookie.getName().substring(1, cookie.getName().lastIndexOf("-"));
						product = productService.findByComboIdOrder(Integer.valueOf(comboId));
						product.setPrice(
								GlobalsFunction.totalPriceCombo(product.getPrice(), product.getRateDiscount()));
					} else {
						product = productService.findByProductIdOrder(Integer.valueOf(productId));
						product.setPrice(product.getPrice() * Integer.valueOf(cookie.getValue()));
					}
					order = new OrderDTO(user.getUserId(), productId, product.getName(), product.getPrice(),
							Integer.valueOf(cookie.getValue()), product.getLocationId());
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
		System.out.println("namecookie " + nameCookie);
		// delete cookie
		Cookie cookieDel = new Cookie(nameCookie, "");
		cookieDel.setMaxAge(0);
		response.addCookie(cookieDel);
		Cookie[] cookies = request.getCookies();

		List<OrderDTO> listOrderDTO = new ArrayList<>();
		OrderDTO product = null;
		OrderDTO order = null;
		for (Cookie cookie : cookies) {
			if (cookie.getName().contains(user.getUsername())) {
				productId = cookie.getName().substring(0, cookie.getName().lastIndexOf("-"));
				if (!cookie.getName().equalsIgnoreCase(nameCookie)) {
					if (productId.substring(0, 1).equals("c")) {
						String comboId = cookie.getName().substring(1, cookie.getName().lastIndexOf("-"));
						product = productService.findByComboIdOrder(Integer.valueOf(comboId));
						product.setPrice(
								GlobalsFunction.totalPriceCombo(product.getPrice(), product.getRateDiscount()));
					} else {
						product = productService.findByProductIdOrder(Integer.valueOf(productId));
					}
					order = new OrderDTO(user.getUserId(), productId, product.getName(), product.getPrice(),
							Integer.valueOf(cookie.getValue()), product.getLocationId());
					listOrderDTO.add(order);
				}
			}
		}
		return listOrderDTO;
	}

	@GetMapping("/checkout")
	public String checkout(Model model, HttpServletRequest request) {
		Users user = (Users) request.getSession().getAttribute("userSession");
		if (user != null) {
			List<OrderDTO> listOrderDTO = new ArrayList<>();
			Cookie[] cookies = request.getCookies();
			float totalCart = 0;
			String productId = "";
			for (Cookie cookie : cookies) {
				if (cookie.getName().contains(user.getUsername())) {
					productId = cookie.getName().substring(0, cookie.getName().lastIndexOf("-"));
					if (!cookie.getValue().equals("")) {
						OrderDTO product = null;
						if (productId.substring(0, 1).equals("c")) {
							String comboId = cookie.getName().substring(1, cookie.getName().lastIndexOf("-"));
							product = productService.findByComboIdOrder(Integer.valueOf(comboId));
							product.setPrice(
									GlobalsFunction.totalPriceCombo(product.getPrice(), product.getRateDiscount()));
						} else {
							product = productService.findByProductIdOrder(Integer.valueOf(productId));
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
		}
		model.addAttribute("userAddress", GlobalsFunction.AddressUser(user.getContactAddress()));
		return "public.checkout";
	}

	@PostMapping("/checkout")
	public String checkout(@Valid @ModelAttribute("userAddress") UserAddress userAddress, Model model,
			HttpServletRequest request, BindingResult br, RedirectAttributes rd, HttpServletResponse response) {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "redirect:/public/checkout";
		}
		Users user = (Users) request.getSession().getAttribute("userSession");
		if (user != null) {
			if (user.getContactAddress() == null) {
				user.setContactAddress(GlobalsFunction.AddressUser(userAddress));
				user.setContactPhone(userAddress.getPhone());
				if (usersService.update(user) == false) {
					rd.addFlashAttribute(GlobalsConstant.MESSAGE,
							messageSource.getMessage("error", null, Locale.getDefault()));
					return "redirect:/public/checkout";
				}
			}
		}
		// remote cookie
		Cookie[] cookies = request.getCookies();
		String productId = "";
		List<OrderDTO> listOrderDTO = new ArrayList<>();
		for (Cookie cookie : cookies) {
			if (cookie.getName().contains(user.getUsername())) {
				productId = cookie.getName().substring(0, cookie.getName().lastIndexOf("-"));
				if (!cookie.getValue().equals("")) {
					OrderDTO product = null;
					if (productId.substring(0, 1).equals("c")) {
						String comboId = cookie.getName().substring(1, cookie.getName().lastIndexOf("-"));
						product = productService.findByComboIdOrder(Integer.valueOf(comboId));
						product.setPrice(
								GlobalsFunction.totalPriceCombo(product.getPrice(), product.getRateDiscount()));
					} else {
						product = productService.findByProductIdOrder(Integer.valueOf(productId));
					}
					OrderDTO order = new OrderDTO(user.getUserId(), productId, product.getName(), product.getPrice(),
							Integer.valueOf(cookie.getValue()), product.getLocationId());
					listOrderDTO.add(order);
					// remote cookie
					Cookie cookieDel = new Cookie(cookie.getName(), "");
					cookieDel.setMaxAge(0);
					response.addCookie(cookieDel);
				}
			}
		}
		List<Orders> listOrders = new ArrayList<>();
		for (OrderDTO orderDTO : listOrderDTO) {
			float totalCart = 0;
			double total = 0;
			boolean Check = false;
			for (Orders orders : listOrders) {
				if (orders.getLocation().getLocationId() == orderDTO.getLocationId()) {
					total = orderDTO.getPrice() * Integer.valueOf(orderDTO.getQuantity());
					totalCart += total;
					orders.setTotalPrice(totalCart + orders.getTotalPrice());
					Check = true;
				}
			}
			if (!Check) {
				total = orderDTO.getPrice() * Integer.valueOf(orderDTO.getQuantity());
				totalCart += total;
				Orders order = new Orders(0, GlobalsFunction.getCurrentTime(), new OrderStatus(1, ""), user, totalCart,
						userAddress.getNote(), "", GlobalsConstant.priceShip, GlobalsFunction.AddressUser(userAddress),
						new Location(orderDTO.getLocationId()));
				listOrders.add(order);
			}
		}

		for (Orders orders : listOrders) {
			orderService.save(orders);
		}

		for (OrderDTO orderDTO : listOrderDTO) {
			OrderDetail orderDetail = null;
			if (orderDTO.getProductId().contains("c")) {
				int id = Integer.valueOf(orderDTO.getProductId().substring(1, orderDTO.getProductId().length()));
				for (Orders orders : listOrders) {
					if (orders.getLocation().getLocationId() == orderDTO.getLocationId()) {
						orderDetail = new OrderDetail(0, orderDTO.getPrice(), orderDTO.getQuantity(),
								userAddress.getNote(), null, new ProductCombo(id), orders);
					}
				}
			} else {
				for (Orders orders : listOrders) {
					if (orders.getLocation().getLocationId() == orderDTO.getLocationId()) {
						orderDetail = new OrderDetail(0, orderDTO.getPrice(), orderDTO.getQuantity(),
								userAddress.getNote(), new Product(Integer.valueOf(orderDTO.getProductId())), null,
								orders);
					}
				}
			}
			orderDetailService.save(orderDetail);
		}
		return "redirect:/public/orderdetails";
	}

	@GetMapping({ "/orderdetails", "/orderdetails/{orderId}" })
	public String orderdetails(Model model, HttpServletRequest request,
			@PathVariable(required = false, name = "orderId") Integer orderId) {
		Users user = (Users) request.getSession().getAttribute("userSession");
		List<Orders> listOrder = orderService.findByUserId(user.getUserId());
		Orders order = null;
		List<OrderDTO> listOrderDTO = null;
		if (orderId != null) {
			order = orderService.findByOrderId(orderId);
			listOrderDTO = orderDetailService.findOrderDTO(orderId);
		} else {
			if (listOrder.size() > 0) {
				order = orderService.findByOrderId(listOrder.get(0).getOrderId());
				listOrderDTO = orderDetailService.findOrderDTO(listOrder.get(0).getOrderId());
			}
		}
		UserAddress userAddress = GlobalsFunction.AddressUser(user.getContactAddress());
		if (listOrderDTO != null) {
			for (OrderDTO orderDTO : listOrderDTO) {
				if (!"null".equals(orderDTO.getProductComboId())) {
					OrderDTO orderNew = productService
							.findComboIdOrderDetail(Integer.valueOf(orderDTO.getProductComboId()));
					orderDTO.setImagePath(orderNew.getImagePath());
					orderDTO.setName(orderNew.getName());
				} else {
					OrderDTO orderNew = productService
							.findProductIdOrderDetail(Integer.valueOf(orderDTO.getProductId()));
					orderDTO.setImagePath(orderNew.getImagePath());
					orderDTO.setName(orderNew.getName());
				}
			}
		}
		model.addAttribute("listOrder", listOrder);
		model.addAttribute("orderDetail", listOrderDTO);
		model.addAttribute("user", user);
		model.addAttribute("order", order);
		model.addAttribute("orderStatusList", orderStatusService.findAll());
		model.addAttribute("userAddress", userAddress);
		return "public.orderdetails";
	}
}
