package com.pshop.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pshop.entity.Cart;
import com.pshop.entity.Order;
import com.pshop.entity.User;

@Transactional
@Repository
public class CartDAOImpl implements CartDAO {
	@Autowired
	SessionFactory factory;
	public Cart findById(Integer id) {
		Session session  =factory.getCurrentSession();
		Cart entity = session.find(Cart.class, id);
		return entity;
		
	}
	@Override
	public List<Cart> findAll() {
		String hql = "FROM Cart";
		Session session=factory.getCurrentSession();
		TypedQuery<Cart> query = session.createQuery(hql,Cart.class);
		List<Cart> list  = query.getResultList();
		return list;
	}
	@Override
	public Cart create(Cart entity) {
		Session session=factory.getCurrentSession();
		session.save(entity);
		return entity;
	}
	@Override
	public void update(Cart entity) {
		Session session=factory.getCurrentSession();
		session.update(entity);
		
	}
	@Override
	public Cart delete(Integer id) {
		Session session=factory.getCurrentSession();
		Cart entity = session.find(Cart.class, id);
		session.delete(entity);
		return entity;
	}
	@Override
	public Cart save(Integer id) {
		Session session=factory.getCurrentSession();
		Cart entity = session.find(Cart.class, id);
		session.delete(entity);
		return entity;
	}
	
	@Override
	public List<Cart> findByUser(User user) {
		String hql="FROM Cart o WHERE o.user.id=:uid";
		Session session=factory.getCurrentSession();
		TypedQuery<Cart> query=session.createQuery(hql,Cart.class);
		query.setParameter("uid", user.getId());
		List<Cart> list=query.getResultList();
		return list;
	}
	@Override
	public void clearCart(User user) {
	    String hql = "DELETE FROM Cart o WHERE o.user.id = :uid";
	    Session session = factory.getCurrentSession();
	    TypedQuery<Cart> query=session.createQuery(hql,Cart.class);
	    query.setParameter("uid", user.getId());
	}

	

}
