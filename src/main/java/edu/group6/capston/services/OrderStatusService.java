package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.OrderStatus;

public interface OrderStatusService {
	List<OrderStatus> findAll();
	boolean save(OrderStatus OrderStatus);
	boolean update(OrderStatus OrderStatus);
	boolean delete(String id);
}
