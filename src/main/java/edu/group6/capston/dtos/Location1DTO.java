package edu.group6.capston.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Location1DTO {
	private int locationId;
	private String locationName;
	private String address;
	private String ward;
	private String district;
	private String city;
	private String country;
	private String openTime;
	private String closeTime;
	private Integer reviewCount;
	private String mediaPath;
	private Integer categoryId;
	private Integer locationTypeId;
	private Integer userId;
	private Float ratingAvgPoint;
	
}
