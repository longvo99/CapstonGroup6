package edu.group6.capston.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Comment {
	private int commentId;
	private String title;
	private String currentTime;
	private String textContent;
	private int parentCommentId;
	private int locationId;
	private int userId;
}
