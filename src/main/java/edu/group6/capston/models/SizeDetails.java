package edu.group6.capston.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SizeDetails {
	private int sizeDetailId;
	private String sizeName;
	private String priceBonus;
	private String note;
}
