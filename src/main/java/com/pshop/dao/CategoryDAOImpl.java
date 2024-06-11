package com.pshop.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pshop.entity.Category;

@Transactional
@Repository
public class CategoryDAOImpl implements CategoryDAO{

	@Autowired
	SessionFactory factory;
	
	@Override
	public Category findById(Integer id) {
		Session session=factory.getCurrentSession();
		Category entity=session.find(Category.class, id);
		return entity;
	}

	@Override
	public List<Category> findAll() {
		String hql="FROM Category";
		Session session=factory.getCurrentSession();
		TypedQuery<Category> query=session.createQuery(hql,Category.class);
		List<Category> list=query.getResultList();
		return list;
	}

	@Override
	public Category create(Category entity) {
		Session session=factory.getCurrentSession();
		session.save(entity);
		return null;
	}

	@Override
	public void update(Category entity) {
		Session session=factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public Category delete(Integer id) {
		Session session=factory.getCurrentSession();
		Category entity=session.find(Category.class, id);
		session.delete(entity);
		return entity;
	}

	@Override
	public List<Category> findListC() {
		String hql="FROM Category c WHERE c.name ='Laptop' ";
		Session session=factory.getCurrentSession();
		TypedQuery<Category> query=session.createQuery(hql,Category.class);
		List<Category> list=query.getResultList();
		return list;
	}
	@Override
	public List<Category> findListC1() {
		String hql="FROM Category c WHERE c.name <> 'Laptop' ";
		Session session=factory.getCurrentSession();
		TypedQuery<Category> query=session.createQuery(hql,Category.class);
		List<Category> list=query.getResultList();
		return list;
	}


}
