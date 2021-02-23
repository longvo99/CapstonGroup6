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
import edu.group6.capston.models.Location;

@Repository
public class LocationDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public boolean save(LocationDTO location) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.persist(location);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean update(LocationDTO location) {
		try (Session session = this.sessionFactory.openSession();) {
			Transaction tx = session.beginTransaction();
			session.update(location);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public List<LocationDTO> findAll() {
		List<LocationDTO> locationList = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<LocationDTO> query = builder.createQuery(LocationDTO.class);
		Root<Location> root = query.from(Location.class);
		root.join("locationCategories", JoinType.INNER);
		root.join("locationTypies", JoinType.INNER);
		query.select(builder.construct(LocationDTO.class,
			root.get("locationId"),
			root.get("locationName"),
			root.get("address"),
			root.get("openTime"),
			root.get("closeTime"),
			root.get("reviewCount"),
			root.get("locationCategories").get("locationCategoryId"),
			root.get("locationCategories").get("locationCategoryName"),
			root.get("locationTypies").get("locationTypeId"),
			root.get("locationTypies").get("locationTypeName"),
			root.get("ward"),
			root.get("district"),
			root.get("city"),
			root.get("country"),
			root.get("categoryId"),
			root.get("discountId"),
			root.get("locationVideoId"),
			root.get("productId"),
			root.get("ratingId")
		));
		locationList = session.createQuery(query).getResultList();
		transaction.commit();
		session.close();
		return locationList;
	}

	public Location findById(int id) {
		Session session = this.sessionFactory.openSession();
		return session.find(Location.class, id);
	}

	public boolean delete(Location location) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(location);
			tx.commit();
			session.close();
			return false;
		} catch (Exception e) {
			return false;
		}
	}
}
