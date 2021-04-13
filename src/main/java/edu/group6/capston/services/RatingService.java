package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.dtos.CommentDTO;
import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.models.Rating;;

public interface RatingService {
	List<LocationDTO> findAllRatingLocation();
	boolean save(Rating rate);
	List<CommentDTO> findAVGRating(Integer locationId);
}
