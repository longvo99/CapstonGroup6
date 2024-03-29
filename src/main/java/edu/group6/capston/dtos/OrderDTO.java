package edu.group6.capston.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderDTO {
	private int userId;
	private String productId;
	private String productComboId;
	private String name;
	private double price;
	private int quantity;
	private int rateDiscount;
	private String imagePath;
	private int locationId;
	
	public OrderDTO(String name, double price) {
		super();
		this.name = name;
		this.price = price;
	}
	
	public OrderDTO(int locationId, String name, float price) {
		super();
		this.locationId = locationId;
		this.name = name;
		this.price = price;
	}

	public OrderDTO(int locationId, String name, int rateDiscount,  double price) {
		super();
		this.locationId = locationId;
		this.name = name;
		this.rateDiscount = rateDiscount;
		this.price = price;
	}

	public OrderDTO(int userId, String productId, String name, double price, int quantity, int locationId) {
		super();
		this.userId = userId;
		this.productId = productId;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.locationId = locationId;
	}

	public OrderDTO(String name, String imagePath) {
		super();
		this.name = name;
		this.imagePath = imagePath;
	}

	public OrderDTO(Integer productId, Integer productComboId, double price, int quantity) {
		super();
		this.productId = String.valueOf(productId);
		this.productComboId = String.valueOf(productComboId);
		this.price = price;
		this.quantity = quantity;
	}

	public OrderDTO(int userId, String name, String imagePath) {
		super();
		this.userId = userId;
		this.name = name;
		this.imagePath = imagePath;
	}
}
