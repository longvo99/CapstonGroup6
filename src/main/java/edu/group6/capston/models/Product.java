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
@Table(name = "Product")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int productId;
	@Column
	private String name;
	@Column
	private String price;
	@Column
	private String describe;
	@Column
	private String orderCount;
	@Column
	private String imagePath;
	@ManyToOne
	@JoinColumn(name = "productCategoryId")
	private ProductCategories productCategories;
	@Column
	private int locationId;
	
}
