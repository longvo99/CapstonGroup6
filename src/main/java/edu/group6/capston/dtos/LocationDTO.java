package edu.group6.capston.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LocationDTO {
	private int locationId;
	private String locationName;
	private String address;
	private String openTime;
	private String closeTime;
	private Integer reviewCount;
	private Integer locationCategoryId;
	private String locationCategoryName;
	private Integer locationTypeId;
	private String locationTypeName;
	private String ward;
	private String district;
	private String city;
	private String country;
	private Integer categoryId;
	private Integer discountId;
	private Integer productId;
	private Integer ratingId;
	private Float ratingAvgPoint;
	
}
