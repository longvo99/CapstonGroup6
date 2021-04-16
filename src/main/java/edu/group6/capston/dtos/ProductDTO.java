package edu.group6.capston.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductDTO {
	private int locationId;
	private int productId;
	private String productName;
	private String imagePath;
	public ProductDTO(int locationId, String productName, String imagePath) {
		super();
		this.locationId = locationId;
		this.productName = productName;
		this.imagePath = imagePath;
	}
	public ProductDTO(int productId, String productName) {
		super();
		this.productId = productId;
		this.productName = productName;
	}
	
}
