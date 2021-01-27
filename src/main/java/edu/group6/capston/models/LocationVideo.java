package edu.group6.capston.models;

import javax.persistence.Column;
import javax.persistence.Entity;
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
	@Column
	private int locationVideoId;
	@Column
	private String locationVideoPath;
	@Column
	private String locationVideoAtl;
	
}
