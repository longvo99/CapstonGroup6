package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.dtos.OrderDTO;
import edu.group6.capston.models.OrderDetail;

public interface OrderDetailService {
	List<OrderDetail> findByOrderId(int orderId);
	List<OrderDTO> findOrderDTO(int orderId);
	boolean save(OrderDetail orderDetail);
}
