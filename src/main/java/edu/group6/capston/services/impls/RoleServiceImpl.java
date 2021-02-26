package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.RoleDAO;
import edu.group6.capston.models.Roles;
import edu.group6.capston.services.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDAO roleDAO;
	
	@Override
	public List<Roles> findAll() {
		return roleDAO.findAll();
	}

	@Override
	public boolean save(Roles LocationTypies) {
		if(roleDAO.save(LocationTypies))
			return true;
		return false;
	}

	@Override
	public boolean update(Roles LocationTypies) {
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
