package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.LocationCategory;

@Repository
public class LocationCategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<LocationCategory> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			List<LocationCategory> list = sessionFactory.getCurrentSession().createQuery("from LocationCategory").list();
			session.close();
			return list;
		}
	}

	public LocationCategory findNameCategory(Integer valueOf) {
		try (Session session = this.sessionFactory.openSession()) {
			session.beginTransaction();
			String hql = "from LocationCategory WHERE CategoryId = " + valueOf;
			Query query = session.createQuery(hql);
			LocationCategory categoryName = (LocationCategory) query.uniqueResult();
			session.close();
			return categoryName;
		}
	}
}
