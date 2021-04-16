package edu.group6.capston.services;

import java.util.List;

import javax.validation.Valid;

import edu.group6.capston.models.ProductCombo;

public interface ProductComboService {

	List<ProductCombo> findAllByLocationId(Integer locationId);

	ProductCombo findOneById(Integer productComboId);

	boolean update(ProductCombo productCombo);

	boolean save(ProductCombo productCombo);

}
