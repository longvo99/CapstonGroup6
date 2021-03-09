package edu.group6.capston.models;

import java.sql.Timestamp;

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
@Table(name = "Orders")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Orders {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int orderId;
	@Column
	private Timestamp orderTime;
	@ManyToOne
	@JoinColumn(name = "orderStatusId")
	private OrderStatus orderStatus;
	@ManyToOne
	@JoinColumn(name = "userOrderId")
	private User user;
	@Column
	private String totalPrice;
	@Column
	private String note;
	@Column
	private String shipDistance;
	@Column
	private String shipPrice;
	@Column
	private String recieverAddress;
}
