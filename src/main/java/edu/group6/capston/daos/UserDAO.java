package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.Users;

@Repository
public class UserDAO{

	@Autowired
	private SessionFactory sessionFactory;

	public void save(Users customer) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.persist(customer);
		tx.commit();
		session.close();
	}

	public List<Users> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("from Users", Users.class).list();
		}
	}
}
