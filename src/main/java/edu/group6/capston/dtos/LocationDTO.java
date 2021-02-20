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
	
	public LocationDTO(int locationId, String locationName, String address, String openTime, String closeTime,
			int reviewCount, int locationCategoryId, int locationTypeId, String ward, String district, String city,
			String country, int categoryId, int discountId, int locationVideoId, int productId, int ratingId) {
		super();
		this.locationId = locationId;
		this.locationName = locationName;
		this.address = address;
		this.openTime = openTime;
		this.closeTime = closeTime;
		this.reviewCount = reviewCount;
		this.locationCategoryId = locationCategoryId;
		this.locationTypeId = locationTypeId;
		this.ward = ward;
		this.district = district;
		this.city = city;
		this.country = country;
		this.categoryId = categoryId;
		this.discountId = discountId;
		this.locationVideoId = locationVideoId;
		this.productId = productId;
		this.ratingId = ratingId;
	}
	
	
}
