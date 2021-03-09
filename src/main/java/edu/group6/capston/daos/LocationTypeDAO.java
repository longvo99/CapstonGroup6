package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.LocationTypes;

@Repository
public class LocationTypeDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<LocationTypes> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("from LocationTypes", LocationTypes.class).list();
		}
	}

	public boolean save(LocationTypes locationTypes) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.persist(locationTypes);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean update(LocationTypes locationTypes) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			session.update(locationTypes);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean delete(Integer id) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			LocationTypes locationTypes;
			locationTypes = (LocationTypes) session.load(LocationTypes.class, id);
			session.delete(locationTypes);
			// This makes the pending delete to be done
			session.flush();
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/*
	 * public LocationTypes findById(int id) { Session session =
	 * this.sessionFactory.openSession(); return session.find(LocationTypes.class,
	 * id); }
	 */
}
