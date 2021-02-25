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
@Table(name = "LocationCategories")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class LocationCategories{
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
	public int getLocationCategoryId() {
		return locationCategoryId;
	}
	public void setLocationCategoryId(int locationCategoryId) {
		this.locationCategoryId = locationCategoryId;
	}
	public String getLocationCategoryName() {
		return locationCategoryName;
	}
	public void setLocationCategoryName(String locationCategoryName) {
		this.locationCategoryName = locationCategoryName;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	
}
