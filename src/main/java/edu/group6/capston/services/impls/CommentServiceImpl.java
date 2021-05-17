package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.CommentDAO;
import edu.group6.capston.models.Comment;
import edu.group6.capston.services.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDAO commentDAO;

	@Override
	public boolean save(Comment comment) {
		return commentDAO.save(comment);
	}

	@Override
	public boolean delete(Comment comment) {
		return commentDAO.delete(comment);
	}

	@Override
	public List<Comment> findAllCommentByLocationId(Integer locationId) {
		return commentDAO.findAllCommentByLocationId(locationId);
	}

	@Override
	public List<Comment> findAllCommentByParentCommentId(Integer locationId) {
		return commentDAO.findAllCommentByParentCommentId(locationId);
	}

	@Override
	public Long findCountCommentByLocationId(Integer locationId) {
		return commentDAO.findCountCommentByLocationId(locationId);
	}

	@Override
	public List<Comment> findCommentReply(int userId) {
		return commentDAO.findCommentReply(userId);
	}

	@Override
	public boolean update(int commentId) {
		if(commentDAO.update(commentId))
			return true;
		return false;
	}

	@Override
	public int deleteParentID(Integer commentId) {
		return commentDAO.deleteParentID(commentId);
	}

	@Override
	public int delete(Integer commentId) {
		return commentDAO.delete(commentId);
	}

	
}
