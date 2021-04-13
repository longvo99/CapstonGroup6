package edu.group6.capston.controller.admins;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.group6.capston.models.DiscountInfo;
import edu.group6.capston.models.DiscountRule;
import edu.group6.capston.models.Location;
import edu.group6.capston.models.Users;
import edu.group6.capston.services.DiscountRuleService;
import edu.group6.capston.services.DiscountService;
import edu.group6.capston.services.LocationService;
import edu.group6.capston.services.ProductCategoryService;
import edu.group6.capston.services.ProductService;
import edu.group6.capston.utils.GlobalsConstant;
import edu.group6.capston.utils.GlobalsFunction;
import edu.group6.capston.utils.UploadFile;

@Controller
@RequestMapping("admin/discount")
public class AdminDiscountController {

	@Autowired
	MessageSource messageSource;

	@Autowired
	private DiscountService discountService;

	@Autowired
	private LocationService locationService;

	@Autowired
	private DiscountRuleService discountRuleService;

	@Autowired
	private ProductCategoryService productCategoryService;

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/index")
	public String Index(Model model) {
		if (GlobalsFunction.getUsers().getRole().getRoleId().equals("ADMIN")) {
			model.addAttribute("discountList", discountService.findAll());
		} else {
			model.addAttribute("discountList", discountService.findAllByUserId(GlobalsFunction.getUsers().getUserId()));
		}
		return "admin.discount.index";
	}

	@GetMapping(value = "/add")
	public String Add(Model model) {
		model.addAttribute("discountRuleList", discountRuleService.findAll());
		if (!GlobalsFunction.getUsers().getRole().getRoleId().equals("ADMIN")) {
			model.addAttribute("locationByUserIdList",
					locationService.findAllByUserId(GlobalsFunction.getUsers().getUserId()));
		}
		return "admin.discount.add";
	}

	@RequestMapping(value = "searchcategory", method = RequestMethod.GET)
	@ResponseBody
	public List<String> searchcategory(HttpServletRequest request) {
		return productCategoryService.searchProductCategoryName();
	}

	@RequestMapping(value = "searchproduct", method = RequestMethod.GET)
	@ResponseBody
	public List<String> searchproduct(HttpServletRequest request) {
		String[] numberStrs = request.getParameter("str").split(",");
		List<Integer> locationIdList = new ArrayList<Integer>();
		for (int i = 0; i < numberStrs.length; i++) {
			locationIdList.add(Integer.parseInt(numberStrs[i]));
		}
		return productService.searchProductNameByLocationId(locationIdList);
	}

