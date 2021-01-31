package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.UserDAO;
import edu.group6.capston.dtos.UserDTO;
import edu.group6.capston.services.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO UserDAO;
	
	@Override
	public List<UserDTO> findAll() {
		return UserDAO.findAll();
	}
	/*
	@Override
	public int add(User User) {
		return UserDAO.add(User);
	}

	@Override
	public int edit(UserDTO User, int cid) {
		return UserDAO.edit(User, cid);
	}

	@Override
	public int delete(int id) {
		return UserDAO.delete(id);
	}

	@Override
	public UserDTO findUserId(int cid) {
		return UserDAO.findUserId(cid);
	}

	@Override
	public List<Role> findRoleAll() {
		return UserDAO.findRoleAll();
	}

	@Override
	public int totalRow() {
		return UserDAO.totalRow();
	}
	*/
}
