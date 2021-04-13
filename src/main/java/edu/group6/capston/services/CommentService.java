package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.Comment;

public interface CommentService {
	//List<Comment> findAll();
	boolean save(Comment comment);
	//boolean update(Comment discount);
	boolean delete(Comment comment);
	List<Comment> findAllCommentByLocationId(Integer locationId);
	List<Comment> findAllCommentByParentCommentId(Integer locationId);
	Long findCountCommentByLocationId(Integer locationId);
}
