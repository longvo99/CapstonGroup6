package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.Product;
import edu.group6.capston.models.ProductCategories;

@Repository
public class ProductCategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<ProductCategories> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("from ProductCategories", ProductCategories.class).list();
		}
	}
	
	public boolean save(ProductCategories Product) {
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

	public boolean update(ProductCategories Product) {
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
			ProductCategories Product;
			Product = (ProductCategories) session.load(ProductCategories.class, id);
			session.delete(Product);
			session.flush();
			tx.commit();
			session.close();
			return false;
		} catch (Exception e) {
			return false;
		}
	}

}
