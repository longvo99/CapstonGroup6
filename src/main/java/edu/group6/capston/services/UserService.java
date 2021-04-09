package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.Users;;

public interface UserService {
	List<Users> findAll();
<<<<<<< HEAD
	List<Users> findByRoleId(String roleName);
=======
	List<Users> findByRoleName(String roleName);
>>>>>>> 28c95529c879dd92f3a2b5775ca70cb518e9212e
	Users getProfile(Users users);
	boolean save(Users user);
	Users findByUsername(String username);
	Users findByUsersId(int i);
	Users findByEmail(String email);
<<<<<<< HEAD
	Users findByResetPasswordToken(String token);
	Users findOneByUserId(Integer userId);
	boolean update(Users user);
	boolean checkUserExist(String username);
	void sendMailWarning(String mail);
	void sendMailNewAccount(String mail, String username);
	boolean setStatusByUserId(int id, Boolean status);
=======
	boolean update(Users user);
>>>>>>> 28c95529c879dd92f3a2b5775ca70cb518e9212e
}
