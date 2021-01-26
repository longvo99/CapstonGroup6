package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.LocationVideo;

@Repository(value = "locationDAO")
public class LocationDAO extends AbstractDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void save(LocationVideo customer) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.persist(customer);
		tx.commit();
		session.close();
	}

	public List<LocationVideo> findAll() {
		Session session = this.sessionFactory.openSession();
		List<LocationVideo> result = session.createQuery("FROM LocationVideo", LocationVideo.class).getResultList();
		return result;
	}

	public static void main(String[] args) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("HibernateConf.java");
		LocationDAO customerDAO = (LocationDAO) context.getBean("locationDAO");

		customerDAO.save(new LocationVideo(2, "bdf", "bdf"));
		customerDAO.save(new LocationVideo(3, "Liverpool", "abada"));

		List<LocationVideo> listCustomer = customerDAO.findAll();
		for (LocationVideo customer : listCustomer) {
			System.out.println(
					customer.getLocationVideoId() + " - " + customer.getLVideoAlt() + " - " + customer.getLVideoPath());
		}
		context.close();
	}
}
