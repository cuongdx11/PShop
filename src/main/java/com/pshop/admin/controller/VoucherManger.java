package com.pshop.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pshop.dao.VoucherDAO;
import com.pshop.entity.Voucher;

@Controller
public class VoucherManger {
	@Autowired
	VoucherDAO vdao;
	@RequestMapping("/admin/voucher/index")
	public String index(Model model) {
		Voucher entity = new Voucher();
		model.addAttribute("entity", entity);
		model.addAttribute("list", vdao.findAll());
		return "admin/voucher/index";
	}
	@RequestMapping("/admin/voucher/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Voucher entity = vdao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("list", vdao.findAll());
		return "admin/voucher/index";
	}
	@RequestMapping("/admin/voucher/create")
	public String create(RedirectAttributes model, @ModelAttribute("entity") Voucher entity) {
		vdao.create(entity);
		model.addAttribute("message", "Thêm mới thành công!");
		return "redirect:/admin/voucher/index";
	}
	
	@RequestMapping("/admin/voucher/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") Voucher entity) {
		vdao.update(entity);
		model.addAttribute("message", "Cập nhật thành công!");
		return "redirect:/admin/voucher/edit/"+entity.getId();
	}
	
	@RequestMapping(value = {"/admin/voucher/delete","/admin/voucher/delete/{id}"})
	public String delete(RedirectAttributes model, 
			@RequestParam(value="id", required = false) Integer id1, 
			@PathVariable(value="id", required = false) Integer id2) {
		if(id1 != null) {
			vdao.delete(id1);
		}else {
			vdao.delete(id2);
		}
		
		model.addAttribute("message", "Xóa thành công!");
		return "redirect:/admin/voucher/index";
	}


}
