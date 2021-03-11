package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.Product;

@Repository
public class ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Product> findByLocationId(int locationId) {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("from Product Where locationId = " + locationId,Product.class).list();
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
		return session.find(Product.class, productId);
	}

}
