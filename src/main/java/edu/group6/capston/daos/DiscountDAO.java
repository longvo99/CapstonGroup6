package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.DiscountInfo;
import edu.group6.capston.models.Location;;

@Repository
public class DiscountDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<DiscountInfo> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			List<DiscountInfo> list = session.createQuery("from DiscountInfo", DiscountInfo.class).list();
			return list;
		}
	}
	
	/*
	 * public boolean save(DiscountInfo DiscountInfo) { return
	 * session.createQuery("FROM DiscountInfo", DiscountInfo.class).list(); } }
	 */

	public boolean save(DiscountInfo discountInfo) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.persist(discountInfo);
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
			List<DiscountInfo> list = session.createQuery("from DiscountInfo ORDER BY DiscountId DESC", DiscountInfo.class).setMaxResults(3).getResultList();
			return list;
		}
	}
	public List<DiscountInfo> findAllByUserId(int userId) {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("FROM DiscountInfo WHERE userId = " + userId, DiscountInfo.class).list();
		}
	}

	public DiscountInfo findOne(Integer discountId) {
		Session session = this.sessionFactory.openSession();
		return session.find(DiscountInfo.class, discountId);
	}

	public int delete(List<Integer> listDiscountId1) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx  = session.beginTransaction();
			@SuppressWarnings("rawtypes")
			Query query = session.createQuery("DELETE FROM DiscountInfo WHERE discountId IN (:list)");
			query.setParameter("list", listDiscountId1); 
			int i = query.executeUpdate();
			tx.commit();
			return i;
		}
	}

	/*
	 * public boolean save(DiscountInfo discountInfo, List<String> strList) {
	 * Session session = this.sessionFactory.openSession(); Transaction tx = null;
	 * try { tx = session.beginTransaction(); System.out.println(strList); for (int
	 * j = 0; j < strList.size(); j++) { discountInfo.setLocation(new
	 * Location(Integer.valueOf(strList.get(j).trim())));
	 * System.out.println(discountInfo); session.save(discountInfo); if (j % 20 ==
	 * 0) { //20, same as the JDBC batch size //flush a batch of inserts and release
	 * memory: session.flush(); session.clear(); } } tx.commit(); session.close();
	 * return true; } catch (Exception e) { if(tx != null && tx.isActive())
	 * tx.rollback(); return false; } }
	 */
}
