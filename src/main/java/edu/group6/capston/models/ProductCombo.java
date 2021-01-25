package edu.group6.capston.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductCombo {
	private int productComboId;
	private String comboName;
	private int orderCount;
	private String rateDiscount;
	private String description;
	private int productImageId;
}
