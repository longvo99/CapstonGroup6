package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.Orders;

@Repository
public class OrderDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Orders> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("from Order ", Orders.class).list();
		}
	}

	public boolean save(Orders orders) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.persist(orders);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean update(Orders orders) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			session.update(orders);
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
			Orders Orders;
			Orders = (Orders) session.load(Orders.class, id);
			session.delete(Orders);
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
	 * public Order findById(int id) { Session session =
	 * this.sessionFactory.openSession(); return session.find(Order.class,
	 * id); }
	 */
}
