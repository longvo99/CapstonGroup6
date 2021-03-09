package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.ProductCategories;

public interface ProductCategoryService {
	List<ProductCategories> findAll();
	boolean save(ProductCategories discount);
	boolean update(ProductCategories discount);
	boolean delete(Integer id);
}
