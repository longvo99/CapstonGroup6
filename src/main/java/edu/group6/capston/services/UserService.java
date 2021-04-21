package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.Users;;

public interface UserService {
	List<Users> findAll();
	List<Users> findByRoleId(String roleName);
	Users getProfile(Users users);
	boolean save(Users user);
	Users findByUsername(String username);
	Users findByUsersId(int i);
	Users findByEmail(String email);
	Users findByResetPasswordToken(String token);
	Users findOneByUserId(Integer userId);
	boolean update(Users user);
	boolean update1(Users user);
	boolean checkUserExist(String username);
	void sendMailWarning(String mail);
	void sendMailNewAccount(String mail, String username);
	boolean setStatusByUserId(int id, Boolean status);
}
