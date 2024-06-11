package com.pshop.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pshop.bean.MailInfo;
import com.pshop.dao.CartDAO;
import com.pshop.dao.OrderDAO;
import com.pshop.dao.OrderDetailDAO;
import com.pshop.dao.ProductDAO;
import com.pshop.entity.Cart;
import com.pshop.entity.Order;
import com.pshop.entity.OrderDetail;
import com.pshop.entity.Product;
import com.pshop.entity.User;
import com.pshop.service.CartService;
import com.pshop.service.MailService;



@Controller
public class OrderController {
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	CartService cart;
	
	@Autowired
	OrderDAO dao;
	
	@Autowired
	OrderDetailDAO ddao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	MailService mailer;
	
	@Autowired
	CartDAO cdao;
	@GetMapping("/order/checkout")
	public String showForm(@RequestParam("tongTien") double tongTien,@ModelAttribute("order") Order order,Model model) {
		User user = (User) session.getAttribute("user");

		order.setOrderDate(new Date());
		order.setUser(user);
		
		order.setStatus(1);
		List<Cart> carts = cdao.findByUser(user);
		List<Product> p = new ArrayList<>();
		double tong = 0;
		for(Cart c : carts) {
			Product pt = new Product();
			pt = pdao.findById(c.getProduct().getId());
			pt.setQuantity((int)(c.getQuantity()*1));
			tong = tong + c.getPrice()*c.getQuantity();
			p.add(pt);
		}
		order.setAmount(tongTien);
		model.addAttribute("pro",p);
		model.addAttribute("tong",tongTien);
		model.addAttribute("sdt",user.getTelephone());
		return "order/checkout";

	}
	@GetMapping("/order/vnpay")
	public String thanhtoanvnpay(Model model,@RequestParam("userId") String userId,RedirectAttributes redirectAttrs,
	        @RequestParam("orderDate") String orderDate,
	        @RequestParam("telephone") String telephone,
	        @RequestParam("address") String address,
	        @RequestParam("status") String status,
	        @RequestParam("amount") String amount,
	        @RequestParam("description") String description,
	        @RequestParam("vnp_Amount") String vnpAmount,
	        @RequestParam("vnp_BankCode") String vnpBankCode,
	        @RequestParam("vnp_BankTranNo") String vnpBankTranNo,
	        @RequestParam("vnp_CardType") String vnpCardType,
	        @RequestParam("vnp_OrderInfo") String vnpOrderInfo,
	        @RequestParam("vnp_PayDate") String vnpPayDate,
	        @RequestParam("vnp_ResponseCode") String vnpResponseCode,
	        @RequestParam("vnp_TmnCode") String vnpTmnCode,
	        @RequestParam("vnp_TransactionNo") String vnpTransactionNo,
	        @RequestParam("vnp_TransactionStatus") String vnpTransactionStatus,
	        @RequestParam("vnp_TxnRef") String vnpTxnRef,
	        @RequestParam("vnp_SecureHash") String vnpSecureHash) {
		
		double amountt = Double.parseDouble(amount);
		int statuss = Integer.parseInt((status));
		User user = (User) session.getAttribute("user");
		Date orderDatee = null;
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        try {
            orderDatee = dateFormat.parse(orderDate);
        } catch (ParseException e) {
            e.printStackTrace(); // Xử lý nếu không thể parse được chuỗi thành Date
        }
		Order order = new Order();
		order.setUser(user);
		order.setAddress(address);
		order.setAmount(amountt);
		order.setStatus(statuss);
		order.setDescription(description);
		order.setOrderDate(orderDatee);
		order.setTelephone(telephone);
		order.setPay(1);
		
		List<Cart> cartItem = cdao.findByUser(user);
//		Collection<Product> list = cart.getItems();
		Collection<Product> list = new ArrayList<>();
		List <Double> a = new ArrayList<>();
		for(Cart c : cartItem) {
			list.add(c.getProduct());
			a.add(c.getQuantity());
		}
		List<OrderDetail> details = new  ArrayList<>();
		for(Product product:list) {
			OrderDetail detail =new OrderDetail();
			int dem =0;
			Product prod = pdao.findById(product.getId());
			if(prod.getQuantity() == 0) {
				model.addAttribute("message","Sản phẩm " +product.getName()+ " hết hàng" );
				return "order/checkout";
			}
			if(product.getQuantity() > prod.getQuantity()) {
				model.addAttribute("message","Sản phẩm " +product.getName()+ " chỉ còn số lượng là: " + prod.getQuantity());
				return "order/checkout";
				
			}
			detail.setOrder(order);
			detail.setProduct(product);
			detail.setUnitPrice(product.getUnitPrice());
//			detail.setQuantity(product.getQuantity());
			detail.setQuantity((int)(a.get(dem)*1.0));
			detail.setDiscount(product.getDiscount());
			details.add(detail);
//			prod.setQuantity(prod.getQuantity()-product.getQuantity());
			prod.setQuantity((int) (prod.getQuantity()-a.get(dem)*1.0));
			pdao.update(prod);
			

		}
		dao.create(order, details);
		
		cart.clear();
		List<Cart> carts = cdao.findByUser(user);
		for(Cart c : carts) {
			cdao.delete(c.getId());
		}
		 
		redirectAttrs.addFlashAttribute("message", "Thanh toán thành công!");
		
		return "redirect:/order/list";
	}
	@PostMapping("/order/checkout")
	public String purchase(Model model, 
			@ModelAttribute("order") Order order) throws MessagingException{
		User user = (User) session.getAttribute("user");
		List<Cart> cartItem = cdao.findByUser(user);
//		Collection<Product> list = cart.getItems();
		Collection<Product> list = new ArrayList<>();
		List <Double> a = new ArrayList<>();
		for(Cart c : cartItem) {
			list.add(c.getProduct());
			a.add(c.getQuantity());
		}
		List<OrderDetail> details = new  ArrayList<>();
		for(Cart c:cartItem) {
			OrderDetail detail =new OrderDetail();
			int dem =0;
			Product prod = pdao.findById(c.getProduct().getId());
			if(prod.getQuantity() == 0) {
				model.addAttribute("message","Sản phẩm " +c.getProduct().getName()+ " hết hàng" );
				return "order/checkout";
			}
			if(c.getQuantity() > c.getProduct().getQuantity()) {
				model.addAttribute("message","Sản phẩm " +c.getProduct().getName()+ " chỉ còn số lượng là: " + c.getProduct().getQuantity());
				return "order/checkout";
				
			}
			order.setPay(0);
			detail.setOrder(order);
			detail.setProduct(c.getProduct());
			detail.setUnitPrice(c.getProduct().getUnitPrice());
//			detail.setQuantity(product.getQuantity());
			detail.setQuantity((int)(a.get(dem)*1.0));
			detail.setDiscount(c.getProduct().getDiscount());
			details.add(detail);
//			prod.setQuantity(prod.getQuantity()-product.getQuantity());
			prod.setQuantity((int) (prod.getQuantity()-a.get(dem)*1.0));
			pdao.update(prod);
			

		}
		dao.create(order, details);
		
		cart.clear();
		List<Cart> carts = cdao.findByUser(user);
		for(Cart c : carts) {
			cdao.delete(c.getId());
		}
		
		@SuppressWarnings("unchecked")
		List<String> adminNotifications = (List<String>) session.getAttribute("adminNotifications");
		if(adminNotifications == null) {
			adminNotifications = new ArrayList<>();
		}
		adminNotifications.add("Có đơn hàng "+order.getId()+" mới của " + user.getId());
		
		session.setAttribute("adminNotifications", adminNotifications);
		 
	    
	    
	    
		model.addAttribute("message", "Đặt hàng thành công!");
		String from = "pshoptech@gmail.com";
		String to = "tamthat2510@gmail.com";
		String subject = "Ting ting ting";
		String url = "http://localhost:8080/admin/order/edit/"+order.getId();
		String body = "Có đơn hàng mới shop ơi! <a href='" + url + "'>Vào Việc</a>";
		MailInfo mail = new MailInfo(from, to, subject, body);
		mailer.send(mail);
		
		return "redirect:/order/list";

	}
	
	
	@GetMapping("/order/list")
	public String list(Model model) {
		User user = (User) session.getAttribute("user");
		List<Order> orders = dao.findByUser(user);
		List<Cart> carts = cdao.findByUser(user);
		double tong = 0;
		for(Cart c : carts) {
			tong = tong + c.getPrice()*c.getQuantity();
		}
		
		model.addAttribute("tong",tong);
		model.addAttribute("orders", orders);
		return "order/list";
	}
	
	@GetMapping("/order/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Order order = dao.findById(id);
		User user = (User) session.getAttribute("user");
		List<OrderDetail> details = ddao.findByOrder(order);
		List<Cart> carts = cdao.findByUser(user);
		double tong = 0;
		for(Cart c : carts) {
			tong = tong + c.getPrice()*c.getQuantity();
		}
		
		model.addAttribute("tong",tong);
		model.addAttribute("order", order);
		model.addAttribute("details", details);
		return "order/detail";
	}
	
	@GetMapping("/order/items")
	public String items(Model model) {
		User user = (User) session.getAttribute("user");
		List<Product> list = dao.findItemsByUser(user);
		model.addAttribute("list", list);
		return "product/list_order_item";
	}
	@GetMapping("/order/cancel/{id}")
	public String cancelDon(Model model ,@PathVariable ("id") Integer id) {
		Order order = dao.findById(id);
		order.setStatus(4);
		dao.update(order);
		model.addAttribute("message", "Hủy đơn hàng thành công");
		return "redirect:/order/list";
	}
}




