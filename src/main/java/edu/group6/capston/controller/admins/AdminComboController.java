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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.group6.capston.dtos.ProductDTO2;
import edu.group6.capston.models.ComboDetail;
import edu.group6.capston.models.Product;
import edu.group6.capston.models.ProductCombo;
import edu.group6.capston.services.ComboDetailService;
import edu.group6.capston.services.ProductComboService;
import edu.group6.capston.services.ProductService;
import edu.group6.capston.utils.GlobalsConstant;
import edu.group6.capston.utils.UploadFile;

@Controller
@RequestMapping("admin/combo")
public class AdminComboController {

	@Autowired
	MessageSource messageSource;

	@Autowired
	private ProductComboService productComboService;

	@Autowired
	private ComboDetailService comboDetailService;

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/index/{locationId}")
	public String Index(@PathVariable Integer locationId, Model model) {
		model.addAttribute("productComboList", productComboService.findAllByLocationId(locationId));
		model.addAttribute("locationId", locationId);
		return "admin.combo.index";
	}

	@RequestMapping(value = "/add/{locationId}")
	public String Add(@PathVariable Integer locationId, Model model) {
		model.addAttribute("productListByLocationId", productService.findAllByLocationId(locationId));
		model.addAttribute("locationId", locationId);
		return "admin.combo.add";
	}

	@PostMapping(value = "/add")
	public String Add(@Valid @ModelAttribute ProductCombo productCombo, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, @RequestParam("image") MultipartFile file, Model model)
			throws IllegalStateException, IOException {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "redirect:/admin/combo/add/" + request.getParameter("location.locationId");
		}
		String filename = UploadFile.upload(file, request);
		productCombo.setImagePath(filename);
		if (productComboService.save(productCombo)) {
			List<String> productIdList1 = Arrays.asList(request.getParameterValues("check[]"));
			for (String string : productIdList1) {
				ComboDetail comboDetail = new ComboDetail(0, new Product(Integer.valueOf(string)), productCombo);
				comboDetailService.save(comboDetail);
			}
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,messageSource.getMessage("success", null, Locale.getDefault()));
			return "redirect:/admin/combo/index/" +productCombo.getLocation().getLocationId();
		}
		UploadFile.del(filename, request);
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		return "redirect:/admin/combo/add/" + productCombo.getLocation().getLocationId();
	}

	@RequestMapping(value = "/edit/{productComboId}/{locationId}")
	public String edit(@PathVariable Integer productComboId, @PathVariable Integer locationId, Model model) {
		model.addAttribute("productCombo", productComboService.findOneById(productComboId));
		List<ProductDTO2> productListByProductComboId = productService.findAllByProductComboId(productComboId);
		List<ProductDTO2> productListByLocationId = productService.findAllByLocationId(locationId);
		List<ProductDTO2> productListChecked = new ArrayList<>();
		List<ProductDTO2> productListUnChecked = new ArrayList<>();
		for (ProductDTO2 obj1 : productListByLocationId) {
			boolean check = true;
			for (ProductDTO2 obj2 : productListByProductComboId) {
				if (obj1.equals(obj2)) {
					productListChecked.add(obj1);
					check = false;
					break;
				}
			}
			if (check == true) {
				productListUnChecked.add(obj1);
			}
		}
		model.addAttribute("productListChecked", productListChecked);
		model.addAttribute("productListUnChecked", productListUnChecked);
		return "admin.combo.edit";
	}

	@PostMapping(value = "/edit")
	public String Edit(@Valid @ModelAttribute ProductCombo productCombo, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, @RequestParam(name = "check[]", required = false) String[] productIdList,
			@RequestParam("image") MultipartFile file, Model model) throws IllegalStateException, IOException {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "redirect:/admin/combo/edit/" + productCombo.getProductComboId() + "/"
					+ productCombo.getLocation().getLocationId();
		}
		String filename = UploadFile.upload(file, request);
		if (!"".equals(filename)) {
			String picture = productComboService.findOneById(productCombo.getProductComboId()).getImagePath();
			UploadFile.del(picture, request);
		} else {
			filename = productComboService.findOneById(productCombo.getProductComboId()).getImagePath();
		}
		productCombo.setImagePath(filename);
		if (productIdList != null) {
			comboDetailService.delete(productCombo.getProductComboId());
			List<String> productIdList1 = Arrays.asList(productIdList);
			for (String string : productIdList1) {
				ComboDetail comboDetail = new ComboDetail(0, new Product(Integer.valueOf(string)),
						new ProductCombo(productCombo.getProductComboId()));
				comboDetailService.save(comboDetail);
			}
		}
		if (productComboService.update(productCombo)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			return "redirect:/admin/combo/index/" + productCombo.getLocation().getLocationId();
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		return "redirect:/admin/combo/edit/" + productCombo.getProductComboId() + "/"
				+ productCombo.getLocation().getLocationId();
	}
}
