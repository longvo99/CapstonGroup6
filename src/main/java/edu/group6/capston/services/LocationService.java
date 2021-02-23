package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.models.Location;;

public interface LocationService {
	List<LocationDTO> findAll();
	boolean save(LocationDTO location);
	boolean update(LocationDTO location);
	boolean delete(Location location);
	Location findUserId(int id);
}
