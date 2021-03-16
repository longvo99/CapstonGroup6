package edu.group6.capston.models;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

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

//	@Transient
//	public List<GrantedAuthority> getAuthorities() {
//		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
//		for (Role usersRoles : role) {
//			authorities.add(new SimpleGrantedAuthority(usersRoles.get.getName()));
//		}
//		return authorities;
//	}

}
