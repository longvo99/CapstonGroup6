package edu.group6.capston.controller.publics;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.group6.capston.dtos.CommentDTO;
import edu.group6.capston.models.Comment;
import edu.group6.capston.models.Location;
import edu.group6.capston.models.LocationFavorites;
import edu.group6.capston.models.Rating;
import edu.group6.capston.models.Users;
import edu.group6.capston.services.ComboDetailService;
import edu.group6.capston.services.CommentService;
import edu.group6.capston.services.DiscountService;
import edu.group6.capston.services.LocationCategoriesService;
import edu.group6.capston.services.LocationFavoriteService;
import edu.group6.capston.services.LocationService;
import edu.group6.capston.services.LocationTypeService;
import edu.group6.capston.services.ProductService;
import edu.group6.capston.services.RatingService;
import edu.group6.capston.utils.GlobalsConstant;
import edu.group6.capston.utils.GlobalsFunction;
import edu.group6.capston.utils.UploadFile;
@Controller
@RequestMapping("public")
public class PublicIndexController extends PublicAbstractController {

	@Autowired
	private LocationService locationService;
	
	@Autowired
	private LocationCategoriesService categoryService;
	
	@Autowired
	private LocationFavoriteService locationFavoriteService;

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
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	MessageSource messageSource;
	
	@Override
	public void addCommonObjects(Model model, HttpServletRequest request) {
		super.addCommonObjects(model, request);
	}
	
	@GetMapping("/index")
	public String index(Model model, HttpServletRequest request) {
		model.addAttribute("locationTypeList", locationTypeService.findAll());
		model.addAttribute("DiscountList", discountService.findLocationIdOnDiscount());
		model.addAttribute("ratingList", ratingService.findAllRatingLocation());
		model.addAttribute("minMaxLocation", productService.findMinMaxPriceLocation());
		model.addAttribute("DiscountTopList", discountService.findTopNewDiscountInfo());
		model.addAttribute("listLocationTopNew", GlobalsFunction.changeImageTopLocation(locationService.findTopNewLocationNew(6)));
		model.addAttribute("RateTopList", GlobalsFunction.changeImageTopLocation(locationService.findTopRate()));
		model.addAttribute("LocationDiscountTopList", GlobalsFunction.changeImageTopLocation(locationService.findTopDiscount()));
		if(request.getSession().getAttribute("userSession") != null) {
			Users user = (Users) request.getSession().getAttribute("userSession");
			List<LocationFavorites> locationFavoriteList = locationFavoriteService.findLocationFavorite(user.getUserId());
			model.addAttribute("locationFavoriteList", GlobalsFunction.changeImageLocationFavorites(locationFavoriteList));
		}
		return "public.index";
	}
	
	@GetMapping("/restaurant/{locationId}")
	public String productdetail(@PathVariable Integer locationId, Model model, HttpServletRequest request) {
		Location location = locationService.findLocationId(locationId);
		String[] imagePath = GlobalsFunction.splitPathMedia(location.getMediaPath());
		model.addAttribute("location", GlobalsFunction.formatTime(location));
		model.addAttribute("image1", imagePath[0]);
		model.addAttribute("image2", imagePath[1]);
		model.addAttribute("product", productService.findByLocationId(locationId));
		model.addAttribute("comboDetailList", comboDetailService.findComboLocation(locationId));
		model.addAttribute("productComboDetailList", comboDetailService.findProductInComboLocation(locationId));
		List<Comment> commentListParent = commentService.findAllCommentByLocationId(locationId);
		for (Comment comment : commentListParent) {
			comment.setCurrentTime(GlobalsFunction.findDifference(comment.getCurrentTime()));
		}
		model.addAttribute("commentListParent", commentListParent);
		List<Comment> commentListChild = commentService.findAllCommentByParentCommentId(locationId);
		for (Comment comment : commentListChild) {
			comment.setCurrentTime(GlobalsFunction.findDifference(comment.getCurrentTime()));
		}
		model.addAttribute("commentListChild", commentListChild);
		if(request.getSession().getAttribute("userSession") != null) {
			Users user = (Users) request.getSession().getAttribute("userSession");
			model.addAttribute("locationFavoriteList", locationFavoriteService.findLocationFavorite(user.getUserId(), locationId));
		}
		
		if(request.getSession().getAttribute("userSession") != null) {
			Users user = (Users) request.getSession().getAttribute("userSession");
			LocationFavorites locationFavorite = locationFavoriteService.findLocationFavorite(user.getUserId() , locationId);
			model.addAttribute("locationFavorite", locationFavorite);
		}
		
		model.addAttribute("countRating", commentService.findCountCommentByLocationId(locationId));
		model.addAttribute("pointRating", ratingService.findAVGRating(locationId));
		
		return "public.restaurant";
	}

	@GetMapping("/register")
	public String register(Model model) {
		return "public.register";
	}
	
