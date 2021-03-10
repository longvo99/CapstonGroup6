package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.Order;

public interface OrderService {
	List<Order> findAll();
	boolean save(Order locationType);
	boolean update(Order locationType);
	boolean delete(Integer id);
}
