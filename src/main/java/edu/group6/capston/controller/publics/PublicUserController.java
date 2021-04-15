package edu.group6.capston.controller.publics;

import java.io.IOException;
import java.sql.Timestamp;
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
@RequestMapping("user")
public class PublicUserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	MessageSource messageSource;

	@Autowired
	RoleService roleService;

	@RequestMapping(value = "/profile/{username}")
	public String profile(@PathVariable String username, Model model) {
		Users user =  userService.findByUsername(username);
		model.addAttribute("user", user);
		model.addAttribute("userAddress", GlobalsFunction.AddressUser(user.getContactAddress()));
		return "admin.user.edit";
	}

	@GetMapping(value = "/edit/{userId}")
	public String edit(@PathVariable Integer userId, Model model) {
		Users user =  userService.findOneByUserId(userId);
		model.addAttribute("user", userService.findOneByUserId(userId));
		model.addAttribute("userAddress", GlobalsFunction.AddressUser(user.getContactAddress()));
		return "admin.user.edit";
	}

	@PostMapping(value = "/edit")
	public String Edit(@Valid @ModelAttribute Users user,@Valid @ModelAttribute("userAddress") UserAddress userAddress, BindingResult br, HttpServletRequest request,
			MultipartFile file, RedirectAttributes rd, @RequestParam(required = false) String checkbox, Model model)
			throws IllegalStateException, IOException {
		if (br.hasErrors()) {
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
		user.setAvatarPath(avatarPath);
		user.setDateOfBirth(Timestamp.valueOf(request.getParameter("dateOfBirth1").concat(" 00:00:00.0")));
		user.setJoinDate(Timestamp.valueOf(request.getParameter("joinDate1").concat(" 00:00:00.0")));
		user.setContactAddress(GlobalsFunction.AddressUser(userAddress));
		if (checkbox != null) {
			user.setPassword(request.getParameter("passwordUser"));
		}
		if (userService.update(user)) {
			System.out.println(UploadFile.getDirPath(request));
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			return "redirect:/profile/" + user.getUsername();
		}
		if (!"".equals(avatarPath)) {
			UploadFile.del(avatarPath, request);
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		return "admin.user.edit";
	}
}
