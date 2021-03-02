package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.LocationVideo;;

public interface LocationVideoService {
	List<LocationVideo> findAll();
	boolean save(LocationVideo LocationVideo);
	boolean update(LocationVideo LocationVideo);
	//LocationVideo findUserId(int id);
	boolean delete(Integer id);
}
