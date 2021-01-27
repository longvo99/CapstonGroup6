package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.LocationVideo;

@Repository
public class UserDAO{

	@Autowired
	private SessionFactory sessionFactory;

	public void save(LocationVideo customer) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.persist(customer);
		tx.commit();
		session.close();
	}

	public List<LocationVideo> findAll() {
		Session session = this.sessionFactory.openSession();
		List<LocationVideo> list = session.createQuery("FROM LocationVideo", LocationVideo.class).getResultList();
		List<LocationVideo> result = list;
		return result;
	}
}
