package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.Order;

@Repository
public class OrderDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Order> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("from Order ", Order.class).list();
		}
	}

	public boolean save(Order order) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.persist(order);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean update(Order order) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			session.update(order);
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
			Order Order;
			Order = (Order) session.load(Order.class, id);
			session.delete(Order);
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
