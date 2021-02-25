package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.Discounts;

public interface DiscountService {
	List<Discounts> findAll();
	boolean save(Discounts discount);
	boolean update(Discounts discount);
	boolean delete(Integer id);
}
