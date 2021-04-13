package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.RatingDAO;
import edu.group6.capston.dtos.CommentDTO;
import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.models.Rating;
import edu.group6.capston.services.RatingService;

@Service
public class RatingServiceImpl implements RatingService {
	@Autowired
	private RatingDAO ratingDAO;

	@Override
	public List<LocationDTO> findAllRatingLocation() {
		return ratingDAO.findAllRatingLocation();
	}

	@Override
	public boolean save(Rating rate) {
		return ratingDAO.save(rate);
	}

	@Override
	public List<CommentDTO> findAVGRating(Integer locationId) {
		return ratingDAO.findAVGRating(locationId);
	}
	
}
