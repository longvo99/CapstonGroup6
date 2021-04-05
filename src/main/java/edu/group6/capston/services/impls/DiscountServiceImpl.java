package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.DiscountDAO;
import edu.group6.capston.models.DiscountInfo;
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
}
