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
@Table(name = "Criteria")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Criteria {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int criteriaId;
	@Column
	private String criteriaName;
	
}
