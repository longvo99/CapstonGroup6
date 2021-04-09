package edu.group6.capston.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LocationDTO {
	private int discountId;
	private int locationId;
	private String locationName;
	private String openTime;
	private String closeTime;
	private Integer reviewCount;
	private String locationCategoryName;
	private String locationTypeName;
	private String mediaPath;
	private double point;
	private float minPrice;
	private float maxPrice;
	public LocationDTO(int locationId, String locationName, String mediaPath, double point) {
		super();
		this.locationId = locationId;
		this.locationName = locationName;
		this.mediaPath = mediaPath;
		this.point = point;
	}
	public LocationDTO(int discountId, int locationId, String locationName, String openTime, String closeTime,
			Integer reviewCount, String locationCategoryName, String locationTypeName, String mediaPath) {
		super();
		this.discountId = discountId;
		this.locationId = locationId;
		this.locationName = locationName;
		this.openTime = openTime;
		this.closeTime = closeTime;
		this.reviewCount = reviewCount;
		this.locationCategoryName = locationCategoryName;
		this.locationTypeName = locationTypeName;
		this.mediaPath = mediaPath;
	}
	public LocationDTO(int locationId, double point) {
		super();
		this.locationId = locationId;
		this.point = point;
	}
	public LocationDTO(int locationId, float minPrice, float maxPrice) {
		super();
		this.locationId = locationId;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
	}
	
	public LocationDTO(int locationId, String locationName, String openTime, String closeTime,
			Integer reviewCount, String locationCategoryName, String locationTypeName, String mediaPath) {
		super();
		this.locationId = locationId;
		this.locationName = locationName;
		this.openTime = openTime;
		this.closeTime = closeTime;
		this.reviewCount = reviewCount;
		this.locationCategoryName = locationCategoryName;
		this.locationTypeName = locationTypeName;
		this.mediaPath = mediaPath;
	}
	
}
