package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.OrderStatus;
import edu.group6.capston.models.Orders;

@Repository
public class OrderDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Orders> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			List<Orders> list = session.createQuery("from Orders ", Orders.class).list();
			return list;
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

	public Orders findByOrderId(int orderId) {
		Session session = this.sessionFactory.openSession();
		Orders order = session.find(Orders.class, orderId);
		return order;
	}

	public List<OrderStatus> findAllOrderStatus() {
		try (Session session = this.sessionFactory.openSession()) {
			List<OrderStatus> list = session.createQuery("from OrderStatus ", OrderStatus.class).list();
			return list;
		}
	}

	public List<Orders> findByUserId(int userId) {
		try (Session session = this.sessionFactory.openSession()) {
			List<Orders> list = session.createQuery("from Orders WHERE userId = " + userId + " ORDER BY OrderId DESC", Orders.class).list();
			return list;
		}
	}

	public long newOrderCount() {
		try (Session session = this.sessionFactory.openSession()) {
			long count = (long) session.createQuery("select count(*) from Orders where orderStatus.orderStatusId = 1").uniqueResult();
			return count;
		}
	}

	public List<Orders> findAllByStatusId(int statusId) {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("from Orders WHERE orderStatus.orderStatusId = " + statusId, Orders.class).list();
		}
	}

	public List<String> revenueByYear(int year) {
		try (Session session = this.sessionFactory.openSession()) {
			session.beginTransaction();
			String hql = "SELECT SUM(totalPrice) from Orders "
					   + "WHERE YEAR(orderTime) = " + year
					   + " GROUP BY MONTH(orderTime)";
			Query query = session.createQuery(hql);
			List<String> list = query.getResultList();
			return list;
		}
	}

	public double largesttotalPrice(int year) {
		try (Session session = this.sessionFactory.openSession()) {
			session.beginTransaction();
			String hql = "SELECT SUM(totalPrice) from Orders "
					   + "WHERE YEAR(orderTime) = " + year
					   + " GROUP BY MONTH(orderTime) "
					   + "ORDER BY SUM(totalPrice) DESC";
			return (double) session.createQuery(hql).setMaxResults(1).uniqueResult();
		}
	}

	/*
	 * public Order findById(int id) { Session session =
	 * this.sessionFactory.openSession(); return session.find(Order.class,
	 * id); }
	 */
}
