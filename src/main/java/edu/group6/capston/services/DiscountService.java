package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.DiscountInfo;

public interface DiscountService {
	List<DiscountInfo> findAll();
	boolean save(DiscountInfo discountInfo);
	boolean update(DiscountInfo discount);
	boolean delete(Integer id);
	List<DiscountInfo> findTopNewDiscountInfo();
	List<DiscountInfo> findAllByUserId(int userId);
	DiscountInfo findOne(Integer discountId);
	int delete(List<Integer> listDiscountId1);
}
