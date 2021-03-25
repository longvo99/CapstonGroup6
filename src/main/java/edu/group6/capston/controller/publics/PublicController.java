package edu.group6.capston.controller.publics;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.group6.capston.models.Location;
import edu.group6.capston.models.LocationFavorites;
import edu.group6.capston.models.Users;
import edu.group6.capston.services.ComboDetailService;
import edu.group6.capston.services.DiscountService;
import edu.group6.capston.services.LocationService;
import edu.group6.capston.services.LocationTypeService;
import edu.group6.capston.services.ProductService;
import edu.group6.capston.services.RatingService;
import edu.group6.capston.utils.GlobalsFunction;

@Controller
@RequestMapping("public")
public class PublicController extends PublicAbstractController {

	@Autowired
	private LocationService locationService;

	@Autowired
	private LocationTypeService locationTypeService;
	
	@Autowired
	private DiscountService discountService;

	@Autowired
	private ProductService productService;
	
	@Autowired
	private ComboDetailService comboDetailService;
	
	@Autowired
	private RatingService ratingService;
	
	@Override
	public void addCommonObjects(Model model) {
		super.addCommonObjects(model);
	}

	@GetMapping("/index")
	public String index(Model model, HttpServletRequest request) {
		model.addAttribute("locationTypeList", locationTypeService.findAll());
		model.addAttribute("DiscountList", discountService.findAll());
		model.addAttribute("ratingList", ratingService.findAllRatingLocation());
		model.addAttribute("minMaxLocation", productService.findMinMaxPriceLocation());
		model.addAttribute("DiscountTopList", discountService.findTopNewDiscountInfo());
		model.addAttribute("listLocationTopNew", GlobalsFunction.changeImageLocation(locationService.findTopNewLocationNew()));
		model.addAttribute("RateTopList", GlobalsFunction.changeImageTopLocation(locationService.findTopRate()));
		model.addAttribute("LocationDiscountTopList", GlobalsFunction.changeImageTopLocation(locationService.findTopDiscount()));
		if(request.getSession().getAttribute("userSession") != null) {
			Users user = (Users) request.getSession().getAttribute("userSession");
			List<LocationFavorites> locationFavoriteList = locationService.findLocationFavorite(user.getUserId());
			model.addAttribute("locationFavoriteList", GlobalsFunction.changeImageLocationFavorites(locationFavoriteList));
		}
		return "public.index";
	}

	@GetMapping("/restaurant/{locationId}")
	public String productdetail(@PathVariable Integer locationId, Model model) {
		Location location = locationService.findLocationId(locationId);
		String[] imagePath = GlobalsFunction.splitPathMedia(location.getMediaPath());
		model.addAttribute("location", GlobalsFunction.formatTime(location));
		model.addAttribute("image1", imagePath[0]);
		model.addAttribute("image2", imagePath[1]);
		model.addAttribute("product", productService.findByLocationId(locationId));
		model.addAttribute("comboDetailList", comboDetailService.findComboLocation(locationId));
		model.addAttribute("productComboDetailList", comboDetailService.findProductInComboLocation(locationId));
		return "public.restaurant";
	}

	@GetMapping("/register")
	public String register(Model model) {
		return "public.register";
	}
	
	@GetMapping("/orderdetails")
	public String orderdetails(Model model) {
		return "public.orderdetails";
	}
	
	@GetMapping("/listview")
	public String listview(Model model) {
		return "public.listview";
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	@ResponseBody
	public List<String> search(HttpServletRequest request) {
		System.out.println("avd");
		return locationService.search(request.getParameter("term"));
	}
	
//	@GetMapping("/shop")
//	public String shop(Model model) {
//		return "public.shop";
//	}
//
//	@GetMapping("/contact")
//	public String contact(Model model) {
//		return "public.contact";
//	}
//
//	@GetMapping("/productdetail")
//	public String productdetail(Model model) {
//		model.addAttribute("linkanh", "DSC_3005.jpg");
//		return "public.productdetail";
//	}
//
//	@PostMapping("/productdetail")
//	public String productdetail(@Valid @ModelAttribute("comment") Comment comment, BindingResult rs,
//			HttpServletRequest request, @RequestParam(value = "images[]") MultipartFile[] files,
//
//			@RequestParam(value = "file[]") MultipartFile file,
//
//			@RequestParam(value = "location", required = false) Integer location, RedirectAttributes rd)
//			throws IllegalStateException, IOException {
//
//		for (MultipartFile obj : files) {
//			String fileName = UploadFile.upload(obj, request);
//			System.out.println(fileName);
//		}
//		String fileVideo = UploadFile.upload(file, request);
//		System.out.println(location);
//		System.out.println(UploadFile.getDirPath(request));
//		return "public.productdetail";
//	}
//
//	@GetMapping("/cart")
//	public String cart(Model model) {
//		return "public.cart";
//	}

}
