package edu.group6.capston.daos;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.Users;

@Repository
public class UserDAO {

	@Autowired
	private BCryptPasswordEncoder bcyptPasswordEncoder;

	@Autowired
	private SessionFactory sessionFactory;

	public boolean save(Users customer) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			if (customer.getPassword() != null) {
				customer.setPassword(bcyptPasswordEncoder.encode(customer.getPassword()));
			}
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
			List<Users> list = session.createQuery("from Users", Users.class).list();
			return list;
		}
	}

	public List<Users> findByRoleId(String roleId) {
		try (Session session = this.sessionFactory.openSession()) {
			List<Users> list = session.createQuery("from Users WHERE roleId = '" + roleId + "'", Users.class).list();
			return list;
		}
	}

	public Users loadUserByUsername(final String username) {
		List<Users> users = new ArrayList<>();
		Session session = this.sessionFactory.openSession();
		users = session.createQuery("from Users where username=?", Users.class).setParameter(0, username).list();
		session.close();
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
		users = session.createQuery("from Users where username='" + username + "'", Users.class).list();
		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}
	}

	public Users findByUsersId(int i) {
		List<Users> users = new ArrayList<>();
		Session session = this.sessionFactory.openSession();
		users = session.createQuery("from Users where userId='" + i + "'", Users.class).list();
		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}
	}

	public Users findByEmail(String email) {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("FROM Users WHERE contactEmail = '" + email + "'", Users.class).uniqueResult();
		}
	}
	
	public Users findByResetPasswordToken(String token) {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("FROM Users WHERE resetPasswordToken = '" + token + "'", Users.class).uniqueResult();
		}
	}

	public Users findOneByUserId(Integer userId) {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("FROM Users WHERE userId = " + userId, Users.class).uniqueResult();
		}
	}

	public boolean update(Users user) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			if (user.getPassword() != null) {
				user.setPassword(bcyptPasswordEncoder.encode(user.getPassword()));
			}
			session.update(user);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public void updateFailedAttempts(int failAttempts, String username) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx  = session.beginTransaction();
			String hql = "update Users set failedAttempt = :failedAttempt where username = :username";
			Query query = session.createQuery(hql);
			query.setParameter("failedAttempt", failAttempts);
			query.setParameter("username", username);
			query.executeUpdate();
			tx.commit();
		}
	}

	public void updateBannedAndLockTime(Users user) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx  = session.beginTransaction();
			String hql = "update Users set banned = :banned, lockTime = :lockTime where username = :username";
			Query query = session.createQuery(hql);
			query.setParameter("banned", user.isBanned());
			query.setParameter("lockTime", user.getLockTime());
			query.setParameter("username", user.getUsername());
			query.executeUpdate();
			tx.commit();
		}
	}

	public void updateBannedAndTimeAndFailedAttempt(Users user) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx  = session.beginTransaction();
			String hql = "update Users set banned = :banned, lockTime = :lockTime, failedAttempt = :failedAttempt where username = :username";
			Query query = session.createQuery(hql);
			query.setParameter("banned", user.isBanned());
			query.setParameter("lockTime", user.getLockTime());
			query.setParameter("failedAttempt", user.getFailedAttempt());
			query.setParameter("username", user.getUsername());
			query.executeUpdate();
			tx.commit();
		}
	}

	public boolean checkUserExist(String username) {
		try (Session session = this.sessionFactory.openSession()) {
			if(session.createQuery("FROM Users WHERE username = '" + username + "'", Users.class).uniqueResult() != null) {
				return true;
			};
			return false;
		}
	}
	public Users findByEmailAndUserName(String email, String username) {
		try (Session session = this.sessionFactory.openSession()) {
			return session.createQuery("FROM Users WHERE contactEmail = '" + email + "' AND username = '" + username + "'" , Users.class).uniqueResult();
		}
	}
	public boolean setStatusByUserId(int id, Boolean status) {
		try (Session session = this.sessionFactory.openSession()) {
			Transaction tx  = session.beginTransaction();
			String hql = "update Users set banned = :banned where userId = :userId";
			Query query = session.createQuery(hql);
			query.setParameter("banned", status);
			query.setParameter("userId", id);
			int i = query.executeUpdate();
			tx.commit();
			if(i > 0) {
				return true;
			} return false;
		}
	}
}
