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
	public boolean save(DiscountInfo DiscountInfo) {
		if(discountDAO.save(DiscountInfo))
			return true;
		return false;
	}

	@Override
	public boolean update(DiscountInfo DiscountInfo) {
		if(discountDAO.update(DiscountInfo))
			return true;
		return false;
	}

	@Override
	public boolean delete(Integer id) {
		if(discountDAO.delete(id))
			return true;
		return false;
	}

	@Override
	public List<DiscountInfo> findTopNewDiscountInfo() {
		return discountDAO.findTopNewDiscountInfo();
	}
}
