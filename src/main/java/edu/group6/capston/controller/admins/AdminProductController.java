package edu.group6.capston.controller.admins;

import java.io.IOException;
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

import edu.group6.capston.models.Product;
import edu.group6.capston.services.ProductCategoryService;
import edu.group6.capston.services.ProductService;
import edu.group6.capston.utils.GlobalsConstant;
import edu.group6.capston.utils.UploadFile;

@Controller
@RequestMapping("admin/product")
public class AdminProductController {
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductCategoryService productCategoryService;
	
	
	@RequestMapping(value ="/index/{locationId}")
	public String Index(@PathVariable Integer locationId, Model model) {
		model.addAttribute("productList" , productService.findByLocationId(locationId));
		model.addAttribute("locationId", locationId);
		return "admin.product.index";
	}
	
	@RequestMapping(value ="/add/{locationId}")
	public String Add(@PathVariable Integer locationId,Model model) {
		model.addAttribute("productCategoryList" , productCategoryService.findAll());
		model.addAttribute("locationId", locationId);
		return "admin.product.add";
	}
	
	@PostMapping(value ="/add")
	public String Add(@Valid @ModelAttribute("product") Product product, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, @RequestParam("image") MultipartFile file, Model model) throws IllegalStateException, IOException {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			rd.addFlashAttribute("error", true);
			model.addAttribute("product", product);
			return "redirect:/admin/product/add/"+product.getLocationId();
		}
		String filename = UploadFile.upload(file, request);
		product.setImagePath(filename);
		if (productService.save(product)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			rd.addFlashAttribute("success", true);
			return "redirect:/admin/product/index/"+product.getLocationId();
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		rd.addFlashAttribute("error", true);
		model.addAttribute("product", product);
		return "redirect:/admin/product/add/"+ product.getLocationId();
	}
	
	@RequestMapping(value ="/edit/{productId}")
	public String edit(@PathVariable Integer productId,Model model) {
		model.addAttribute("product" , productService.findByProductId(productId));
		model.addAttribute("productCategoryList" , productCategoryService.findAll());
		return "admin.product.edit";
	}
	
	@PostMapping(value ="/edit")
	public String Edit(@Valid @ModelAttribute("product") Product product, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, @RequestParam("image") MultipartFile file, Model model) throws IllegalStateException, IOException {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			rd.addFlashAttribute("error", true);
			model.addAttribute("product", product);
			return "redirect:/admin/product/edit/"+product.getProductId();
		}
		String filename = UploadFile.upload(file, request);
		if (!"".equals(filename)) {
			String picture = productService.findByProductId(product.getProductId()).getImagePath();
			UploadFile.del(picture, request);
		}else {
			filename = productService.findByProductId(product.getProductId()).getImagePath();
		}
		product.setImagePath(filename);
		if (productService.update(product)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			rd.addFlashAttribute("success", true);
			return "redirect:/admin/product/index/"+product.getLocationId();
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		rd.addFlashAttribute("error", true);
		model.addAttribute("product", product);
		return "redirect:/admin/product/edit/"+ product.getProductId();
	}
	
	@RequestMapping(value ="/del/{id}")
	public String delete(@PathVariable Integer id, RedirectAttributes rd, HttpServletRequest request, Model mode) {
		if (productService.delete(id)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			rd.addFlashAttribute("error", true);
			return "redirect:/admin/product/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("success", null, Locale.getDefault()));
		rd.addFlashAttribute("success", true);
		return "redirect:/admin/product/index";
	}
}
