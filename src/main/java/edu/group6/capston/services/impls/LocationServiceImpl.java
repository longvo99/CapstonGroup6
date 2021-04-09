package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.group6.capston.daos.LocationDAO;
import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.models.Location;
import edu.group6.capston.services.LocationService;

@Service
@Transactional
public class LocationServiceImpl implements LocationService {
	@Autowired
	private LocationDAO LocationDAO;

	@Override
	public List<Location> findAll() {
		return LocationDAO.findAll();
	}

	@Override
	public boolean save(Location location) {
		if (LocationDAO.save(location))
			return true;
		return false;
	}

	@Override
	public boolean update(Location location) {
		if (LocationDAO.update(location))
			return true;
		return false;
	}

	@Override
	public boolean delete(Location location) {
		if (LocationDAO.delete(location))
			return true;
		return false;
	}

	@Override
	public Location findLocationId(int id) {
		return LocationDAO.findById(id);
	}

	@Override
	public long locationCount() {
		return LocationDAO.locationCount();
	}

	@Override
	public List<String> search(String keyword) {
		return LocationDAO.search(keyword);
	}

	@Override
	public List<LocationDTO> findTopNewLocationNew(int maxResults) {
		return LocationDAO.findTopNewLocationNew(maxResults);
	}

	@Override
	public List<LocationDTO> findTopRate() {
		return LocationDAO.findTopRate();
	}

	@Override
	public List<LocationDTO> findTopDiscount() {
		return LocationDAO.findTopDiscount();
	}

	public Location findByUserId(int userId) {
		return LocationDAO.findByUserId(userId);
	}

	@Override
	public List<Location> findAllByUserId(int userId) {
		return LocationDAO.findAllByUserId(userId);
	}

	@Override
	public int updateImage(Location location) {
		return LocationDAO.updateImage(location);
	}

	@Override
	public List<Location> findAllByCategory(Integer categoryId) {
		return LocationDAO.findAllByCategory(categoryId);}
	public List<LocationDTO> findLocationByCategoryId(int categoryId) {
		return LocationDAO.findLocationByCategoryId(categoryId);
	}

}
