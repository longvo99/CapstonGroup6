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
@Table(name = "LocationCategory")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class LocationCategory{
	/**
	 * 
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "CategoryId")
	private int CategoryId;
	@Column
	private String lCategoryName;
	@Column
	private int parentId;
}
