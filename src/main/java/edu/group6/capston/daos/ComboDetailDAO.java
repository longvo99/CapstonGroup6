package edu.group6.capston.daos;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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
		root.join("productCompo", JoinType.INNER);
		query.distinct(true);
		query.multiselect(
				root.get("productCompo").get("productComboId"),
				root.get("productCompo").get("comboName"),
				root.get("productCompo").get("orderCount"),
				root.get("productCompo").get("rateDiscount"),
				root.get("productCompo").get("description"),
				root.get("productCompo").get("imagePath"));
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
		root.join("productCompo", JoinType.INNER);
		query.distinct(true);
		query.multiselect(
				root.get("product").get("productId"),
				root.get("productCompo").get("productComboId"),
				root.get("product").get("name"),
				root.get("product").get("imagePath"),
				root.get("product").get("price"));
		query.where(builder.equal(root.get("product").get("location").get("locationId"), locationId));
		locationList = session.createQuery(query).getResultList();
		transaction.commit();
		session.close();
		return locationList;
	}
}
