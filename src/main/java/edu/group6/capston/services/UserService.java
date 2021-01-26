package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.LocationVideo;;

public interface UserService {
	List<LocationVideo> findAll();
	/*
	 * int add(User user); int edit(UserDTO user, int id); int delete(int id);
	 * UserDTO findUserId(int id); List<Role> findRoleAll(); int totalRow();
	 */
}
