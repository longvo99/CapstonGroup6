package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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
			return list;
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
			List<ProductCategory> list = session.createQuery("from ProductCategory where PCategoryName like '%"+keywork+"%'", ProductCategory.class).list();
			return list;
		}
	}
	
	/*
	 * @SuppressWarnings({ "unchecked", "deprecation" }) public List<String>
	 * search1(String keywork) { List<String> result = null; Session session =
	 * this.sessionFactory.openSession(); Transaction transaction = null; try {
	 * transaction = session.beginTransaction(); result =
	 * session.createQuery("select PCategoryName " + "from ProductCategory " +
	 * "where PCategoryName like :keywork").setString("keywork", "%"+ keywork +"%")
	 * .setMaxResults(10).list(); transaction.commit(); } catch (Exception e) {
	 * result = null; if(transaction != null) { transaction.rollback(); } } finally
	 * { session.close(); } return result; }
	 */

}
