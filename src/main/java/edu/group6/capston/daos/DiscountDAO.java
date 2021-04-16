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

import edu.group6.capston.models.DiscountInfo;
import edu.group6.capston.models.DiscountLimitedUse;
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
	
	public List<DiscountInfo> findLocationIdOnDiscount() {
		List<DiscountInfo> locationList = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<DiscountInfo> query = builder.createQuery(DiscountInfo.class);
		Root<DiscountInfo> root = query.from(DiscountInfo.class);
		query.multiselect(root.get("title"),
				root.get("location").get("locationId"));
		query.distinct(true);
		locationList = session.createQuery(query).getResultList();
		transaction.commit();
		session.close();
		return locationList;
	}
	
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
			List<DiscountInfo> list = session.createQuery("SELECT DISTINCT a from DiscountInfo a ORDER BY DiscountId DESC", DiscountInfo.class).setMaxResults(3).getResultList();
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

	public List<DiscountInfo> findBylocationId(int locationId) {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("FROM DiscountInfo WHERE locationId = " + locationId + " AND limitedPerUser > 0 AND Convert(date, getdate()) <= Convert(date, endDate)", DiscountInfo.class).list();
		}
	}

	public int limitedPerUser(String discountId) {
		try (Session session = this.sessionFactory.openSession()) {
			int count = (int) session.createQuery("select limitedPerUser from DiscountInfo WHERE discountId = " + discountId).uniqueResult();
			return count;
		}
	}

	public DiscountLimitedUse findDiscountLimitedUse(String discountId, int userId) {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("FROM DiscountLimitedUse WHERE discountId = " + discountId + " AND userId = " + userId, DiscountLimitedUse.class).uniqueResult();
		}
	}

	public boolean updateDiscountLimitedUse(DiscountLimitedUse discountLimitedUse) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			session.update(discountLimitedUse);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean saveDiscountLimitedUse(DiscountLimitedUse discountLimitedUse) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.persist(discountLimitedUse);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public List<DiscountLimitedUse> findDiscountLimitedUseByLocationId(int locationId, int userId) {
		List<DiscountLimitedUse> locationList = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<DiscountLimitedUse> query = builder.createQuery(DiscountLimitedUse.class);
		Root<DiscountLimitedUse> root = query.from(DiscountLimitedUse.class);
		root.join("discountInfo", JoinType.INNER);
		query.distinct(true);
		query.multiselect(
				root.get("discountInfo").get("discountId"),
				root.get("limitedPerUser"));
		query.where(builder.equal(root.get("discountInfo").get("location").get("locationId"), locationId));
		query.where(builder.equal(root.get("userId"), userId));
		locationList = session.createQuery(query).getResultList();
		transaction.commit();
		session.close();
		return locationList;
	}
}
