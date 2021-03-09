package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.RoleDAO;
import edu.group6.capston.models.Role;
import edu.group6.capston.services.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDAO roleDAO;
	
	@Override
	public List<Role> findAll() {
		return roleDAO.findAll();
	}

	@Override
	public boolean save(Role LocationTypies) {
		if(roleDAO.save(LocationTypies))
			return true;
		return false;
	}

	@Override
	public boolean update(Role LocationTypies) {
		if(roleDAO.update(LocationTypies))
			return true;
		return false;
	}

	@Override
	public boolean delete(Integer id) {
		if(roleDAO.delete(id))
			return true;
		return false;
	}
}
