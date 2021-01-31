package edu.group6.capston.dtos;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserDTO {
	private int userId;
	private String username;
	private String password;
	private String fullname;
	private String phone;
	private String email;
	private String address;
	private String gender;
	private Date dateOfBirth;
	private String avatarPath;
	private String avatarAlt;
	private String description;
	private Date joinDate;
	private boolean banned;
	private boolean hide;
	private String roleName;
	
	
}
