package edu.group6.capston.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

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
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int discountId;
	@Column
	private String title;
	@Column
	private String code;
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
<<<<<<< Updated upstream
	private int limitedPerUse;
=======
	private int limitedPerUser;
	@ManyToOne
	@JoinColumn(name = "ruleId")
	private DiscountRule discountRule;
	@Column
	private int valueRule;
>>>>>>> Stashed changes
	@ManyToOne
	@JoinColumn(name = "locationId")
	private Location location;
	
}
