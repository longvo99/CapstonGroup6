package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.DiscountInfo;;

@Repository
public class DiscountDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<DiscountInfo> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("from DiscountInfo", DiscountInfo.class).list();
		}
	}
	
	public boolean save(DiscountInfo DiscountInfo) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.persist(DiscountInfo);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean update(DiscountInfo DiscountInfo) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			session.update(DiscountInfo);
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
			DiscountInfo DiscountInfo;
			DiscountInfo = (DiscountInfo) session.load(DiscountInfo.class, id);
			session.delete(DiscountInfo);
			// This makes the pending delete to be done
			session.flush();
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public List<DiscountInfo> findTopNewDiscountInfo() {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("from DiscountInfo ORDER BY DiscountId DESC", DiscountInfo.class).setMaxResults(3).getResultList();
		}
	}
}
