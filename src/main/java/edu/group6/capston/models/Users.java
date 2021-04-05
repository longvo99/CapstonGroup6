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
import javax.persistence.UniqueConstraint;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Users", uniqueConstraints = @UniqueConstraint(columnNames = "username"))
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Users {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true)
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
	@Column(name = "isBanned")
	private boolean banned;
	@Column(name = "isHide")
	private boolean hide;
	@ManyToOne
	@JoinColumn(name = "roleId")
	private Role role;
	public Users(String username, String contactName, String contactEmail, Timestamp joinDate, boolean banned,
			boolean hide, Role role) {
		super();
		this.username = username;
		this.contactName = contactName;
		this.contactEmail = contactEmail;
		this.joinDate = joinDate;
		this.banned = banned;
		this.hide = hide;
		this.role = role;
	}
	public Users(int userId) {
		super();
		this.userId = userId;
	}
<<<<<<< Updated upstream
=======
	

>>>>>>> Stashed changes
}
