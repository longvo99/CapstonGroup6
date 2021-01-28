package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.Location;

@Repository
public class LocationDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public boolean save(Location location) {
		try (Session session = this.sessionFactory.openSession();) {
			Transaction tx = session.beginTransaction();
			session.persist(location);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean update(Location location) {
		try (Session session = this.sessionFactory.openSession();) {
			Transaction tx = session.beginTransaction();
			session.update(location);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public List<Location> findAll() {
		Session session = this.sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Location.class);
		return criteria.list();
	}

	public Location findById(int id) {
		Session session = this.sessionFactory.openSession();
		return session.find(Location.class, id);
	}

	public boolean delete(Location location) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			session.delete(location);
			tx.commit();
			session.close();
			return false;
		} catch (Exception e) {
			return false;
		}
	}

	public List<Location> findAll(int offset, int limit) {
		Session session = this.sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Location.class);
		criteria.setFirstResult(offset);
		criteria.setMaxResults(limit);
		return criteria.list();
	}

}
