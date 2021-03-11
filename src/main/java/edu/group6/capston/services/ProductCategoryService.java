package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.ProductCategory;

public interface ProductCategoryService {
	List<ProductCategory> findAll();
	boolean save(ProductCategory discount);
	boolean update(ProductCategory discount);
	boolean delete(Integer id);
}
