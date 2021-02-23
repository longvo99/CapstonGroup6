package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.LocationCategories;

@Repository
public class LocationCategoriesDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<LocationCategories> findAll() {
		return sessionFactory.getCurrentSession().createQuery("from LocationCategories").list();
	}
}
