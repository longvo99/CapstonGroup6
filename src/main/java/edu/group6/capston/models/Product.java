package edu.group6.capston.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Product {
	private int productId;
	private String productName;
	private String price;
	private String describe;
	private String orderCount;
	private int productImageId;
	private int productCategoryId;
	private int discountId;
}
