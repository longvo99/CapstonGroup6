package edu.group6.capston.daos;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.dtos.LocationDTO2;
import edu.group6.capston.dtos.ProductDTO2;
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

	public List<Object[]> revenueByYear(int year) {
		try (Session session = this.sessionFactory.openSession()) {
			session.beginTransaction();
			String hql = "SELECT MONTH(orderTime), SUM(totalPrice) from Orders "
					   + "WHERE YEAR(orderTime) = " + year + " AND orderStatus.orderStatusId = 4"
					   + " GROUP BY MONTH(orderTime) ORDER BY MONTH(orderTime)";
			Query query = session.createQuery(hql);
			List<Object[]> listResult = query.getResultList();
			return listResult;
		}
	}

	public double largesttotalPrice(int year) {
		try (Session session = this.sessionFactory.openSession()) {
			session.beginTransaction();
			String hql = "SELECT SUM(totalPrice) from Orders "
					   + "WHERE YEAR(orderTime) = " + year + " AND orderStatus.orderStatusId = 4"
					   + " GROUP BY MONTH(orderTime) "
					   + "ORDER BY SUM(totalPrice) DESC";
			return (double) session.createQuery(hql).setMaxResults(1).uniqueResult();
		}
	}

	public double findTotalOrderedPricelocationId(int locationId, int userId) {
		try (Session session = this.sessionFactory.openSession()) {
			session.beginTransaction();
			String hql = "SELECT SUM(totalPrice) from Orders "
					   + "WHERE locationId = " + locationId
					   + " AND userId = " + userId
					   + " AND OrderStatusId = 4";
			double result = 0;
			if(session.createQuery(hql).setMaxResults(1).uniqueResult() != null) {
				result = (double) session.createQuery(hql).setMaxResults(1).uniqueResult();
			}
			return result;
		}
	}

	public List<Integer> listYear() {
		try (Session session = this.sessionFactory.openSession()) {
			session.beginTransaction();
			String hql = "select YEAR(orderTime) from Orders GROUP BY YEAR(orderTime)";
			Query query = session.createQuery(hql);
			List<Integer> listResult = query.getResultList();
			return listResult;
		}
	}

//	public List<Orders> findAllByYear(Integer year) {
//		try (Session session = this.sessionFactory.openSession()) {
//			session.beginTransaction();
//			String hql = "SELECT SUM(totalPrice) from Orders "
//					   + "WHERE YEAR(orderTime) = " + year + " AND orderStatus.orderStatusId = 4"
//					   + " GROUP BY MONTH(orderTime) "
//					   + "ORDER BY SUM(totalPrice) DESC";
//			return (double) session.createQuery(hql).setMaxResults(1).uniqueResult();
//		}
//	}
	
	public List<LocationDTO2> findAllByYear(Integer year) {
		List<LocationDTO2> listLocations = new ArrayList<LocationDTO2>();
		try (Session session = this.sessionFactory.openSession()) {
			session.beginTransaction();
			String hql = "SELECT o.location.locationName, o.location.address, "
					+ "COUNT(o.location.locationId), SUM(o.totalPrice), SUM(o.shipPrice) "
					+ "FROM Orders o RIGHT OUTER JOIN o.location "
					+ "ON YEAR(o.orderTime) = " + year + " AND o.orderStatus.orderStatusId = 4 "
					+ "GROUP BY o.location.locationId, o.location.locationName, o.location.address "
					+ "ORDER BY SUM(o.totalPrice) DESC";
			@SuppressWarnings("rawtypes")
			Query query = session.createQuery(hql);
			@SuppressWarnings("unchecked")
			List<Object[]> listObj = query.list();
			for (Object[] object : listObj) {
				listLocations.add(new LocationDTO2((String)object[0], (String)object[1], 
						object[2] == null ? 0:(long)object[2], object[3] == null ? 0:(double)object[3], 
								object[4]==null? 0:Double.valueOf(((String)object[4]))));
				//.substring(0,((String)object[4]).indexOf("."))
			}
			return listLocations;
		}
	}

}
