package edu.group6.capston.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name = "LocationCategories")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class LocationCategories{
	/**
	 * 
	 */
	@Id
	@GeneratedValue
	@Column(name = "LocationCategoryId")
	private int locationCategoryId;
	@Column
	private String locationCategoryName;
	@Column(nullable = true)
	private int parentId;
	@Column(nullable = true)
	private String categoryName;
}
