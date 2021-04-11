package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.LocationFavoriteDAO;
import edu.group6.capston.models.LocationFavorites;
import edu.group6.capston.services.LocationFavoriteService;

@Service
public class LocationFavariteServiceImpl implements LocationFavoriteService {
	
	@Autowired
	private LocationFavoriteDAO locationFavoriteDAO;
	
	@Override
	public LocationFavorites findLocationFavorites(int locationId, int userId) {
		return locationFavoriteDAO.findLocationFavorites(locationId, userId);
	}

	@Override
	public boolean save(int locationId, int userId) {
		if(locationFavoriteDAO.save(locationId, userId))
			return true;
		return false;
	}

	@Override
	public boolean delete(LocationFavorites locationFavorite) {
		if(locationFavoriteDAO.delete(locationFavorite))
			return true;
		return false;
	}
	
	@Override
	public List<LocationFavorites> findLocationFavorite(int userId) {
		return locationFavoriteDAO.findLocationFavorite(userId);
	}

	@Override
	public LocationFavorites findLocationFavorite(int userId, int locationId) {
		return locationFavoriteDAO.findLocationFavorites(userId, locationId);
	}
}
