package com.pshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pshop.dao.CategoryDAO;
import com.pshop.dao.ProductDAO;
import com.pshop.entity.Category;
import com.pshop.entity.Product;



@Controller
public class HomeController {
	@Autowired
	ProductDAO pdao;
	@Autowired
	CategoryDAO cdao;
	@RequestMapping(value = {"", "/home"})
	public String index(Model model) {
		List<Product> list2 = pdao.findBySpecial(4);
		model.addAttribute("list", list2);
		List<Product> list3 = pdao.findBySpecial(0);
		model.addAttribute("list1", list3);
		List<Category> list4 = cdao.findListC();
		model.addAttribute("list2", list4);
		List<Category> list5 = cdao.findListC1();
		model.addAttribute("list3", list5);
		return "home/index";
	}
	@RequestMapping("/about")
	public String about() {
		return "home/about";
	}
	@RequestMapping("/contact")
	public String contact() {
		return "home/contact";
	}
	@RequestMapping("/feedback")
	public String feedback() {
		return "home/feedback";
	}
	@RequestMapping("/faq")
	public String faq() {
		return "home/faq";
	}
	
	@ResponseBody
	@RequestMapping("/home/language")
	public void language() {

	}
}
