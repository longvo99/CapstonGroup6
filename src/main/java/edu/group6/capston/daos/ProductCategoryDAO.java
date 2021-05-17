package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.ProductCategory;

@Repository
public class ProductCategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<ProductCategory> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			List<ProductCategory> list = session.createQuery("from ProductCategory", ProductCategory.class).list();
			session.close();
			return list;
		}
	}
	
	public List<String> searchProductCategoryName() {
		try (Session session = this.sessionFactory.openSession()) {
			session.beginTransaction();
			String hql = "select productCategoryName from ProductCategory";
			Query query = session.createQuery(hql);
			List<String> listProducts = query.getResultList();
			session.close();
			return listProducts;
		}
	}

	public boolean save(ProductCategory Product) {
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

	public boolean update(ProductCategory Product) {
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
			ProductCategory Product;
			Product = (ProductCategory) session.load(ProductCategory.class, id);
			session.delete(Product);
			session.flush();
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public List<ProductCategory> search(String keywork) {
		try (Session session = this.sessionFactory.openSession()) {
			List<ProductCategory> list = session.createQuery("from ProductCategory where PCategoryName like '%" + keywork + "%'",
					ProductCategory.class).list();
			session.close();
			return list;
		}
	}

}
