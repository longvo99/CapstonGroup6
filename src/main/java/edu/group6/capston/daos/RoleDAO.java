package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.Roles;

@Repository
public class RoleDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Roles> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("from Roles", Roles.class).list();
		}
	}

	public boolean save(Roles locationTypies) {
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

	public boolean update(Roles locationTypies) {
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
			Roles locationTypes;
			locationTypes = (Roles) session.load(Roles.class, id);
			session.delete(locationTypes);
			// This makes the pending delete to be done
			session.flush();
			tx.commit();
			session.close();
			return false;
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
