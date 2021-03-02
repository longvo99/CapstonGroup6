package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.LocationVideo;

@Repository
public class LocationVideoDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<LocationVideo> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("from LocationVideo", LocationVideo.class).list();
		}
	}

	public boolean save(LocationVideo locationVideo) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.persist(locationVideo);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean update(LocationVideo locationVideo) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			session.update(locationVideo);
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
			LocationVideo LocationVideo;
			LocationVideo = (LocationVideo) session.load(LocationVideo.class, id);
			session.delete(LocationVideo);
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
	 * public LocationVideo findById(int id) { Session session =
	 * this.sessionFactory.openSession(); return session.find(LocationVideo.class,
	 * id); }
	 */
}
