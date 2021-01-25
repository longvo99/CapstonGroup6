package edu.group6.capston.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderDetails {
	private int orderDetailId;
	private String currentPrice;
	private String quantity;
	private String note;
	private int productId;
	private int productCompoId;
	private int orderId;
}
