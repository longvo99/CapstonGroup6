package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.DiscountInfo;
import edu.group6.capston.models.DiscountLimitedUse;

public interface DiscountService {
	List<DiscountInfo> findAll();
	List<DiscountInfo> findLocationIdOnDiscount();
	boolean save(DiscountInfo discountInfo);
	boolean update(DiscountInfo discount);
	boolean delete(Integer id);
	List<DiscountInfo> findTopNewDiscountInfo();
	List<DiscountInfo> findAllByUserId(int userId);
	DiscountInfo findOne(Integer discountId);
	int delete(List<Integer> listDiscountId1);
	List<DiscountInfo> findBylocationId(int locationId);
	int limitedPerUser(String discountId);
	
	DiscountLimitedUse findDiscountLimitedUse(String discountId, int userId);
	boolean updateDiscountLimitedUse(DiscountLimitedUse discountLimitedUse);
	boolean saveDiscountLimitedUse(DiscountLimitedUse discountLimitedUse);
	List<DiscountLimitedUse> findDiscountLimitedUseByLocationId(int locationId, int userId);
}
