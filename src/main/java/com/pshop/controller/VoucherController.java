package com.pshop.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.List;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.pshop.dao.VoucherDAO;
import com.pshop.entity.Voucher;

@RestController
@RequestMapping("/api")
public class VoucherController {
	@Autowired
	VoucherDAO vdao;
	@GetMapping("/voucher")
	public List<Voucher> voucher () {
		List<Voucher> list = vdao.findAll();
		
		return list ;
	}
	@GetMapping("/voucher/{vouchercode}")
	public  String getVoucher(@PathVariable("vouchercode") String vouchercode) throws JsonProcessingException {
		Voucher voucher = vdao.findByCode(vouchercode);
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.registerModule(new JavaTimeModule());
	    objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
	    objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
		String jsonData = objectMapper.writeValueAsString(voucher);
		return jsonData;
	}
}
