package edu.group6.capston.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.UserDAO;
import edu.group6.capston.models.LocationFavorites;
import edu.group6.capston.models.Users;

public class GlobalsFunction {
	
	@Autowired
	private static UserDAO userDAO;
	
	public static String checkUsername(String username) {
		System.out.println("abc: " + username);
		username = "admin";
		Users user = userDAO.findByUsername(username);
		if(user != null) {
			Random rd = new Random();
			username = username + rd.nextInt(100);  
		}else {
			return username;
		}
		return checkUsername(username);
	}
	
	
	public static String[] splitPathMedia(String pathMedia){
		String[] parts = pathMedia.split(";");
		return parts;
	}
	
	public static String createUsernameEmail(String email) {
		return email.substring(0, email.lastIndexOf("@"));
	}
	
	public static Timestamp getCurrentTime() {
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date(System.currentTimeMillis());
		return Timestamp.valueOf(formatter.format(date));
	}
	
	public static List<LocationFavorites> changeImageLocation(List<LocationFavorites> list){
		String image = "";
		for (LocationFavorites locationFavorites : list) {
			image = locationFavorites.getLocation().getMediaPath();
			String[] mediaPath = splitPathMedia(image);
			image = mediaPath[0];
			locationFavorites.setLocation(locationFavorites.getLocation()).setMediaPath(image));
		}
	}
	
}
