package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.OrderDetail;

public interface OrderDetailService {
	List<OrderDetail> findByOrderId(int orderId);
	/*
	 * boolean save(Orders locationType); boolean update(Orders locationType);
	 * boolean delete(Integer id);
	 */
}
