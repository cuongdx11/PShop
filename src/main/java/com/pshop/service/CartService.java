package com.pshop.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.pshop.dao.CartDAO;
import com.pshop.dao.ProductDAO;
import com.pshop.entity.Cart;
import com.pshop.entity.Product;
import com.pshop.entity.User;

@SessionScope 
@Service
public class CartService {

	@Autowired
	ProductDAO dao;
	@Autowired
	CartDAO cdao;
	@Autowired
	HttpSession session;
	Map<Integer, Product> map = new HashMap<>();//Hien thi danh sach gio hangf

	public void add(Integer id) {//Chon san pham
		Product p = map.get(id);
		if (p == null) {
			p = dao.findById(id);
			p.setQuantity(1);
			map.put(id, p);
		} else {
			p.setQuantity(p.getQuantity() + 1);
		}
	}
	public void addt(Integer id) {//Chon san pham
//		Product p = map.get(id);
//		Cart cartItem = new Cart();
		User user =(User) session.getAttribute("user");
		List<Cart> cartItem = cdao.findByUser(user);
		Cart cart = new Cart();
//		System.out.println("Số lượng phần tử trong danh sách là: " + cartItem.size());
		if (cartItem.isEmpty()) {
			Product p = dao.findById(id);
			cart.setProduct(p);
			cart.setPrice(p.getUnitPrice());
			cart.setQuantity(1.0);
			cart.setUser(user);
			cdao.create(cart);
		} else {
			int check = 0;
			for(Cart c : cartItem) {
				if(c.getProduct().getId().equals(id)) {
					c.setQuantity(c.getQuantity() + 1);
					cdao.update(c);
					check =1;
				}
				
			}
			if(check==0) {
				Product p = dao.findById(id);
				cart.setProduct(p);
				cart.setPrice(p.getUnitPrice());
				cart.setQuantity(1.0);
				cart.setUser(user);
				cdao.create(cart);
			}
			
//			p.setQuantity(p.getQuantity() + 1);
//			cartItem.setQuantity(cartItem.getQuantity() + 1);
		}
//		cdao.create(cartItem);
	}
	public void remove(Integer id) {//Xoa theo id san pham
		
		map.remove(id);
	}

	public void update(Integer id, int qty) {//Cap nhat san pham
		Product p = map.get(id);
		p.setQuantity(qty);
	}

	public void clear() {//Xoa tat ca san pham
		map.clear();
	}

	public int getCount() {//Hien thi so luong
		Collection<Product> ps = this.getItems();
		int count = 0;
		for (Product p : ps) {
			count += p.getQuantity();
		}
		return count;
	}
	public int getCounts() {
		User user =(User) session.getAttribute("user");
		int count = 0;
		List<Cart> carts = cdao.findByUser(user);
		count =  carts.size();
		return count;
	}
	public double getAmount() {//Tinh tong
		Collection<Product> ps = this.getItems();
		double amount = 0;
		for (Product p : ps) {
			amount += p.getQuantity() * p.getUnitPrice() * (1 - p.getDiscount());
		}
		return amount;
	}

	public Collection<Product> getItems() {//Hien thi danh sach da chon
		return map.values();
	}
	
	public int getProductQuantity(Integer id) {
	    Product p = dao.findById(id);
	    if (p != null) {
	    	int quan = p.getQuantity();
	        return quan;
	    }
	    return 0;
	}
	
}
