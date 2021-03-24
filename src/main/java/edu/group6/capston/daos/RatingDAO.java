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

import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.models.Rating;

@Repository
public class RatingDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	public List<LocationDTO> findAllRatingLocation() {
		List<LocationDTO> locationList = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<LocationDTO> query = builder.createQuery(LocationDTO.class);
		Root<Rating> root = query.from(Rating.class);
		root.join("comment", JoinType.INNER);
		query.multiselect(
				root.get("comment").get("location").get("locationId"),
				builder.avg(root.get("point")));
		query.groupBy(root.get("comment").get("location").get("locationId"));
		locationList = session.createQuery(query).getResultList();
		transaction.commit();
		session.close();
		return locationList;
	}
}