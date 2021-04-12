package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.ProductCategoryDAO;
import edu.group6.capston.models.ProductCategory;
import edu.group6.capston.services.ProductCategoryService;

@Service
public class ProductCategoryServiceImpl implements ProductCategoryService {

	@Autowired
	private ProductCategoryDAO ProductCategoriesDAO;

	@Override
	public List<ProductCategory> findAll() {
		return ProductCategoriesDAO.findAll();
	}

	@Override
	public boolean save(ProductCategory ProductCategoriess) {
		if (ProductCategoriesDAO.save(ProductCategoriess))
			return true;
		return false;
	}

	@Override
	public boolean update(ProductCategory ProductCategoriess) {
		if (ProductCategoriesDAO.update(ProductCategoriess))
			return true;
		return false;
	}

	@Override
	public boolean delete(Integer id) {
		if (ProductCategoriesDAO.delete(id))
			return true;
		return false;
	}

	@Override
	public List<String> searchProductCategoryName() {
		/*
		 * List<String> listStr = new ArrayList<>(); List<ProductCategory> list =
		 * ProductCategoriesDAO.findAll(); for (ProductCategory productCategory : list)
		 * { listStr.add(productCategory.getProductCategoryName()); }
		 */
		return ProductCategoriesDAO.searchProductCategoryName();
	}

}
