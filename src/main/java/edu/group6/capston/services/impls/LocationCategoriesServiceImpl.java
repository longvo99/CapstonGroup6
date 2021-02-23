package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.group6.capston.daos.LocationCategoriesDAO;
import edu.group6.capston.models.LocationCategories;
import edu.group6.capston.services.LocationCategoriesService;

@Service
@Transactional
public class LocationCategoriesServiceImpl implements LocationCategoriesService {
	@Autowired
	private LocationCategoriesDAO locationCategoriesDAO;
	
	@Override
	@Transactional
	public List<LocationCategories> findAll() {
		return locationCategoriesDAO.findAll();
	}
}
