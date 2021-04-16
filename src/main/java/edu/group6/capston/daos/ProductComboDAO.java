package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.DiscountInfo;
import edu.group6.capston.models.Location;
import edu.group6.capston.models.ProductCombo;

@Repository
public class ProductComboDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<ProductCombo> findAllByLocationId(int locationId) {
		try (Session session = this.sessionFactory.openSession()) {
			List<ProductCombo> list = session.createQuery("FROM ProductCombo WHERE location.locationId = " + locationId, ProductCombo.class).list();
			return list;
		}
	}

	public ProductCombo findOneById(Integer productComboId) {
		Session session = this.sessionFactory.openSession();
		ProductCombo productCombo = session.find(ProductCombo.class, productComboId);
		return productCombo;
	}

	public boolean update(ProductCombo productCombo) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			session.update(productCombo);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean save(ProductCombo ProductCombo) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.persist(ProductCombo);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
