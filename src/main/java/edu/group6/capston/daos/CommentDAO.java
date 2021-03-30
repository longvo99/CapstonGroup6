package edu.group6.capston.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.group6.capston.models.Comment;

@Repository
public class CommentDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	public boolean save(Comment comment) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.persist(comment);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean delete(Comment comment) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(comment);
			tx.commit();
			session.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public List<Comment> findAllCommentByLocationId(Integer locationId) {
		try (Session session = this.sessionFactory.openSession()) {
			List<Comment> list = session.createQuery("from Comment WHERE locationId = " + locationId + " AND parentCommentId = 0", Comment.class).list();
			return list;
		}
	}
	
	public List<Comment> findAllCommentByParentCommentId(Integer locationId) {
		try (Session session = this.sessionFactory.openSession()) {
			List<Comment> list = session.createQuery("from Comment WHERE locationId = " + locationId + " AND parentCommentId != 0", Comment.class).list();
			return list;
		}
	}
}
