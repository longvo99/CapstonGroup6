package edu.group6.capston.controller.admins;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.group6.capston.dtos.UserAddress;
import edu.group6.capston.models.Users;
import edu.group6.capston.services.RoleService;
import edu.group6.capston.services.UserService;
import edu.group6.capston.utils.GlobalsConstant;
import edu.group6.capston.utils.GlobalsFunction;
import edu.group6.capston.utils.UploadFile;

@Controller
@RequestMapping("admin/user")
public class AdminUserController {

	@Autowired
	private UserService userService;

	@Autowired
	MessageSource messageSource;
	
	@Autowired
	private BCryptPasswordEncoder bcyptPasswordEncoder;
	
	@Autowired
	RoleService roleService;

	@GetMapping(value = "/add")
	public String add(Model model) {
		model.addAttribute("roleList", roleService.findAll());
		return "admin.user.add";
	}

	@PostMapping(value = "/setbaned")
	public String setbaned(Model model, HttpServletRequest request, RedirectAttributes rd) {
		Boolean status = Boolean.valueOf(request.getParameter("banned"));
		int id = Integer.valueOf(request.getParameter("id"));
		String roleId = request.getParameter("roleId");
		if (userService.setStatusByUserId(id, status)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			return "redirect:/admin/user/" + roleId;
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		return "redirect:/admin/user/" + roleId;
	}

	@PostMapping(value = "/add")
	public String add(@Valid @ModelAttribute Users users, BindingResult br, RedirectAttributes rd,
			HttpServletRequest request, Model model) {
		if (br.hasErrors()) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "redirect:/admin/user/add";
		}
		if (userService.checkUserExist(users.getUsername())) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("errorUsername", null, Locale.getDefault()));
			rd.addFlashAttribute("users", users);
			return "redirect:/admin/user/add";
		}
		users.setPassword("123456");
		users.setJoinDate(new Timestamp(new Date().getTime()));
		if (userService.save(users)) {
			userService.sendMailNewAccount(users.getContactEmail(), users.getUsername());
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,messageSource.getMessage("success", null, Locale.getDefault()));
			return "redirect:/admin/user/" + users.getRole().getRoleId();
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		return "redirect:/admin/user/add";

	}

	@GetMapping(value = "/{roleId}")
	public String Index(@PathVariable String roleId, Model model) {
		model.addAttribute("userList", userService.findByRoleId(roleId));
		model.addAttribute("roleName", roleId);
		return "admin.user.index";
	}

	@RequestMapping(value = "/profile/{username}")
	public String profile(@PathVariable String username, Model model) {
		model.addAttribute("user", userService.findByUsername(username));
		return "admin.user.profile";
	}

	@GetMapping(value = "/edit/{userId}")
	public String edit(@PathVariable Integer userId, Model model) {
		model.addAttribute("user", userService.findOneByUserId(userId));
		model.addAttribute("userAddress",
				GlobalsFunction.AddressUser(userService.findOneByUserId(userId).getContactAddress()));
		return "admin.user.edit";
	}

	@PostMapping(value = "/edit")
	public String Edit(@Valid @ModelAttribute Users user, @Valid @ModelAttribute("userAddress") UserAddress userAddress,
			BindingResult br, HttpServletRequest request, MultipartFile file, RedirectAttributes rd,
			@RequestParam(required = false) String checkbox, Model model) throws IllegalStateException, IOException {
		if (br.hasErrors()) {
			System.out.println(br.getFieldError());
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "admin.user.edit";
		}
		String avatarPath = UploadFile.upload(file, request);
		if (!"".equals(avatarPath)) {
			String picture = userService.findOneByUserId(user.getUserId()).getAvatarPath();
			UploadFile.del(picture, request);
		} else {
			avatarPath = userService.findOneByUserId(user.getUserId()).getAvatarPath();
		}
		user.setContactAddress(GlobalsFunction.AddressUser(userAddress));
		user.setAvatarPath(avatarPath);
		user.setDateOfBirth(Timestamp.valueOf(request.getParameter("dateOfBirth1").concat(" 00:00:00.0")));
		user.setJoinDate(Timestamp.valueOf(request.getParameter("joinDate1").concat(" 00:00:00.0")));
		if (checkbox != null) {
			user.setPassword(bcyptPasswordEncoder.encode(request.getParameter("passwordUser")));
		}
		if (userService.update1(user)) {
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			return "redirect:/admin/user/" + user.getRole().getRoleId();
		}
		if (!"".equals(avatarPath)) {
			UploadFile.del(avatarPath, request);
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		return "admin.user.edit";
	}
}
