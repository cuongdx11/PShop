package com.pshop.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pshop.dao.OrderDAO;
import com.pshop.dao.ProductDAO;
import com.pshop.dao.UserDAO;
import com.pshop.entity.Order;
import com.pshop.entity.Product;
import com.pshop.entity.User;

@Controller
public class AdminHomeController {
	
	@Autowired
	UserDAO dao;
	
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	OrderDAO odao;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/admin/home/index")
	public String index(Model model) {
		
		//Thống kê số lượng người dùng
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("user", dao.findAll());
		
		//Thống kê số lượng sản phẩm
		Product product = new Product();
		model.addAttribute("product", product);
		model.addAttribute("product", pdao.findAll());
		
		//Thống kê số đơn hàng
		Order order = new Order();
		model.addAttribute("order", order);
		model.addAttribute("order", odao.findAll());
		
		@SuppressWarnings("unchecked")
		List<String> adminNotifications = (List<String>) session.getAttribute("adminNotifications");
		
		if(adminNotifications != null) {
			model.addAttribute(adminNotifications);
		}
		if (adminNotifications != null) {
		    for (String notification : adminNotifications) {
		        if (notification.startsWith("Có đơn hàng ")) {
		            int startIndex = "Có đơn hàng ".length();
		            int endIndex = notification.indexOf(" mới của ");
		            if (endIndex != -1) {
		                String orderId = notification.substring(startIndex, endIndex);
		                model.addAttribute("orderId", orderId);
		                // Hoặc thực hiện các xử lý khác với orderId
		            }
		        }
		    }
		}
	
	    
		return "admin/home/index";
		
      }	
}
