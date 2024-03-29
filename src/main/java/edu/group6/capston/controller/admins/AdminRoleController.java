package edu.group6.capston.controller.admins;

import java.io.UnsupportedEncodingException;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.group6.capston.models.Role;
import edu.group6.capston.services.RoleService;
import edu.group6.capston.utils.GlobalsConstant;

@Controller
@RequestMapping("admin/role")
public class AdminRoleController {
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value ="/index")
	public String Index(Model model) {
		model.addAttribute("roleList" , roleService.findAll());
		return "admin.role.index";
	}
	@RequestMapping(value ="/add")
	public String Add(Model model) {
		return "admin.role.add";
	}
	
	@PostMapping(value ="/add")
	public String Add(@Valid @ModelAttribute("role") Role role, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, Model model) {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "admin.role.add";
		}
		if (roleService.save(role)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			rd.addFlashAttribute("success", true);
			return "redirect:/admin/role/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		model.addAttribute("roles", role);
		return "admin.role.add";
	}
	
	@PostMapping(value ="/edit")
	public String Edit(@Valid @ModelAttribute("role") Role role, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, Model model) throws UnsupportedEncodingException {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "admin.role.index";
		}
		if (roleService.update(role)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("success", null, Locale.getDefault()));
			rd.addFlashAttribute("success", true);
			return "redirect:/admin/role/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		rd.addFlashAttribute("error", true);
		return "redirect:/admin/role/index";
	}
	
	@RequestMapping(value ="/del/{id}")
	public String delete(@PathVariable String id, RedirectAttributes rd, HttpServletRequest request, Model mode) {
		if (roleService.delete(id)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			rd.addFlashAttribute("error", true);
			return "redirect:/admin/role/index";
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("success", null, Locale.getDefault()));
		rd.addFlashAttribute("success", true);
		return "redirect:/admin/role/index";
	}
}
