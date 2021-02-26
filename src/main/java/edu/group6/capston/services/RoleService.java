package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.Roles;;

public interface RoleService {
	List<Roles> findAll();
	boolean save(Roles role);
	boolean update(Roles role);
	boolean delete(Integer id);
}
