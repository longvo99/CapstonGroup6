package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.DiscountInfo;

public interface DiscountService {
	List<DiscountInfo> findAll();
	boolean save(DiscountInfo discount);
	boolean update(DiscountInfo discount);
	boolean delete(Integer id);
	List<String> search(String keyword);
}
