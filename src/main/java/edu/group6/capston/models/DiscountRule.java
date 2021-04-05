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
@Table(name = "DiscountRule")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class DiscountRule {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ruleId")
	private int ruleId;

	@Column(name = "ruleContent")
	private String ruleContent;

	public DiscountRule(int ruleId) {
		super();
		this.ruleId = ruleId;
	}
	
}
