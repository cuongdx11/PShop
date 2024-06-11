package com.pshop.dao;

import java.util.List;

import com.pshop.entity.Order;
import com.pshop.entity.OrderDetail;

public interface OrderDetailDAO {
	OrderDetail findById(Integer id);

	List<OrderDetail> findAll();

	OrderDetail create(OrderDetail entity);

	void update(OrderDetail entity);

	OrderDetail delete(Integer id);

	List<OrderDetail> findByOrder(Order order);
}
