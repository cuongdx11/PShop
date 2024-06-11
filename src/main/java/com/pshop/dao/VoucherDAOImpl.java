package com.pshop.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pshop.entity.Category;
import com.pshop.entity.Voucher;

@Transactional
@Repository
public class VoucherDAOImpl implements VoucherDAO {
	@Autowired
	SessionFactory factory;
	public Voucher findById(Integer id) {
		Session session  =factory.getCurrentSession();
		Voucher entity = session.find(Voucher.class, id);
		return entity;
		
	}
	@Override
	public List<Voucher> findAll() {
		String hql = "FROM Voucher";
		Session session=factory.getCurrentSession();
		TypedQuery<Voucher> query = session.createQuery(hql,Voucher.class);
		List<Voucher> list  = query.getResultList();
		return list;
	}
	@Override
    public Voucher findByCode(String vouchercode) {
        String hql = "FROM Voucher v WHERE v.vouchercode = :vouchercode";
        Session session = factory.getCurrentSession();
        TypedQuery<Voucher> query = session.createQuery(hql, Voucher.class);
        query.setParameter("vouchercode", vouchercode);
        List<Voucher> voucherList = query.getResultList();
        if (voucherList != null && !voucherList.isEmpty()) {
            return voucherList.get(0);
        }
        return null;
    }
	@Override
	public void update(Voucher entity) {
		Session session=factory.getCurrentSession();
		session.update(entity);
		
	}
	@Override
	public Voucher delete(Integer id) {
		Session session=factory.getCurrentSession();
		Voucher entity=session.find(Voucher.class, id);
		session.delete(entity);
		return entity;
		
	}
	@Override
	public Voucher create(Voucher entity) {
		Session session=factory.getCurrentSession();
		session.save(entity);
		return null;
		
	}
}
