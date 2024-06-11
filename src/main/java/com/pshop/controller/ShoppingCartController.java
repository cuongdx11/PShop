package com.pshop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pshop.dao.CartDAO;
import com.pshop.dao.ProductDAO;
import com.pshop.entity.Cart;
import com.pshop.entity.Product;
import com.pshop.entity.User;
import com.pshop.service.CartService;

@Controller
public class ShoppingCartController {
	
	@Autowired
	CartService cart;
	@Autowired
	HttpSession session;
	@Autowired
	CartDAO cdao;
	@Autowired
	ProductDAO pdao;
	@ResponseBody
	@RequestMapping("/cart/update/{id}/{qty}")
//	public Object[] update(@PathVariable("id") Integer id, @PathVariable("qty") Integer qty) {
	public void update(@PathVariable("id") Integer id, @PathVariable("qty") Integer qty) {
//		cart.update(id,qty);
//		Object[] info= {cart.getCount(), cart.getAmount()};
		User user =(User) session.getAttribute("user");
		List<Cart> carts = cdao.findByUser(user);
		List<Product> p = new ArrayList<>();
		for(Cart c : carts) {
			if(c.getProduct().getId().equals(id)) {
				c.setQuantity(qty*1.0);
				cdao.update(c);
			}
		}
		
//		return info;
	}
	
	
	@ResponseBody
	@RequestMapping("/cart/add/{id}")
	public Object[] add(@PathVariable("id") Integer id) {
		cart.addt(id);
		Object[] info= {cart.getCount(), cart.getAmount()};
		return info;
	}
	
	@ResponseBody
	@RequestMapping("/cart/remove/{id}")
//	public Object[] remove(@PathVariable("id") Integer id) {
	public void remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		User user =(User) session.getAttribute("user");
		List<Cart> carts = cdao.findByUser(user);
//		List<Product> p = new ArrayList<>();
		for(Cart c : carts) {
			if(c.getProduct().getId() == id) {
				cdao.delete(c.getId());
				cdao.update(c);
			}
		}
		
//		Object[] info= {cart.getCount(), cart.getAmount(),cart.getProductQuantity(id)};
//		return info;
	}
	
	@RequestMapping("/cart/view")
	public String view() {
		return "cart/view";
	}
	@GetMapping("/cart/giohang")
	public String giohang(Model model) {
		User user =(User) session.getAttribute("user");
		List<Cart> carts = cdao.findByUser(user);
		List<Product> p = new ArrayList<>();
		double tong = 0;
		Map<Integer, Integer> productQuantities = new HashMap<>();
		for(Cart c : carts) {
			Product pt = new Product();
			pt = pdao.findById(c.getProduct().getId());
			productQuantities.put(c.getProduct().getId(), productQuantities.getOrDefault(c.getProduct().getId(), 0) + pt.getQuantity());
			pt.setQuantity((int)(c.getQuantity()*1));
			tong = tong + c.getPrice()*c.getQuantity() - c.getPrice()*c.getProduct().getDiscount();
			p.add(pt);
		}
		model.addAttribute("productQuantities", productQuantities);
		model.addAttribute("giohang",carts);
		model.addAttribute("count",carts.size());
		model.addAttribute("tong",tong);
		model.addAttribute("pro",p);
		return "cart/giohang";
	}
	@ResponseBody
	@RequestMapping("/cart/clear")
	public void clear() {
//		cart.clear();
		User user =(User) session.getAttribute("user");
		List<Cart> carts = cdao.findByUser(user);
		for(Cart c : carts) {
			cdao.delete(c.getId());
		}
			
	}
	@GetMapping("/cart/test")
	public String list(Model model) {
		User user =(User) session.getAttribute("user");
		List<Cart> carts = cdao.findByUser(user);
		model.addAttribute("carts",carts);
		return "cart/test";
	}

}
