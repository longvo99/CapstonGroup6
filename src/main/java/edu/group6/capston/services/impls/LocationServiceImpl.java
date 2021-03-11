package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.LocationDAO;
import edu.group6.capston.models.Location;
import edu.group6.capston.services.LocationService;

@Service
public class LocationServiceImpl implements LocationService {
	@Autowired
	private LocationDAO LocationDAO;
	
	@Override
	public List<Location> findAll() {
		return LocationDAO.findAll();
	}

	@Override
	public boolean save(Location location) {
		if(LocationDAO.save(location))
			return true;
		return false;
	}

	@Override
	public boolean update(Location location) {
		if(LocationDAO.update(location))
			return true;
		return false;
	}

	@Override
	public boolean delete(Location location) {
		if(LocationDAO.delete(location))
			return true;
		return false;
	}

	@Override
	public Location findLocationId(int id) {
		return LocationDAO.findById(id);
	}

	@Override
	public long locationCount() {
		return 0;
	}

}
