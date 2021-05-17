package edu.group6.capston.dtos;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CommentDTO {
	private String title;
	private String content;
	private MultipartFile images;
	private float location;
	private float price;
	private float quality;
	private float service;
	private float space;
	private double avgPoint;
	public CommentDTO(String content, double avgPoint) {
		super();
		this.content = content;
		this.avgPoint = avgPoint;
	}
	public CommentDTO(String title, String content, MultipartFile images, float location,
			float price, float quality, float service, float space) {
		super();
		this.title = title;
		this.content = content;
		this.images = images;
		this.location = location;
		this.price = price;
		this.quality = quality;
		this.service = service;
		this.space = space;
	}
}
