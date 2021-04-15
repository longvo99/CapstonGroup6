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
@Table(name = "DiscountLimitedUse")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class DiscountLimitedUse {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int discountLimitedUseId;
	@ManyToOne
	@JoinColumn(name = "discountId")
	private DiscountInfo discountInfo;
	@Column
	private int userId;
	@Column
	private int limitedPerUser;
	
	public DiscountLimitedUse(int discountId, int limitedPerUse) {
		super();
		this.discountInfo = new DiscountInfo(discountId);
		this.limitedPerUser = limitedPerUse;
	}

	public DiscountLimitedUse(int discountLimitedUseId, int discountId, int userId, int limitedPerUse) {
		super();
		this.discountLimitedUseId = discountLimitedUseId;
		this.discountInfo = new DiscountInfo(discountId);
		this.userId = userId;
		this.limitedPerUser = limitedPerUse;
	}
	
}
