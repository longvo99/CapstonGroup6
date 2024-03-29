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

import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.models.DiscountInfo;
import edu.group6.capston.models.Location;
import edu.group6.capston.models.Rating;

@Repository
public class LocationDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public boolean save(Location location) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.persist(location);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean update(Location location) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			session.update(location);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public List<Location> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			List<Location> list = session.createQuery("from Location", Location.class).list();
			session.close();
			return list;
		}
	}

	public Location findById(int id) {
		Session session = this.sessionFactory.openSession();
		Location location = session.find(Location.class, id);
		session.close();
		return location;
	}

	public boolean delete(Location location) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(location);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public long locationCount() {
		try (Session session = this.sessionFactory.openSession()) {
			long count = (long) session.createQuery("select count(*) from Location").uniqueResult();
			session.close();
			return count;
		}
	}

	public List<String> search(String keyword) {
		try (Session session = this.sessionFactory.openSession()) {
			String hql = "SELECT locationName from Location WHERE locationName LIKE '%" + keyword + "%' AND status = true";
			@SuppressWarnings("unchecked")
			List<String> listResult = session.createQuery(hql).getResultList();
			session.close();
			return listResult;
		}
	}

	public List<LocationDTO> findTopRate() {
		List<LocationDTO> locationList = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<LocationDTO> query = builder.createQuery(LocationDTO.class);
		Root<Rating> root = query.from(Rating.class);
		root.join("comment", JoinType.INNER);
		query.multiselect(root.get("comment").get("location").get("locationId"),
				root.get("comment").get("location").get("locationName"),
				root.get("comment").get("location").get("mediaPath"), builder.avg(root.get("point")));
		query.where(builder.equal(root.get("comment").get("location").get("status"), true));
		query.groupBy(root.get("comment").get("location").get("locationId"),
				root.get("comment").get("location").get("locationName"),
				root.get("comment").get("location").get("mediaPath"));
		query.where(builder.equal(root.get("comment").get("location").get("status"), true));
		query.orderBy(builder.desc(builder.avg(root.get("point"))));
		locationList = session.createQuery(query).setMaxResults(4).getResultList();
		transaction.commit();
		session.close();
		return locationList;
	}

	public List<LocationDTO> findTopDiscount() {
		List<LocationDTO> locationList = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<LocationDTO> query = builder.createQuery(LocationDTO.class);
		Root<DiscountInfo> root = query.from(DiscountInfo.class);
		root.join("location", JoinType.INNER);
		query.distinct(true);
		query.multiselect(root.get("location").get("locationId"),
				root.get("location").get("locationName"), root.get("location").get("openTime"),
				root.get("location").get("closeTime"), root.get("location").get("reviewCount"),
				root.get("location").get("locationCategory").get("locationCategoryName"),
				root.get("location").get("locationType").get("locationTypeName"),
				root.get("location").get("mediaPath"));
		query.where(builder.equal(root.get("location").get("status"), true));
		locationList = session.createQuery(query).setMaxResults(6).getResultList();
		transaction.commit();
		session.close();
		return locationList;
	}

	public List<LocationDTO> findLocationByCategoryId(int categoryId) {
		List<LocationDTO> locationList = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<LocationDTO> query = builder.createQuery(LocationDTO.class);
		Root<Location> root = query.from(Location.class);
		root.join("locationCategory", JoinType.INNER);
		root.join("locationType", JoinType.INNER);
		query.multiselect(root.get("locationId"), root.get("locationName"), root.get("openTime"), root.get("closeTime"),
				root.get("reviewCount"), root.get("locationCategory").get("locationCategoryName"),
				root.get("locationType").get("locationTypeName"), root.get("mediaPath"));
		query.where(builder.equal(root.get("locationCategory").get("categoryId"), categoryId) , builder.equal(root.get("status"), true));
		query.orderBy(builder.desc(root.get("locationId")));
		locationList = session.createQuery(query).getResultList();
		transaction.commit();
		session.close();
		return locationList;
	}

	public List<LocationDTO> findTopNewLocationNew(int maxResults) {
		List<LocationDTO> locationList = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<LocationDTO> query = builder.createQuery(LocationDTO.class);
		Root<Location> root = query.from(Location.class);
		root.join("locationCategory", JoinType.INNER);
		root.join("locationType", JoinType.INNER);
		query.multiselect(root.get("locationId"), root.get("locationName"), root.get("openTime"), root.get("closeTime"),
				root.get("reviewCount"), root.get("locationCategory").get("locationCategoryName"),
				root.get("locationType").get("locationTypeName"), root.get("mediaPath"));
		query.where(builder.equal(root.get("status"), true));
		query.orderBy(builder.desc(root.get("locationId")));
		locationList = session.createQuery(query).setMaxResults(maxResults).getResultList();
		transaction.commit();
		session.close();
		return locationList;
	}

	public List<Location> findAllByUserId(int userId) {
		try (Session session = this.sessionFactory.openSession()) {
			List<Location> list = session.createQuery("FROM Location WHERE users.userId = " + userId, Location.class).list();
			session.close();
			return list;
		}
	}

	public int updateImage(Location location) {
		try (Session session = this.sessionFactory.openSession()) {
			String hql = "update Location set mediaPath = '"+ location.getMediaPath() +"' where locationId = " + location.getLocationId();
			Query query = session.createQuery(hql);
			int i = query.executeUpdate(); 
			session.close();
			return i;
		}
	}

	public List<Location> findAllByCategory(Integer categoryId) {
		try (Session session = this.sessionFactory.openSession()) {
			List<Location> list = session.createQuery("FROM Location WHERE locationCategory.categoryId = " + categoryId, Location.class).list();
			session.close();
			return list;
		}
	}
	
	public List<LocationDTO> searchLocation(String search) {
		List<LocationDTO> locationList = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<LocationDTO> query = builder.createQuery(LocationDTO.class);
		Root<Location> root = query.from(Location.class);
		root.join("locationCategory", JoinType.INNER);
		root.join("locationType", JoinType.INNER);
		query.multiselect(root.get("locationId"), root.get("locationName"), root.get("openTime"), root.get("closeTime"),
				root.get("reviewCount"), root.get("locationCategory").get("locationCategoryName"),
				root.get("locationType").get("locationTypeName"), root.get("mediaPath"));
		query.where(builder.like(root.get("locationName"), "%" + search + "%"));
		query.orderBy(builder.desc(root.get("locationId")));
		locationList = session.createQuery(query).setMaxResults(12).getResultList();
		transaction.commit();
		session.close();
		return locationList;
	}

	public List<Location> findImageLocation() {
		List<Location> locationList = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Location> query = builder.createQuery(Location.class);
		Root<Location> root = query.from(Location.class);
		query.multiselect(root.get("locationId"), 
				root.get("mediaPath"));
		query.orderBy(builder.desc(root.get("locationId")));
		locationList = session.createQuery(query).setMaxResults(12).getResultList();
		transaction.commit();
		session.close();
		return locationList;
	}

	public List<Location> unapprovedLocationList() {
		try (Session session = this.sessionFactory.openSession()) {
			List<Location> list = session.createQuery("FROM Location WHERE status = false ORDER BY locationId DESC", Location.class).list();
			session.close();
			return list;
		}
	}

	public List<Location> findLocationNearYou(String ward, String district, String city) {
		try (Session session = this.sessionFactory.openSession()) {
			List<Location> list = session.createQuery("FROM Location WHERE ward = " + ward + " or district = " + district + " or City = " + city, Location.class).setMaxResults(5).list();
			session.close();
			return list;
		}
	}
}
