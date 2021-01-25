package edu.group6.capston.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class RatingVideo {
	private int ratingVideoId;
	private String videoPath;
	private String videoAlt;
}
