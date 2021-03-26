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
@Table(name = "ProductCombo")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductCombo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int productComboId;
	@Column
	private String comboName;
	@Column
	private int orderCount;
	@Column
	private int rateDiscount;
	@Column
	private String description;
	@Column
	private String imagePath;
}
