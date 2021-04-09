package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.OrderStatusDAO;
import edu.group6.capston.models.OrderStatus;
import edu.group6.capston.services.OrderStatusService;

@Service
public class OrderStatusServiceImpl implements OrderStatusService {
	
	@Autowired
	private OrderStatusDAO OrderStatusDAO;
	
	@Override
	public List<OrderStatus> findAll() {
		return OrderStatusDAO.findAll();
	}

	@Override
	public boolean save(OrderStatus LocationTypies) {
		if(OrderStatusDAO.save(LocationTypies))
			return true;
		return false;
	}

	@Override
	public boolean update(OrderStatus LocationTypies) {
		if(OrderStatusDAO.update(LocationTypies))
			return true;
		return false;
	}

	@Override
	public boolean delete(String id) {
		if(OrderStatusDAO.delete(id))
			return true;
		return false;
	}
}
