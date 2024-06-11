package com.pshop.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pshop.entity.Ship;



@Transactional
@Repository
public class ShipDAOImpl implements ShipDAO {
	@Autowired
	SessionFactory factory;
	public Ship findById(Integer  id) {
		Session session = factory.getCurrentSession();
		Ship entity = session.find(Ship.class, id);
		return entity;
	}
	@Override
	public List<Ship> findAll() {
		String hql = "FROM Ship";
		Session session=factory.getCurrentSession();
		TypedQuery<Ship> query = session.createQuery(hql,Ship.class);
		List<Ship> list  = query.getResultList();
		return list;
	}
}
