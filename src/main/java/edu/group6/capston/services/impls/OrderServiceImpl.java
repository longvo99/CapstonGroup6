package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.OrderDAO;
import edu.group6.capston.models.OrderStatus;
import edu.group6.capston.models.Orders;
import edu.group6.capston.services.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public List<Orders> findAll() {
		return orderDAO.findAll();
	}

	@Override
	public boolean save(Orders LocationTypies) {
		if(orderDAO.save(LocationTypies))
			return true;
		return false;
	}

	@Override
	public boolean update(Orders LocationTypies) {
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

	@Override
	public Orders findByOrderId(int orderId) {
		return orderDAO.findByOrderId(orderId);
	}

	@Override
	public List<OrderStatus> findAllOrderStatus() {
		return orderDAO.findAllOrderStatus();
	}

	@Override
	public List<Orders> findByUserId(int userId) {
		return orderDAO.findByUserId(userId);
	}

	@Override
	public long newOrderCount() {
		return orderDAO.newOrderCount();
	}

	@Override
	public List<Orders> findAllByStatusId(int statusId) {
		return orderDAO.findAllByStatusId(statusId);
	}

	@Override
	public List<Object[]> revenueByYear(int year) {
		return orderDAO.revenueByYear(year);
	}

	@Override
	public double largesttotalPrice(int year) {
		return orderDAO.largesttotalPrice(year);
	}

	@Override
	public double findTotalOrderedPricelocationId(int locationId, int userId) {
		return orderDAO.findTotalOrderedPricelocationId(locationId, userId);
	}
}
