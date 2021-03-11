package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.Users;;

public interface UserService {
	List<Users> findAll();
	/*
	 * int add(User user); int edit(UserDTO user, int id); int delete(int id);
	 * UserDTO findUserId(int id); List<Role> findRoleAll(); int totalRow();
	 */
}
