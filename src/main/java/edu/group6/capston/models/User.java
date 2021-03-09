package edu.group6.capston.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "User")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int userId;
	@Column
	private String username;
	@Column
	private String password;
	@Column
	private String fullname;
	@Column
	private String phone;
	@Column
	private String email;
	@Column
	private String address;
	@Column
	private String gender;
	@Column
	private Date dateOfBirth;
	@Column
	private String avatarPath;
	@Column
	private String avatarAlt;
	@Column
	private String description;
	@Column
	private Date joinDate;
	@Column
	private boolean banned;
	@Column
	private boolean hide;
	@ManyToOne
	@JoinColumn(name = "roleId")
	private Role roles;
}
