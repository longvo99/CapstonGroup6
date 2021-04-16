package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.models.Location;;

public interface LocationService {
	List<Location> findAll();
	boolean save(Location location);
	boolean update(Location location);
	boolean delete(Location location);
	Location findLocationId(int id);
	long locationCount();
	List<String> search(String keyword);
	List<LocationDTO> findTopNewLocationNew(int maxResults);
	List<LocationDTO> findTopRate();
	List<LocationDTO> findTopDiscount();
	List<LocationDTO> findLocationByCategoryId(int categoryId);
	List<Location> findAllByUserId(int userId);
	int updateImage(Location location);
	List<Location> findAllByCategory(Integer categoryId);
	List<LocationDTO> searchLocation(String productName);
	List<Location> findImageLocation();
	List<Location> unapprovedLocationList();
}
