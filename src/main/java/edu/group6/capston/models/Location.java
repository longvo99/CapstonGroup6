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
@Table(name = "Locations")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Location{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int locationId;
	@Column
	private String locationName;
	@Column
	private String address;
	@Column
	private String openTime;
	@Column
	private String closeTime;
	@Column
	private int reviewCount;
	@ManyToOne
	@JoinColumn(name = "LocationCategoryId")
	private LocationCategories locationCategories;
	@ManyToOne
	@JoinColumn(name = "locationTypeId")
	private LocationTypes locationTypies;
	@Column
	private String ward;
	@Column
	private String district;
	@Column
	private String city;
	@Column
	private String country;
	@Column
	private int categoryId;
	@Column
	private int discountId;
	@Column
	private int productId;
	@Column
	private int ratingId;
	
}
