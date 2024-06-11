package com.pshop.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.pshop.entity.Voucher;

@Repository
public interface VoucherDAO {
	Voucher findById(Integer id);
	List<Voucher> findAll();
	Voucher findByCode(String code);
	void update(Voucher entity);
	Voucher delete(Integer id);
	Voucher create(Voucher entity);
	
}
