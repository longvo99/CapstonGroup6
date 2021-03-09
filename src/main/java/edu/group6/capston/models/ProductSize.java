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
@Table(name = "ProductSize")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductSize {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int productId;
	@Column
	private int sizeId;
}
