package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.LocationTypeDAO;
import edu.group6.capston.models.LocationType;
import edu.group6.capston.services.LocationTypeService;

@Service
public class LocationTypeServiceImpl implements LocationTypeService {
	
	@Autowired
	private LocationTypeDAO locationTypeDAO;
	
	@Override
	public List<LocationType> findAll() {
		return locationTypeDAO.findAll();
	}

	@Override
	public boolean save(LocationType LocationTypies) {
		if(locationTypeDAO.save(LocationTypies))
			return true;
		return false;
	}

	@Override
	public boolean update(LocationType LocationTypies) {
		if(locationTypeDAO.update(LocationTypies))
			return true;
		return false;
	}

	@Override
	public boolean delete(Integer id) {
		if(locationTypeDAO.delete(id))
			return true;
		return false;
	}
}
