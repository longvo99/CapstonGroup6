package edu.group6.capston.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name = "LocationVideo")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class LocationVideo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int locationVideoId;
	@Column
	private String locationVideoPath;
	@Column
	private int locationId;
	
	public LocationVideo(String locationVideoPath, int locationId) {
		super();
		this.locationVideoPath = locationVideoPath;
		this.locationId = locationId;
	}
	
}
