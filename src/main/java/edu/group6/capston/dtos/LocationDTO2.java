package edu.group6.capston.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LocationDTO2 {
	private String locationName;
	private String address;
	private long totalOrder;
	private double totalPrice;
	private double totalShip;
}
