
package edu.group6.capston.mail;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.group6.capston.utils.GlobalsConstant;

@Controller
public class MainApp {

	@Autowired
	MessageSource messageSource;

	@PostMapping("/mail")
	public String index(@RequestParam("tieude") String tieude, @RequestParam("email") String email,
			@RequestParam("message") String noidung, RedirectAttributes rd) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		MailSender mailSender = (MailSender) context.getBean("mailSender2");
		System.out.println("Sending text...");
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("haintde130138@gmail.com");
		message.setTo(email);
		message.setSubject(tieude);
		message.setText(noidung);
		// sending message
		try {
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println("Error!");
			context.close();
			rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
			return "redirect:/admin/location/index";
		}
		System.out.println("Sending text done!");
		context.close();
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("success", null, Locale.getDefault()));
		return "redirect:/admin/location/index";

	}
}
