package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.Role;

public interface RoleService {
	List<Role> findAll();
	boolean save(Role role);
	boolean update(Role role);
	boolean delete(String id);
}
