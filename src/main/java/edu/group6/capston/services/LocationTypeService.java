package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.LocationTypes;;

public interface LocationTypeService {
	List<LocationTypes> findAll();
	boolean save(LocationTypes locationType);
	boolean update(LocationTypes locationType);
	boolean delete(Integer id);
	LocationTypes findUserId(int id);
}
