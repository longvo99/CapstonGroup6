package edu.group6.capston.utils;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class UploadFile {
	
	@Autowired 
	public ServletContext servletContext; 
	
	public static String upload(MultipartFile mtf, HttpServletRequest request)
			throws IllegalStateException, IOException {
		if (!"".equals(mtf.getOriginalFilename())) {
			String webPath = request.getServletContext().getRealPath("");
			String dirPath = webPath + GlobalsConstant.DIR_UPLOAD;
			if (!new File(dirPath).exists()) {
				new File(dirPath).mkdir();
			}
			String fileName = rename(mtf.getOriginalFilename());
			String pathFile = dirPath + File.separator + fileName;
			mtf.transferTo(new File(pathFile));
			return fileName;
		}
		return "";
	}
	
	public static void del(String picture, HttpServletRequest request) {
		if(!"".equals(picture)) {
			String filePath = getDirPath(request) + picture;
			File file = new File(filePath);
			file.delete();
		}
	}
	
	public static String getDirPath(HttpServletRequest request) {
		return request.getServletContext().getRealPath("") + GlobalsConstant.DIR_UPLOAD + File.separator;
	}
	
	public String getDirPath() {
		return servletContext.getRealPath("") + GlobalsConstant.DIR_UPLOAD + File.separator;
	}
	
	public static String rename(String filename) {
		//lấy đuôi file
		FilenameUtils.getExtension(filename);
		//lấy tên file
		FilenameUtils.getBaseName(filename);
		String newFileName = "";
		if(!"".equals(filename)) {
			newFileName = FilenameUtils.getBaseName(filename) 
									+ "-" + System.nanoTime() 
									+ "." + FilenameUtils.getExtension(filename);
		}
		return newFileName;
	}
	
}
