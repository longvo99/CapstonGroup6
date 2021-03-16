package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.Role;

@Repository
public class RoleDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Role> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("from Role", Role.class).list();
		}
	}

	public boolean save(Role locationTypies) {
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

	public boolean update(Role role) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			session.update(role);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean delete(String id) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			Role locationTypes;
			locationTypes = (Role) session.load(Role.class, id);
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
