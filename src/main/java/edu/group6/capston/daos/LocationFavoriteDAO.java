package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.Location;
import edu.group6.capston.models.LocationFavorites;
import edu.group6.capston.models.Users;

@Repository
public class LocationFavoriteDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public boolean save(int locationId, int userId) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			LocationFavorites lf = new LocationFavorites(new Users(userId), new Location(locationId));
			session.persist(lf);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	public LocationFavorites findLocationFavorites(int userId, int locationId) {
		try (Session session = this.sessionFactory.openSession()) {
			LocationFavorites locationFavorites = session.createQuery("from LocationFavorites WHERE LFuserId = " + userId + " AND LFlocationId = " + locationId, LocationFavorites.class).uniqueResult();
			return locationFavorites;
		}
	}
	
	public boolean delete(LocationFavorites location) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(location);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public List<LocationFavorites> findLocationFavorite(int userId) {
		try (Session session = this.sessionFactory.openSession()) {
			List<LocationFavorites> list = session.createQuery("from LocationFavorites WHERE LFUserId = " + userId, LocationFavorites.class)
			.list();
			return list;
		}
	}
	
}
