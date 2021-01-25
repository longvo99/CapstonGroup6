package edu.group6.capston.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Location {
	private int locationId;
	private String locationName;
	private String address;
	private String openTime;
	private String closeTime;
	private int reviewCount;
	private String ward;
	private String district;
	private String city;
	private String country;
	private int categoryId;
	private int locationTypeId;
	private int locationVideoId;
	private int productId;
	private int ratingId;
	private int discountId;
}
