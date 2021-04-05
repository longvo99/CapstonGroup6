package edu.group6.capston.daos;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.dtos.OrderDTO;
import edu.group6.capston.models.Product;

@Repository
public class ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Product> findByLocationId(int locationId) {
		try (Session session = this.sessionFactory.openSession()) {
			List<Product> list = session.createQuery("from Product Where locationId = " + locationId,Product.class).list();
			return list;
		}
	}

	public boolean save(Product Product) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.persist(Product);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean update(Product Product) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			session.update(Product);
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
			Product Product;
			Product = (Product) session.load(Product.class, id);
			session.delete(Product);
			session.flush();
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public Product findByProductId(Integer productId) {
		Session session = this.sessionFactory.openSession();
		Product product = session.find(Product.class, productId);
		return product;
	}
	
	public List<LocationDTO> findMinMaxPriceLocation() {
		List<LocationDTO> locationList = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<LocationDTO> query = builder.createQuery(LocationDTO.class);
		Root<Product> root = query.from(Product.class);
		query.multiselect(
				root.get("location").get("locationId"),
				builder.min(root.get("price")),
				builder.max(root.get("price")));
		query.groupBy(root.get("location").get("locationId"));
		locationList = session.createQuery(query).getResultList();
		transaction.commit();
		session.close();
		return locationList;
	}
	
	public OrderDTO findByProductIdOrder(Integer productId) {
		OrderDTO product = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<OrderDTO> query = builder.createQuery(OrderDTO.class);
		Root<Product> root = query.from(Product.class);
		query.multiselect(
				root.get("name"),
				root.get("price"));
		query.where(builder.equal(root.get("productId"), productId));
		product = session.createQuery(query).uniqueResult();
		transaction.commit();
		session.close();
		return product;
	}

	public List<String> searchProductNameByUserId(int userId) {
		try (Session session = this.sessionFactory.openSession()) {
			session.beginTransaction();
			String hql = "select p.name from Product p "
					+ "inner join p.location "
					+ "inner join p.location.users "
					+ "where p.location.users.userId = " + userId;
			Query query = session.createQuery(hql);
//			query.setParameter("userId", userId);
			//List<Product> listProducts = query.list();
			/* List<Object[]> listResult = query.list(); */
			List<String> listProducts = query.getResultList();
			/*
			 * for (Object[] aRow : listResult) { listProducts.add((Product) aRow[0]); }
			 */
			return listProducts;
		}
	}

}
