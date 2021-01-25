package edu.group6.capston.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Discounts {
	private int discountId;
	private String discountTitle;
	private String codeDiscount;
	private String rateDiscount;
	private String description;
	private String startDate;
	private String endDate;
	private String minimumOrder;
	private int discountVideoId;
}