	@GetMapping("/listview/{category}")
	public String listview(@PathVariable String category, Model model, HttpServletRequest request) {
		model.addAttribute("DiscountList", discountService.findAll());
		model.addAttribute("ratingList", ratingService.findAllRatingLocation());
		model.addAttribute("minMaxLocation", productService.findMinMaxPriceLocation());
		
		if(category.equals("new")) {
			model.addAttribute("nameCategory","Địa điểm mới");
			model.addAttribute("listLocation", GlobalsFunction.changeImageTopLocation(locationService.findTopNewLocationNew(12)));
		}
		if(category.equals("discount")) {
			model.addAttribute("nameCategory","Địa điểm giảm giá");
			model.addAttribute("listLocation", GlobalsFunction.changeImageTopLocation(locationService.findTopDiscount()));
		}
		if(category.contains("category")) {
			String categoryId = category.substring(8, category.length());
			model.addAttribute("nameCategory", categoryService.findNameCategory(Integer.valueOf(categoryId)).getLocationCategoryName());
			model.addAttribute("listLocation", GlobalsFunction.changeImageTopLocation(locationService.findLocationByCategoryId(Integer.valueOf(categoryId))));
		}
		if(request.getSession().getAttribute("userSession") != null) {
			Users user = (Users) request.getSession().getAttribute("userSession");
			List<LocationFavorites> locationFavoriteList = locationFavoriteService.findLocationFavorite(user.getUserId());
			model.addAttribute("nameCategory","Địa điểm yêu thích");
			if(category.equals("favorite")) {
				model.addAttribute("listLocation2", GlobalsFunction.changeImageLocationFavorites(locationFavoriteList));
			}else {
				model.addAttribute("locationFavoriteList", GlobalsFunction.changeImageLocationFavorites(locationFavoriteList));
			}
		}
		return "public.category";
	}
	
	@RequestMapping(value = "/editLocationFavorite/{locationId}", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody void editLocationFavorite(@RequestBody Integer userId, @PathVariable Integer locationId) {
		LocationFavorites locationFavorite = locationFavoriteService.findLocationFavorites(userId, locationId);
		if(locationFavorite != null) {
			locationFavoriteService.delete(locationFavorite);
		}else {
			locationFavoriteService.save(locationId, userId);
		}
	}
	
	@RequestMapping(value = "/restaurant/parentComment/{commentId}/{locationId}", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String addParentComment(@RequestBody String content, @PathVariable Integer commentId, @PathVariable Integer locationId, HttpServletRequest request) {
		Users user = (Users) request.getSession().getAttribute("userSession");
		Comment comment = new Comment(0, null, String.valueOf(GlobalsFunction.getCurrentTime()), content, null, commentId, new Location(locationId), new Users(user.getUserId()));
		commentService.save(comment);
		return "success";
	}
	
	@PostMapping(value = "/restaurant/comment/{locationId}")
	public String addComment(@Valid @ModelAttribute("commentDTO") CommentDTO commentDTO, @PathVariable Integer locationId, BindingResult br,
			RedirectAttributes rd ,HttpServletRequest request, Model model) throws IllegalStateException, IOException {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "redirect:/public/restaurant/" + locationId;
		}
		String mediaPath = "";
		List<MultipartFile> filesImage = commentDTO.getImages();
		MultipartFile fileVideo = commentDTO.getVideo();
		String video = UploadFile.upload(fileVideo, request);
		if (filesImage != null && filesImage.size() > 0) {
			for (MultipartFile multipartFile : filesImage) {
				String filename = UploadFile.upload(multipartFile, request);
				if (filesImage.indexOf(multipartFile) == 0) {
					mediaPath = filename;
				} else {
					mediaPath = mediaPath + ";" + filename;
				}
			}
		}
		mediaPath += ";" + video;
		Users user = (Users) request.getSession().getAttribute("userSession");
		Comment comment = new Comment(0, commentDTO.getTitle(), String.valueOf(GlobalsFunction.getCurrentTime()), commentDTO.getContent(), mediaPath, 0, new Location(locationId), new Users(user.getUserId()));
		if (commentService.save(comment)) {
			Rating rate1 = new Rating(0, commentDTO.getLocation() , "location", comment);
			Rating rate2 = new Rating(0, commentDTO.getPrice() , "price", comment);
			Rating rate3 = new Rating(0, commentDTO.getQuality() , "quality", comment);
			Rating rate4 = new Rating(0, commentDTO.getService() , "service", comment);
			Rating rate5 = new Rating(0, commentDTO.getSpace() , "space", comment);
			if(ratingService.save(rate1) && ratingService.save(rate2) && ratingService.save(rate3) && ratingService.save(rate4) && ratingService.save(rate5)) {
				rd.addFlashAttribute(GlobalsConstant.MESSAGE,
						messageSource.getMessage("success", null, Locale.getDefault()));
				rd.addFlashAttribute("success", true);
				return "redirect:/public/restaurant/" + locationId;
			}
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		return "redirect:/public/restaurant/" + locationId;
	}
}
