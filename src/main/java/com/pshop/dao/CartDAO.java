package com.pshop.dao;

import java.util.List;
import com.pshop.entity.Cart;
import com.pshop.entity.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartDAO  {
	Cart findById(Integer id);
	
	List<Cart> findAll();
	
	Cart create(Cart entity);
	
	void update(Cart entity);
	
	Cart delete(Integer id);

	List<Cart> findByUser(User user);

	Cart save(Integer id);

	void clearCart(User user);
	
	
	
}

