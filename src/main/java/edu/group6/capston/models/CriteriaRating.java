package edu.group6.capston.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CriteriaRating {
	private int criteriaRatingId;
	private int point;
	private int criteriaId;
}
