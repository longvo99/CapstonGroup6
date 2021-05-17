package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.Comment;

public interface CommentService {
	//List<Comment> findAll();
	boolean save(Comment comment);
	boolean update(int commentId);
	boolean delete(Comment comment);
	List<Comment> findAllCommentByLocationId(Integer locationId);
	List<Comment> findAllCommentByParentCommentId(Integer locationId);
	Long findCountCommentByLocationId(Integer locationId);
	List<Comment> findCommentReply(int userId);
	int deleteParentID(Integer commentId);
	int delete(Integer commentId);
}
