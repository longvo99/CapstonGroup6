package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.LocationCategory;
import edu.group6.capston.models.LocationCategory;

@Repository
public class LocationCategoriesDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<LocationCategory> findAll() {
		return sessionFactory.getCurrentSession().createQuery("from LocationCategory").list();
	}
}
