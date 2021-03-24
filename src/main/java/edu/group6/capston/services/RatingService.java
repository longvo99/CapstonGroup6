package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.dtos.LocationDTO;;

public interface RatingService {
	List<LocationDTO> findAllRatingLocation();
}
