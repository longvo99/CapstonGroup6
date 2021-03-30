package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.models.Rating;;

public interface RatingService {
	List<LocationDTO> findAllRatingLocation();
	boolean save(Rating rate);
}
