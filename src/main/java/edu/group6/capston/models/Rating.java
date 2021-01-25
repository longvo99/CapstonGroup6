package edu.group6.capston.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Rating {
	private int ratingId;
	private String title;
	private String ratingTime;
	private String comment;
	private String likeCount;
	private int userId;
	private int criteriaRatingId;
	private int ratingVideoId;
}
