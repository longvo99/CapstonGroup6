package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.Location;
import edu.group6.capston.models.LocationFavorites;;

public interface LocationService {
	List<Location> findAll();
	boolean save(Location location);
	boolean update(Location location);
	boolean delete(Location location);
	Location findLocationId(int id);
	long locationCount();
	List<LocationFavorites> findLocationFavorite(int userId);
	List<String> search(String keyword);
	
}
