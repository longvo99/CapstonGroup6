package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.Users;;

public interface UserService {
	List<Users> findAll();
	List<Users> findByRoleName(String roleName);
	Users getProfile(Users users);
	boolean save(Users user);
	Users findByUsername(String username);
	Users findByUsersId(int i);
	Users findByEmail(String email);
	boolean update(Users user);
}
