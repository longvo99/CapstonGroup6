package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.OrderDAO;
import edu.group6.capston.models.Order;
import edu.group6.capston.services.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public List<Order> findAll() {
		return orderDAO.findAll();
	}

	@Override
	public boolean save(Order LocationTypies) {
		if(orderDAO.save(LocationTypies))
			return true;
		return false;
	}

	@Override
	public boolean update(Order LocationTypies) {
		if(orderDAO.update(LocationTypies))
			return true;
		return false;
	}

	@Override
	public boolean delete(Integer id) {
		if(orderDAO.delete(id))
			return true;
		return false;
	}
}
