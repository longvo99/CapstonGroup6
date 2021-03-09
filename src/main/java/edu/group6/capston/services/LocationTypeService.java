package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.LocationType;

public interface LocationTypeService {
	List<LocationType> findAll();
	boolean save(LocationType locationType);
	boolean update(LocationType locationType);
	boolean delete(Integer id);
}
