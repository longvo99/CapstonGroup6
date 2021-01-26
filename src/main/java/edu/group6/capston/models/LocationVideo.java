package edu.group6.capston.models;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "LocationVideo")
public class LocationVideo {
	private int locationVideoId;
	private String lVideoPath;
	private String lVideoAlt;
}
