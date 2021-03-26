package edu.group6.capston.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ComboDetailDTO {
	
	private int productId;
	private int productComboId;
	private String comboName;
	private int orderCount;
	private int rateDiscount;
	private String description;
	private String comboImagePath;
	
	private String productName;
	private String productImagePath;
	private float price;
	
	public ComboDetailDTO(int productComboId, String comboName, int orderCount, int rateDiscount, String description,
			String imagePath) {
		super();
		this.productComboId = productComboId;
		this.comboName = comboName;
		this.orderCount = orderCount;
		this.rateDiscount = rateDiscount;
		this.description = description;
		this.comboImagePath = imagePath;
	}

	public ComboDetailDTO(int productId, int productComboId, String productName, String productImagePath,
			float price) {
		super();
		this.productId = productId;
		this.productComboId = productComboId;
		this.productName = productName;
		this.productImagePath = productImagePath;
		this.price = price;
	}
}
