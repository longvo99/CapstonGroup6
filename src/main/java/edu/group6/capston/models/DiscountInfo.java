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
@Table(name = "DiscountInfo")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class DiscountInfo {
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int discountId;
	@Column
	private String title;
	@Column
	private String description;
	@Column
	private int rateDiscount;
	@Column
	private String value;
	@Column
	private String mediaPath;
	@Column
	private String startDate;
	@Column
	private String endDate;
	@ManyToOne
	@JoinColumn(name = "userId")
	private Users users;
	@Column
	private int limitedUse;
	@Column
	private int limitedPerUser;
	@ManyToOne
	@JoinColumn(name = "ruleId")
	private DiscountRule discountRule;
	@Column
	private int valueRule;
	@ManyToOne
	@JoinColumn(name = "locationId")
	private Location location;
	
}