	@PostMapping(value = "/add")
	public String Add(@Valid @ModelAttribute DiscountInfo discountInfo, BindingResult br, HttpServletRequest request,
			MultipartFile file, RedirectAttributes rd, @RequestParam(required = false) String condition, Model model)
			throws IllegalStateException, IOException {
		if (br.hasErrors()) {
			/* System.out.println(br.getFieldError()); */
			return "admin.discount.add";
		}
		String filename = UploadFile.upload(file, request);
		discountInfo.setMediaPath(filename);
		discountInfo.setUsers(new Users(GlobalsFunction.getUsers().getUserId()));
		if (GlobalsFunction.getUsers().getRole().getRoleId().equals("ADMIN")) {
			switch (request.getParameter("optradio")) {
			case "allproduct":
				discountInfo.setValue("alldistrict");
				break;
			case "category":
				String somedistrict = request.getParameter("categoryName").trim();
				discountInfo.setValue("somedistrict:".concat(somedistrict));
				break;
			case "product":
				String someward = request.getParameter("productName").trim();
				discountInfo.setValue("someward:".concat(someward));
				break;
			}
			;
		}
		if (GlobalsFunction.getUsers().getRole().getRoleId().equals("POSTER")) {
			switch (request.getParameter("optradio1")) {
			case "allproduct":
				discountInfo.setValue("allproduct");
				break;
			case "category":
				String categoryName = request.getParameter("categoryName").trim();
				discountInfo.setValue("category:".concat(categoryName));
				break;
			case "product":
				String productName = request.getParameter("productName").trim();
				discountInfo.setValue("product:".concat(productName));
				break;
			}
			;
		}
		if (condition != null) {
			discountInfo.setDiscountRule(new DiscountRule(Integer.parseInt(request.getParameter("discountRule1"))));
			discountInfo.setValueRule(Integer.parseInt(request.getParameter("valueRule1")));
		}
		if (!GlobalsFunction.getUsers().getRole().getRoleId().equals("ADMIN")) {
			List<DiscountInfo> list1 = new ArrayList<>();
			DiscountInfo obj = null;
			List<String> strList = Arrays.asList(request.getParameterValues("check[]"));//lisst ID location
			for (String string : strList) {
				obj = new DiscountInfo(0, discountInfo.getTitle(), discountInfo.getCode(), 
						discountInfo.getDescription(), discountInfo.getRateDiscount(), discountInfo.getValue(), 
						discountInfo.getMediaPath(), discountInfo.getStartDate(), discountInfo.getEndDate(), 
						discountInfo.getUsers(), discountInfo.getLimitedUse(), discountInfo.getLimitedPerUser(), 
						discountInfo.getDiscountRule(), discountInfo.getValueRule(), new Location(Integer.valueOf(string.trim())));
				list1.add(obj);
			}
			for (DiscountInfo obj1 : list1) {
				discountService.save(obj1);
			}
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("success", null, Locale.getDefault()));
			return "redirect:/admin/discount/index";
		} else {
			if (discountService.save(discountInfo)) {
				rd.addFlashAttribute(GlobalsConstant.MESSAGE,
						messageSource.getMessage("success", null, Locale.getDefault()));
				return "redirect:/admin/discount/index";
			}
			UploadFile.del(filename, request);
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			model.addAttribute("DiscountInfo", discountInfo);
			return "admin.discount.add";
		}
	}

	@GetMapping("edit/{discountId}")
	public String edit(@PathVariable Integer discountId, Model model, RedirectAttributes rd) {
		try {
			model.addAttribute("discountRuleList", discountRuleService.findAll());
			model.addAttribute("discount", discountService.findOne(discountId));
		} catch (Exception e) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "redirect:/admin/discount/index";
		}
		return "admin.discount.edit";
	}

	@PostMapping(value = "/edit")
	public String Edit(@Valid @ModelAttribute DiscountInfo discountInfo, BindingResult br, HttpServletRequest request,
			MultipartFile file, RedirectAttributes rd, @RequestParam(required = false) String condition, Model model)
			throws IllegalStateException, IOException {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "admin.discount.edit";
		}
		String filename = UploadFile.upload(file, request);
		if (!"".equals(filename)) {
			String picture = discountService.findOne(discountInfo.getDiscountId()).getMediaPath();
			UploadFile.del(picture, request);
		} else {
			filename = discountService.findOne(discountInfo.getDiscountId()).getMediaPath();
		}
		discountInfo.setMediaPath(filename);
		discountInfo.setUsers(new Users(GlobalsFunction.getUsers().getUserId()));
		if (GlobalsFunction.getUsers().getRole().getRoleId().equals("ADMIN")) {
			switch (request.getParameter("optradio")) {
			case "allproduct":
				discountInfo.setValue("alldistrict");
				break;
			case "category":
				String somedistrict = request.getParameter("categoryName").trim();
				discountInfo.setValue("somedistrict:".concat(somedistrict));
				break;
			case "product":
				String someward = request.getParameter("productName").trim();
				discountInfo.setValue("someward:".concat(someward));
				break;
			}
			;
		}
		if (GlobalsFunction.getUsers().getRole().getRoleId().equals("POSTER")) {
			switch (request.getParameter("optradio")) {
			case "allproduct":
				discountInfo.setValue("allproduct");
				break;
			case "category":
				String categoryName = request.getParameter("categoryName").trim();
				discountInfo.setValue("category:".concat(categoryName));
				break;
			case "product":
				String productName = request.getParameter("productName").trim();
				discountInfo.setValue("product:".concat(productName));
				break;
			}
			;
		}
		if (condition != null) {
			discountInfo.setDiscountRule(new DiscountRule(Integer.parseInt(request.getParameter("discountRule1"))));
			discountInfo.setValueRule(Integer.parseInt(request.getParameter("valueRule1")));
		}
		if (!GlobalsFunction.getUsers().getRole().getRoleId().equals("ADMIN")) {
			int locationId = Integer.valueOf(request.getParameter("locati"));
			discountInfo.setLocation(new Location(locationId));
		}
		if (discountService.update(discountInfo)) {
			System.out.println(UploadFile.getDirPath(request));
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			return "redirect:/admin/discount/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		return "admin.discount.edit";
	}

	@GetMapping("del/{str}")
	public String delete(@PathVariable String str, HttpServletRequest request, RedirectAttributes rd) {
		List<Integer> listDiscountId1 = new ArrayList<Integer>();
		String[] listDiscountId = str.split(",");
		for (String discountId : listDiscountId) {
			// Nên xem phần này ở project about me
			DiscountInfo discountInfo = discountService.findOne(Integer.valueOf(discountId));
			String mediaPath = discountInfo.getMediaPath();
			if (!"".equals(mediaPath)) {
				UploadFile.del(mediaPath, request);
			}
			listDiscountId1.add(Integer.valueOf(discountId));
		}
		System.out.println(UploadFile.getDirPath(request));
		str = str.substring(0, str.length() - 1);
		if (discountService.delete(listDiscountId1) > 0) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			return "redirect:/admin/discount/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		return "admin.discount.index";
	}
}
