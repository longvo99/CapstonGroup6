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
<<<<<<< Updated upstream
	List<Location> findTopNewLocationNew();
	List<LocationDTO> findTopRate();
	List<LocationDTO> findTopDiscount();
=======
	Location findByUserId(int userId);
	List<Location> findAllByUserId(int userId);
	
>>>>>>> Stashed changes
}
