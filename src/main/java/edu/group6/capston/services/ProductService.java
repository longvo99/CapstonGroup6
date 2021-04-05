package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.dtos.OrderDTO;
import edu.group6.capston.models.Product;

public interface ProductService {
	List<Product> findByLocationId(int locationId);
	boolean save(Product product);
	boolean update(Product product);
	boolean delete(Integer id);
	Product findByProductId(Integer productId);
<<<<<<< Updated upstream
	List<LocationDTO> findMinMaxPriceLocation();
	OrderDTO findByProductIdOrder(Integer productId);
=======
	List<String> searchProductNameByUserId(int userId);
>>>>>>> Stashed changes
}
