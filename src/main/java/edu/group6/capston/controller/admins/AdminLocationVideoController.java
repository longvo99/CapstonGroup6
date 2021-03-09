package edu.group6.capston.controller.admins;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.group6.capston.dtos.ImageUpload;
import edu.group6.capston.models.LocationVideo;
import edu.group6.capston.services.LocationVideoService;
import edu.group6.capston.utils.GlobalsConstant;
import edu.group6.capston.utils.UploadFile;

@Controller
@RequestMapping("admin/locationVideo")
public class AdminLocationVideoController {

	@Autowired
	MessageSource messageSource;

	@Autowired
	private LocationVideoService locationVideoService;

	@RequestMapping(value = "/image/{locationId}")
	public String LocationVideo(@PathVariable Integer locationId, Model model) {
		model.addAttribute("locationVideoList", locationVideoService.findByIdLocation(locationId));
		model.addAttribute("locationId", locationId);
		return "admin.location.image";
	}

	@PostMapping(value = "/edit/{locationId}")
	public String Edit(@PathVariable Integer locationId, @Valid @ModelAttribute("imageUpload") ImageUpload imageUpload,
			BindingResult br, RedirectAttributes rd, HttpServletRequest request, MultipartFile file, Model model)
			throws IllegalStateException, IOException {
		List<LocationVideo> listlocationVideo = locationVideoService.findByIdLocation(locationId);
		List<MultipartFile> files = imageUpload.getImages();
		if (null != files && files.size() > 1 ) {
			System.out.println(files.size());
			System.out.println("abc " + files.get(0));
			for (LocationVideo locationVideo : listlocationVideo) {
				System.out.println(locationVideo.getLocationVideoPath());
				UploadFile.del(locationVideo.getLocationVideoPath(), request);
				locationVideoService.delete(locationVideo.getLocationVideoId());
			}
			for (MultipartFile multipartFile : files) {
				String fileName = UploadFile.upload(multipartFile, request);
				if (!"".equals(fileName)) {
					LocationVideo locationVideo = new LocationVideo(fileName, locationId);
					locationVideoService.save(locationVideo);
				}
			}
			rd.addFlashAttribute(GlobalsConstant.MESSAGE,
					messageSource.getMessage("success", null, Locale.getDefault()));
			rd.addFlashAttribute("success", true);
			return "redirect:/admin/locationVideo/image/" + locationId;
		}
		rd.addFlashAttribute(GlobalsConstant.MESSAGE, messageSource.getMessage("error", null, Locale.getDefault()));
		rd.addFlashAttribute("error", true);
		return "redirect:/admin/locationVideo/image/" + locationId;
	}

}
