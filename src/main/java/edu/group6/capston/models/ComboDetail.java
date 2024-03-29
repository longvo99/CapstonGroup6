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
@Table(name = "ComboDetail")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ComboDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int comboDetailId;
	@ManyToOne
	@JoinColumn(name = "productId")
	private Product product;
	@ManyToOne
	@JoinColumn(name = "productComboId")
	private ProductCombo productCombo;
}
