package edu.group6.capston.models;

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
@Table(name = "LocationFavorites")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class LocationFavorites{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int id;
	@ManyToOne
	@JoinColumn(name = "LFuserId")
	private Users user;
	@ManyToOne
	@JoinColumn(name = "LFlocationId")
	private Location location;
	public LocationFavorites(Users user, Location location) {
		super();
		this.user = user;
		this.location = location;
	}
}
