package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.dtos.OrderDTO;
import edu.group6.capston.dtos.ProductDTO;
import edu.group6.capston.dtos.ProductDTO2;
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
	List<ProductDTO> searchAllProductName(String search);
	OrderDTO findComboIdOrderDetail(int id);
	OrderDTO findProductIdOrderDetail(int id);
	List<String> searchProductNameByLocationId(List<Integer> locationIdList);
	List<ProductDTO2> findAllByLocationId(Integer locationId);
	List<ProductDTO2> findAllByProductComboId(Integer productComboId);
}
