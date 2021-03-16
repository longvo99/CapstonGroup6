package edu.group6.capston.controller.auths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.group6.capston.services.UserService;

@Controller
@RequestMapping("auth")
public class LoginController {
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login")
	public String LoginAdmin() {
		/*
		Users user = new Users(0, "admin4", "123456", "abd", "aa", "a", "a", "nam", Timestamp.valueOf("2021-02-02 08:08:00"), "aaa", "aaa", Timestamp.valueOf("2021-02-02 08:08:00"), false, false, new Role("ADMIN", null));
		if(userService.save(user)) {
			System.out.println("av");
		}
		*/
		return "auths.admin.login";
	}

	/*
	 * @PostMapping("login") public String
	 * LoginAdmin(@Valid @ModelAttribute("users") Users users, HttpSession session)
	 * { if(userService.getProfile(users) != null) {
	 * 
	 * } return "auth.login"; }
	 */

}
