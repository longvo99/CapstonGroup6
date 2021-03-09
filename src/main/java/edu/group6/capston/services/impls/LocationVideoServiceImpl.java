package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.LocationVideoDAO;
import edu.group6.capston.models.LocationVideo;
import edu.group6.capston.services.LocationVideoService;

@Service
public class LocationVideoServiceImpl implements LocationVideoService {
	
	@Autowired
	private LocationVideoDAO locationVideoDAO;
	
	@Override
	public List<LocationVideo> findAll() {
		return locationVideoDAO.findAll();
	}

	@Override
	public boolean save(LocationVideo LocationTypies) {
		if(locationVideoDAO.save(LocationTypies))
			return true;
		return false;
	}

	@Override
	public boolean update(LocationVideo LocationTypies) {
		if(locationVideoDAO.update(LocationTypies))
			return true;
		return false;
	}

	@Override
	public boolean delete(Integer id) {
		if(locationVideoDAO.delete(id))
			return true;
		return false;
	}

	@Override
	public List<LocationVideo> findByIdLocation(int locationId) {
		return locationVideoDAO.findByIdLocation(locationId);
	}

	/*
	 * @Override public LocationVideo findUserId(int id) {
	 * if(locationVideoDAO.findUserId(id)) return true; return false; }
	 */
}
