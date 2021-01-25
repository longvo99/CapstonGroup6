package edu.group6.capston.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Order {
	private int orderId;
	private String orderTime;
	private int orderStatusId;
	private int userId;
	private String totalPrice;
	private String note;
	private String shipDistance;
	private String shipPrice;
	private String recieverAddress;
}
