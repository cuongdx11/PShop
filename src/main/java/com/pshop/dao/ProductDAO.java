package com.pshop.dao;

import java.util.List;

import com.pshop.entity.Product;

public interface ProductDAO {
	Product findById(Integer id);

	List<Product> findAll();

	Product create(Product entity);

	void update(Product entity);

	Product delete(Integer id);

	List<Product> findByCategoryId(Integer categoryId);

	List<Product> findByKeywords(String keywords);

	List<Product> findByIds(String ids);

	List<Product> findBySpecial(Integer id);

	List<Product> findByPrice(Integer id);

	List<Product> findByPrice1(Integer id);
}
