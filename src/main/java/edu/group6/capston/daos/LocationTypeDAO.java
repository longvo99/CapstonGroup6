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
			return session.createQuery("from LocationType", LocationType.class).list();
		}
	}

	public boolean save(LocationType locationTypies) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.persist(locationTypies);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean update(LocationType locationTypies) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			session.update(locationTypies);
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
			LocationType LocationType;
			LocationType = (LocationType) session.load(LocationType.class, id);
			session.delete(LocationType);
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
	 * public LocationType findById(int id) { Session session =
	 * this.sessionFactory.openSession(); return session.find(LocationType.class,
	 * id); }
	 */
}
