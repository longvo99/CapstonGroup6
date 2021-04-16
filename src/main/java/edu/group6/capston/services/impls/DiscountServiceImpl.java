package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.DiscountDAO;
import edu.group6.capston.models.DiscountInfo;
import edu.group6.capston.models.DiscountLimitedUse;
import edu.group6.capston.services.DiscountService;

@Service
public class DiscountServiceImpl implements DiscountService {

	@Autowired
	private DiscountDAO discountDAO;

	@Override
	public List<DiscountInfo> findAll() {
		return discountDAO.findAll();
	}

	@Override
	public boolean save(DiscountInfo discountInfo) {
		if (discountDAO.save(discountInfo))
			return true;
		return false;
	}

	@Override
	public boolean update(DiscountInfo discountInfo) {
		if (discountDAO.update(discountInfo))
			return true;
		return false;
	}

	@Override
	public boolean delete(Integer id) {
		if (discountDAO.delete(id))
			return true;
		return false;
	}

	@Override
	public List<DiscountInfo> findTopNewDiscountInfo() {
		return discountDAO.findTopNewDiscountInfo();
	}

	public List<DiscountInfo> findAllByUserId(int userId) {
		return discountDAO.findAllByUserId(userId);
	}

	@Override
	public DiscountInfo findOne(Integer discountId) {
		return discountDAO.findOne(discountId);
	}

	@Override
	public int delete(List<Integer> listDiscountId1) {
		return discountDAO.delete(listDiscountId1);
	}

	@Override
	public List<DiscountInfo> findBylocationId(int locationId) {
		return discountDAO.findBylocationId(locationId);
	}

	@Override
	public int limitedPerUser(String discountId) {
		return discountDAO.limitedPerUser(discountId);
	}

	@Override
	public DiscountLimitedUse findDiscountLimitedUse(String discountId, int userId) {
		return discountDAO.findDiscountLimitedUse(discountId, userId);
	}

	@Override
	public boolean updateDiscountLimitedUse(DiscountLimitedUse discountLimitedUse) {
		if (discountDAO.updateDiscountLimitedUse(discountLimitedUse))
			return true;
		return false;
	}

	@Override
	public boolean saveDiscountLimitedUse(DiscountLimitedUse discountLimitedUse) {
		if (discountDAO.saveDiscountLimitedUse(discountLimitedUse))
			return true;
		return false;
	}

	@Override
	public List<DiscountLimitedUse> findDiscountLimitedUseByLocationId(int locationId, int userId) {
		return discountDAO.findDiscountLimitedUseByLocationId(locationId, userId);
	}

	@Override
	public List<DiscountInfo> findLocationIdOnDiscount() {
		return discountDAO.findLocationIdOnDiscount();
	}
}
