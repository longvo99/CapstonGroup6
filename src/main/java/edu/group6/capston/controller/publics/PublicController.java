package edu.group6.capston.controller.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import edu.group6.capston.daos.LocationDAO;
import edu.group6.capston.models.Location;
import edu.group6.capston.services.LocationService;
import edu.group6.capston.utils.UploadFile;

@Controller
@RequestMapping("public")
public class PublicController extends PublicAbstractController {

	@Autowired
	private LocationService locationService;
	
	@Autowired
	private LocationDAO locationDAO;
	
	@GetMapping("/index")
	public String index(Model model) {
		model.addAttribute("locationList", locationService.findAll());
		//locationDAO.findAll1();
		return "public.index";
	}
	@GetMapping("/restaurant")
	public String productdetail(Model model) {
		model.addAttribute("linkanh", "DSC_3005.jpg");
		return "public.restaurant";
	}
	@PostMapping("/restaurant")
	public String restaurant(Model model, HttpServletRequest request,
			@RequestParam(value = "images[]") MultipartFile[] files) throws IllegalStateException, IOException {
		model.addAttribute("locationList", locationService.findAll());
		for (MultipartFile obj : files) {
			String fileName = UploadFile.upload(obj, request);
			System.out.println(fileName);
		}
		System.out.println(UploadFile.getDirPath(request));
		return "public.restaurant";
	}

	@Override
	public void addCommonObjects(Model model) {
		super.addCommonObjects(model);
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
