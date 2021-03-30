package edu.group6.capston.dtos;

import java.util.List;

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
	private List<MultipartFile> images;
	private MultipartFile video;
	private float location;
	private float price;
	private float quality;
	private float service;
	private float space;
}
