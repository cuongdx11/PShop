package com.pshop.dao;

import java.util.List;

public interface ReportDAO {
	public List<Object[]> inventory();
	public List<Object[]> revenueByCategory();
	public List<Object[]> revenueByCustomer();
	public List<Object[]> revenueByYear();
	public List<Object[]> revenueByQuarter();
	public List<Object[]> revenueByMonth();
	public List<Object[]> revenueByProduct();
}
