package edu.group6.capston.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
	private double currentPrice;
	@Column
	private int quantity;
	@Column
	private String note;
	@Column
	private int productId;
	@Column
	private int productComboId;
	@ManyToOne
	@JoinColumn(name = "orderId")
	private Orders orders;
}
