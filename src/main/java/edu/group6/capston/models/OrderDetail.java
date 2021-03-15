package edu.group6.capston.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "OrderDetail")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int orderDetailId;
	@Column
	private String currentPrice;
	@Column
	private String quantity;
	@Column
	private String note;
	@Column
	private int productId;
	@Column
	private boolean isCompo;
	@Column
	private int orderId;
}