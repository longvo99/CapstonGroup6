package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.OrderDetailDAO;
import edu.group6.capston.dtos.OrderDTO;
import edu.group6.capston.models.OrderDetail;
import edu.group6.capston.services.OrderDetailService;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {
	
	@Autowired
	private OrderDetailDAO orderDetailDAO;
	
	@Override
	public List<OrderDetail> findByOrderId(int orderId) {
		return orderDetailDAO.findByOrderId(orderId);
	}
	/*
	@Override
	public boolean save(OrderDetail LocationTypies) {
		if(orderDAO.save(LocationTypies))
			return true;
		return false;
	}

	@Override
	public boolean update(OrderDetail LocationTypies) {
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
	*/

	@Override
	public boolean save(OrderDetail orderDetail) {
		return orderDetailDAO.save(orderDetail);
	}

	@Override
	public List<OrderDTO> findOrderDTO(int orderId) {
		// TODO Auto-generated method stub
		return orderDetailDAO.findByOrderDTO(orderId);
	}
}
