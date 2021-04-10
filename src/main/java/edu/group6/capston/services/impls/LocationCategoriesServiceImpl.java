package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.group6.capston.daos.LocationCategoryDAO;
import edu.group6.capston.models.LocationCategory;
import edu.group6.capston.services.LocationCategoriesService;

@Service
@Transactional
public class LocationCategoriesServiceImpl implements LocationCategoriesService {
	@Autowired
	private LocationCategoryDAO locationCategoryDAO;
	
	@Override
	@Transactional
	public List<LocationCategory> findAll() {
		return locationCategoryDAO.findAll();
	}

	@Override
	public LocationCategory findNameCategory(Integer valueOf) {
		return locationCategoryDAO.findNameCategory(valueOf);
	}
}
