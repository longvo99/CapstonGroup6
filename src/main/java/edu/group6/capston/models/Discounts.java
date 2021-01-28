package edu.group6.capston.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "Discounts")
public class Discounts {
	@Id
	@Column(name="discountId")
	private int discountId;
	@Column
	private String discountTitle;
	@Column
	private String codeDiscount;
	@Column
	private String rateDiscount;
	@Column
	private String description;
	@Column
	private String startDate;
	@Column
	private String endDate;
	@Column
	private String minimumOrder;
	@Column
	private int discountVideoId;
}
