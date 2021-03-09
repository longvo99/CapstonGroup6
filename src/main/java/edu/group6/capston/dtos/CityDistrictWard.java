package edu.group6.capston.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CityDistrictWard {
	private String id;
	private String name;
	private String parent_id;
}
