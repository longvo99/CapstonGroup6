package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.Location;

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
			return session.createQuery("from Location", Location.class).list();
		}
	}
	/*
	 * public void findAll1() { Session session = this.sessionFactory.openSession();
	 * String hql = "SELECT avg(Point) FROM Comment c " +
	 * "INNER JOIN Location l ON c.LocationId = l.LocationId " +
	 * "INNER JOIN Rating r ON c.CommentId = r.CommentId GROUP BY l.LocationName";
	 * //List<Object[]> listResult = session.createQuery(hql).list(); List
	 * listResult = session.createQuery(hql).list(); Number number = (Number)
	 * listResult.get(0); System.out.println(number.intValue()); }
	 */

	/*
	 * public List<LocationDTO> findAll() { List<LocationDTO> locationList = null;
	 * Session session = this.sessionFactory.openSession(); Transaction transaction
	 * = session.beginTransaction(); CriteriaBuilder builder =
	 * session.getCriteriaBuilder(); CriteriaQuery<LocationDTO> query =
	 * builder.createQuery(LocationDTO.class); Root<Location> root =
	 * query.from(Location.class); root.join("locationCategory", JoinType.INNER);
	 * root.join("locationType", JoinType.INNER);
	 * query.select(builder.construct(LocationDTO.class, root.get("locationId"),
	 * root.get("locationName"), root.get("country"), root.get("city"),
	 * root.get("district"), root.get("ward"), root.get("address"),
	 * root.get("mediaPath"), root.get("openTime"), root.get("closeTime"),
	 * root.get("reviewCount"), root.get("locationCategory").get("categoryId"),
	 * root.get("locationCategory").get("lCategoryName"),
	 * root.get("locationType").get("locationTypeId"),
	 * root.get("locationType").get("locationTypeName"), root.get("userId") ));
	 * locationList = session.createQuery(query).getResultList();
	 * transaction.commit(); session.close(); return locationList; }
	 */
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
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/*
	 * public long locationCount() { Session session =
	 * this.sessionFactory.openSession(); Query query =
	 * session.createQuery("select count(*) from Location"); return
	 * (Long)query.uniqueResult(); }
	 */

}
