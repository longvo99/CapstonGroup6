package edu.group6.capston.models;

import java.sql.Timestamp;

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
	private String contactName;
	@Column
	private String contactPhone;
	@Column
	private String contactEmail;
	@Column
	private String contactAddress;
	@Column
	private String gender;
	@Column
	private Timestamp dateOfBirth;
	@Column
	private String avatarPath;
	@Column
	private String description;
	@Column
	private Timestamp joinDate;
	@Column
	private boolean isBanned;
	@Column
	private boolean isHide;
	@ManyToOne
	@JoinColumn(name = "roleId")
	private Role role;
}
