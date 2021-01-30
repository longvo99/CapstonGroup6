package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.models.Location;;

public interface LocationService {
	List<LocationDTO> findAll();
	boolean save(Location location);
	boolean update(Location location);
	boolean delete(Location location);
	Location findUserId(int id);
}
