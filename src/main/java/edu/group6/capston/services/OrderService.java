package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.OrderStatus;
import edu.group6.capston.models.Orders;

public interface OrderService {
	List<Orders> findAll();
	Orders findByOrderId(int orderId);
	boolean save(Orders locationType);
	boolean update(Orders locationType);
	boolean delete(Integer id);
	List<OrderStatus> findAllOrderStatus();
	List<Orders> findByUserId(int userId);
	long newOrderCount();
	List<Orders> findAllByStatusId(int statusId);
}
