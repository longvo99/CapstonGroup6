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
@Table(name = "LocationType")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class LocationType {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int locationTypeId;
	@Column
	private String locationTypeName;
}
