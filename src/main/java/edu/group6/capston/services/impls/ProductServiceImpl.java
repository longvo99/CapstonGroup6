package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.ProductDAO;
import edu.group6.capston.dtos.LocationDTO;
import edu.group6.capston.dtos.OrderDTO;
import edu.group6.capston.dtos.ProductDTO;
import edu.group6.capston.dtos.ProductDTO2;
import edu.group6.capston.models.Product;
import edu.group6.capston.services.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO ProductDAO;

	@Override
	public List<Product> findByLocationId(int locationId) {
		return ProductDAO.findByLocationId(locationId);
	}

	@Override
	public boolean save(Product Products) {
		if (ProductDAO.save(Products))
			return true;
		return false;
	}

	@Override
	public boolean update(Product Products) {
		if (ProductDAO.update(Products))
			return true;
		return false;
	}

	@Override
	public boolean delete(Integer id) {
		if (ProductDAO.delete(id))
			return true;
		return false;
	}

	@Override
	public Product findByProductId(Integer productId) {
		return ProductDAO.findByProductId(productId);
	}

	@Override
	public List<LocationDTO> findMinMaxPriceLocation() {
		return ProductDAO.findMinMaxPriceLocation();
	}

	@Override
	public OrderDTO findByProductIdOrder(Integer productId) {
		return ProductDAO.findByProductIdOrder(productId);
	}

	public List<ProductDTO> searchAllProductName(String search) {
		return ProductDAO.searchAllProductName(search);
	}
	
	
	@Override
	public OrderDTO findByComboIdOrder(Integer comboId) {
		return ProductDAO.findByComboIdOrder(comboId);
	}

	@Override
	public OrderDTO findComboIdOrderDetail(int id) {
		return ProductDAO.findComboIdOrderDetail(id);
	}

	@Override
	public OrderDTO findProductIdOrderDetail(int id) {
		return ProductDAO.findProductIdOrderDetail(id);
	}

	@Override
	public List<String> searchProductNameByLocationId(List<Integer> locationIdList) {
		return ProductDAO.searchProductNameByLocationId(locationIdList);
	}

	@Override
	public List<ProductDTO2> findAllByLocationId(Integer locationId) {
		return ProductDAO.findAllByLocationId(locationId);
	}

	@Override
	public List<ProductDTO2> findAllByProductComboId(Integer productComboId) {
		return ProductDAO.findAllByProductComboId(productComboId);
	}
}
