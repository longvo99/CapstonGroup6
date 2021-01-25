package edu.group6.capston.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductImages {
	private int productImageId;
	private String imagePath;
	private String imageAlt;
}
