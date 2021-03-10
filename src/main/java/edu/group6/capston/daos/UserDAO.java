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

import edu.group6.capston.dtos.UserDTO;
import edu.group6.capston.models.Users;

@Repository
public class UserDAO{

	@Autowired
	private SessionFactory sessionFactory;

	public void save(Users customer) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.persist(customer);
		tx.commit();
		session.close();
	}

	public List<UserDTO> findAll() {
		List<UserDTO> locationList = null;
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<UserDTO> query = builder.createQuery(UserDTO.class);
		Root<Users> root = query.from(Users.class);
		root.join("roles", JoinType.INNER);
		query.select(builder.construct(UserDTO.class,
			root.get("userId"),
			root.get("username"),
			root.get("password"),
			root.get("fullname"),
			root.get("phone"),
			root.get("email"),
			root.get("address"),
			root.get("gender"),
			root.get("dateOfBirth"),
			root.get("avatarPath"),
			root.get("avatarAlt"),
			root.get("description"),
			root.get("joinDate"),
			root.get("banned"),
			root.get("hide"),
			root.get("roles").get("roleName")
		));
		locationList = session.createQuery(query).getResultList();
		transaction.commit();
		session.close();
		return locationList;
	}
}
