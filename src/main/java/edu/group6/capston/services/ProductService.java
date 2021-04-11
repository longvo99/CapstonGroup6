package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.dtos.OrderDTO;
import edu.group6.capston.dtos.ProductDTO;
import edu.group6.capston.models.Product;

public interface ProductService {
	List<Product> findByLocationId(int locationId);
	boolean save(Product product);
	boolean update(Product product);
	boolean delete(Integer id);
	Product findByProductId(Integer productId);
	List<LocationDTO> findMinMaxPriceLocation();
	OrderDTO findByProductIdOrder(Integer productId);
	OrderDTO findByComboIdOrder(Integer productId);
	List<String> searchProductNameByUserId(int userId);
	List<ProductDTO> searchAllProductName(String search);
	OrderDTO findComboIdOrderDetail(int id);
	OrderDTO findProductIdOrderDetail(int id);
}
