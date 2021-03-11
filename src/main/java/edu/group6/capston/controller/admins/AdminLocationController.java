package edu.group6.capston.controller.admins;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.group6.capston.dtos.ImageUpload;
import edu.group6.capston.models.Location;
import edu.group6.capston.models.LocationCategory;
import edu.group6.capston.services.LocationCategoriesService;
import edu.group6.capston.services.LocationService;
import edu.group6.capston.services.LocationTypeService;
import edu.group6.capston.utils.GlobalsConstant;
import edu.group6.capston.utils.UploadFile;

@Controller
@RequestMapping("admin/location")
public class AdminLocationController {

	@Autowired
	MessageSource messageSource;

	@Autowired
	private LocationService locationService;

	@Autowired
	private LocationCategoriesService locationCategoriesService;

	@Autowired
	private LocationTypeService locationTypeService;

	@GetMapping("/index")
	public String Index(Model model) {
		model.addAttribute("locationList", locationService.findAll());
		return "admin.location.index";
	}
	
	@GetMapping("/image/{locationId}")
	public String image(@PathVariable Integer locationId, Model model) {
		Location location =  locationService.findLocationId(locationId);
		String[] imagePath = UploadFile.splitPathMedia(location.getMediaPath());
		model.addAttribute("imagePath", imagePath);
		return "admin.location.image";
	}
	
	@PostMapping("/image/edit/{locationId}")
	public String image(@PathVariable Integer locationId, Model model, @Valid @ModelAttribute("images") ImageUpload images, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException {
		Location location =  locationService.findLocationId(locationId);
		List<MultipartFile> files = images.getImages();
		if(files != null && files.size() > 0) {
			String mediaPath = "";
			for (MultipartFile multipartFile : files) {
				String filename = UploadFile.upload(multipartFile, request);
				if(files.indexOf(multipartFile) == 0) {
					mediaPath = filename ;
				}else {
					mediaPath = mediaPath + ";" + filename ;
				}
			}
			location.setMediaPath(mediaPath);
			if(locationService.update(location)) {
				rd.addFlashAttribute(GlobalsConstant.MESSAGE,
						messageSource.getMessage("success", null, Locale.getDefault()));
				rd.addFlashAttribute("success", true);
				return "redirect:/admin/location/index";
			}
		}
		
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		rd.addFlashAttribute("error", true);
		return "admin.location.image";
	}

	@GetMapping("add")
	public String add(ModelMap modelMap) {
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
		modelMap.addAttribute("locationCategoriesList1", locationCategoriesList1);
		modelMap.addAttribute("locationCategoriesList2", locationCategoriesList2);
		modelMap.addAttribute("locationTypeList", locationTypeService.findAll());
		return "admin.location.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("location") Location location,
			@Valid @ModelAttribute("images") ImageUpload images, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, MultipartFile file, Model model) throws IllegalStateException, IOException {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			rd.addFlashAttribute("error", true);
			model.addAttribute("location", location);
			return "admin.location.add";
		}
		List<MultipartFile> files = images.getImages();
		if(files != null && files.size() > 0) {
			String mediaPath = "";
			for (MultipartFile multipartFile : files) {
				String filename = UploadFile.upload(multipartFile, request);
				if(files.indexOf(multipartFile) == 0) {
					mediaPath = filename ;
				}else {
					mediaPath = mediaPath + ";" + filename ;
				}
			}
			location.setMediaPath(mediaPath);
			if(locationService.save(location)) {
				rd.addFlashAttribute(GlobalsConstant.MESSAGE,
						messageSource.getMessage("success", null, Locale.getDefault()));
				rd.addFlashAttribute("success", true);
				return "redirect:/admin/location/index";
			}
		}
		
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		rd.addFlashAttribute("error", true);
		model.addAttribute("location", location);
		return "admin.location.add";
	}
	
	@GetMapping("edit/{locationId}")
	public String edit(@PathVariable Integer locationId, Model model) {
		Location location = locationService.findLocationId(locationId);
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
		model.addAttribute("locationCategoriesList1", locationCategoriesList1);
		model.addAttribute("locationCategoriesList2", locationCategoriesList2);
		model.addAttribute("locationTypeList", locationTypeService.findAll());
		model.addAttribute("location", location);
		return "admin.location.edit";
	}

	@PostMapping(value = "/edit")
	public String Edit(@Valid @ModelAttribute("location") Location location, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, MultipartFile file, Model model) {
		if (br.hasErrors()) {
			return "admin.location.index";
		}
		if (locationService.update(location)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			rd.addFlashAttribute("success", true);
			return "redirect:/admin/location/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		rd.addFlashAttribute("error", true);
		return "admin.location.index";
	}

	@RequestMapping(value = "/detele")
	public String Delete(Model model) {
		model.addAttribute("locationList", locationService.findAll());
		return "admin.location.detele";
	}
}
