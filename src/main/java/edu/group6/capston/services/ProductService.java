package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.models.Product;

public interface ProductService {
	List<Product> findByLocationId(int locationId);
	boolean save(Product product);
	boolean update(Product product);
	boolean delete(Integer id);
	Product findByProductId(Integer productId);
}
