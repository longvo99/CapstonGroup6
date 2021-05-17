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

import edu.group6.capston.dtos.ComboDetailDTO;
import edu.group6.capston.models.ComboDetail;

@Repository
public class ComboDetailDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	public List<ComboDetailDTO> findComboLocation(int locationId) {
		List<ComboDetailDTO> locationList = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<ComboDetailDTO> query = builder.createQuery(ComboDetailDTO.class);
		Root<ComboDetail> root = query.from(ComboDetail.class);
		root.join("product", JoinType.INNER);
		root.join("productCombo", JoinType.INNER);
		query.distinct(true);
		query.multiselect(
				root.get("productCombo").get("productComboId"),
				root.get("productCombo").get("comboName"),
				root.get("productCombo").get("orderCount"),
				root.get("productCombo").get("rateDiscount"),
				root.get("productCombo").get("description"),
				root.get("productCombo").get("imagePath"));
		query.where(builder.equal(root.get("product").get("location").get("locationId"), locationId));
		locationList = session.createQuery(query).getResultList();
		transaction.commit();
		session.close();
		return locationList;
	}
	
	public List<ComboDetailDTO> findProductInComboLocation(int locationId) {
		List<ComboDetailDTO> locationList = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<ComboDetailDTO> query = builder.createQuery(ComboDetailDTO.class);
		Root<ComboDetail> root = query.from(ComboDetail.class);
		root.join("product", JoinType.INNER);
		root.join("productCombo", JoinType.INNER);
		query.distinct(true);
		query.multiselect(
				root.get("product").get("productId"),
				root.get("productCombo").get("productComboId"),
				root.get("product").get("name"),
				root.get("product").get("imagePath"),
				root.get("product").get("price"));
		query.where(builder.equal(root.get("product").get("location").get("locationId"), locationId));
		locationList = session.createQuery(query).getResultList();
		transaction.commit();
		session.close();
		return locationList;
	}

	public void delete(Integer productComboId) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx  = session.beginTransaction();
			@SuppressWarnings("rawtypes")
			Query query = session.createQuery("DELETE FROM ComboDetail WHERE productCombo.productComboId = :productComboId");
			query.setParameter("productComboId", productComboId); 
			query.executeUpdate();
			tx.commit();
			session.close();
		}
	}

	public void save(ComboDetail comboDetail) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.persist(comboDetail);
			tx.commit();
			session.close();
		} catch (Exception e) {
		}
	}
}
