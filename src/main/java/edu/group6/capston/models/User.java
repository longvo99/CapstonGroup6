package edu.group6.capston.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class User {
	private int userId;
	private String username;
	private String password;
	private String contactName;
	private String contactPhone;
	private String contactEmail;
	private String contactAddress;
	private String gender;
	private String dateOfBirth;
	private String avatarPath;
	private String avatarAlt;
	private String discription;
	private String joinDate;
	private String isBanned;
	private String isHide;
	private int roleId;
}
