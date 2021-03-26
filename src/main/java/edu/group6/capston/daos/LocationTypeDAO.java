package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.LocationType;

@Repository
public class LocationTypeDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<LocationType> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			List<LocationType> list = session.createQuery("from LocationType", LocationType.class).list();
			session.close();
			return list;
		}
	}

	public boolean save(LocationType locationTypes) {
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

	public boolean update(LocationType locationTypes) {
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
			LocationType locationTypes;
			locationTypes = (LocationType) session.load(LocationType.class, id);
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
