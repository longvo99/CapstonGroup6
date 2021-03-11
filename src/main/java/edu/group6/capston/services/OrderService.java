package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.Orders;

public interface OrderService {
	List<Orders> findAll();
	boolean save(Orders locationType);
	boolean update(Orders locationType);
	boolean delete(Integer id);
}
