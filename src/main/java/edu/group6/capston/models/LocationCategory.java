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
@Table(name = "LocationCategory")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class LocationCategory{
	/**
	 * 
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "LocationCategoryId")
	private int locationCategoryId;
	@Column
	private String locationCategoryName;
	@Column(nullable = true)
	private int parentId;
	@Column(nullable = true)
	private String categoryName;
	
	
}
