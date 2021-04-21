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
	private Integer productId;
	@Column
	private String name;
	@Column
	private float price;
	@Column
	private String description;
	@Column
	private int orderCount;
	@Column
	private String imagePath;
	@ManyToOne
	@JoinColumn(name = "productCategoryId")
	private ProductCategory productCategory;
	@ManyToOne
	@JoinColumn(name = "locationId")
	private Location location;
	public Product(int productId) {
		super();
		this.productId = productId;
	}
	
	public Product(int locationId, String name, String imagePath) {
		super();
		this.location.setLocationId(locationId);
		this.name = name;
		this.imagePath = imagePath;
	}
	
	
}
