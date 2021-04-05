package edu.group6.capston.utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< Updated upstream

import edu.group6.capston.daos.UserDAO;
import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.models.Location;
=======
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.UserDAO;
import edu.group6.capston.models.CustomUserDetails;
>>>>>>> Stashed changes
import edu.group6.capston.models.LocationFavorites;
import edu.group6.capston.models.Users;

public class GlobalsFunction {

	@Autowired
	private static UserDAO userDAO;

	public static String checkUsername(String username) {
		System.out.println("abc: " + username);
		username = "admin";
		Users user = userDAO.findByUsername(username);
		if (user != null) {
			Random rd = new Random();
			username = username + rd.nextInt(100);
		} else {
			return username;
		}
		return checkUsername(username);
	}

	public static String[] splitPathMedia(String pathMedia) {
		String[] parts = pathMedia.split(";");
		return parts;
	}

	public static String createUsernameEmail(String email) {
		return email.substring(0, email.lastIndexOf("@"));
	}

	public static Timestamp getCurrentTime() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date(System.currentTimeMillis());
		return Timestamp.valueOf(formatter.format(date));
	}
<<<<<<< Updated upstream

	public static List<LocationFavorites> changeImageLocationFavorites(List<LocationFavorites> list) {
		String image = "";
		for (LocationFavorites locationFavorites : list) {
			image = locationFavorites.getLocation().getMediaPath();
			String[] mediaPath = splitPathMedia(image);
			image = mediaPath[0];
			locationFavorites.getLocation().setMediaPath(image);
			locationFavorites.getLocation()
					.setCloseTime(locationFavorites.getLocation().getCloseTime().substring(0, 5));
			locationFavorites.getLocation().setOpenTime(locationFavorites.getLocation().getOpenTime().substring(0, 5));
		}
		return list;
	}

	public static List<Location> changeImageLocation(List<Location> list) {
		String image = "";
		for (Location location : list) {
			image = location.getMediaPath();
			String[] mediaPath = splitPathMedia(image);
			image = mediaPath[0];
			location.setMediaPath(image);
			location.setCloseTime(location.getCloseTime().substring(0, 5));
			location.setOpenTime(location.getOpenTime().substring(0, 5));
		}
		return list;
	}

	public static Location formatTime(Location location) {
		location.setCloseTime(location.getCloseTime().substring(0, 5));
		location.setOpenTime(location.getOpenTime().substring(0, 5));
		return location;
	}

	public static List<LocationDTO> changeImageTopLocation(List<LocationDTO> findTopRate) {
		String image = "";
		for (LocationDTO location : findTopRate) {
			image = location.getMediaPath();
			String[] mediaPath = splitPathMedia(image);
			image = mediaPath[0];
			location.setMediaPath(image);
			if (location.getOpenTime() != null || location.getCloseTime() != null) {
				location.setCloseTime(location.getCloseTime().substring(0, 5));
				location.setOpenTime(location.getOpenTime().substring(0, 5));
			}
		}
		return findTopRate;
	}

	public static String findDifference(String end_date) {

		// SimpleDateFormat converts the
		// string format to date object
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String result = "";
		// Try Block
		try {
			// parse method is used to parse
			// the text from a string to
			// produce the date
			Date d1 = sdf.parse(end_date);
			Date d2 = sdf.parse(String.valueOf(getCurrentTime()));
			
			// Calculate time difference
			// in milliseconds
			long difference_In_Time = d2.getTime() - d1.getTime();
			// Calculate time difference in
			// seconds, minutes, hours, years,
			// and days
			long difference_In_Minutes = (difference_In_Time / (1000 * 60)) % 60;

			long difference_In_Hours = (difference_In_Time / (1000 * 60 * 60)) % 24;

			long difference_In_Years = (difference_In_Time / (1000l * 60 * 60 * 24 * 365));

			long difference_In_Days = (difference_In_Time / (1000 * 60 * 60 * 24)) % 365;
			
			
			if(difference_In_Years > 0) {
				result = difference_In_Years + " năm trước";
			}else if(difference_In_Days < 365 && difference_In_Days > 0) {
				result = difference_In_Days + " ngày trước";
			}else if(difference_In_Hours < 24 && difference_In_Hours > 0) {
				result = difference_In_Hours + " giờ trước";
			}else {
				result = difference_In_Minutes + " phút trước";
			}
		}
		// Catch the Exception
		catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}

=======
	
	public static Users getUsers() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomUserDetails customUser = (CustomUserDetails) authentication.getPrincipal();
		return customUser.getUser();
	}
	
	/*
	 * public static List<LocationFavorites>
	 * changeImageLocation(List<LocationFavorites> list){ String image = ""; for
	 * (LocationFavorites locationFavorites : list) { image =
	 * locationFavorites.getLocation().getMediaPath(); String[] mediaPath =
	 * splitPathMedia(image); image = mediaPath[0];
	 * //locationFavorites.setLocation(locationFavorites.getLocation()).setMediaPath
	 * (image)); } }
	 */
	
>>>>>>> Stashed changes
}
