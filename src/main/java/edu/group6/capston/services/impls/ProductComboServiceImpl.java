package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.ProductComboDAO;
import edu.group6.capston.models.ProductCombo;
import edu.group6.capston.services.ProductComboService;

@Service
public class ProductComboServiceImpl implements ProductComboService {
	
	@Autowired
	private ProductComboDAO productComboDAO;

	@Override
	public List<ProductCombo> findAllByLocationId(Integer locationId) {
		return productComboDAO.findAllByLocationId(locationId);
	}

	@Override
	public ProductCombo findOneById(Integer productComboId) {
		return productComboDAO.findOneById(productComboId);
	}

	@Override
	public boolean update(ProductCombo productCombo) {
		return productComboDAO.update(productCombo);
	}

	@Override
	public boolean save(ProductCombo productCombo) {
		return productComboDAO.save(productCombo);
	}


}
