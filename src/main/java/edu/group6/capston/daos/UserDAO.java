package edu.group6.capston.daos;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.Users;

@Repository
public class UserDAO{
	
	@Autowired
	private BCryptPasswordEncoder bcyptPasswordEncoder;

	@Autowired
	private SessionFactory sessionFactory;

	public boolean save(Users customer) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			if(customer.getPassword() != null) {
				customer.setPassword(bcyptPasswordEncoder.encode(customer.getPassword()));
			}
			System.out.println("acs7777777");
			session.persist(customer);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public List<Users> findAll() {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("from Users", Users.class).list();
		}
	}

	public List<Users> findByRoleName(String roleId) {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("from Users WHERE roleId = " + "'"+roleId+"'" , Users.class).list();
		}
	}
	
	public Users loadUserByUsername(final String username) {
	    List<Users> users = new ArrayList<>();
	    Session session = this.sessionFactory.openSession();
	    users = session.createQuery("from Users where username=?", Users.class).setParameter(0, username).list();
	    if (users.size() > 0) {
	      return users.get(0);
	    } else {
	      return null;
	    }
	  }

	public Users getProfile(Users users) {
		return null;
	}

	public Users findByUsername(String username) {
		List<Users> users = new ArrayList<>();
	    Session session = this.sessionFactory.openSession();
	    users = session.createQuery("from Users where username='"+ username +"'", Users.class).list();
	    if (users.size() > 0) {
	      return users.get(0);
	    } else {
	      return null;
	    }
	}

	public Users findByEmail(String email) {
		List<Users> users = new ArrayList<>();
	    Session session = this.sessionFactory.openSession();
	    users = session.createQuery("from Users where contactEmail='"+ email +"'", Users.class).list();
	    if (users.size() > 0) {
	      return users.get(0);
	    } else {
	      return null;
	    }
	}
}
