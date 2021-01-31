package edu.group6.capston.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Roles")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Roles {
	@Id
	@Column
	private int roleId;
	@Column
	private String roleName;
}
