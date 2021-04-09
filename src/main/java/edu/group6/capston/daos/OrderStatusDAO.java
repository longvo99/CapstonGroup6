package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.OrderStatus;

@Repository
public class OrderStatusDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<OrderStatus> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			List<OrderStatus> list = session.createQuery("from OrderStatus", OrderStatus.class).list();
			return list;
		}
	}

	public boolean save(OrderStatus locationTypies) {
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

	public boolean update(OrderStatus OrderStatus) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			session.update(OrderStatus);
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
			OrderStatus locationTypes;
			locationTypes = (OrderStatus) session.load(OrderStatus.class, id);
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
