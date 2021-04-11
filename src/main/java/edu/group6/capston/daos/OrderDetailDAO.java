package edu.group6.capston.daos;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.dtos.OrderDTO;
import edu.group6.capston.models.OrderDetail;

@Repository
public class OrderDetailDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<OrderDetail> findByOrderId(int orderId) {
		try (Session session = this.sessionFactory.openSession()) {
			List<OrderDetail> list = session.createQuery("from OrderDetail WHERE orderId = " + orderId, OrderDetail.class).list();
			return list;
		}
	}

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

	public List<OrderDTO> findByOrderDTO(int orderId) {
		List<OrderDTO> product = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<OrderDTO> query = builder.createQuery(OrderDTO.class);
		Root<OrderDetail> root = query.from(OrderDetail.class);
		query.multiselect(
				root.get("product").get("productId"),
				root.get("productCombo").get("productComboId"),
				root.get("currentPrice"),
				root.get("quantity"));
		query.where(builder.equal(root.get("orders").get("orderId"), orderId));
		product = session.createQuery(query).getResultList();
		transaction.commit();
		session.close();
		return product;
	}
}
