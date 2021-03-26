package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.OrderDetail;

@Repository
public class OrderDetailDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<OrderDetail> findByOrderId(int orderId) {
		try (Session session = this.sessionFactory.openSession()) {
			List<OrderDetail> list = session.createQuery("from OrderDetail WHERE orderId = " + orderId, OrderDetail.class).list();
			session.close();
			return list;
		}
	}
	/*
	public boolean save(OrderDetail OrderDetail) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.persist(OrderDetail);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean update(OrderDetail OrderDetail) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			session.update(OrderDetail);
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
			OrderDetail OrderDetail;
			OrderDetail = (OrderDetail) session.load(OrderDetail.class, id);
			session.delete(OrderDetail);
			// This makes the pending delete to be done
			session.flush();
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	*/

	/*
	 * public Order findById(int id) { Session session =
	 * this.sessionFactory.openSession(); return session.find(Order.class,
	 * id); }
	 */
}
