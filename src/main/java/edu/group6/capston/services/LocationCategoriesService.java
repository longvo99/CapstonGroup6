package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.LocationCategory;;

public interface LocationCategoriesService {
	List<LocationCategory> findAll();
	LocationCategory findNameCategory(Integer valueOf);
}
