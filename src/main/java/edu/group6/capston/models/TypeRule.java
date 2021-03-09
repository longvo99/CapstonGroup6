package edu.group6.capston.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "TypeRule")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class TypeRule {
	@Column
	private int discountId;
	@Column
	private int ruleId;
}
