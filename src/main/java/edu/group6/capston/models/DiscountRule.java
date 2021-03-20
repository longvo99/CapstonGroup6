package edu.group6.capston.models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*@Entity
@Table(name = "DiscountRule")
@AllArgsConstructor
@NoArgsConstructor
@Data*/
public class DiscountRule {
	/*
	 * @Id
	 * 
	 * @GeneratedValue(strategy = GenerationType.IDENTITY)
	 * 
	 * @Column(name = "ruleId") private int ruleId;
	 * 
	 * @Column(name = "ruleContent") private String ruleContent;
	 * 
	 * @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	 * 
	 * @JoinTable(name = "TypeRule", joinColumns = { @JoinColumn(name = "ruleId" )
	 * }, inverseJoinColumns = { @JoinColumn(name = "discountId") }) private
	 * Set<DiscountInfo> discountInfos = new HashSet<>();
	 */
}
