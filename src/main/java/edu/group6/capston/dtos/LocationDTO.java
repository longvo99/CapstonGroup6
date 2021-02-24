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
	private int reviewCount;
	private int locationCategoryId;
	private String locationCategoryName;
	private int locationTypeId;
	private String locationTypeName;
	private String ward;
	private String district;
	private String city;
	private String country;
	private int categoryId;
	private int discountId;
	private int locationVideoId;
	private int productId;
	private int ratingId;
}
