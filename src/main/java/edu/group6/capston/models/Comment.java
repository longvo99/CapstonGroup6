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
@Table(name = "Comment")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int commentId;
	@Column
	private String title;
	@Column
	private String currentTime;
	@Column
	private String textContent;
	@Column
	private String mediaPath;
	@Column
	private int parentCommentId;
	@ManyToOne
	@JoinColumn(name = "locationId")
	private Location location;
	@ManyToOne
	@JoinColumn(name = "userId")
	private Users users;
	@Column
	private boolean status;
}
