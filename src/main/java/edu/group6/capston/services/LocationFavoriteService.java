package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.LocationFavorites;

public interface LocationFavoriteService {
	LocationFavorites findLocationFavorites(int locationId, int userId);
	boolean save(int locationId, int userId);
	boolean delete(LocationFavorites locationFavorite);
	List<LocationFavorites> findLocationFavorite(int userId);
	LocationFavorites findLocationFavorite(int userId, int locationId);
}
