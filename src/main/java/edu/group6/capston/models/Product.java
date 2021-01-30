package edu.group6.capston.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Entity
@Table(name = "Products")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Product {
	
	@Id
	@Column
	private int productId;
	@Column
	private String productName;
	@Column
	private String price;
	@Column
	private String describe;
	@Column
	private String orderCount;
	@Column
	private int productImageId;
	@Column
	private int productCategoryId;
	@Column
	private int discountId;
}
