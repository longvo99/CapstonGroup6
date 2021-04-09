package edu.group6.capston.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserAddress {
	private String stress;
	private String city;
	private String district;
	private String ward;
	private String phone;
	private String note;
	public UserAddress(String stress, String city, String district, String ward) {
		super();
		this.stress = stress;
		this.city = city;
		this.district = district;
		this.ward = ward;
	}
}
