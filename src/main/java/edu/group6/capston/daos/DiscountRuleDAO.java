package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.DiscountRule;
import edu.group6.capston.models.Location;

@Repository
public class DiscountRuleDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<DiscountRule> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("from DiscountRule", DiscountRule.class).list();
		}
	}

}
