package com.pshop.dao;

import java.util.List;

import com.pshop.entity.Order;
import com.pshop.entity.OrderDetail;
import com.pshop.entity.Product;
import com.pshop.entity.User;

public interface OrderDAO {
	Order findById(Integer id);

	List<Order> findAll();

	Order create(Order entity);

	void update(Order entity);

	Order delete(Integer id);

	void create(Order order, List<OrderDetail> details);

	List<Order> findByUser(User user);

	List<Product> findItemsByUser(User user);
}
