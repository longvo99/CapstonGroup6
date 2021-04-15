package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.group6.capston.daos.DiscountRuleDAO;
import edu.group6.capston.models.DiscountRule;
import edu.group6.capston.services.DiscountRuleService;

@Service
@Transactional
public class DiscountRuleServiceImpl implements DiscountRuleService{

	@Autowired
	private DiscountRuleDAO discountRuleDAO;
	
	@Override
	public List<DiscountRule> findAll() {
		return discountRuleDAO.findAll();
	}
}
