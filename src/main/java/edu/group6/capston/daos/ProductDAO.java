package edu.group6.capston.daos;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.dtos.OrderDTO;
import edu.group6.capston.dtos.ProductDTO;
import edu.group6.capston.models.ComboDetail;
import edu.group6.capston.models.Location;
import edu.group6.capston.models.Product;
import edu.group6.capston.models.ProductCombo;

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
	
	public List<String> searchProductNameByUserId(int userId) {
		try (Session session = this.sessionFactory.openSession()) {
			session.beginTransaction();
			String hql = "select p.name from Product p "
					+ "inner join p.location "
					+ "inner join p.location.users "
					+ "where p.location.users.userId = " + userId;
			@SuppressWarnings("rawtypes")
			Query query = session.createQuery(hql);
			@SuppressWarnings("unchecked")
			List<String> listProducts = query.getResultList();
			return listProducts;
		}
	}
	
	public List<ProductDTO> searchAllProductName(String search) {
		List<ProductDTO> product = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<ProductDTO> query = builder.createQuery(ProductDTO.class);
		Root<Location> root = query.from(Location.class);
		query.multiselect(
				root.get("locationId"),
				root.get("locationName"),
				root.get("mediaPath"));
		query.where(builder.like(root.get("locationName"), "%" + search + "%"));
		product = session.createQuery(query).setMaxResults(3).getResultList();
		transaction.commit();
		session.close();
		return product;
	}

	public OrderDTO findByProductIdOrder(Integer productId) {
		OrderDTO product = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<OrderDTO> query = builder.createQuery(OrderDTO.class);
		Root<Product> root = query.from(Product.class);
		query.multiselect(
				root.get("location").get("locationId"),
				root.get("name"),
				root.get("price"));
		query.where(builder.equal(root.get("productId"), productId));
		product = session.createQuery(query).uniqueResult();
		transaction.commit();
		session.close();
		return product;
	}
	
	public OrderDTO findByComboIdOrder(Integer comboId) {
		OrderDTO product = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<OrderDTO> query = builder.createQuery(OrderDTO.class);
		Root<ComboDetail> root = query.from(ComboDetail.class);
		root.join("product", JoinType.INNER);
		root.join("productCombo", JoinType.INNER);
		query.multiselect(
				root.get("product").get("location").get("locationId"),
				root.get("productCombo").get("comboName"),
				root.get("productCombo").get("rateDiscount"),
				builder.sum(root.get("product").get("price")));
		query.where(builder.equal(root.get("productCombo").get("productComboId"), comboId));
		query.groupBy(root.get("product").get("location").get("locationId"), root.get("productCombo").get("comboName"), root.get("productCombo").get("rateDiscount"));
		product = session.createQuery(query).uniqueResult();
		transaction.commit();
		session.close();
		return product;
	}
	
	public OrderDTO findProductIdOrderDetail(Integer id) {
		OrderDTO product = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<OrderDTO> query = builder.createQuery(OrderDTO.class);
		Root<Product> root = query.from(Product.class);
		query.multiselect(
				root.get("name"),
				root.get("imagePath"));
		query.where(builder.equal(root.get("productId"), id));
		product = session.createQuery(query).uniqueResult();
		transaction.commit();
		session.close();
		return product;
	}
	
	public OrderDTO findComboIdOrderDetail(Integer id) {
		OrderDTO product = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<OrderDTO> query = builder.createQuery(OrderDTO.class);
		Root<ProductCombo> root = query.from(ProductCombo.class);
		query.multiselect(
				root.get("comboName"),
				root.get("imagePath"));
		query.where(builder.equal(root.get("productComboId"), id));
		product = session.createQuery(query).uniqueResult();
		transaction.commit();
		session.close();
		return product;
	}

	public List<String> searchProductNameByLocationId(List<Integer> locationIdList) {
		try (Session session = this.sessionFactory.openSession()) {
			session.beginTransaction();
			String hql = "select p.name from Product p "
					+ "where location.locationId IN (:list)";
			@SuppressWarnings("rawtypes")
			Query query = session.createQuery(hql);
			query.setParameter("list", locationIdList); 
			@SuppressWarnings("unchecked")
			List<String> listProducts = query.getResultList();
			return listProducts;
		}
	}
}
