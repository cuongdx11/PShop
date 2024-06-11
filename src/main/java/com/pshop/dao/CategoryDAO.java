package com.pshop.dao;

import java.util.List;

import com.pshop.entity.Category;

public interface CategoryDAO {
	Category findById(Integer id);

	List<Category> findAll();

	Category create(Category entity);

	void update(Category entity);

	Category delete(Integer id);

	List<Category> findListC();

	List<Category> findListC1();
}
